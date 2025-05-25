package org.localsend.localsend_app.livephoto

import android.content.ContentValues
import android.content.Context
import android.net.Uri
import android.os.Build
import android.provider.MediaStore
import android.util.Log
import java.io.File
import java.io.FileInputStream

/**
 * LivePhoto strategy base class
 * Provides common file saving functionality and basic implementation
 */
abstract class BaseLivePhotoStrategy(protected val context: Context) : LivePhotoStrategy {
    
    companion object {
        private const val TAG = "BaseLivePhotoStrategy"
    }
    
    /**
     * Check if device supports LivePhoto
     * Subclasses need to implement specific support logic
     */
    abstract override fun isSupported(): Boolean
    
    /**
     * Concrete implementation of saving LivePhoto
     * Subclasses can override this method to implement specific saving logic
     */
    override fun saveLivePhoto(imagePath: String, videoPath: String, album: String?) {
        try {
            if (!isSupported()) {
                throw LivePhotoException("Current device does not support LivePhoto functionality")
            }
            
            Log.i(TAG, "Starting to save LivePhoto: image=$imagePath, video=$videoPath, album=$album")
            
            // Save image
            val imageUri = saveImageToGallery(imagePath, album)
            Log.d(TAG, "Image saved successfully: $imageUri")
            
            // Save video
            val videoUri = saveVideoToGallery(videoPath, album)
            Log.d(TAG, "Video saved successfully: $videoUri")
            
            // Link image and video
            linkLivePhotoFiles(imageUri, videoUri)
            Log.i(TAG, "LivePhoto save completed")
            
        } catch (e: Exception) {
            Log.e(TAG, "Failed to save LivePhoto", e)
            throw LivePhotoException("Failed to save LivePhoto: ${e.message}", e)
        }
    }
    
    /**
     * Save image to gallery
     */
    protected open fun saveImageToGallery(imagePath: String, album: String?): Uri {
        val imageFile = File(imagePath)
        if (!imageFile.exists()) {
            throw LivePhotoException("Image file does not exist: $imagePath")
        }
        
        val values = ContentValues().apply {
            put(MediaStore.Images.Media.DISPLAY_NAME, imageFile.name)
            put(MediaStore.Images.Media.MIME_TYPE, "image/jpeg")
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                put(MediaStore.Images.Media.RELATIVE_PATH, getGalleryPath(album))
                put(MediaStore.Images.Media.IS_PENDING, 1)
            }
        }

        val uri = context.contentResolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, values)
            ?: throw LivePhotoException("Unable to create image URI")
            
        context.contentResolver.openOutputStream(uri).use { os ->
            if (os == null) throw LivePhotoException("Unable to open output stream")
            FileInputStream(imageFile).use { it.copyTo(os) }
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            values.clear()
            values.put(MediaStore.Images.Media.IS_PENDING, 0)
            context.contentResolver.update(uri, values, null, null)
        }

        return uri
    }
    
    /**
     * Save video to gallery
     */
    protected open fun saveVideoToGallery(videoPath: String, album: String?): Uri {
        val videoFile = File(videoPath)
        if (!videoFile.exists()) {
            throw LivePhotoException("Video file does not exist: $videoPath")
        }
        
        val values = ContentValues().apply {
            put(MediaStore.Video.Media.DISPLAY_NAME, videoFile.name)
            put(MediaStore.Video.Media.MIME_TYPE, "video/mp4")
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                put(MediaStore.Video.Media.RELATIVE_PATH, getGalleryPath(album))
                put(MediaStore.Video.Media.IS_PENDING, 1)
            }
        }

        val uri = context.contentResolver.insert(MediaStore.Video.Media.EXTERNAL_CONTENT_URI, values)
            ?: throw LivePhotoException("Unable to create video URI")
            
        context.contentResolver.openOutputStream(uri).use { os ->
            if (os == null) throw LivePhotoException("Unable to open output stream")
            FileInputStream(videoFile).use { it.copyTo(os) }
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            values.clear()
            values.put(MediaStore.Video.Media.IS_PENDING, 0)
            context.contentResolver.update(uri, values, null, null)
        }

        return uri
    }
    
    /**
     * Link image and video files
     * Subclasses can override this method to implement specific linking logic
     */
    protected open fun linkLivePhotoFiles(imageUri: Uri, videoUri: Uri) {
        // Default implementation: Use MediaStore API to link files on Android 10+
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            try {
                val values = ContentValues().apply {
                    put(MediaStore.Images.Media.MOTION_PHOTO_FILE_ID, videoUri.toString())
                }
                context.contentResolver.update(imageUri, values, null, null)
                Log.d(TAG, "LivePhoto files linked successfully")
            } catch (e: Exception) {
                Log.w(TAG, "Failed to link LivePhoto files, but files have been saved", e)
            }
        }
    }
    
    /**
     * Get gallery path
     */
    protected fun getGalleryPath(album: String?): String {
        return if (album.isNullOrBlank()) {
            "DCIM/Camera"
        } else {
            "DCIM/$album"
        }
    }
} 