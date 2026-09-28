package org.localsend.localsend_app

import android.content.ComponentName
import android.content.Context
import android.graphics.drawable.Icon
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.service.quicksettings.Tile
import android.service.quicksettings.TileService
import android.util.Log
import android.widget.Toast
import androidx.annotation.RequiresApi
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

@RequiresApi(Build.VERSION_CODES.N)
class QuickTileService : TileService() {
    override fun onClick() {
        super.onClick()
        ReceivingTileBridge.toggle(this) {
            ReceivingTileBridge.setEnabled(this, true)
            try {
                ReceivingService.start(this)
            } catch (e: Exception) {
                Log.w(javaClass.simpleName, "Could not start receiving", e)
                ReceivingTileBridge.setEnabled(this, false)
                Toast.makeText(this, R.string.receiving_tile_busy, Toast.LENGTH_SHORT).show()
            }
        }
    }

    override fun onStartListening() {
        super.onStartListening()
        val tile = qsTile ?: return
        val receiving = ReceivingTileBridge.receiving
        tile.icon = Icon.createWithResource(this, R.mipmap.ic_launcher_quicktile_foreground)
        val stateLabel = getString(if (receiving) R.string.receiving_tile_on else R.string.receiving_tile_off)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            tile.label = getString(R.string.receiving_tile)
            tile.subtitle = getString(if (receiving) R.string.receiving_tile_state_on else R.string.receiving_tile_state_off)
        } else {
            tile.label = stateLabel
        }
        tile.contentDescription = stateLabel
        tile.state = if (receiving) Tile.STATE_ACTIVE else Tile.STATE_INACTIVE
        tile.updateTile()
    }

}

/** Routes tile and notification actions to the active Flutter engine. */
internal object ReceivingTileBridge {
    private const val channelName = "org.localsend.localsend_app/receiving_tile"
    private const val preferencesName = "receiving_tile"
    private const val enabledKey = "receiving_enabled"
    private var uiChannel: MethodChannel? = null
    private var backgroundChannel: MethodChannel? = null
    var uiAttached = false
        private set
    var receiving: Boolean = false
        private set

    fun attach(context: Context, messenger: BinaryMessenger, background: Boolean = false) {
        val channel = MethodChannel(messenger, channelName).also { methodChannel ->
            methodChannel.setMethodCallHandler { call, result ->
                when (call.method) {
                    "isReceivingEnabled" -> result.success(isEnabled(context))
                    "setReceivingState" -> {
                        receiving = call.arguments == true
                        setEnabled(context, receiving)
                        if (receiving) ReceivingService.start(context) else ReceivingService.stop(context)
                        refresh(context)
                        result.success(null)
                    }
                    "stopBackgroundReceiver" -> ReceivingService.instance?.stopBackgroundEngine { stopped -> result.success(stopped) } ?: result.success(true)
                    "showIncomingRequest" -> {
                        val args = call.arguments as? Map<*, *>
                        val sessionId = args?.get("sessionId") as? String
                        val sender = args?.get("sender") as? String
                        val fileCount = args?.get("fileCount") as? Int
                        val fileName = args?.get("fileName") as? String
                        val previewBytes = args?.get("previewBytes") as? ByteArray
                        if (sessionId == null || sender == null || fileCount == null) {
                            result.error("INVALID_REQUEST", "Missing incoming request details", null)
                        } else {
                            ReceivingService.instance?.showRequest(sessionId, sender, fileCount, fileName, previewBytes)
                            result.success(null)
                        }
                    }
                    "dismissIncomingRequest" -> {
                        ReceivingService.instance?.dismissRequest(call.arguments as? String)
                        result.success(null)
                    }
                    "showCompletedFile" -> {
                        val args = call.arguments as? Map<*, *>
                        val entryId = args?.get("entryId") as? String
                        val fileName = args?.get("fileName") as? String
                        val sender = args?.get("sender") as? String
                        if (entryId == null || fileName == null || sender == null) {
                            result.error("INVALID_FILE", "Missing received file details", null)
                        } else {
                            ReceivingService.instance?.showCompletedFile(entryId, fileName, sender)
                            result.success(null)
                        }
                    }
                    "backgroundFailed" -> {
                        setEnabled(context, false)
                        ReceivingService.stop(context)
                        result.success(null)
                    }
                    else -> result.notImplemented()
                }
            }
        }
        if (background) backgroundChannel = channel else {
            uiChannel = channel
            uiAttached = true
        }
    }

    fun detach(context: Context, background: Boolean = false) {
        if (background) {
            backgroundChannel?.setMethodCallHandler(null)
            backgroundChannel = null
        } else {
            uiChannel?.setMethodCallHandler(null)
            uiChannel = null
            uiAttached = false
            Handler(Looper.getMainLooper()).postDelayed({ ReceivingService.instance?.ensureBackgroundEngine() }, 500)
        }
        receiving = ReceivingService.instance != null && isEnabled(context)
        refresh(context)
    }

    fun isEnabled(context: Context): Boolean =
        context.getSharedPreferences(preferencesName, Context.MODE_PRIVATE).getBoolean(enabledKey, true)

    fun setEnabled(context: Context, enabled: Boolean) {
        context.getSharedPreferences(preferencesName, Context.MODE_PRIVATE).edit().putBoolean(enabledKey, enabled).apply()
        receiving = enabled && ReceivingService.instance != null
        refresh(context)
    }

    fun serviceStopped(context: Context) {
        receiving = false
        refresh(context)
    }

    fun toggle(context: Context, onUnavailable: () -> Unit) {
        val methodChannel = backgroundChannel ?: uiChannel ?: return onUnavailable()
        methodChannel.invokeMethod("toggleReceiving", null, object : MethodChannel.Result {
            override fun success(result: Any?) {
                if (result is Boolean) {
                    receiving = result
                    refresh(context)
                } else {
                    onUnavailable()
                }
            }

            override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {
                if (errorCode == "RECEIVING_BUSY") {
                    Toast.makeText(context, R.string.receiving_tile_busy, Toast.LENGTH_SHORT).show()
                } else {
                    onUnavailable()
                }
            }
            override fun notImplemented() = onUnavailable()
        })
    }

    fun sendRequestAction(sessionId: String, accept: Boolean) {
        val methodChannel = backgroundChannel ?: uiChannel ?: return
        methodChannel.invokeMethod("incomingRequestAction", mapOf("sessionId" to sessionId, "accept" to accept), object : MethodChannel.Result {
            override fun success(result: Any?) {
                if (result == true) ReceivingService.instance?.dismissRequest(sessionId)
            }
            override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {
                Log.w("ReceivingTile", "Incoming request action failed: $errorCode $errorMessage")
            }
            override fun notImplemented() {}
        })
    }

    fun refresh(context: Context) {
        TileService.requestListeningState(context, ComponentName(context, QuickTileService::class.java))
    }
}
