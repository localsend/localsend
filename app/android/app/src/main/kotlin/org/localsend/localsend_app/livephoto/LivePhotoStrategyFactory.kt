package org.localsend.localsend_app.livephoto

import android.util.Log
import org.localsend.localsend_app.livephoto.strategies.UnsupportedLivePhotoStrategy
import org.localsend.localsend_app.livephoto.strategies.VivoLivePhotoStrategy

/**
 * LivePhoto strategy factory
 * Determines strategy based on device type during initialization
 */
object LivePhotoStrategyFactory {
    
    private const val TAG = "LivePhotoFactory"
    
    private val strategyInstance: LivePhotoStrategy by lazy {
        createStrategyForDevice()
    }
    
    /**
     * Create appropriate strategy based on current device
     */
    private fun createStrategyForDevice(): LivePhotoStrategy {
        val deviceInfo = DeviceInfo.current()
        
        Log.i(TAG, "Device info: manufacturer=${deviceInfo.manufacturer}, " +
                "model=${deviceInfo.model}, sdkVersion=${deviceInfo.sdkVersion}")
        
        // List of all available strategies
        val availableStrategies = listOf(
            VivoLivePhotoStrategy(),
            // Add more strategy instances here...
            // PixelLivePhotoStrategy(),
            // SamsungLivePhotoStrategy(),
        )
        
        // Find the first strategy that supports the current device
        val selectedStrategy = availableStrategies.firstOrNull { strategy ->
            strategy.isSupported(deviceInfo)
        } ?: UnsupportedLivePhotoStrategy() // If no supported strategy is found, use default strategy
        
        Log.i(TAG, "Selected strategy: ${selectedStrategy::class.java.simpleName}, " +
                "supported: ${selectedStrategy.isSupported(deviceInfo)}")
        
        return selectedStrategy
    }
    
    /**
     * Get the strategy instance for current device
     */
    fun getStrategy(): LivePhotoStrategy {
        return strategyInstance
    }
    
    /**
     * Create LivePhoto strategy suitable for current device
     * @deprecated Use getStrategy() instead for better performance
     */
    @Deprecated("Use getStrategy() instead", ReplaceWith("getStrategy()"))
    fun createStrategy(): LivePhotoStrategy {
        return getStrategy()
    }
    
    /**
     * Check if current device supports LivePhoto functionality
     */
    fun isLivePhotoSupported(): Boolean {
        val deviceInfo = DeviceInfo.current()
        return strategyInstance.isSupported(deviceInfo)
    }
} 