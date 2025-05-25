package org.localsend.localsend_app.livephoto.strategies

import android.content.Context
import android.util.Log
import org.localsend.localsend_app.livephoto.BaseLivePhotoStrategy
import org.localsend.localsend_app.livephoto.LivePhotoException

/**
 * Default strategy for devices that don't support LivePhoto
 * Used for devices that don't support LivePhoto functionality, saves image and video separately
 */
class UnsupportedLivePhotoStrategy(context: Context) : BaseLivePhotoStrategy(context) {
    
    companion object {
        private const val TAG = "UnsupportedLivePhotoStrategy"
    }
    
    override fun isSupported(): Boolean {
        return false
    }
    
    override fun saveLivePhoto(imagePath: String, videoPath: String, album: String?) {
        Log.i(TAG, "Device does not support LivePhoto")
        throw LivePhotoException("Device does not support LivePhoto")
    }
} 