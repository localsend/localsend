import 'package:localsend_app/model/state/server/receiving_file.dart';
import 'package:localsend_app/util/live_photo_pairing_helper.dart';
import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:test/test.dart';

void main() {
  test('pairs accepted image and video using desired file names', () {
    final files = {
      'image': _receivingFile(
        id: 'image',
        originalFileName: 'IMG_0001.HEIC',
        desiredName: 'Vacation/Beach/live.heic',
        fileType: FileType.image,
      ),
      'video': _receivingFile(
        id: 'video',
        originalFileName: 'IMG_0001.MOV',
        desiredName: 'Vacation/Beach/live.mov',
        fileType: FileType.video,
      ),
    };

    expect(findLivePhotoPairFileIds(files), {'image', 'video'});
  });

  test('ignores skipped files and unpaired accepted files', () {
    final files = {
      'image': _receivingFile(
        id: 'image',
        originalFileName: 'IMG_0001.HEIC',
        desiredName: 'live.heic',
        fileType: FileType.image,
      ),
      'video': _receivingFile(
        id: 'video',
        originalFileName: 'IMG_0001.MOV',
        desiredName: null,
        fileType: FileType.video,
      ),
    };

    expect(findLivePhotoPairFileIds(files), isEmpty);
  });

  test('does not pair files when desired names no longer match', () {
    final files = {
      'image': _receivingFile(
        id: 'image',
        originalFileName: 'IMG_0001.HEIC',
        desiredName: 'live.heic',
        fileType: FileType.image,
      ),
      'video': _receivingFile(
        id: 'video',
        originalFileName: 'IMG_0001.MOV',
        desiredName: 'clip.mov',
        fileType: FileType.video,
      ),
    };

    expect(findLivePhotoPairFileIds(files), isEmpty);
  });
}

ReceivingFile _receivingFile({
  required String id,
  required String originalFileName,
  required String? desiredName,
  required FileType fileType,
}) {
  return ReceivingFile(
    file: FileDto(
      id: id,
      fileName: originalFileName,
      size: 1,
      fileType: fileType,
      hash: null,
      preview: null,
      metadata: null,
    ),
    token: desiredName != null ? 'token-$id' : null,
    desiredName: desiredName,
    path: null,
    savedToGallery: false,
    errorMessage: null,
  );
}
