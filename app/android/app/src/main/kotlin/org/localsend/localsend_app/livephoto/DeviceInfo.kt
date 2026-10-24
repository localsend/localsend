package org.localsend.localsend_app.livephoto

import android.os.Build

/**
 * Device information class
 * Used to get device manufacturer, model and system version information
 */
data class DeviceInfo(
    val manufacturer: String,
    val model: String,
    val sdkVersion: Int,
    val androidVersion: String
) {
    companion object {
        /**
         * Get current device information
         */
        fun current(): DeviceInfo {
            return DeviceInfo(
                manufacturer = Build.MANUFACTURER.uppercase(),
                model = Build.MODEL.uppercase(),
                sdkVersion = Build.VERSION.SDK_INT,
                androidVersion = Build.VERSION.RELEASE
            )
        }
    }
}

/**
 * Version range class
 * Used to define supported Android version ranges
 */
data class VersionRange(
    val minSdk: Int,
    val maxSdk: Int = Int.MAX_VALUE
) {
    /**
     * Check if the specified version is within range
     */
    fun contains(sdkVersion: Int): Boolean {
        return sdkVersion in minSdk..maxSdk
    }
    
    companion object {
        /**
         * Create minimum version requirement
         */
        fun atLeast(minSdk: Int) = VersionRange(minSdk)
        
        /**
         * Create version range
         */
        fun between(minSdk: Int, maxSdk: Int) = VersionRange(minSdk, maxSdk)
    }
} 