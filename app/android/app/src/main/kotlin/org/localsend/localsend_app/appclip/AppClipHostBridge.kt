package org.localsend.localsend_app.appclip

import android.content.Context
import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel

/** Keeps App Clip host lifecycle calls on LocalSend's existing native bridge and emits redacted state events. */
object AppClipHostBridge {
    private const val EVENT_CHANNEL = "org.localsend.localsend_app/localsend/app-clip-events"
    private val mainHandler = Handler(Looper.getMainLooper())
    private var eventSink: EventChannel.EventSink? = null
    private val listener: (Map<String, Any?>) -> Unit = { state ->
        mainHandler.post { eventSink?.success(state) }
    }

    fun configureEvents(messenger: BinaryMessenger) {
        EventChannel(messenger, EVENT_CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
                    eventSink = events
                    AppClipHostStateBus.add(listener)
                }

                override fun onCancel(arguments: Any?) {
                    AppClipHostStateBus.remove(listener)
                    eventSink = null
                }
            },
        )
    }

    fun getPrerequisites(context: Context): Map<String, Any> = AppClipHostService.prerequisites(context)
    fun getState(): Map<String, Any?> = AppClipHostStateBus.snapshot()
    fun start(context: Context, deviceName: String): Map<String, Any?> = AppClipHostService.start(context, deviceName)
    fun stop(context: Context) = AppClipHostService.stop(context)
    fun getInvocationUrl(): String? = AppClipHostService.invocationUrl()
    fun getBootstrap(): Map<String, Any>? = AppClipHostService.bootstrap()
    fun acknowledgeBootstrap(context: Context, sessionId: String): Boolean = AppClipHostService.acknowledge(context, sessionId)
}
