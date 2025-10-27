import 'package:localsend_app/util/native/content_uri_helper.dart';
import 'package:test/test.dart';

void main() {
  group('getPathFromTreeUri', () {
    test('should return the root folder path from the content uri', () {
      expect(
        ContentUriHelper.getPathFromTreeUri('content://com.android.externalstorage.documents/tree/primary%3ADocuments'),
        'primary:Documents',
      );
    });

    test('should return the folder path from the content uri', () {
      expect(
        ContentUriHelper.getPathFromTreeUri('content://com.android.externalstorage.documents/tree/primary%3ADocuments%2FOffice%20Lens'),
        'primary:Documents/Office Lens',
      );
    });

    test('should return folder path from content uri in SD card', () {
      expect(
        ContentUriHelper.getPathFromTreeUri('content://com.android.externalstorage.documents/tree/1234-5678:Documents'),
        '1234-5678:Documents',
      );
    });
  });

  group('getEntityNameFromPath', () {
    test('should return the entity name from the path', () {
      expect(
        ContentUriHelper.getEntityNameFromPath('primary:Documents'),
        'Documents',
      );
    });

    test('should return the entity name from the path with a folder', () {
      expect(
        ContentUriHelper.getEntityNameFromPath('primary:Documents/Office Lens'),
        'Office Lens',
      );
    });

    test('should return the entity name from the path with a folder in SD card', () {
      expect(
        ContentUriHelper.getEntityNameFromPath('1234-5678:Documents/Office Lens'),
        'Office Lens',
      );
    });
  });

  group('guessRelativePathFromPickedFileContentUri', () {
    test('should return the relative path from the picked file content uri', () {
      expect(
        ContentUriHelper.guessRelativePathFromPickedFileContentUri(
          folderContentUri: 'content://com.android.externalstorage.documents/tree/primary%3ADocuments%2FOffice%20Lens',
          basePath: 'primary:Documents/Office Lens',
          folderName: 'Office Lens',
          uri:
              'content://com.android.externalstorage.documents/tree/primary%3ADocuments%2FOffice%20Lens/document/primary%3ADocuments%2FOffice%20Lens%2FTest.pdf',
        ),
        'Office Lens/Test.pdf',
      );
    });

    test('should return the relative path from the picked file content uri without the folder', () {
      expect(
        ContentUriHelper.guessRelativePathFromPickedFileContentUri(
          folderContentUri: 'content://com.android.externalstorage.documents/tree/primary%3ADocuments',
          basePath: 'primary:Documents',
          folderName: 'Documents',
          uri: 'content://com.android.externalstorage.documents/tree/primary%3ADocuments/document/primary%3ADocuments%2FTest.pdf',
        ),
        'Documents/Test.pdf',
      );
    });

    test('should return the relative path from the picked file content uri in SD card', () {
      expect(
        ContentUriHelper.guessRelativePathFromPickedFileContentUri(
          folderContentUri: 'content://com.android.externalstorage.documents/tree/1234-5678:Documents',
          basePath: '1234-5678:Documents',
          folderName: 'Documents',
          uri: 'content://com.android.externalstorage.documents/tree/1234-5678:Documents/document/1234-5678:Documents%2FTest.pdf',
        ),
        'Documents/Test.pdf',
      );
    });

    test('should return the relative path from the picked file content uri in SD card root', () {
      expect(
        ContentUriHelper.guessRelativePathFromPickedFileContentUri(
          folderContentUri: 'content://com.android.externalstorage.documents/tree/1234-5678%3A',
          basePath: '1234-5678:',
          folderName: '1234-5678',
          uri: 'content://com.android.externalstorage.documents/tree/1234-5678%3A/document/1234-5678%3ATest.pdf',
        ),
        '1234-5678/Test.pdf',
      );
    });
  });

  group('convertTreeUriToDocumentUri', () {
    test('should return the document uri from the tree uri', () {
      expect(
        ContentUriHelper.convertTreeUriToDocumentUri(treeUri: 'content://com.android.externalstorage.documents/tree/primary%3ALocalSend'),
        'content://com.android.externalstorage.documents/tree/primary%3ALocalSend/document/primary%3ALocalSend',
      );
    });

    test('should return the document uri from the tree uri with a folder', () {
      expect(
        ContentUriHelper.convertTreeUriToDocumentUri(
          treeUri: 'content://com.android.externalstorage.documents/tree/primary%3ALocalSend',
          suffix: 'subFolder',
        ),
        'content://com.android.externalstorage.documents/tree/primary%3ALocalSend/document/primary%3ALocalSend%2FsubFolder',
      );
    });
  });

  group('encodeTreeUri', () {
    test('should return the encoded tree uri', () {
      expect(
        ContentUriHelper.encodeTreeUri('content://com.android.externalstorage.documents/tree/primary%3ALocalSend/subFolder'),
        'content://com.android.externalstorage.documents/tree/primary%3ALocalSend%2FsubFolder',
      );
    });

    test('should return the encoded tree uri with a folder in SD card', () {
      expect(
        ContentUriHelper.encodeTreeUri('content://com.android.externalstorage.documents/tree/1234-5678:LocalSend/subFolder'),
        'content://com.android.externalstorage.documents/tree/1234-5678%3ALocalSend%2FsubFolder',
      );
    });
  });
}
