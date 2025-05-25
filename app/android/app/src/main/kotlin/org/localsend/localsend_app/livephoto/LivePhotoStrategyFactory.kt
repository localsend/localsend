package org.localsend.localsend_app.livephoto

import android.content.Context
import android.util.Log
import org.localsend.localsend_app.livephoto.strategies.UnsupportedLivePhotoStrategy
import org.localsend.localsend_app.livephoto.strategies.VivoLivePhotoStrategy

/**
 * LivePhoto strategy factory
 * Selects appropriate LivePhoto strategy based on device information
 */
object LivePhotoStrategyFactory {
    
    private const val TAG = "LivePhotoFactory"
    
    /**
     * Create LivePhoto strategy suitable for current device
     */
    fun createStrategy(context: Context): LivePhotoStrategy {
        val deviceInfo = DeviceInfo.current()

        Log.i(TAG, "Device info: manufacturer=${deviceInfo.manufacturer}, " +
                "model=${deviceInfo.model}, sdkVersion=${deviceInfo.sdkVersion}")

        val strategy = when {
            VivoLivePhotoStrategy.isVivoDevice(deviceInfo) -> {
                Log.i(TAG, "Detected VIVO device, using VivoLivePhotoStrategy")
                VivoLivePhotoStrategy(context)
            }
            
            else -> {
                Log.i(TAG, "Unknown device or does not support LivePhoto, using UnsupportedLivePhotoStrategy")
                UnsupportedLivePhotoStrategy(context)
            }
        }
        
        val isSupported = strategy.isSupported()
        Log.i(TAG, "LivePhoto support status: $isSupported")
        
        return strategy
    }
    
    /**
     * Check if current device supports LivePhoto functionality
     */
    fun isLivePhotoSupported(context: Context): Boolean {
        return createStrategy(context).isSupported()
    }
} 