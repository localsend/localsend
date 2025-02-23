package org.localsend.localsend_app

import android.content.ContentValues
import android.content.Context
import android.os.Build
import android.provider.MediaStore
import android.util.Log
import java.io.File
import java.io.FileInputStream
import java.io.IOException

class LivePhotoHandler(private val context: Context) {
    companion object {
        private const val TAG = "LivePhotoHandler"
        
        // 支持实况照片的机型列表
        private val SUPPORTED_MANUFACTURERS = setOf(
            "HUAWEI",
            "HONOR",
            "XIAOMI",
            "OPPO",
            "VIVO"
        )
        
        // 检查设备是否支持实况照片
        private fun isLivePhotoSupported(): Boolean {
            return Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q && 
                   SUPPORTED_MANUFACTURERS.contains(Build.MANUFACTURER.uppercase())
        }
    }

    fun saveLivePhoto(imagePath: String, videoPath: String, album: String?) {
        try {
            if (isLivePhotoSupported()) {
                // 支持实况照片的设备,尝试保存为实况照片
                try {
                    // 1. 保存图片
                    val imageUri = saveImageToGallery(imagePath, album)
                    
                    // 2. 保存视频
                    val videoUri = saveVideoToGallery(videoPath, album)
                    
                    // 3. 关联图片和视频
                    linkLivePhotoFiles(imageUri.toString(), videoUri.toString())
                } catch (e: Exception) {
                    Log.w(TAG, "Failed to save as live photo, falling back to normal save", e)
                    saveAsSeparateFiles(imagePath, videoPath, album)
                }
            } else {
                // 不支持实况照片的设备,直接分别保存
                saveAsSeparateFiles(imagePath, videoPath, album)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Failed to save live photo", e)
            throw e
        }
    }
    
    private fun saveAsSeparateFiles(imagePath: String, videoPath: String, album: String?) {
        // 分别保存图片和视频
        saveImageToGallery(imagePath, album)
        saveVideoToGallery(videoPath, album)
        Log.i(TAG, "Saved image and video separately")
    }

    private fun saveImageToGallery(imagePath: String, album: String?): android.net.Uri {
        val imageFile = File(imagePath)
        val values = ContentValues().apply {
            put(MediaStore.Images.Media.DISPLAY_NAME, imageFile.name)
            put(MediaStore.Images.Media.MIME_TYPE, "image/jpeg")
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                put(MediaStore.Images.Media.RELATIVE_PATH, getGalleryPath(album))
                put(MediaStore.Images.Media.IS_PENDING, 1)
            }
        }

        val uri = context.contentResolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, values)!!
        context.contentResolver.openOutputStream(uri).use { os ->
            FileInputStream(imageFile).use { it.copyTo(os!!) }
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            values.clear()
            values.put(MediaStore.Images.Media.IS_PENDING, 0)
            context.contentResolver.update(uri, values, null, null)
        }

        return uri
    }

    private fun saveVideoToGallery(videoPath: String, album: String?): android.net.Uri {
        val videoFile = File(videoPath)
        val values = ContentValues().apply {
            put(MediaStore.Video.Media.DISPLAY_NAME, videoFile.name)
            put(MediaStore.Video.Media.MIME_TYPE, "video/mp4")
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                put(MediaStore.Video.Media.RELATIVE_PATH, getGalleryPath(album))
                put(MediaStore.Video.Media.IS_PENDING, 1)
            }
        }

        val uri = context.contentResolver.insert(MediaStore.Video.Media.EXTERNAL_CONTENT_URI, values)!!
        context.contentResolver.openOutputStream(uri).use { os ->
            FileInputStream(videoFile).use { it.copyTo(os!!) }
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            values.clear()
            values.put(MediaStore.Video.Media.IS_PENDING, 0)
            context.contentResolver.update(uri, values, null, null)
        }

        return uri
    }

    private fun linkLivePhotoFiles(imageUri: String, videoUri: String) {
        // 在 Android 10+ 上,使用 MediaStore API 关联文件
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            val values = ContentValues().apply {
                put(MediaStore.Images.Media.MOTION_PHOTO_FILE_ID, videoUri)
            }
            context.contentResolver.update(android.net.Uri.parse(imageUri), values, null, null)
        }
    }

    private fun getGalleryPath(album: String?): String {
        return if (album != null) {
            "DCIM/$album"
        } else {
            "DCIM/Camera"
        }
    }
} 