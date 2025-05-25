package org.localsend.localsend_app.livephoto.strategies

import android.content.Context
import android.os.Build
import org.localsend.localsend_app.livephoto.BaseLivePhotoStrategy
import org.localsend.localsend_app.livephoto.DeviceInfo
import org.localsend.localsend_app.livephoto.VersionRange

/**
 * VIVO device LivePhoto strategy
 * Supports devices with OriginOS
 */
class VivoLivePhotoStrategy(context: Context) : BaseLivePhotoStrategy(context) {
    
    companion object {
        private val SUPPORTED_MANUFACTURERS = setOf("VIVO", "IQOO")
        private val SUPPORTED_VERSION_RANGE = VersionRange.atLeast(Build.VERSION_CODES.Q) // Android 10+
        
        /**
         * Check if device is VIVO brand
         */
        fun isVivoDevice(deviceInfo: DeviceInfo): Boolean {
            return SUPPORTED_MANUFACTURERS.contains(deviceInfo.manufacturer)
        }
    }
    
    override fun isSupported(): Boolean {
        val deviceInfo = DeviceInfo.current()
        return isVivoDevice(deviceInfo) && SUPPORTED_VERSION_RANGE.contains(deviceInfo.sdkVersion)
    }
} 