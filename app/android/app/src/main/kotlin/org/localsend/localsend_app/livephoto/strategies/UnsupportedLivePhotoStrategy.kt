package org.localsend.localsend_app.livephoto.strategies

import android.content.Context
import android.util.Log
import org.localsend.localsend_app.livephoto.BaseLivePhotoStrategy
import org.localsend.localsend_app.livephoto.DeviceInfo
import org.localsend.localsend_app.livephoto.LivePhotoException
import org.localsend.localsend_app.livephoto.VersionRange

/**
 * Default strategy for devices that don't support LivePhoto
 * Always returns false for isSupported
 */
class UnsupportedLivePhotoStrategy : BaseLivePhotoStrategy() {
    
    companion object {
        private const val TAG = "UnsupportedLivePhotoStrategy"
    }
    
    override fun getSupportedManufacturers(): Set<String> {
        return emptySet() // 不支持任何厂商
    }
    
    override fun getSupportedVersionRange(): VersionRange {
        return VersionRange.between(0, 0) // 不支持任何版本
    }
    
    override fun saveLivePhoto(context: Context, imagePath: String, videoPath: String, album: String?) {
        Log.i(TAG, "Device does not support LivePhoto")
        throw LivePhotoException("Device does not support LivePhoto")
    }
} 