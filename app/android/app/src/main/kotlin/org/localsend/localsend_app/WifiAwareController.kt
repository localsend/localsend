package org.localsend.localsend_app

import android.annotation.SuppressLint
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import android.net.wifi.aware.AttachCallback
import android.net.wifi.aware.DiscoverySession
import android.net.wifi.aware.DiscoverySessionCallback
import android.net.wifi.aware.PeerHandle
import android.net.wifi.aware.PublishConfig
import android.net.wifi.aware.PublishDiscoverySession
import android.net.wifi.aware.SubscribeConfig
import android.net.wifi.aware.SubscribeDiscoverySession
import android.net.wifi.aware.WifiAwareManager
import android.net.wifi.aware.WifiAwareNetworkInfo
import android.net.wifi.aware.WifiAwareSession
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Log
import io.flutter.plugin.common.MethodChannel
import java.security.SecureRandom
import java.util.concurrent.ConcurrentHashMap

internal data class WifiAwareServiceInfo(
    val port: Int,
    val https: Boolean,
    val passphrase: String,
)

internal object WifiAwareServiceInfoCodec {
    private const val VERSION = "1"

    fun encode(info: WifiAwareServiceInfo): ByteArray = "$VERSION|${info.port}|${if (info.https) 1 else 0}|${info.passphrase}".toByteArray(Charsets.UTF_8)

    fun decode(bytes: ByteArray): WifiAwareServiceInfo? {
        val parts = bytes.toString(Charsets.UTF_8).split('|')
        if (parts.size != 4 || parts[0] != VERSION) return null
        val port = parts[1].toIntOrNull()?.takeIf { it in 1..65535 } ?: return null
        val https = when (parts[2]) {
            "1" -> true
            "0" -> false
            else -> return null
        }
        val passphrase = parts[3].takeIf { it.length in 8..63 } ?: return null
        return WifiAwareServiceInfo(port, https, passphrase)
    }
}

/**
 * Bridges Android Wi-Fi Aware discovery/data paths into LocalSend's existing
 * HTTP discovery. The native layer only establishes a network and reports a
 * scoped IPv6 endpoint; identity, registration, TLS, and transfers continue
 * through the regular Rust LocalSend protocol stack.
 */
