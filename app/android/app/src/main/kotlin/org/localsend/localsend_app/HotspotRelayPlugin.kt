package org.localsend.localsend_app

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import android.net.wifi.WifiConfiguration
import android.net.wifi.WifiManager
import android.net.wifi.WifiNetworkSpecifier
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Log
import androidx.annotation.RequiresApi
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/**
 * PRP (Peer Relay Protocol) - Hotspot Relay Plugin for Android
 *
 * Enables devices to establish a temporary local network via WiFi hotspot
 * when they cannot discover each other on the same LAN.
 *
 * Two modes:
 *   HOTSPOT_HOST - Device creates a local-only hotspot and waits for peers
 *   HOTSPOT_CLIENT - Device scans QR and connects to the host's hotspot
 */
class HotspotRelayPlugin(private val activity: MainActivity) {

    companion object {
        private const val TAG = "HotspotRelayPlugin"
        private const val CHANNEL = "org.localsend.localsend_app/hotspot_relay"

        // Intent actions for hotspot state changes
        private const val ACTION_HOTSPOT_STATE_CHANGED =
            "android.net.wifi.WIFI_AP_STATE_CHANGED"
    }

    private var wifiManager: WifiManager? = null
    private var connectivityManager: ConnectivityManager? = null
    private var currentHotspotCallback: MethodChannel.Result? = null
    private var networkCallback: ConnectivityManager.NetworkCallback? = null
    private var hotspotStateReceiver: BroadcastReceiver? = null
    private var hotspotReservation: WifiManager.LocalOnlyHotspotReservation? = null

