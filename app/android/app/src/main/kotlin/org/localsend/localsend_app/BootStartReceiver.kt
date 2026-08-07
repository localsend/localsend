package org.localsend.localsend_ng

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

const val EXTRA_BACKGROUND_START = "org.localsend.localsend_ng.BACKGROUND_START"

class BootStartReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val action = intent.action ?: return
        if (
            action != Intent.ACTION_BOOT_COMPLETED &&
            action != Intent.ACTION_MY_PACKAGE_REPLACED &&
            action != Intent.ACTION_PACKAGE_REPLACED
        ) {
            return
        }

        try {
            val launchIntent = MainActivity.createDefaultIntent(context).apply {
                flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS or Intent.FLAG_ACTIVITY_NO_ANIMATION
                putExtra(EXTRA_BACKGROUND_START, true)
            }
            context.startActivity(launchIntent)
        } catch (e: Exception) {
            Log.w("LocalSendNG", "Could not auto-start background receiver", e)
        }
    }
}
