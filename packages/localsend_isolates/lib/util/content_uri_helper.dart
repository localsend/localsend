class ContentUriHelper {
  /// Converts
  /// content://com.android.externalstorage.documents/tree/primary%3ADocuments
  /// to primary:Documents
  static String? getPathFromTreeUri(String uri) {
    final index = uri.indexOf('/tree/');
    if (index == -1) {
      return null;
    }

    return Uri.decodeComponent(uri.substring(index + 6));
  }

  /// Converts
  /// primary:Documents to Documents
  /// "primary:Documents/Some Folder" to "Some Folder"
  static String? getEntityNameFromPath(String path) {
    final parts = path.replaceAll(':', '/').split('/');
    for (int i = parts.length - 1; i >= 0; i--) {
      if (parts[i].isNotEmpty) {
        return parts[i];
      }
    }

    return null;
  }

  /// Converts
  /// content://com.android.externalstorage.documents/tree/primary%3ADocuments%2FOffice%20Lens/document/primary%3ADocuments%2FOffice%20Lens%2FTest.pdf
  /// to
  /// Office Lens/Test.pdf
  static String? guessRelativePathFromPickedFileContentUri({
    required String folderContentUri,
    required String basePath,
    required String folderName,
    required String uri,
  }) {
    final withoutFolder = uri.replaceFirst(folderContentUri, '');
    String fileUri = withoutFolder;
    if (withoutFolder.startsWith('/document/')) {
      fileUri = withoutFolder.substring(10);
    }

    final decoded = Uri.decodeComponent(fileUri);
    final withoutBasePath = decoded.replaceFirst(basePath, '');
    if (withoutBasePath.startsWith('/')) {
      return '$folderName$withoutBasePath';
    } else {
      return '$folderName/$withoutBasePath';
    }
  }

  /// Converts
  /// content://com.android.externalstorage.documents/tree/primary%3ALocalSend
  /// to
  /// content://com.android.externalstorage.documents/tree/primary%3ALocalSend/document/primary%3ALocalSend
  /// or
  /// content://com.android.externalstorage.documents/tree/primary%3ALocalSend/document/primary%3ALocalSend%2FsubFolder
  static String convertTreeUriToDocumentUri({
    required String treeUri,
    String? suffix,
  }) {
    final index = treeUri.indexOf('/tree/');
    final treePath = treeUri.substring(index + 6);

    if (suffix == null) {
      return '$treeUri/document/$treePath';
    } else {
      return '$treeUri/document/$treePath%2F${Uri.encodeComponent(suffix)}';
    }
  }

  /// Converts
  /// content://com.android.externalstorage.documents/tree/primary%3ALocalSend/subFolder
  /// to
  /// content://com.android.externalstorage.documents/tree/primary%3ALocalSend%2FsubFolder
  static String encodeTreeUri(String uri) {
    final treeIndex = uri.indexOf('/tree/');
    if (treeIndex == -1) {
      return uri;
    }

    final encodedPath = Uri.encodeComponent(Uri.decodeComponent(uri.substring(treeIndex + 6)));
    return uri.substring(0, treeIndex + 6) + encodedPath;
  }
}
