package org.localsend.localsend_app.livephoto

import android.content.Context

/**
 * LivePhoto strategy base class
 * Provides common interface and logic for LivePhoto functionality
 */
abstract class BaseLivePhotoStrategy : LivePhotoStrategy {
    
    /**
     * Get supported device manufacturers
     * Subclasses must implement this to specify which manufacturers they support
     */
    protected abstract fun getSupportedManufacturers(): Set<String>
    
    /**
     * Get supported version range
     * Subclasses must implement this to specify which Android versions they support
     */
    protected abstract fun getSupportedVersionRange(): VersionRange
    
    /**
     * Additional device support check
     * Subclasses can override this for custom device detection logic
     */
    protected open fun isDeviceSupported(deviceInfo: DeviceInfo): Boolean {
        return true
    }
    
    /**
     * Check if the strategy supports the given device
     * Uses manufacturer and version range checks
     */
    final override fun isSupported(deviceInfo: DeviceInfo): Boolean {
        val manufacturerSupported = getSupportedManufacturers().contains(deviceInfo.manufacturer)
        val versionSupported = getSupportedVersionRange().contains(deviceInfo.sdkVersion)
        val deviceSupported = isDeviceSupported(deviceInfo)
        
        return manufacturerSupported && versionSupported && deviceSupported
    }
    
} 