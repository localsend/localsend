package org.localsend.localsend_app.appclip

import android.Manifest
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.content.pm.ServiceInfo
import android.net.wifi.WifiManager
import android.os.Build
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import org.localsend.localsend_app.MainActivity
import org.localsend.localsend_app.R
import java.net.Inet4Address
import java.net.NetworkInterface
import java.security.SecureRandom
import java.util.Collections
import java.util.concurrent.CopyOnWriteArraySet
import java.util.concurrent.Executors
import java.util.concurrent.ScheduledExecutorService
import java.util.concurrent.ScheduledFuture
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicBoolean

internal data class AppClipHostState(
    val state: String,
    val message: String? = null,
    val hceAvailable: Boolean = false,
    val sessionId: String? = null,
) {
    fun toMap(): Map<String, Any?> = mapOf(
        "state" to state,
        "message" to message,
        "hceAvailable" to hceAvailable,
        "sessionId" to sessionId,
    )
}

internal object AppClipHostStateBus {
    @Volatile
    private var state = AppClipHostState("idle")
    private val listeners = CopyOnWriteArraySet<(Map<String, Any?>) -> Unit>()

    fun snapshot(): Map<String, Any?> = state.toMap()

    fun publish(value: AppClipHostState) {
        state = value
        val map = value.toMap()
        listeners.forEach { it(map) }
    }

    fun add(listener: (Map<String, Any?>) -> Unit) {
        listeners.add(listener)
        listener(snapshot())
    }

    fun remove(listener: (Map<String, Any?>) -> Unit) {
        listeners.remove(listener)
    }
}

