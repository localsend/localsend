# Fix: File picker crash on Android devices with non-standard DocumentsProvider

## Summary

On some Android devices (notably Chinese OEMs such as vivo, Xiaomi, OPPO, etc.), selecting a file via the system file picker causes a crash or a misleading "no permission" error. This is caused by non-standard `DocumentsProvider` implementations that return incomplete or differently-ordered cursor columns.

## Root cause

The Android Storage Access Framework (SAF) defines a standard set of columns in `DocumentsContract.Document` that a compliant `DocumentsProvider` must return when queried. The original code assumed these columns were always present and accessed them by hardcoded indices (e.g., `cursor.getString(2)` for `COLUMN_SIZE`).

However, some OEM-customized file managers do not fully comply with the SAF contract:

- **Missing columns**: The cursor returned by `contentResolver.query()` may omit columns such as `COLUMN_SIZE` or `COLUMN_LAST_MODIFIED` entirely. Accessing a hardcoded index that does not exist causes `IllegalStateException: Couldn't read row 0, col N from CursorWindow`.
- **Reordered columns**: Even when all columns are present, their order may differ from the projection requested, making hardcoded indices unreliable.
- **Restricted persistable permissions**: Some providers throw `SecurityException` when `takePersistableUriPermission()` is called, even though the URI was granted with `FLAG_GRANT_PERSISTABLE_URI_PERMISSION`.

When the native crash occurred, the Dart side caught a generic `PlatformException` and displayed a "no permission" dialog, which was misleading — the user had already granted the necessary permissions.

## Affected devices

This issue affects devices whose OEM-customized file manager implements a non-standard or incomplete `DocumentsProvider`:

| OEM | Likely affected | Notes |
|-----|-----------------|-------|
| **vivo** | Confirmed | Reproduced on vivo running Android 16. The file manager omits `COLUMN_SIZE` from the cursor. |
| **Xiaomi (MIUI/HyperOS)** | Likely | MIUI has a history of non-standard SAF behavior and restrictive permission management. |
| **OPPO / OnePlus (ColorOS)** | Likely | ColorOS uses a customized file manager with potential SAF deviations. |
| **Honor** | Likely | Shares lineage with Huawei's EMUI file manager. |
| **Samsung (One UI)** | Not affected | Samsung's DocumentsProvider follows AOSP standards closely. |
| **Google Pixel** | Not affected | Uses the reference AOSP implementation. |

Even on unaffected devices, the fix is purely defensive — it does not change behavior when the provider is standards-compliant.

## Changes

### 1. `FastDocumentFile.kt` — Dynamic column index resolution

Replaced all hardcoded cursor column indices with `cursor.getColumnIndex(columnName)`, which returns `-1` if the column is missing. Each access is guarded by an `if (idx >= 0)` check, falling back to a safe default (`""` for strings, `0L` for size, `null` for last modified).

This applies to both `listFiles()` and `fromDocumentUri()`.

**Before:**
```kotlin
// Assumed column order: 0=mime, 1=docId, 2=name, 3=size, 4=lastMod
val mime = cursor.getString(0)
val size = cursor.getLong(3)
```

**After:**
```kotlin
val sizeIdx = cursor.getColumnIndex(DocumentsContract.Document.COLUMN_SIZE)
val size = if (sizeIdx >= 0) cursor.getLong(sizeIdx) else 0L
```

### 2. `MainActivity.kt` — Fallback metadata retrieval

When `FastDocumentFile.fromDocumentUri()` returns `null` (indicating the Document contract query failed entirely), a fallback path now retrieves file metadata through alternative Android contracts:

- **File name**: Queries `OpenableColumns.DISPLAY_NAME` — a more generic contract that some providers implement even when `DocumentsContract.Document` columns are missing. Falls back to `uri.lastPathSegment`, then `uri.toString()`.
- **File size**: Opens an `AssetFileDescriptor` in read-only mode and reads `length`. Falls back to `0L` if the descriptor cannot be opened or returns a negative length.

### 3. `MainActivity.kt` — Safe persistable URI permission

Wrapped all `contentResolver.takePersistableUriPermission()` calls in `try-catch(SecurityException)` across all three result-handling paths (`REQUEST_CODE_PICK_DIRECTORY`, `REQUEST_CODE_PICK_DIRECTORY_PATH`, `REQUEST_CODE_PICK_FILE`). When the provider refuses persistable permissions, the URI remains usable for the current session.

### 4. `MainActivity.kt` — Robust `folderExists()`

Updated `folderExists()` to use `getColumnIndex()` instead of assuming column positions, consistent with the `FastDocumentFile` changes.

### 5. `file_picker.dart` — Accurate error reporting

Differentiated error handling in `_pickFiles()` and `_pickFolder()`:

- `PlatformException` with code `CANCELED` → silently return (user dismissed the picker).
- `PlatformException` with code `PERMISSION_DENIED` → show `NoPermissionDialog` (genuine permission issue).
- All other errors → show `ErrorDialog` with the actual error code and message, instead of the misleading "no permission" dialog.

## Testing

- **vivo (Android 16)**: File selection now succeeds. Previously crashed with `IllegalStateException`.
- **Pixel (Android 15)**: No behavior change. All code paths take the standard route; fallback logic is never triggered.
- **Folder selection**: Verified on both standard and non-standard devices.

## Design principles

- **Defensive, not device-specific**: The fix does not detect or special-case any OEM. It assumes any `DocumentsProvider` may return incomplete data, which makes it robust against future devices.
- **Zero impact on compliant providers**: When all columns are present and correctly ordered, `getColumnIndex()` returns the same indices as the previous hardcoded values. The fallback path is only reached when `fromDocumentUri()` returns `null`.
- **No new dependencies**: Uses only existing Android SDK APIs (`OpenableColumns`, `AssetFileDescriptor`, `getColumnIndex`).
