package org.localsend.localsend_app

import android.annotation.SuppressLint
import android.app.ActivityManager
import android.app.PendingIntent
import android.content.Intent
import android.graphics.drawable.Icon
import android.os.Build
import android.service.quicksettings.TileService
import android.util.Log
import androidx.annotation.RequiresApi

/**
 * Service used to launch the app as a quick tile from the top/status bar
 * @see https://dev.to/djsmk123/fluttercreate-custom-quick-title-android-only-3ehp
 * @see https://github.com/ProtonVPN/android-app/blob/2290b3c6b8b5ded339d69ec7c12e15acbb4b4b3d/app/src/main/java/com/protonvpn/android/components/QuickTileService.kt#L171
 */
@RequiresApi(Build.VERSION_CODES.N)
class QuickTileService : TileService() {
    override fun onClick() {
        super.onClick()

        launchApp()
    }



    override fun onStartListening() {
        super.onStartListening()
        setupIcon()
    }

    private fun setupIcon() {
        // The tile is only available between `onStartListening` and
        // `onStopListening`, so we ensure the tile is available
        if (qsTile == null) {
            return
        }

        qsTile.icon =
            Icon.createWithResource(this, R.mipmap.ic_launcher_quicktile_foreground)
        qsTile.label = packageManager.getApplicationLabel(application.applicationInfo)
        qsTile.updateTile()
    }

    @SuppressLint("StartActivityAndCollapseDeprecated")
    private fun launchApp() {
        try{
            val launchIntent = getLaunchIntent()

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
                // Starting from `Build.VERSION_CODES.UPSIDE_DOWN_CAKE` we can
                // no longer start and collapse an Intent. We need to use a
                // PendingIntent instead.
                //
                // The request code can be used to identify the pending intent
                // request if needed. We don't, hence the 0.
                //
                // The launch intent used for the tile doesn't need any data
                // thus we mark it as immutable to ensure maximal reuse.
                startActivityAndCollapse(
                    PendingIntent.getActivity(this, 0, launchIntent,
                        PendingIntent.FLAG_IMMUTABLE)
                )
            } else {
                // For any version below `Build.VERSION_CODES.UPSIDE_DOWN_CAKE`
                // we can simply start the intent directly.
                startActivityAndCollapse(launchIntent)
            }
        }
        catch (e:Exception){
            Log.w(this.javaClass.toString(),"Exception $e")
        }
    }

    private fun getLaunchIntent(): Intent {
        // Getting the launch intent from the package manager is the optimal
        // way to get the proper intent to launch the app.
        val cleanIntent = packageManager.getLaunchIntentForPackage(packageName)

        return if (cleanIntent != null) {
            cleanIntent
        } else {
            // If we can't get the launch intent from the PM, then we default
            // back to creating one by instantiating the app intent ourself.
            val dirtyIntent = MainActivity.createDefaultIntent(this)
            dirtyIntent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
            dirtyIntent
        }
    }

    private fun appIsAlreadyRunning(): Boolean {
        val info = ActivityManager.RunningAppProcessInfo()
        ActivityManager.getMyMemoryState(info)
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            info.importance != ActivityManager.RunningAppProcessInfo.IMPORTANCE_CACHED
        } else {
            info.importance != ActivityManager.RunningAppProcessInfo.IMPORTANCE_BACKGROUND
        }
    }
}