package org.localsend.localsend_app.livephoto

import android.content.Context

/**
 * LivePhoto strategy interface
 * Defines core methods for LivePhoto functionality
 */
interface LivePhotoStrategy {
    
    /**
     * Check if the current device supports LivePhoto functionality
     */
    fun isSupported(): Boolean
    
    /**
     * Save LivePhoto to gallery
     * @param imagePath Image file path
     * @param videoPath Video file path
     * @param album Album name, can be null
     * @throws LivePhotoException Thrown when save fails
     */
    @Throws(LivePhotoException::class)
    fun saveLivePhoto(imagePath: String, videoPath: String, album: String?)
}

/**
 * LivePhoto related exception
 */
class LivePhotoException(message: String, cause: Throwable? = null) : Exception(message, cause) 