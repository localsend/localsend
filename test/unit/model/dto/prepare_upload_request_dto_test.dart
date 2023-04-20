import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/dto/prepare_upload_request_dto.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:test/test.dart';

void main() {
  group('parse PrepareUploadRequestDto', () {
    test('should parse valid enums', () {
      final dto = {
        'info': {
          'alias': 'Nice Banana',
          'deviceModel': 'Samsung',
          'deviceType': 'mobile',
        },
        'files': {
          'some id': {
            'id': 'some id',
            'fileName': 'another image.jpg',
            'size': 1234,
            'fileType': 'image',
            'preview': "*preview data*"
          }
        }
      };
      final parsed = PrepareUploadRequestDto.fromJson(dto);
      expect(parsed.info.deviceType, DeviceType.mobile);
      expect(parsed.files.length, 1);
      expect(parsed.files.values.first.fileType, FileType.image);
    });

    test('should fallback deviceType', () {
      final dto = {
        'info': {
          'alias': 'Nice Banana',
          'deviceModel': 'Samsung',
          'deviceType': 'invalidType',
        },
        'files': {
          'some id': {
            'id': 'some id',
            'fileName': 'another image.jpg',
            'size': 1234,
            'fileType': 'image',
            'preview': "*preview data*"
          }
        }
      };
      final parsed = PrepareUploadRequestDto.fromJson(dto);
      expect(parsed.info.deviceType, DeviceType.desktop);
      expect(parsed.files.length, 1);
      expect(parsed.files.values.first.fileType, FileType.image);
    });

    test('should fallback fileType', () {
      final dto = {
        'info': {
          'alias': 'Nice Banana',
          'deviceModel': 'Samsung',
          'deviceType': 'mobile',
        },
        'files': {
          'some id': {
            'id': 'some id',
            'fileName': 'another image.jpg',
            'size': 1234,
            'fileType': 'superBigImage',
            'preview': "*preview data*"
          }
        }
      };
      final parsed = PrepareUploadRequestDto.fromJson(dto);
      expect(parsed.info.deviceType, DeviceType.mobile);
      expect(parsed.files.length, 1);
      expect(parsed.files.values.first.fileType, FileType.other);
    });
  });
}
