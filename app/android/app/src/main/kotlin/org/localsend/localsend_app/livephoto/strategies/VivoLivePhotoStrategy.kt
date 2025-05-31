package org.localsend.localsend_app.livephoto.strategies

import android.content.Context
import android.os.Build
import org.localsend.localsend_app.livephoto.BaseLivePhotoStrategy
import org.localsend.localsend_app.livephoto.DeviceInfo
import org.localsend.localsend_app.livephoto.LivePhotoException
import org.localsend.localsend_app.livephoto.VersionRange

/**
 * VIVO device LivePhoto strategy
 * Supports devices with OriginOS
 */
class VivoLivePhotoStrategy : BaseLivePhotoStrategy() {
    
    override fun getSupportedManufacturers(): Set<String> {
        return setOf("VIVO", "IQOO")
    }
    
    override fun getSupportedVersionRange(): VersionRange {
        return VersionRange.atLeast(Build.VERSION_CODES.Q) // Android 10+
    }

    override fun isDeviceSupported(deviceInfo: DeviceInfo): Boolean {
        // TODO: Implementation coming soon
        return false
    }

    override fun saveLivePhoto(context: Context, imagePath: String, videoPath: String, album: String?) {
        // TODO: Implementation coming soon
        throw LivePhotoException("VIVO LivePhoto implementation is not yet available")
    }
} 