package org.localsend.localsend_app.livephoto

import android.content.Context

/**
 * LivePhoto strategy interface
 * Defines core methods for LivePhoto functionality
 */
interface LivePhotoStrategy {
    
    /**
     * Check if the strategy supports the given device
     */
    fun isSupported(deviceInfo: DeviceInfo): Boolean
    
    /**
     * Save LivePhoto to gallery
     * @param context Application context
     * @param imagePath Image file path
     * @param videoPath Video file path
     * @param album Album name, can be null
     * @throws LivePhotoException Thrown when save fails
     */
    @Throws(LivePhotoException::class)
    fun saveLivePhoto(context: Context, imagePath: String, videoPath: String, album: String?)
}

/**
 * LivePhoto related exception
 */
class LivePhotoException(message: String, cause: Throwable? = null) : Exception(message, cause) 