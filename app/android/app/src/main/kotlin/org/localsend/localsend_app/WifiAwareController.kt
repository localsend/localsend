package org.localsend.localsend_app

import android.annotation.SuppressLint
import android.app.AlertDialog
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import android.net.wifi.aware.AttachCallback
import android.net.wifi.aware.AwareDataPathRequest
import android.net.wifi.aware.AwarePairingConfig
import android.net.wifi.aware.Characteristics
import android.net.wifi.aware.DiscoverySession
import android.net.wifi.aware.DiscoverySessionCallback
import android.net.wifi.aware.PeerHandle
import android.net.wifi.aware.PublishConfig
import android.net.wifi.aware.PublishDiscoverySession
import android.net.wifi.aware.ServiceDiscoveryInfo
import android.net.wifi.aware.SubscribeConfig
import android.net.wifi.aware.SubscribeDiscoverySession
import android.net.wifi.aware.WifiAwareManager
import android.net.wifi.aware.WifiAwareNetworkInfo
import android.net.wifi.aware.WifiAwareSession
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.text.InputType
import android.util.Log
import android.widget.EditText
import android.widget.TextView
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
        // RFC 6763 service type used by Apple's Wi-Fi Aware API and on the air.
        private const val SERVICE_NAME = "_localsend._tcp"
        private const val MESSAGE_CONNECT = "connect-v1"
        private const val MESSAGE_READY = "ready-v1"
        private const val IP_PROTOCOL_TCP = 6
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
    private val pairingPeers = ConcurrentHashMap.newKeySet<PeerHandle>()
    private val pairingPasswords = ConcurrentHashMap<PeerHandle, String>()
    private val pendingPairingRequests = ConcurrentHashMap<PeerHandle, Pair<Int, DiscoverySession>>()
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
        val configBuilder = PublishConfig.Builder()
            .setServiceName(SERVICE_NAME)
            .setServiceSpecificInfo(serviceInfo)
        pairingConfig()?.let(configBuilder::setPairingConfig)
        val config = configBuilder.build()
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

            override fun onPairingSetupRequestReceived(peerHandle: PeerHandle, requestId: Int) {
                acceptPairingWhenReady(publishSession, peerHandle, requestId)
            }

            override fun onBootstrappingSucceeded(peerHandle: PeerHandle, method: Int) {
                completeBootstrapping(publishSession, peerHandle, method, initiator = false)
            }

            override fun onPairingSetupSucceeded(peerHandle: PeerHandle, alias: String) {
                pairingPeers.add(peerHandle)
                Log.i(TAG, "Wi-Fi Aware pairing established with publisher peer")
            }

            override fun onPairingVerificationSucceed(peerHandle: PeerHandle, alias: String) {
                pairingPeers.add(peerHandle)
            }

            override fun onDataPathRequestReceived(peerHandle: PeerHandle) {
                if (Build.VERSION.SDK_INT < 37 || !pairingPeers.contains(peerHandle)) return
                val request = AwareDataPathRequest.Builder()
                    .setPort(port)
                    .setTransportProtocol(IP_PROTOCOL_TCP)
                    .build()
                if (publishSession?.acceptDataPathRequest(peerHandle, request) != true) {
                    Log.w(TAG, "Could not accept paired Wi-Fi Aware data path")
                }
            }

            override fun onSessionConfigFailed() {
                Log.w(TAG, "Wi-Fi Aware publish configuration failed")
            }
        }, handler)
    }

    @SuppressLint("MissingPermission")
    private fun subscribe(session: WifiAwareSession) {
        val configBuilder = SubscribeConfig.Builder()
            .setServiceName(SERVICE_NAME)
        pairingConfig()?.let(configBuilder::setPairingConfig)
        val config = configBuilder.build()
        session.subscribe(config, object : DiscoverySessionCallback() {
            override fun onSubscribeStarted(session: SubscribeDiscoverySession) {
                subscribeSession = session
                Log.i(TAG, "Wi-Fi Aware subscriber started")
            }

            override fun onServiceDiscovered(peerHandle: PeerHandle, serviceSpecificInfo: ByteArray, matchFilter: List<ByteArray>) {
                discoverLegacyPeer(peerHandle, serviceSpecificInfo)
            }

            override fun onServiceDiscovered(info: ServiceDiscoveryInfo) {
                val peer = info.peerHandle
                val serviceInfo = info.serviceSpecificInfo ?: return
                parseService(peer, serviceInfo)?.let { discoveredPeers[peer] = it }
                val pairing = info.pairingConfig
                val method = pairing?.let(::selectBootstrappingMethod)
                if (Build.VERSION.SDK_INT >= 37 && method != null) {
                    pairingPeers.add(peer)
                    subscribeSession?.initiateBootstrappingRequest(peer, method)
                } else {
                    discoverLegacyPeer(peer, serviceInfo)
                }
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
                pairingPeers.remove(peerHandle)
            }

            override fun onPairingSetupRequestReceived(peerHandle: PeerHandle, requestId: Int) {
                acceptPairingWhenReady(subscribeSession, peerHandle, requestId)
            }

            override fun onBootstrappingSucceeded(peerHandle: PeerHandle, method: Int) {
                completeBootstrapping(subscribeSession, peerHandle, method, initiator = true)
            }

            override fun onBootstrappingFailed(peerHandle: PeerHandle) {
                fallbackToLegacy(peerHandle)
            }

            override fun onPairingSetupSucceeded(peerHandle: PeerHandle, alias: String) {
                initiatePairedDataPath(peerHandle)
            }

            override fun onPairingVerificationSucceed(peerHandle: PeerHandle, alias: String) {
                initiatePairedDataPath(peerHandle)
            }

            override fun onPairingSetupFailed(peerHandle: PeerHandle) {
                fallbackToLegacy(peerHandle)
            }

            override fun onPairingVerificationFailed(peerHandle: PeerHandle) {
                fallbackToLegacy(peerHandle)
            }

            override fun onDataPathConnected(peerHandle: PeerHandle, networkInfo: WifiAwareNetworkInfo) {
                val service = discoveredPeers[peerHandle]
                emitEndpoint(
                    networkInfo,
                    service?.port ?: networkInfo.port,
                    service?.https ?: true,
                )
            }

            override fun onDataPathRequestFailed(peerHandle: PeerHandle, reason: Int) {
                Log.w(TAG, "Paired Wi-Fi Aware data path failed ($reason)")
                fallbackToLegacy(peerHandle)
            }

            override fun onSessionConfigFailed() {
                Log.w(TAG, "Wi-Fi Aware subscribe configuration failed")
            }
        }, handler)
    }

    private fun discoverLegacyPeer(peer: PeerHandle, serviceSpecificInfo: ByteArray) {
        val service = parseService(peer, serviceSpecificInfo) ?: return
        discoveredPeers[peer] = service
        subscribeSession?.sendMessage(peer, 0, MESSAGE_CONNECT.toByteArray(Charsets.UTF_8))
    }

    private fun fallbackToLegacy(peer: PeerHandle) {
        pairingPeers.remove(peer)
        val service = discoveredPeers[peer] ?: return
        subscribeSession?.sendMessage(service.peer, 0, MESSAGE_CONNECT.toByteArray(Charsets.UTF_8))
    }

    private fun initiatePairedDataPath(peer: PeerHandle) {
        if (Build.VERSION.SDK_INT < 37 || !requestedPeers.add(peer)) return
        val request = AwareDataPathRequest.Builder()
            .setTransportProtocol(IP_PROTOCOL_TCP)
            .build()
        if (subscribeSession?.initiateDataPathRequest(peer, request) != true) {
            requestedPeers.remove(peer)
            fallbackToLegacy(peer)
        }
    }

    private fun pairingConfig(): AwarePairingConfig? {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.UPSIDE_DOWN_CAKE) return null
        val characteristics = runCatching { awareManager?.characteristics }.getOrNull() ?: return null
        if (!characteristics.isAwarePairingSupported) return null
        return AwarePairingConfig.Builder()
            .setPairingSetupEnabled(true)
            .setPairingVerificationEnabled(true)
            .setPairingCacheEnabled(true)
            .setBootstrappingMethods(
                AwarePairingConfig.PAIRING_BOOTSTRAPPING_PIN_CODE_DISPLAY or
                    AwarePairingConfig.PAIRING_BOOTSTRAPPING_PIN_CODE_KEYPAD,
            )
            .build()
    }

    private fun selectBootstrappingMethod(config: AwarePairingConfig): Int? {
        val methods = config.bootstrappingMethods
        return when {
            methods and AwarePairingConfig.PAIRING_BOOTSTRAPPING_PIN_CODE_DISPLAY != 0 ->
                AwarePairingConfig.PAIRING_BOOTSTRAPPING_PIN_CODE_DISPLAY
            methods and AwarePairingConfig.PAIRING_BOOTSTRAPPING_PIN_CODE_KEYPAD != 0 ->
                AwarePairingConfig.PAIRING_BOOTSTRAPPING_PIN_CODE_KEYPAD
            else -> null
        }
    }

    private fun pairingCipherSuite(): Int {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            return Characteristics.WIFI_AWARE_CIPHER_SUITE_NCS_PK_PASN_128
        }
        val suites = runCatching { awareManager?.characteristics?.supportedPairingCipherSuites }.getOrNull() ?: 0
        return if (suites and Characteristics.WIFI_AWARE_CIPHER_SUITE_NCS_PK_PASN_256 != 0) {
            Characteristics.WIFI_AWARE_CIPHER_SUITE_NCS_PK_PASN_256
        } else {
            Characteristics.WIFI_AWARE_CIPHER_SUITE_NCS_PK_PASN_128
        }
    }

    private fun completeBootstrapping(
        session: DiscoverySession?,
        peer: PeerHandle,
        method: Int,
        initiator: Boolean,
    ) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.UPSIDE_DOWN_CAKE || session == null) return
        pairingPeers.add(peer)
        val localEntersPin = if (initiator) {
            method == AwarePairingConfig.PAIRING_BOOTSTRAPPING_PIN_CODE_DISPLAY
        } else {
            method == AwarePairingConfig.PAIRING_BOOTSTRAPPING_PIN_CODE_KEYPAD
        }
        if (localEntersPin) {
            promptForPairingPin { pin -> finishBootstrapping(session, peer, pin, initiator) }
        } else {
            val pin = randomPin()
            showPairingPin(pin)
            finishBootstrapping(session, peer, pin, initiator)
        }
    }

    private fun finishBootstrapping(session: DiscoverySession, peer: PeerHandle, pin: String?, initiator: Boolean) {
        if (pin == null) {
            pairingPeers.remove(peer)
            fallbackToLegacy(peer)
            return
        }
        pairingPasswords[peer] = pin
        if (initiator) {
            session.initiatePairingRequest(peer, peerAlias(peer), pairingCipherSuite(), pin)
        } else {
            pendingPairingRequests.remove(peer)?.let { (requestId, pendingSession) ->
                acceptPairing(pendingSession, peer, requestId, pin)
            }
        }
    }

    private fun acceptPairingWhenReady(session: DiscoverySession?, peer: PeerHandle, requestId: Int) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.UPSIDE_DOWN_CAKE || session == null) return
        pairingPasswords[peer]?.let { pin ->
            acceptPairing(session, peer, requestId, pin)
        } ?: run {
            pendingPairingRequests[peer] = requestId to session
        }
    }

    private fun acceptPairing(session: DiscoverySession, peer: PeerHandle, requestId: Int, pin: String) {
        session.acceptPairingRequest(requestId, peer, peerAlias(peer), pairingCipherSuite(), pin)
    }

    private fun promptForPairingPin(onResult: (String?) -> Unit) {
        handler.post {
            var completed = false
            fun complete(pin: String?) {
                if (!completed) {
                    completed = true
                    onResult(pin)
                }
            }
            val input = EditText(context).apply {
                inputType = InputType.TYPE_CLASS_NUMBER or InputType.TYPE_NUMBER_VARIATION_PASSWORD
                hint = context.getString(R.string.wifi_aware_pairing_code_hint)
            }
            AlertDialog.Builder(context)
                .setTitle(R.string.wifi_aware_pairing_title)
                .setMessage(R.string.wifi_aware_pairing_enter_message)
                .setView(input)
                .setPositiveButton(R.string.wifi_aware_pairing_action) { _, _ ->
                    complete(input.text.toString().takeIf { it.matches(Regex("[0-9]{8}")) })
                }
                .setNegativeButton(android.R.string.cancel) { _, _ -> complete(null) }
                .setOnCancelListener { complete(null) }
                .show()
        }
    }

    private fun showPairingPin(pin: String) {
        handler.post {
            val code = TextView(context).apply {
                text = pin
                textSize = 28f
                textAlignment = TextView.TEXT_ALIGNMENT_CENTER
                setPadding(32, 24, 32, 24)
            }
            AlertDialog.Builder(context)
                .setTitle(R.string.wifi_aware_pairing_title)
                .setMessage(R.string.wifi_aware_pairing_display_message)
                .setView(code)
                .setPositiveButton(android.R.string.ok, null)
                .show()
        }
    }

    private fun peerAlias(peer: PeerHandle): String = "localsend-${peer.hashCode().toUInt().toString(16)}"

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
                emitted = true
                emitEndpoint(info, endpoint.port, endpoint.https)
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

    private fun emitEndpoint(info: WifiAwareNetworkInfo, port: Int, https: Boolean) {
        if (port !in 1..65535) return
        val address = info.peerIpv6Addr ?: return
        val scopeId = address.scopeId
        if (scopeId == 0) return
        val hostAddress = address.hostAddress ?: return
        val host = "${hostAddress.substringBefore('%')}%$scopeId"
        handler.post {
            channel.invokeMethod(
                "wifiAwareEndpoint",
                mapOf("host" to host, "port" to port, "https" to https),
            )
        }
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
        pairingPeers.clear()
        pairingPasswords.clear()
        pendingPairingRequests.clear()
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

    private fun randomPin(): String = SecureRandom().nextInt(100_000_000).toString().padStart(8, '0')
}
