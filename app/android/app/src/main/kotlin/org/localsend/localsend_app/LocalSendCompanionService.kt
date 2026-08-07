package org.localsend.localsend_ng

import android.companion.AssociationInfo
import android.companion.CompanionDeviceService
import android.content.Intent
import android.os.Build
import android.util.Log
import androidx.annotation.RequiresApi

@RequiresApi(Build.VERSION_CODES.S)
class LocalSendCompanionService : CompanionDeviceService() {

    // API 33+ delivers the full AssociationInfo; API 31/32 only the MAC address,
    // so both overloads are implemented. Overriding the AssociationInfo variant
    // means the platform's default fan-out to the String one never fires on 33+.
    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    override fun onDeviceAppeared(associationInfo: AssociationInfo) {
        Log.i(TAG, "Companion device appeared (associationId=${associationInfo.id})")
        startMainActivityInBackground()
    }

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    override fun onDeviceDisappeared(associationInfo: AssociationInfo) {
        Log.i(TAG, "Companion device disappeared (associationId=${associationInfo.id})")
    }

    @Deprecated("Only called on API 31/32; API 33+ uses the AssociationInfo overload.")
    override fun onDeviceAppeared(address: String) {
        Log.i(TAG, "Companion device appeared ($address)")
        startMainActivityInBackground()
    }

    @Deprecated("Only called on API 31/32; API 33+ uses the AssociationInfo overload.")
    override fun onDeviceDisappeared(address: String) {
        Log.i(TAG, "Companion device disappeared ($address)")
    }

    private fun startMainActivityInBackground() {
        try {
            val launchIntent = MainActivity.createDefaultIntent(this).apply {
                flags = Intent.FLAG_ACTIVITY_NEW_TASK or
                        Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS or
                        Intent.FLAG_ACTIVITY_NO_ANIMATION
                putExtra(EXTRA_BACKGROUND_START, true)
            }
            startActivity(launchIntent)
        } catch (e: Exception) {
            Log.w(TAG, "Could not start activity from companion service", e)
        }
    }

    companion object {
        private const val TAG = "LocalSendCompanion"
    }
}
