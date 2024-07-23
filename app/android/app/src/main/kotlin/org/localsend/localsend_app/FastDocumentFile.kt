package org.localsend.localsend_app

import android.content.ContentResolver
import android.content.Context
import android.database.Cursor
import android.net.Uri
import android.provider.DocumentsContract
import android.util.Log

const val MIME_TYPE_DIR = "vnd.android.document/directory"

/**
 * Similar to AndroidX/DocumentFile, but faster by querying all fields at once.
 */
class FastDocumentFile(
    private val context: Context,
    private val mime: String,
    val uri: Uri,
    val name: String,
    val size: Long,
    val lastModified: Long,
) {
    val isDirectory: Boolean = mime == MIME_TYPE_DIR
    val isFile: Boolean = !isDirectory && mime.isNotBlank()

    fun listFiles(): List<FastDocumentFile> {
        val resolver: ContentResolver = context.contentResolver
        val childrenUri = DocumentsContract.buildChildDocumentsUriUsingTree(
            uri,
            DocumentsContract.getDocumentId(uri)
        )

        val results = mutableListOf<FastDocumentFile>()

        var cursor: Cursor? = null
        try {
            cursor = resolver.query(
                childrenUri,
                arrayOf(
                    DocumentsContract.Document.COLUMN_MIME_TYPE,
                    DocumentsContract.Document.COLUMN_DOCUMENT_ID,
                    DocumentsContract.Document.COLUMN_DISPLAY_NAME,
                    DocumentsContract.Document.COLUMN_SIZE,
                    DocumentsContract.Document.COLUMN_LAST_MODIFIED,
                ),
                null,
                null,
                null
            )
            while (cursor!!.moveToNext()) {
                results.add(
                    FastDocumentFile(
                        context = context,
                        mime = cursor.getString(0),
                        uri = DocumentsContract.buildDocumentUriUsingTree(
                            uri,
                            cursor.getString(1)
                        ),
                        name = cursor.getString(2),
                        size = cursor.getLong(3),
                        lastModified = cursor.getLong(4)
                    )
                )
            }
        } catch (e: Exception) {
            Log.w(TAG, "Error: $e")
        } finally {
            try {
                cursor?.close()
            } catch (_: Exception) {}
        }
        return results
    }

    companion object {
        const val TAG = "FastDocumentFile"

        /**
         * Create a FastDocumentFile from a tree Uri.
         */
        fun fromTreeUri(context: Context, treeUri: Uri): FastDocumentFile {
            val documentId = when {
                DocumentsContract.isDocumentUri(
                    context,
                    treeUri
                ) -> DocumentsContract.getDocumentId(treeUri)
                else -> DocumentsContract.getTreeDocumentId(treeUri)
            }

            return FastDocumentFile(
                context = context,
                mime = "",
                uri = DocumentsContract.buildDocumentUriUsingTree(
                    treeUri,
                    documentId,
                ),
                name = "",
                size = 0,
                lastModified = 0,
            )
        }

        fun fromDocumentUri(context: Context, documentUri: Uri): FastDocumentFile? {
            var cursor: Cursor? = null
            try {
                cursor = context.contentResolver.query(
                    documentUri,
                    arrayOf(
                        DocumentsContract.Document.COLUMN_MIME_TYPE,
                        DocumentsContract.Document.COLUMN_DISPLAY_NAME,
                        DocumentsContract.Document.COLUMN_SIZE,
                        DocumentsContract.Document.COLUMN_LAST_MODIFIED,
                    ),
                    null,
                    null,
                    null
                )

                return if (cursor != null && cursor.moveToFirst()) {
                    FastDocumentFile(
                        context = context,
                        mime = cursor.getString(0),
                        uri = documentUri,
                        name = cursor.getString(1),
                        size = cursor.getLong(2),
                        lastModified = cursor.getLong(3),
                    )
                } else {
                    null
                }
            } catch (e: Exception) {
                Log.w(TAG, "Error: $e")
                return null
            } finally {
                try {
                    cursor?.close()
                } catch (_: Exception) {}
            }
        }
    }
}
