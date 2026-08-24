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
    val lastModified: Long?,
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
            if (cursor == null) {
                return results
            }

            // Some providers (e.g. vivo's file manager) do not return all
            // requested columns, so resolve indices dynamically instead of
            // assuming a fixed column order.
            val mimeIdx = cursor.getColumnIndex(DocumentsContract.Document.COLUMN_MIME_TYPE)
            val docIdIdx = cursor.getColumnIndex(DocumentsContract.Document.COLUMN_DOCUMENT_ID)
            val nameIdx = cursor.getColumnIndex(DocumentsContract.Document.COLUMN_DISPLAY_NAME)
            val sizeIdx = cursor.getColumnIndex(DocumentsContract.Document.COLUMN_SIZE)
            val lastModIdx = cursor.getColumnIndex(DocumentsContract.Document.COLUMN_LAST_MODIFIED)

            while (cursor.moveToNext()) {
                val documentId = if (docIdIdx >= 0) cursor.getString(docIdIdx) else continue
                results.add(
                    FastDocumentFile(
                        context = context,
                        mime = if (mimeIdx >= 0) cursor.getString(mimeIdx) ?: "" else "",
                        uri = DocumentsContract.buildDocumentUriUsingTree(
                            uri,
                            documentId
                        ),
                        name = if (nameIdx >= 0) cursor.getString(nameIdx) ?: "" else "",
                        size = if (sizeIdx >= 0) cursor.getLong(sizeIdx) else 0L,
                        lastModified = if (lastModIdx >= 0) readLastModified(cursor, lastModIdx) else null
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
         * Treats null, 0 (File.lastModified() errors) and negative sentinels as unknown.
         */
        private fun readLastModified(cursor: Cursor, columnIndex: Int): Long? {
            if (cursor.isNull(columnIndex)) {
                return null
            }
            return cursor.getLong(columnIndex).takeIf { it > 0L }
        }

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
                lastModified = null,
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

                if (cursor == null || !cursor.moveToFirst()) {
                    return null
                }

                // Some providers (e.g. vivo's file manager) do not return all
                // requested columns, so resolve indices dynamically instead of
                // assuming a fixed column order.
                val mimeIdx = cursor.getColumnIndex(DocumentsContract.Document.COLUMN_MIME_TYPE)
                val nameIdx = cursor.getColumnIndex(DocumentsContract.Document.COLUMN_DISPLAY_NAME)
                val sizeIdx = cursor.getColumnIndex(DocumentsContract.Document.COLUMN_SIZE)
                val lastModIdx = cursor.getColumnIndex(DocumentsContract.Document.COLUMN_LAST_MODIFIED)

                return FastDocumentFile(
                    context = context,
                    mime = if (mimeIdx >= 0) cursor.getString(mimeIdx) ?: "" else "",
                    uri = documentUri,
                    name = if (nameIdx >= 0) cursor.getString(nameIdx) ?: "" else "",
                    size = if (sizeIdx >= 0) cursor.getLong(sizeIdx) else 0L,
                    lastModified = if (lastModIdx >= 0) readLastModified(cursor, lastModIdx) else null
                )
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
