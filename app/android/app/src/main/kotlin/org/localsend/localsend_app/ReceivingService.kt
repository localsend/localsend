package org.localsend.localsend_app

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.pm.ServiceInfo
import android.graphics.BitmapFactory
import android.os.Build
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.util.Log
import android.widget.RemoteViews
import io.flutter.FlutterInjector
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel

class ReceivingService : Service() {
    companion object {
        private const val readyChannel = "localsend_receiving"
        private const val requestChannel = "localsend_incoming_request"
        private const val completedChannel = "localsend_received_files"
        private const val readyNotificationId = 101
        private const val requestNotificationId = 102
        private const val actionEnable = "org.localsend.ENABLE_RECEIVING"
        private const val actionAccept = "org.localsend.ACCEPT_REQUEST"
        private const val actionDecline = "org.localsend.DECLINE_REQUEST"
        private const val sessionKey = "sessionId"

        var instance: ReceivingService? = null
            private set

        fun start(context: Context) {
            val intent = Intent(context, ReceivingService::class.java).setAction(actionEnable)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                context.startForegroundService(intent)
            } else {
                context.startService(intent)
            }
        }

        fun stop(context: Context) {
            Handler(Looper.getMainLooper()).postDelayed({ context.stopService(Intent(context, ReceivingService::class.java)) }, 200)
        }
    }

    private val notifications by lazy { getSystemService(NotificationManager::class.java) }
    private var backgroundEngine: FlutterEngine? = null
    private var backgroundChannel: MethodChannel? = null
    private var activeSessionId: String? = null

    override fun onCreate() {
        super.onCreate()
        instance = this
        if (ReceivingTileBridge.isEnabled(this)) ReceivingTileBridge.setEnabled(this, true)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            notifications.createNotificationChannel(NotificationChannel(readyChannel, getString(R.string.receiving_service_title), NotificationManager.IMPORTANCE_LOW))
            notifications.createNotificationChannel(NotificationChannel(requestChannel, getString(R.string.receiving_tile), NotificationManager.IMPORTANCE_HIGH))
            notifications.createNotificationChannel(NotificationChannel(completedChannel, getString(R.string.received_file_channel), NotificationManager.IMPORTANCE_DEFAULT))
        }
        val builder = notificationBuilder(readyChannel)
            .setSmallIcon(R.mipmap.ic_launcher_quicktile_foreground)
            .setContentTitle(getString(R.string.receiving_service_title))
            .setContentText(getString(R.string.receiving_service_text))
            .setOngoing(true)
            .setContentIntent(PendingIntent.getActivity(this, 0, MainActivity.createDefaultIntent(this), PendingIntent.FLAG_IMMUTABLE))
        val notification = builder.build()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            startForeground(readyNotificationId, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_CONNECTED_DEVICE)
        } else {
            startForeground(readyNotificationId, notification)
        }
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            actionAccept, actionDecline -> {
                val sessionId = intent.getStringExtra(sessionKey)
                if (sessionId != null && sessionId == activeSessionId) {
                    ReceivingTileBridge.sendRequestAction(sessionId, intent.action == actionAccept)
                }
            }
            else -> {
                if (ReceivingTileBridge.isEnabled(this)) ensureBackgroundEngine()
                else stopSelf()
            }
        }
        return START_STICKY
    }

    fun ensureBackgroundEngine() {
        if (ReceivingTileBridge.uiAttached || backgroundEngine != null || !ReceivingTileBridge.isEnabled(this)) return
        try {
            val loader = FlutterInjector.instance().flutterLoader()
            loader.startInitialization(this)
            loader.ensureInitializationComplete(this, null)
            val engine = FlutterEngine(this)
            backgroundEngine = engine
            ReceivingTileBridge.attach(this, engine.dartExecutor.binaryMessenger, background = true)
            backgroundChannel = MethodChannel(engine.dartExecutor.binaryMessenger, "org.localsend.localsend_app/receiving_tile")
            engine.dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint(loader.findAppBundlePath(), "receiverMain"))
        } catch (e: Exception) {
            Log.e("ReceivingService", "Could not start background receiver", e)
            ReceivingTileBridge.setEnabled(this, false)
            stopSelf()
        }
    }

    fun stopBackgroundEngine(done: (Boolean) -> Unit) {
        val channel = backgroundChannel
        if (channel == null) {
            done(true)
            return
        }
        channel.invokeMethod("shutdownBackground", null, object : MethodChannel.Result {
            override fun success(result: Any?) {
                if (result == false) done(false) else finish()
            }
            override fun error(code: String, message: String?, details: Any?) = finish()
            override fun notImplemented() = finish()

            private fun finish() {
                val engine = backgroundEngine
                backgroundEngine = null
                backgroundChannel = null
                if (engine != null) {
                    ReceivingTileBridge.detach(this@ReceivingService, background = true)
                    engine.destroy()
                }
                done(true)
            }
        })
    }

    fun showRequest(sessionId: String, sender: String, fileCount: Int, fileName: String?, previewBytes: ByteArray?) {
        activeSessionId = sessionId
        val senderName = sender.ifBlank { getString(R.string.incoming_request_unknown_sender) }
        val description = when {
            fileCount == 0 -> getString(R.string.incoming_request_message)
            fileCount == 1 && !fileName.isNullOrBlank() -> getString(R.string.incoming_request_file, fileName)
            else -> getString(R.string.incoming_request_files, fileCount)
        }
        val openIntent = PendingIntent.getActivity(this, 0, MainActivity.createDefaultIntent(this), PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT)
        val accept = requestAction(actionAccept, sessionId, 1)
        val decline = requestAction(actionDecline, sessionId, 2)
        val builder = notificationBuilder(requestChannel)
            .setSmallIcon(R.mipmap.ic_launcher_quicktile_foreground)
            .setContentTitle(senderName)
            .setContentText(description)
            .setSubText(getString(R.string.receiving_service_title))
            .setCategory(Notification.CATEGORY_EVENT)
            .setPriority(Notification.PRIORITY_HIGH)
            .setAutoCancel(false)
            .setContentIntent(openIntent)
            .addAction(android.R.drawable.ic_menu_save, getString(R.string.incoming_request_accept), accept)
            .addAction(android.R.drawable.ic_menu_close_clear_cancel, getString(R.string.incoming_request_decline), decline)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            val compactView = RemoteViews(packageName, R.layout.incoming_request_compact).apply {
                setTextViewText(R.id.incoming_sender, senderName)
                setTextViewText(R.id.incoming_description, description)
                setOnClickPendingIntent(R.id.incoming_decline, decline)
                setOnClickPendingIntent(R.id.incoming_accept, accept)
            }
            builder.setCustomContentView(compactView)
            builder.setCustomHeadsUpContentView(compactView)
            builder.setStyle(Notification.DecoratedCustomViewStyle())
        }
        if (previewBytes != null && previewBytes.size <= 64 * 1024) {
            val bitmap = BitmapFactory.decodeByteArray(previewBytes, 0, previewBytes.size)
            if (bitmap != null) {
                builder.setLargeIcon(bitmap)
                builder.setStyle(Notification.BigPictureStyle().bigPicture(bitmap).setBigContentTitle(senderName).setSummaryText(description))
            }
        }
        notifications.notify(requestNotificationId, builder.build())
    }

    fun dismissRequest(sessionId: String?) {
        if (sessionId == null || sessionId != activeSessionId) return
        activeSessionId = null
        notifications.cancel(requestNotificationId)
    }

    fun showCompletedFile(entryId: String, fileName: String, sender: String) {
        val notificationId = 1000 + (entryId.hashCode() and 0x3fffffff)
        val openIntent = MainActivity.createDefaultIntent(this).putExtra(MainActivity.receivedFileIdExtra, entryId)
        val open = PendingIntent.getActivity(this, notificationId, openIntent, PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE)
        val notification = notificationBuilder(completedChannel)
            .setSmallIcon(R.mipmap.ic_launcher_quicktile_foreground)
            .setContentTitle(getString(R.string.received_file_title, fileName))
            .setContentText(getString(R.string.received_file_sender, sender))
            .setContentIntent(open)
            .setAutoCancel(true)
            .build()
        notifications.notify(notificationId, notification)
    }

    private fun requestAction(action: String, sessionId: String, requestCode: Int): PendingIntent {
        val intent = Intent(this, ReceivingService::class.java).setAction(action).putExtra(sessionKey, sessionId)
        return PendingIntent.getService(this, requestCode, intent, PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE)
    }

    private fun notificationBuilder(channel: String): Notification.Builder =
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) Notification.Builder(this, channel) else Notification.Builder(this)

    override fun onDestroy() {
        dismissRequest(activeSessionId)
        backgroundEngine?.let { engine ->
            ReceivingTileBridge.detach(this, background = true)
            engine.destroy()
        }
        backgroundEngine = null
        backgroundChannel = null
        instance = null
        ReceivingTileBridge.serviceStopped(this)
        super.onDestroy()
    }

    override fun onBind(intent: Intent?): IBinder? = null
}
