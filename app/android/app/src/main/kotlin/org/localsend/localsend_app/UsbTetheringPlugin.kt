package org.localsend.localsend_app

import android.content.Context
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import android.os.Build
import android.util.Log
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/**
 * USB Tethering Plugin for LocalSend.
 *
 * Detects and manages USB tethering connections for PRP (Peer Relay Protocol).
 * Uses Android's ConnectivityManager with TRANSPORT_USB (API 21+) to detect
 * when a device is connected via USB cable with tethering enabled.
 *
 * This enables P2P file transfer over USB cable without WiFi.
 */
class UsbTetheringPlugin(private val activity: MainActivity) {

    companion object {
        private const val TAG = "UsbTetheringPlugin"
        private const val CHANNEL = "org.localsend.localsend_app/usb_tethering"
    }

    private var connectivityManager: ConnectivityManager? = null
    private var tetheringCallback: ConnectivityManager.NetworkCallback? = null
    private var isTetheringActive = false

    /**
     * Register this plugin's method channel on the given Flutter engine.
     */
    fun configure(flutterEngine: FlutterEngine) {
        val context = activity.applicationContext
        connectivityManager = context.getSystemService(Context.CONNECTIVITY_SERVICE) as? ConnectivityManager

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "isUsbTetheringAvailable" -> isUsbTetheringAvailable(result)
                "isUsbTetheringActive" -> checkUsbTetheringActive(result)
                "startUsbTethering" -> startUsbTethering(result)
                "stopUsbTethering" -> stopUsbTethering(result)
                "connectUsbTethering" -> connectUsbTethering(call, result)
                "disconnectUsbTethering" -> disconnectUsbTethering(result)
                "listenUsbTetheringChanges" -> listenTetheringChanges(result)
                else -> result.notImplemented()
            }
        }
    }

    /**
     * Check if USB tethering is supported on this device.
     * Requires Android 5.0+ (API 21) for TRANSPORT_USB.
     */
    private fun isUsbTetheringAvailable(result: MethodChannel.Result) {
        val available = Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP
        Log.d(TAG, "USB tethering available: $available (SDK: ${Build.VERSION.SDK_INT})")
        result.success(available)
    }

    /**
     * Check if USB tethering is currently active.
     * Looks for a network with TRANSPORT_USB capability.
     */
    private fun checkUsbTetheringActive(result: MethodChannel.Result) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP) {
            result.success(false)
            return
        }

        val cm = connectivityManager ?: run {
            result.success(false)
            return
        }

        val activeNetwork = cm.activeNetwork
        val caps = activeNetwork?.let { cm.getNetworkCapabilities(it) }

        val hasUsbTransport = caps?.hasTransport(NetworkCapabilities.TRANSPORT_USB) == true
        Log.d(TAG, "USB tethering active: $hasUsbTransport")

        isTetheringActive = hasUsbTransport
        result.success(hasUsbTransport)
    }

    /**
     * Start USB tethering.
     *
     * On most Android devices, USB tethering must be enabled by the user
     * through system settings. This method checks if it's already active
     * and returns the current state. For actual tethering enable/disable,
     * we can open the system tethering settings page.
     */
    private fun startUsbTethering(result: MethodChannel.Result) {
        Log.d(TAG, "startUsbTethering called")

        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP) {
            result.error("UNSUPPORTED", "USB tethering requires Android 5.0+", null)
            return
        }

        checkUsbTetheringActive(object : MethodChannel.Result {
            override fun success(active: Any?) {
                val isActive = active as? Boolean ?: false
                if (isActive) {
                    // USB tethering is already active
                    val info = getUsbNetworkInfo()
                    result.success(mapOf(
                        "active" to true,
                        "interfaceName" to (info?.first ?: ""),
                        "ipAddress" to (info?.second ?: ""),
                    ))
                } else {
                    // Not active — tell Flutter to guide the user
                    result.success(mapOf(
                        "active" to false,
                        "interfaceName" to "",
                        "ipAddress" to "",
                        "needUserAction" to true,
                        "hint" to "Enable USB tethering in system settings",
                    ))
                }
            }

            override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {
                result.error(errorCode, errorMessage, errorDetails)
            }

            override fun notImplemented() {
                result.notImplemented()
            }
        })
    }

    /**
     * Stop USB tethering — we can only inform the user,
     * as programmatic disable requires system permission.
     */
    private fun stopUsbTethering(result: MethodChannel.Result) {
        Log.d(TAG, "stopUsbTethering called")
        unregisterTetheringCallback()
        isTetheringActive = false
        result.success(mapOf("stopped" to true))
    }

    /**
     * Connect via USB tethering.
     *
     * Binds to the USB network interface for LocalSend discovery.
     * If the USB tethering network is active, returns its info.
     */
    private fun connectUsbTethering(call: MethodCall, result: MethodChannel.Result) {
        Log.d(TAG, "connectUsbTethering called")
        checkUsbTetheringActive(object : MethodChannel.Result {
            override fun success(active: Any?) {
                val isActive = active as? Boolean ?: false
                if (isActive) {
                    val info = getUsbNetworkInfo()
                    result.success(mapOf(
                        "connected" to true,
                        "interfaceName" to (info?.first ?: ""),
                        "ipAddress" to (info?.second ?: ""),
                    ))
                } else {
                    result.success(mapOf(
                        "connected" to false,
                        "interfaceName" to "",
                        "ipAddress" to "",
                    ))
                }
            }

            override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {
                result.success(mapOf("connected" to false))
            }

            override fun notImplemented() {
                result.notImplemented()
            }
        })
    }

    /**
     * Disconnect from USB tethering network.
     */
    private fun disconnectUsbTethering(result: MethodChannel.Result) {
        Log.d(TAG, "disconnectUsbTethering called")
        unregisterTetheringCallback()
        result.success(mapOf("disconnected" to true))
    }

    /**
     * Listen for USB tethering state changes.
     * Registers a NetworkCallback to detect when USB tethering
     * becomes available or unavailable.
     */
    private fun listenTetheringChanges(result: MethodChannel.Result) {
        Log.d(TAG, "listenTetheringChanges called")

        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP) {
            result.success(false)
            return
        }

        val cm = connectivityManager ?: run {
            result.success(false)
            return
        }

        // Unregister existing callback first
        unregisterTetheringCallback()

        val request = NetworkRequest.Builder()
            .addTransportType(NetworkCapabilities.TRANSPORT_USB)
            .build()

        tetheringCallback = object : ConnectivityManager.NetworkCallback() {
            override fun onAvailable(network: Network) {
                Log.d(TAG, "USB tethering network available: $network")
                isTetheringActive = true
                // Notify Flutter via method channel if needed
            }

            override fun onLost(network: Network) {
                Log.d(TAG, "USB tethering network lost: $network")
                isTetheringActive = false
            }

            override fun onCapabilitiesChanged(network: Network, caps: NetworkCapabilities) {
                val hasInternet = caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
                Log.d(TAG, "USB network capabilities changed, internet: $hasInternet")
            }
        }

        cm.registerNetworkCallback(request, tetheringCallback!!)
        result.success(true)
    }

    // ============================================================
    //  HELPERS
    // ============================================================

    /**
     * Get the USB network interface name and IP address.
     */
    private fun getUsbNetworkInfo(): Pair<String, String>? {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP) return null

        val cm = connectivityManager ?: return null
        val activeNetwork = cm.activeNetwork ?: return null
        val caps = cm.getNetworkCapabilities(activeNetwork) ?: return null

        if (!caps.hasTransport(NetworkCapabilities.TRANSPORT_USB)) return null

        // Get link properties for the USB network
        val lp = cm.getLinkProperties(activeNetwork) ?: return null
        val interfaceName = lp.interfaceName ?: ""
        val ipAddress = lp.linkAddresses
            .firstOrNull { it.address is java.net.Inet4Address }
            ?.address
            ?.hostAddress ?: ""

        return Pair(interfaceName, ipAddress)
    }

    private fun unregisterTetheringCallback() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            try {
                tetheringCallback?.let {
                    connectivityManager?.unregisterNetworkCallback(it)
                }
                tetheringCallback = null
            } catch (e: Exception) {
                Log.w(TAG, "Error unregistering tethering callback", e)
            }
        }
    }

    /**
     * Clean up all resources.
     */
    fun dispose() {
        unregisterTetheringCallback()
    }
}
