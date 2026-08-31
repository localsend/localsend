package org.localsend.localsend_app.appclip

import android.content.ComponentName
import android.content.Context
import android.content.pm.PackageManager
import android.nfc.cardemulation.HostApduService
import android.os.Bundle

internal object AppClipHceRegistry {
    @Volatile
    private var tag: Type4NdefTag? = null

    fun arm(context: Context, invocationUrl: String): Boolean {
        if (!context.packageManager.hasSystemFeature(PackageManager.FEATURE_NFC_HOST_CARD_EMULATION)) return false
        return try {
            tag = Type4NdefTag(invocationUrl)
            context.packageManager.setComponentEnabledSetting(
                ComponentName(context, AppClipNdefService::class.java),
                PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                PackageManager.DONT_KILL_APP,
            )
            true
        } catch (_: RuntimeException) {
            tag = null
            false
        }
    }

    fun process(command: ByteArray): ByteArray = tag?.process(command) ?: byteArrayOf(0x69, 0x85.toByte())

    fun reset() {
        tag?.reset()
    }

    fun clear(context: Context) {
        tag = null
        try {
            context.packageManager.setComponentEnabledSetting(
                ComponentName(context, AppClipNdefService::class.java),
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP,
            )
        } catch (_: RuntimeException) {
            // An absent HCE implementation is handled by the QR fallback.
        }
    }
}

/** Thin Android adapter around the pure Type-4 state machine. */
class AppClipNdefService : HostApduService() {
    override fun processCommandApdu(commandApdu: ByteArray?, extras: Bundle?): ByteArray =
        if (commandApdu == null) byteArrayOf(0x67, 0x00) else AppClipHceRegistry.process(commandApdu)

    override fun onDeactivated(reason: Int) {
        AppClipHceRegistry.reset()
    }
}
