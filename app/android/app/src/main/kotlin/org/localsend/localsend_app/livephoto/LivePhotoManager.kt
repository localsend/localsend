package org.localsend.localsend_app.livephoto

import android.content.Context
import android.util.Log

/**
 * LivePhoto manager
 * Provides unified interface for LivePhoto functionality
 */
object LivePhotoManager {
    
    private const val TAG = "LivePhotoManager"
    
    private val strategy: LivePhotoStrategy
        get() = LivePhotoStrategyFactory.getStrategy()
    
    /**
     * Check if current device supports LivePhoto functionality
     */
    fun isLivePhotoSupported(): Boolean {
        return try {
            strategy.isSupported(DeviceInfo.current())
        } catch (e: Exception) {
            Log.e(TAG, "Error occurred while checking LivePhoto support status", e)
            false
        }
    }
    
    /**
     * Save LivePhoto to gallery
     * @param context Application context
     * @param imagePath Image file path
     * @param videoPath Video file path
     * @param album Album name, can be null
     * @throws LivePhotoException Thrown when save fails
     */
    @Throws(LivePhotoException::class)
    fun saveLivePhoto(context: Context, imagePath: String, videoPath: String, album: String? = null) {
        Log.i(TAG, "Starting to save LivePhoto: image=$imagePath, video=$videoPath, album=$album")
        
        try {
            strategy.saveLivePhoto(context, imagePath, videoPath, album)
            Log.i(TAG, "LivePhoto saved successfully")
        } catch (e: LivePhotoException) {
            Log.e(TAG, "Failed to save LivePhoto", e)
            throw e
        } catch (e: Exception) {
            Log.e(TAG, "Unknown error occurred while saving LivePhoto", e)
            throw LivePhotoException("Unknown error occurred while saving LivePhoto: ${e.message}", e)
        }
    }
    
    /**
     * Get current device information
     */
    fun getDeviceInfo(): DeviceInfo {
        return DeviceInfo.current()
    }
} 