class WifiAwareController(
    private val context: Context,
    private val channel: MethodChannel,
) {
    companion object {
        private const val TAG = "LocalSendWifiAware"
        private const val SERVICE_NAME = "localsend"
        private const val MESSAGE_CONNECT = "connect-v1"
        private const val MESSAGE_READY = "ready-v1"
    }

    private data class PeerService(
        val peer: PeerHandle,
        val port: Int,
        val https: Boolean,
        val passphrase: String,
    )

    private val handler = Handler(Looper.getMainLooper())
    private val awareManager = context.getSystemService(WifiAwareManager::class.java)
    private val connectivityManager = context.getSystemService(ConnectivityManager::class.java)
    private val networkCallbacks = mutableSetOf<ConnectivityManager.NetworkCallback>()
    private val discoveredPeers = ConcurrentHashMap<PeerHandle, PeerService>()
    private val requestedPeers = ConcurrentHashMap.newKeySet<PeerHandle>()
    private val respondedPeers = ConcurrentHashMap.newKeySet<PeerHandle>()
    private var receiverRegistered = false
    private var requested = false
    private var port = 0
    private var https = true
    private var passphrase = ""
    private var awareSession: WifiAwareSession? = null
    private var publishSession: PublishDiscoverySession? = null
    private var subscribeSession: SubscribeDiscoverySession? = null

    private val availabilityReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            if (intent?.action != WifiAwareManager.ACTION_WIFI_AWARE_STATE_CHANGED) return
            if (awareManager?.isAvailable == true) {
                attach()
            } else {
                closeSessions()
            }
        }
    }

    /** Starts or reconfigures Wi-Fi Aware. Returns false when unsupported. */
    @SuppressLint("MissingPermission")
    fun start(port: Int, https: Boolean): Boolean {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q || awareManager == null) {
            return false
        }

        val configurationChanged = this.port != port || this.https != https
        requested = true
        this.port = port
        this.https = https
        if (!receiverRegistered) {
            val filter = IntentFilter(WifiAwareManager.ACTION_WIFI_AWARE_STATE_CHANGED)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                context.registerReceiver(availabilityReceiver, filter, Context.RECEIVER_NOT_EXPORTED)
            } else {
                context.registerReceiver(availabilityReceiver, filter)
            }
            receiverRegistered = true
        }
        if (configurationChanged || awareSession == null) {
            closeSessions()
            passphrase = randomPassphrase()
            attach()
        }
        return true
    }

    fun stop() {
        requested = false
        closeSessions()
        if (receiverRegistered) {
            context.unregisterReceiver(availabilityReceiver)
            receiverRegistered = false
        }
    }

    @SuppressLint("MissingPermission")
    private fun attach() {
        if (!requested || awareSession != null || awareManager?.isAvailable != true) return
        awareManager.attach(object : AttachCallback() {
            override fun onAttached(session: WifiAwareSession) {
                if (!requested) {
                    session.close()
                    return
                }
                awareSession = session
                Log.i(TAG, "Attached to Wi-Fi Aware")
                publish(session)
                subscribe(session)
            }

            override fun onAttachFailed() {
                Log.w(TAG, "Could not attach to Wi-Fi Aware")
            }
        }, handler)
    }

    @SuppressLint("MissingPermission")
    private fun publish(session: WifiAwareSession) {
        val serviceInfo = WifiAwareServiceInfoCodec.encode(WifiAwareServiceInfo(port, https, passphrase))
        val config = PublishConfig.Builder()
            .setServiceName(SERVICE_NAME)
            .setServiceSpecificInfo(serviceInfo)
            .build()
        session.publish(config, object : DiscoverySessionCallback() {
            override fun onPublishStarted(session: PublishDiscoverySession) {
                publishSession = session
                Log.i(TAG, "Wi-Fi Aware publisher started")
            }

            override fun onMessageReceived(peerHandle: PeerHandle, message: ByteArray) {
                if (message.toString(Charsets.UTF_8) != MESSAGE_CONNECT) return
                val current = publishSession ?: return
                if (!respondedPeers.add(peerHandle)) return
                requestNetwork(current, peerHandle, passphrase, null)
                current.sendMessage(peerHandle, 0, MESSAGE_READY.toByteArray(Charsets.UTF_8))
            }

            override fun onSessionConfigFailed() {
                Log.w(TAG, "Wi-Fi Aware publish configuration failed")
            }
        }, handler)
    }

    @SuppressLint("MissingPermission")
    private fun subscribe(session: WifiAwareSession) {
        val config = SubscribeConfig.Builder()
            .setServiceName(SERVICE_NAME)
            .build()
        session.subscribe(config, object : DiscoverySessionCallback() {
            override fun onSubscribeStarted(session: SubscribeDiscoverySession) {
                subscribeSession = session
                Log.i(TAG, "Wi-Fi Aware subscriber started")
            }

            override fun onServiceDiscovered(peerHandle: PeerHandle, serviceSpecificInfo: ByteArray, matchFilter: List<ByteArray>) {
                val service = parseService(peerHandle, serviceSpecificInfo) ?: return
                discoveredPeers[peerHandle] = service
                subscribeSession?.sendMessage(peerHandle, 0, MESSAGE_CONNECT.toByteArray(Charsets.UTF_8))
            }

            override fun onMessageReceived(peerHandle: PeerHandle, message: ByteArray) {
                if (message.toString(Charsets.UTF_8) != MESSAGE_READY) return
                val service = discoveredPeers[peerHandle] ?: return
                val current = subscribeSession ?: return
                if (!requestedPeers.add(peerHandle)) return
                requestNetwork(current, service.peer, service.passphrase, service)
            }

            override fun onServiceLost(peerHandle: PeerHandle, reason: Int) {
                discoveredPeers.remove(peerHandle)
            }

            override fun onSessionConfigFailed() {
                Log.w(TAG, "Wi-Fi Aware subscribe configuration failed")
            }
        }, handler)
    }

    private fun parseService(peer: PeerHandle, bytes: ByteArray): PeerService? {
        val info = WifiAwareServiceInfoCodec.decode(bytes) ?: return null
        return PeerService(peer, info.port, info.https, info.passphrase)
    }

    @Suppress("DEPRECATION")
    @SuppressLint("MissingPermission")
    private fun requestNetwork(
        discoverySession: DiscoverySession,
        peer: PeerHandle,
        passphrase: String,
        endpoint: PeerService?,
    ) {
        val specifier = discoverySession.createNetworkSpecifierPassphrase(peer, passphrase)
        val request = NetworkRequest.Builder()
            .addTransportType(NetworkCapabilities.TRANSPORT_WIFI_AWARE)
            .setNetworkSpecifier(specifier)
            .build()
        var emitted = false
        val callback = object : ConnectivityManager.NetworkCallback() {
            override fun onCapabilitiesChanged(network: Network, capabilities: NetworkCapabilities) {
                if (emitted || endpoint == null) return
                val info = capabilities.transportInfo as? WifiAwareNetworkInfo ?: return
                val address = info.peerIpv6Addr ?: return
                val scopeId = address.scopeId
                if (scopeId == 0) return
                val hostAddress = address.hostAddress ?: return
                emitted = true
                val host = "${hostAddress.substringBefore('%')}%$scopeId"
                handler.post {
                    channel.invokeMethod(
                        "wifiAwareEndpoint",
                        mapOf("host" to host, "port" to endpoint.port, "https" to endpoint.https),
                    )
                }
            }

            override fun onUnavailable() {
                removeNetworkCallback(this, peer, endpoint != null)
            }

            override fun onLost(network: Network) {
                removeNetworkCallback(this, peer, endpoint != null)
            }
        }
        synchronized(networkCallbacks) { networkCallbacks.add(callback) }
        connectivityManager.requestNetwork(request, callback, handler)
    }

    private fun removeNetworkCallback(callback: ConnectivityManager.NetworkCallback, peer: PeerHandle, initiator: Boolean) {
        val removed = synchronized(networkCallbacks) { networkCallbacks.remove(callback) }
        if (removed) {
            runCatching { connectivityManager.unregisterNetworkCallback(callback) }
        }
        if (initiator) {
            requestedPeers.remove(peer)
        } else {
            respondedPeers.remove(peer)
        }
    }

    private fun closeSessions() {
        subscribeSession?.close()
        subscribeSession = null
        publishSession?.close()
        publishSession = null
        awareSession?.close()
        awareSession = null
        discoveredPeers.clear()
        requestedPeers.clear()
        respondedPeers.clear()
        val callbacks = synchronized(networkCallbacks) {
            networkCallbacks.toList().also { networkCallbacks.clear() }
        }
        callbacks.forEach { runCatching { connectivityManager.unregisterNetworkCallback(it) } }
    }

    private fun randomPassphrase(): String {
        val alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        val random = SecureRandom()
        return buildString(24) {
            repeat(24) { append(alphabet[random.nextInt(alphabet.length)]) }
        }
    }
}
