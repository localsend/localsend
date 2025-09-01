package org.localsend.localsend_app

import android.R
import android.annotation.SuppressLint
import android.app.PendingIntent
import android.content.Intent
import android.graphics.drawable.Icon
import android.os.Build
import android.os.Build.VERSION_CODES
import android.service.quicksettings.TileService
import android.util.Log

/**
 * @see https://dev.to/djsmk123/fluttercreate-custom-quick-title-android-only-3ehp
 * @see https://github.com/ProtonVPN/android-app/blob/2290b3c6b8b5ded339d69ec7c12e15acbb4b4b3d/app/src/main/java/com/protonvpn/android/components/QuickTileService.kt#L171
 */
class QuickTileService : TileService() {
    override fun onClick() {
        super.onClick()

        launchApp()
    }

    override fun onStartListening() {
        super.onStartListening()
        qsTile.icon = Icon.createWithResource(this, R.drawable.ic_launcher_foreground)
        qsTile.label = packageManager.getApplicationLabel(application.applicationInfo)
        qsTile.updateTile()
    }

    @SuppressLint("StartActivityAndCollapseDeprecated")
    private fun launchApp() {
        try{
            val launchIntent = run {
                val cleanIntent = packageManager.getLaunchIntentForPackage(packageName)

                if (cleanIntent != null) {
                    cleanIntent
                } else {
                    val dirtyIntent = MainActivity.withNewEngine().dartEntrypointArgs(listOf<String>()).build(this)
                    dirtyIntent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                    dirtyIntent
                }
            }

            if (Build.VERSION.SDK_INT >= 34) {
                startActivityAndCollapse(
                    PendingIntent.getActivity(this, 0, launchIntent,
                        PendingIntent.FLAG_IMMUTABLE)
                )
            } else {
                startActivityAndCollapse(launchIntent)
            }
        }
        catch (e:Exception){
            Log.w(this.javaClass.toString(),"Exception $e")
        }
    }

    /*@SuppressLint("StartActivityAndCollapseDeprecated")
    private fun launchApp() {
        val launchIntent = packageManager.getLaunchIntentForPackage(packageName)
        if (Build.VERSION.SDK_INT >= 34) {
            startActivityAndCollapse(
                PendingIntent.getActivity(
                    this,
                    0,
                    launchIntent,
                    PendingIntent.FLAG_IMMUTABLE
                )
            )
        } else {
            startActivityAndCollapse(launchIntent)
        }
    }*/
}