/** Owns the local-only hotspot and authenticated callback until Flutter completes or cancels the transfer. */
class AppClipHostService : Service() {
    private val mainHandler = Handler(Looper.getMainLooper())
    private val scheduler: ScheduledExecutorService = Executors.newSingleThreadScheduledExecutor { runnable ->
        Thread(runnable, "localsend-app-clip-host").apply { isDaemon = true }
    }
    private val closed = AtomicBoolean(false)
    private var reservation: WifiManager.LocalOnlyHotspotReservation? = null
    private var bootstrapServer: AppClipBootstrapServer? = null
    private var sessionId: String? = null
    private var beforeAddresses: Set<String> = emptySet()
    private var hotspotSsid: String? = null
    private var hotspotPassphrase: String? = null
    private var readyTimeout: ScheduledFuture<*>? = null
    private var approvalTimeout: ScheduledFuture<*>? = null
    private lateinit var sessionIdBytes: ByteArray
    private lateinit var sessionKey: ByteArray

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_START -> startHosting(intent.getStringExtra(EXTRA_DEVICE_NAME) ?: "")
            ACTION_ACKNOWLEDGE -> acknowledge(intent.getStringExtra(EXTRA_SESSION_ID) ?: "")
            ACTION_STOP -> finish(AppClipHostState("idle"))
            else -> finish(AppClipHostState("idle"))
        }
        return START_NOT_STICKY
    }

    private fun startHosting(deviceName: String) {
        if (bootstrapServer != null || reservation != null) return
        createNotificationChannel()
        startForegroundCompat(notification(R.string.app_clip_notification_starting))

        val baseUrl = getString(R.string.app_clip_invocation_base_url).trim()
        try {
            AppClipProtocol.validateInvocationBaseUrl(baseUrl)
        } catch (_: RuntimeException) {
            fail("APP_CLIP_URL_NOT_CONFIGURED")
            return
        }
        if (deviceName.toByteArray(Charsets.UTF_8).size !in 1..80) {
            fail("INVALID_DEVICE_NAME")
            return
        }

        sessionIdBytes = ByteArray(16).also(SecureRandom()::nextBytes)
        sessionKey = ByteArray(32).also(SecureRandom()::nextBytes)
        sessionId = AppClipProtocol.encodeSessionId(sessionIdBytes)
        beforeAddresses = currentPrivateAddresses()
        try {
            bootstrapServer = AppClipBootstrapServer(
                sessionId = sessionIdBytes,
                sessionKey = sessionKey,
                onAccepted = ::onBootstrapAccepted,
                onFatalError = { mainHandler.post { fail("BOOTSTRAP_LISTENER_FAILED") } },
            )
        } catch (_: Exception) {
            fail("BOOTSTRAP_LISTENER_FAILED")
            return
        }

        AppClipHostStateBus.publish(AppClipHostState("startingHotspot", sessionId = sessionId))
        val wifi = getSystemService(WifiManager::class.java)
        try {
            wifi.startLocalOnlyHotspot(
                object : WifiManager.LocalOnlyHotspotCallback() {
                    override fun onStarted(value: WifiManager.LocalOnlyHotspotReservation) {
                        if (closed.get()) {
                            value.close()
                            return
                        }
                        reservation = value
                        try {
                            val credentials = readHotspotCredentials(value)
                            hotspotSsid = credentials.first
                            hotspotPassphrase = credentials.second
                            qualifyHotspotAddresses(deviceName, 0)
                        } catch (_: RuntimeException) {
                            fail("HOTSPOT_CREDENTIALS_UNAVAILABLE")
                        }
                    }

                    override fun onFailed(reason: Int) {
                        fail("HOTSPOT_FAILED_$reason")
                    }

                    override fun onStopped() {
                        if (!closed.get()) fail("HOTSPOT_STOPPED")
                    }
                },
                mainHandler,
            )
        } catch (_: SecurityException) {
            fail("HOTSPOT_PERMISSION_DENIED")
        } catch (_: RuntimeException) {
            fail("HOTSPOT_START_FAILED")
        }
    }

    private fun qualifyHotspotAddresses(deviceName: String, attempt: Int) {
        if (closed.get()) return
        val candidates = (currentPrivateAddresses() - beforeAddresses).sorted().take(4)
        if (candidates.isNotEmpty()) {
            makeReady(deviceName, candidates)
            return
        }
        if (attempt >= ADDRESS_ATTEMPTS) {
            fail("HOTSPOT_ADDRESS_UNAVAILABLE")
            return
        }
        scheduler.schedule(
            { mainHandler.post { qualifyHotspotAddresses(deviceName, attempt + 1) } },
            ADDRESS_RETRY_MILLIS,
            TimeUnit.MILLISECONDS,
        )
    }

    private fun makeReady(deviceName: String, hosts: List<String>) {
        val server = bootstrapServer ?: return fail("BOOTSTRAP_LISTENER_FAILED")
        val ssid = hotspotSsid ?: return fail("HOTSPOT_CREDENTIALS_UNAVAILABLE")
        val passphrase = hotspotPassphrase ?: return fail("HOTSPOT_CREDENTIALS_UNAVAILABLE")
        val url = try {
            AppClipProtocol.buildInvocationUrl(
                baseUrl = getString(R.string.app_clip_invocation_base_url).trim(),
                sessionId = sessionIdBytes,
                sessionKey = sessionKey,
                ssid = ssid,
                passphrase = passphrase,
                hosts = hosts,
                bootstrapPort = server.port,
                deviceName = deviceName,
            )
        } catch (_: RuntimeException) {
            fail("INVOCATION_URL_INVALID")
            return
        }
        publishInvocationUrl(url)
        val hce = AppClipHceRegistry.arm(this, url)
        AppClipHostStateBus.publish(AppClipHostState("readyForTap", hceAvailable = hce, sessionId = sessionId))
        updateNotification(R.string.app_clip_notification_ready)
        readyTimeout = scheduler.schedule({ mainHandler.post { fail("SESSION_TIMED_OUT") } }, READY_TIMEOUT_MINUTES, TimeUnit.MINUTES)
    }

    private fun onBootstrapAccepted(result: AppClipBootstrapResult) {
        mainHandler.post {
            if (closed.get()) return@post
            readyTimeout?.cancel(false)
            pendingBootstrap.set(result)
            publishInvocationUrl(null)
            AppClipHceRegistry.clear(this)
            AppClipHostStateBus.publish(AppClipHostState("waitingForApproval", sessionId = result.sessionId))
            updateNotification(R.string.app_clip_notification_connected)
            approvalTimeout = scheduler.schedule({ mainHandler.post { fail("APPROVAL_TIMED_OUT") } }, APPROVAL_TIMEOUT_MINUTES, TimeUnit.MINUTES)
        }
    }

    private fun acknowledge(value: String) {
        val result = pendingBootstrap.get()
        if (result == null || result.sessionId != value) return
        approvalTimeout?.cancel(false)
        pendingBootstrap.compareAndSet(result, null)
        bootstrapServer?.close()
        bootstrapServer = null
        AppClipHostStateBus.publish(AppClipHostState("receiving", sessionId = value))
        updateNotification(R.string.app_clip_notification_receiving)
    }

    private fun fail(code: String) {
        if (closed.get()) return
        finish(AppClipHostState("failed", message = code, sessionId = sessionId))
    }

    private fun finish(finalState: AppClipHostState) {
        if (!closed.compareAndSet(false, true)) return
        readyTimeout?.cancel(false)
        approvalTimeout?.cancel(false)
        publishInvocationUrl(null)
        pendingBootstrap.set(null)
        AppClipHceRegistry.clear(this)
        bootstrapServer?.close()
        bootstrapServer = null
        try {
            reservation?.close()
        } catch (_: RuntimeException) {
            // Reservation teardown is idempotent from the host's perspective.
        }
        reservation = null
        if (this::sessionIdBytes.isInitialized) sessionIdBytes.fill(0)
        if (this::sessionKey.isInitialized) sessionKey.fill(0)
        scheduler.shutdownNow()
        AppClipHostStateBus.publish(finalState)
        if (finalState.state == "failed") updateNotification(R.string.app_clip_notification_failed)
        stopForeground(STOP_FOREGROUND_REMOVE)
        stopSelf()
    }

    override fun onDestroy() {
        if (!closed.get()) finish(AppClipHostState("idle"))
        super.onDestroy()
    }

    @Suppress("DEPRECATION")
    private fun readHotspotCredentials(value: WifiManager.LocalOnlyHotspotReservation): Pair<String, String> {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            val config = value.softApConfiguration
            val ssid = config.ssid ?: ""
            val passphrase = config.passphrase ?: ""
            if (ssid.isNotEmpty() && passphrase.isNotEmpty()) return ssid to passphrase
        }
        val config = value.wifiConfiguration ?: throw IllegalStateException("Hotspot credentials unavailable")
        val ssid = config.SSID?.removeSurrounding("\"") ?: ""
        val passphrase = config.preSharedKey?.removeSurrounding("\"") ?: ""
        if (ssid.isEmpty() || passphrase.isEmpty()) throw IllegalStateException("Hotspot credentials unavailable")
        return ssid to passphrase
    }

    private fun currentPrivateAddresses(): Set<String> = try {
        Collections.list(NetworkInterface.getNetworkInterfaces())
            .asSequence()
            .filter { it.isUp && !it.isLoopback }
            .flatMap { Collections.list(it.inetAddresses).asSequence() }
            .filterIsInstance<Inet4Address>()
            .mapNotNull { it.hostAddress }
            .filter(AppClipProtocol::isCanonicalPrivateIpv4)
            .toSet()
    } catch (_: Exception) {
        emptySet()
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            getSystemService(NotificationManager::class.java).createNotificationChannel(
                NotificationChannel(
                    NOTIFICATION_CHANNEL,
                    getString(R.string.app_clip_notification_channel),
                    NotificationManager.IMPORTANCE_LOW,
                ),
            )
        }
    }

    private fun notification(text: Int): Notification {
        val launch = PendingIntent.getActivity(
            this,
            0,
            MainActivity.createDefaultIntent(this),
            PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT,
        )
        val stop = PendingIntent.getService(
            this,
            1,
            Intent(this, AppClipHostService::class.java).setAction(ACTION_STOP),
            PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT,
        )
        val builder = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            Notification.Builder(this, NOTIFICATION_CHANNEL)
        } else {
            @Suppress("DEPRECATION")
            Notification.Builder(this)
        }
        return builder
            .setContentTitle(getString(R.string.app_clip_notification_title))
            .setContentText(getString(text))
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentIntent(launch)
            .setOngoing(true)
            .addAction(0, getString(R.string.app_clip_notification_stop), stop)
            .build()
    }

    private fun startForegroundCompat(value: Notification) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            startForeground(NOTIFICATION_ID, value, ServiceInfo.FOREGROUND_SERVICE_TYPE_CONNECTED_DEVICE)
        } else {
            startForeground(NOTIFICATION_ID, value)
        }
    }

    private fun updateNotification(text: Int) {
        getSystemService(NotificationManager::class.java).notify(NOTIFICATION_ID, notification(text))
    }

    companion object {
        private const val ACTION_START = "org.localsend.appclip.START"
        private const val ACTION_STOP = "org.localsend.appclip.STOP"
        private const val ACTION_ACKNOWLEDGE = "org.localsend.appclip.ACKNOWLEDGE"
        private const val EXTRA_DEVICE_NAME = "deviceName"
        private const val EXTRA_SESSION_ID = "sessionId"
        private const val NOTIFICATION_CHANNEL = "app_clip_receive"
        private const val NOTIFICATION_ID = 4_721
        private const val ADDRESS_ATTEMPTS = 50
        private const val ADDRESS_RETRY_MILLIS = 100L
        private const val READY_TIMEOUT_MINUTES = 10L
        private const val APPROVAL_TIMEOUT_MINUTES = 2L
        private val pendingBootstrap = java.util.concurrent.atomic.AtomicReference<AppClipBootstrapResult?>(null)
        @Volatile private var activeInvocationUrl: String? = null

        fun prerequisites(context: Context): Map<String, Any> {
            val missing = mutableListOf<String>()
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) missing += "ANDROID_8_REQUIRED"
            if (context.getSystemService(WifiManager::class.java) == null) missing += "WIFI_UNAVAILABLE"
            val runtimePermission = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                Manifest.permission.NEARBY_WIFI_DEVICES
            } else {
                Manifest.permission.ACCESS_FINE_LOCATION
            }
            if (context.checkSelfPermission(runtimePermission) != PackageManager.PERMISSION_GRANTED) missing += runtimePermission
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU &&
                context.checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED
            ) {
                missing += Manifest.permission.POST_NOTIFICATIONS
            }
            val baseUrl = context.getString(R.string.app_clip_invocation_base_url).trim()
            try {
                AppClipProtocol.validateInvocationBaseUrl(baseUrl)
            } catch (_: RuntimeException) {
                missing += "APP_CLIP_URL_NOT_CONFIGURED"
            }
            return mapOf(
                "available" to missing.isEmpty(),
                "missing" to missing,
                "hceAvailable" to context.packageManager.hasSystemFeature(PackageManager.FEATURE_NFC_HOST_CARD_EMULATION),
            )
        }

        @Synchronized
        fun start(context: Context, deviceName: String): Map<String, Any?> {
            val current = AppClipHostStateBus.snapshot()
            if (current["state"] !in setOf("idle", "failed", "unavailable")) return current
            val check = prerequisites(context)
            if (check["available"] != true) return check + ("state" to "unavailable")
            pendingBootstrap.set(null)
            activeInvocationUrl = null
            AppClipHostStateBus.publish(AppClipHostState("startingHotspot"))
            val intent = Intent(context, AppClipHostService::class.java)
                .setAction(ACTION_START)
                .putExtra(EXTRA_DEVICE_NAME, deviceName)
            try {
                context.startForegroundService(intent)
            } catch (_: RuntimeException) {
                AppClipHostStateBus.publish(AppClipHostState("failed", message = "FOREGROUND_SERVICE_START_FAILED"))
            }
            return AppClipHostStateBus.snapshot()
        }

        fun stop(context: Context) {
            if (AppClipHostStateBus.snapshot()["state"] in setOf("idle", "failed", "unavailable")) {
                pendingBootstrap.set(null)
                activeInvocationUrl = null
                AppClipHostStateBus.publish(AppClipHostState("idle"))
                return
            }
            context.startService(Intent(context, AppClipHostService::class.java).setAction(ACTION_STOP))
        }

        fun acknowledge(context: Context, sessionId: String): Boolean {
            val result = pendingBootstrap.get() ?: return false
            if (result.sessionId != sessionId) return false
            context.startService(
                Intent(context, AppClipHostService::class.java)
                    .setAction(ACTION_ACKNOWLEDGE)
                    .putExtra(EXTRA_SESSION_ID, sessionId),
            )
            return true
        }

        fun bootstrap(): Map<String, Any>? = pendingBootstrap.get()?.toMap()
        fun invocationUrl(): String? = activeInvocationUrl
    }

    private fun publishInvocationUrl(value: String?) {
        activeInvocationUrl = value
    }
}
