package org.localsend.localsend_app

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.provider.DocumentsContract
import java.util.Locale

fun openUri(context: Context, uriStr: String) {
    val uri = Uri.parse(uriStr)
    val intent = Intent(Intent.ACTION_VIEW, uri)
    val type = getFileType(uriStr)

    println("Inferred type: $type")

    intent.setDataAndType(uri, type)
    intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
    context.startActivity(intent)
}

private fun getFileType(filePath: String): String {
    val fileExt = filePath.substring(filePath.lastIndexOf(".") + 1).lowercase(Locale.ROOT)
    println("File extension: $fileExt")
    return when (fileExt) {
        "3gp" -> "video/3gpp"
        "torrent" -> "application/x-bittorrent"
        "kml" -> "application/vnd.google-earth.kml+xml"
        "gpx" -> "application/gpx+xml"
        "apk" -> "application/vnd.android.package-archive"
        "asf" -> "video/x-ms-asf"
        "avi" -> "video/x-msvideo"
        "bin", "class", "exe" -> "application/octet-stream"
        "bmp" -> "image/bmp"
        "c" -> "text/plain"
        "conf" -> "text/plain"
        "cpp" -> "text/plain"
        "doc" -> "application/msword"
        "docx" -> "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
        "xls", "csv" -> "application/vnd.ms-excel"
        "xlsx" -> "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        "gif" -> "image/gif"
        "gtar" -> "application/x-gtar"
        "gz" -> "application/x-gzip"
        "h" -> "text/plain"
        "htm" -> "text/html"
        "html" -> "text/html"
        "jar" -> "application/java-archive"
        "java" -> "text/plain"
        "jpeg" -> "image/jpeg"
        "jpg" -> "image/jpeg"
        "js" -> "application/x-javascript"
        "log" -> "text/plain"
        "m3u" -> "audio/x-mpegurl"
        "m4a" -> "audio/mp4a-latm"
        "m4b" -> "audio/mp4a-latm"
        "m4p" -> "audio/mp4a-latm"
        "m4u" -> "video/vnd.mpegurl"
        "m4v" -> "video/x-m4v"
        "mov" -> "video/quicktime"
        "mp2" -> "audio/x-mpeg"
        "mp3" -> "audio/x-mpeg"
        "mp4" -> "video/mp4"
        "mpc" -> "application/vnd.mpohun.certificate"
        "mpe" -> "video/mpeg"
        "mpeg" -> "video/mpeg"
        "mpg" -> "video/mpeg"
        "mpg4" -> "video/mp4"
        "mpga" -> "audio/mpeg"
        "msg" -> "application/vnd.ms-outlook"
        "ogg" -> "audio/ogg"
        "pdf" -> "application/pdf"
        "png" -> "image/png"
        "pps" -> "application/vnd.ms-powerpoint"
        "ppt" -> "application/vnd.ms-powerpoint"
        "pptx" -> "application/vnd.openxmlformats-officedocument.presentationml.presentation"
        "prop" -> "text/plain"
        "rc" -> "text/plain"
        "rmvb" -> "audio/x-pn-realaudio"
        "rtf" -> "application/rtf"
        "sh" -> "text/plain"
        "tar" -> "application/x-tar"
        "tgz" -> "application/x-compressed"
        "txt" -> "text/plain"
        "wav" -> "audio/x-wav"
        "wma" -> "audio/x-ms-wma"
        "wmv" -> "audio/x-ms-wmv"
        "wps" -> "application/vnd.ms-works"
        "xml" -> "text/plain"
        "z" -> "application/x-compress"
        "zip" -> "application/x-zip-compressed"
        else -> DocumentsContract.Document.MIME_TYPE_DIR
    }
}