    /**
     * Register this plugin's method channel on the given Flutter engine.
     */
    fun configure(flutterEngine: FlutterEngine) {
        val context = activity.applicationContext
        wifiManager = context.getSystemService(Context.WIFI_SERVICE) as? WifiManager
        connectivityManager = context.getSystemService(Context.CONNECTIVITY_SERVICE) as? ConnectivityManager

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "startHotspot" -> startHotspot(result)
                "stopHotspot" -> stopHotspot(result)
                "isHotspotActive" -> isHotspotActive(result)
                "connectToWifi" -> connectToWifi(call, result)
                "disconnectWifi" -> disconnectWifi(result)
                "isConnectedToHotspot" -> isConnectedToHotspot(result)
                "getHotspotInfo" -> getHotspotInfo(result)
                else -> result.notImplemented()
            }
        }
    }

    // ============================================================
    //  HOTSPOT HOST MODE
    // ============================================================

    /**
     * Start a local-only hotspot.
     *
     * On Android 8.0+ (API 26+), uses [WifiManager.startLocalOnlyHotspot]
     * which creates a secure hotspot without internet access.
     *
     * On older devices, falls back to [WifiManager.setWifiApEnabled] (requires
     * system permission on some devices).
     */
    @RequiresApi(Build.VERSION_CODES.O)
    private fun startHotspot(result: MethodChannel.Result) {
        Log.d(TAG, "startHotspot called")

        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) {
            result.error("UNSUPPORTED", "Hotspot relay requires Android 8.0+", null)
            return
        }

        // Check if hotspot is already running
        if (isHotspotRunning()) {
            Log.d(TAG, "Hotspot already running, returning current info")
            val info = getCurrentHotspotInfo()
            if (info != null) {
                result.success(info)
            } else {
                result.error("ALREADY_RUNNING", "Hotspot is already running but info unavailable", null)
            }
            return
        }

        try {
            val wifiManager = wifiManager ?: run {
                result.error("NO_WIFI_SERVICE", "WiFi service unavailable", null)
                return
            }

            currentHotspotCallback = result

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                // Android 13+: Use new API
                startHotspotAndroid13(wifiManager, result)
            } else {
                // Android 8-12: Use LocalOnlyHotspot
                startLocalOnlyHotspot(wifiManager, result)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Failed to start hotspot", e)
            result.error("HOTSPOT_ERROR", "Failed to start hotspot: ${e.message}", null)
        }
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private fun startLocalOnlyHotspot(wifiManager: WifiManager, result: MethodChannel.Result) {
        // Public signature: startLocalOnlyHotspot(LocalOnlyHotspotCallback callback, Handler handler)
        wifiManager.startLocalOnlyHotspot(
            object : WifiManager.LocalOnlyHotspotCallback() {
                override fun onStarted(reservation: WifiManager.LocalOnlyHotspotReservation) {
                    Log.d(TAG, "LocalOnlyHotspot started")
                    // Keep the reservation alive to prevent hotspot from stopping
                    hotspotReservation = reservation

                    val config = reservation.wifiConfiguration
                    val ssid = config?.SSID?.trim('"') ?: "LocalSend-Relay"
                    val password = config?.preSharedKey?.trim('"') ?: ""

                    Log.d(TAG, "Hotspot SSID: $ssid, Password: $password")

                    // Return hotspot info to Flutter
                    val info = mapOf(
                        "ssid" to ssid,
                        "password" to password,
                        "isRunning" to true,
                    )
                    result.success(info)

                    // Register broadcast receiver to monitor hotspot state
                    registerHotspotStateReceiver(reservation)
                }

                override fun onStopped() {
                    Log.d(TAG, "LocalOnlyHotspot stopped")
                    val info = mapOf(
                        "ssid" to "",
                        "password" to "",
                        "isRunning" to false,
                    )
                    // If there's a pending result, it already completed.
                    // Notify Flutter via a separate mechanism if needed.
                }

                override fun onFailed(reason: Int) {
                    Log.e(TAG, "LocalOnlyHotspot failed, reason: $reason")
                    val errorMsg = when (reason) {
                        WifiManager.LocalOnlyHotspotCallback.ERROR_NO_CHANNEL ->
                            "No channel available"
                        WifiManager.LocalOnlyHotspotCallback.ERROR_GENERIC ->
                            "Generic hotspot error"
                        WifiManager.LocalOnlyHotspotCallback.ERROR_INCOMPATIBLE_MODE ->
                            "Incompatible mode (tethering already active)"
                        else -> "Unknown error (code: $reason)"
                    }
                    result.error("HOTSPOT_FAILED", errorMsg, null)
                }
            },
            Handler(Looper.getMainLooper()),
        )
    }

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    private fun startHotspotAndroid13(wifiManager: WifiManager, result: MethodChannel.Result) {
        // On Android 13+, we can use the newer SoftApConfiguration API
        // but startLocalOnlyHotspot still works as the primary method.
        // Fall through to the standard approach.
        startLocalOnlyHotspot(wifiManager, result)
    }

    /**
     * Stop the current hotspot.
     */
    private fun stopHotspot(result: MethodChannel.Result) {
        Log.d(TAG, "stopHotspot called")
        // Close the reservation to stop the hotspot
        try {
            hotspotReservation?.close()
        } catch (e: Exception) {
            Log.w(TAG, "Error closing hotspot reservation", e)
        }
        hotspotReservation = null

        unregisterHotspotStateReceiver()
        unregisterNetworkCallback()

        result.success(mapOf("stopped" to true))
    }

    /**
     * Check if the hotspot is currently active.
     */
    private fun isHotspotActive(result: MethodChannel.Result) {
        result.success(isHotspotRunning())
    }

    /**
     * Get current hotspot info (SSID, password, etc.)
     */
    private fun getHotspotInfo(result: MethodChannel.Result) {
        val info = getCurrentHotspotInfo()
        if (info != null) {
            result.success(info)
        } else {
            result.success(mapOf(
                "ssid" to "",
                "password" to "",
                "isRunning" to false,
            ))
        }
    }

    // ============================================================
    //  HOTSPOT CLIENT MODE
    // ============================================================

    /**
     * Connect to a WiFi network (peer's hotspot).
     *
     * On Android 10+ (API 29+), uses [WifiNetworkSpecifier] for a
     * seamless connection experience.
     *
     * On older devices, uses [WifiManager] to configure and connect.
     */
    private fun connectToWifi(call: MethodCall, result: MethodChannel.Result) {
        val ssid = call.argument<String>("ssid") ?: ""
        val password = call.argument<String>("password") ?: ""

        Log.d(TAG, "connectToWifi: SSID=$ssid")

        if (ssid.isEmpty()) {
            result.error("INVALID_SSID", "SSID cannot be empty", null)
            return
        }

        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                connectToWifiAndroid10(ssid, password, result)
            } else {
                connectToWifiLegacy(ssid, password, result)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Failed to connect to WiFi", e)
            result.error("CONNECT_ERROR", "Failed to connect: ${e.message}", null)
        }
    }

    @RequiresApi(Build.VERSION_CODES.Q)
    private fun connectToWifiAndroid10(
        ssid: String,
        password: String,
        result: MethodChannel.Result
    ) {
        val specifier = WifiNetworkSpecifier.Builder()
            .setSsid(ssid)
            .setWpa2Passphrase(password)
            .setIsEnhancedOpen(false)
            .build()

        val request = NetworkRequest.Builder()
            .addTransportType(NetworkCapabilities.TRANSPORT_WIFI)
            .removeCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
            .setNetworkSpecifier(specifier)
            .build()

        val cm = connectivityManager ?: run {
            result.error("NO_CONNECTIVITY", "Connectivity service unavailable", null)
            return
        }

        // Register a network callback to track connection progress
        val callback = object : ConnectivityManager.NetworkCallback() {
            override fun onAvailable(network: Network) {
                Log.d(TAG, "Connected to hotspot network: $network")
                // Attempt to bind to this network for discovery
                cm.bindProcessToNetwork(network)
                result.success(mapOf("connected" to true, "ssid" to ssid))
            }

            override fun onUnavailable() {
                Log.e(TAG, "Hotspot network unavailable")
                result.error("CONNECT_UNAVAILABLE", "Could not connect to hotspot", null)
            }

            override fun onLost(network: Network) {
                Log.d(TAG, "Lost hotspot network: $network")
            }
        }

        networkCallback = callback
        cm.requestNetwork(request, callback)
    }

    private fun connectToWifiLegacy(
        ssid: String,
        password: String,
        result: MethodChannel.Result
    ) {
        val wifiManager = wifiManager ?: run {
            result.error("NO_WIFI_SERVICE", "WiFi service unavailable", null)
            return
        }

        val wifiConfig = WifiConfiguration().apply {
            SSID = "\"$ssid\""
            preSharedKey = "\"$password\""
            allowedKeyManagement.set(WifiConfiguration.KeyMgmt.WPA_PSK)
        }

        // Remove existing configuration for this SSID
        val existingNetId = wifiManager.configuredNetworks
            .firstOrNull { it.SSID?.trim('"') == ssid }
            ?.networkId

        if (existingNetId != null) {
            wifiManager.removeNetwork(existingNetId)
        }

        val netId = wifiManager.addNetwork(wifiConfig)
        if (netId == -1) {
            result.error("CONNECT_FAILED", "Failed to add network configuration", null)
            return
        }

        val connected = wifiManager.enableNetwork(netId, true)
        if (connected) {
            wifiManager.reconnect()
            result.success(mapOf("connected" to true, "ssid" to ssid))
        } else {
            result.error("CONNECT_FAILED", "Failed to enable network", null)
        }
    }

    /**
     * Disconnect from the current hotspot network.
     */
    private fun disconnectWifi(result: MethodChannel.Result) {
        Log.d(TAG, "disconnectWifi called")
        unregisterNetworkCallback()

        // Release the hotspot network
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            connectivityManager?.let { cm ->
                networkCallback?.let { cm.unregisterNetworkCallback(it) }
            }
        }

        result.success(mapOf("disconnected" to true))
    }

    /**
     * Check if currently connected to the hotspot network.
     */
    private fun isConnectedToHotspot(result: MethodChannel.Result) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) {
            result.success(false)
            return
        }

        val cm = connectivityManager
        val activeNetwork = cm?.activeNetwork ?: run {
            result.success(false)
            return
        }

        val caps = cm.getNetworkCapabilities(activeNetwork)
        val isWifi = caps?.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) == true
        // Check if the network does NOT have internet (characteristic of local-only hotspot)
        val hasInternet = caps?.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET) == true

        result.success(isWifi && !hasInternet)
    }

    // ============================================================
    //  HELPERS
    // ============================================================

    /**
     * WifiManager exposes no public API to query soft-AP / LocalOnlyHotspot state.
     * We therefore track our own reservation first, and only fall back to the hidden
     * `isWifiApEnabled` API via reflection. That fallback is blocked by the hidden-API
     * restrictions on API 28+, in which case this simply returns false.
     */
    private fun isHotspotRunning(): Boolean {
        if (hotspotReservation != null) {
            return true
        }
        return try {
            val method = wifiManager?.javaClass?.getMethod("isWifiApEnabled")
            method?.isAccessible = true
            method?.invoke(wifiManager) as? Boolean ?: false
        } catch (e: Exception) {
            Log.w(TAG, "Failed to check hotspot state", e)
            false
        }
    }

    private fun getCurrentHotspotInfo(): Map<String, Any>? {
        // Preferred path: the configuration of the reservation we own (public API).
        hotspotReservation?.wifiConfiguration?.let { config ->
            return mapOf(
                "ssid" to (config.SSID?.trim('"') ?: ""),
                "password" to (config.preSharedKey?.trim('"') ?: ""),
                "isRunning" to true,
            )
        }

        // Fallback: hidden WifiManager API via reflection.
        // WifiConfiguration exposes SSID / preSharedKey as public *fields*, not getters.
        return try {
            val getConfigMethod = wifiManager?.javaClass?.getMethod("getWifiApConfiguration")
            getConfigMethod?.isAccessible = true
            val config = getConfigMethod?.invoke(wifiManager)
            if (config != null) {
                val ssidField = config.javaClass.getField("SSID")
                val pskField = config.javaClass.getField("preSharedKey")
                mapOf(
                    "ssid" to ((ssidField.get(config) as? String)?.trim('"') ?: ""),
                    "password" to ((pskField.get(config) as? String)?.trim('"') ?: ""),
                    "isRunning" to isHotspotRunning(),
                )
            } else {
                null
            }
        } catch (e: Exception) {
            Log.w(TAG, "Failed to get hotspot info", e)
            null
        }
    }

    /**
     * Register a BroadcastReceiver to monitor hotspot state changes.
     * This is used to detect when the hotspot is turned off externally.
     */
    private fun registerHotspotStateReceiver(reservation: WifiManager.LocalOnlyHotspotReservation) {
        val filter = IntentFilter(ACTION_HOTSPOT_STATE_CHANGED)

        hotspotStateReceiver = object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                val state = intent.getIntExtra("wifi_state", 0)
                Log.d(TAG, "Hotspot state changed: $state")
                if (state == 10 || state == 11) { // WIFI_AP_STATE_DISABLING or DISABLED
                    // Hotspot was disabled externally
                    try {
                        reservation.close()
                    } catch (e: Exception) {
                        Log.w(TAG, "Error closing reservation", e)
                    }
                }
            }
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            activity.registerReceiver(hotspotStateReceiver, filter, Context.RECEIVER_NOT_EXPORTED)
        } else {
            activity.registerReceiver(hotspotStateReceiver, filter)
        }
    }

    private fun unregisterHotspotStateReceiver() {
        try {
            hotspotStateReceiver?.let { activity.unregisterReceiver(it) }
            hotspotStateReceiver = null
        } catch (e: Exception) {
            Log.w(TAG, "Error unregistering hotspot receiver", e)
        }
    }

    private fun unregisterNetworkCallback() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            try {
                networkCallback?.let {
                    connectivityManager?.unregisterNetworkCallback(it)
                }
                networkCallback = null
            } catch (e: Exception) {
                Log.w(TAG, "Error unregistering network callback", e)
            }
        }
    }

    /**
     * Clean up all resources.
     */
    fun dispose() {
        try {
            hotspotReservation?.close()
        } catch (e: Exception) {
            Log.w(TAG, "Error closing hotstop reservation on dispose", e)
        }
        hotspotReservation = null
        unregisterHotspotStateReceiver()
        unregisterNetworkCallback()
    }
}
