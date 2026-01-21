import 'package:common/model/device.dart';
import 'package:common/model/dto/file_dto.dart';
import 'package:common/model/dto/info_register_dto.dart';
import 'package:common/model/dto/multicast_dto.dart';
import 'package:common/model/dto/prepare_upload_request_dto.dart';
import 'package:common/model/dto/prepare_upload_response_dto.dart';
import 'package:common/model/file_type.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

void main() {
  MapperContainer.globals.use(const FileDtoMapper());

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
            'preview': '*preview data*',
          },
        },
      };
      final parsed = PrepareUploadRequestDto.fromJson(dto);
      expect(parsed.info.deviceType, DeviceType.mobile);
      expect(parsed.files.length, 1);
      expect(parsed.files.values.first.fileType, FileType.image);
    });

    test('Should fallback deviceType (simple)', () {
      final dto = {
        'alias': 'Nice Banana',
        'deviceModel': 'Samsung',
        'deviceType': 'invalidType',
      };

      final parsed = InfoRegisterDto.fromJson(dto);
      expect(parsed.deviceType, DeviceType.desktop);
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
            'preview': '*preview data*',
          },
        },
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
            'preview': '*preview data*',
          },
        },
      };
      final parsed = PrepareUploadRequestDto.fromJson(dto);
      expect(parsed.info.deviceType, DeviceType.mobile);
      expect(parsed.files.length, 1);
      expect(parsed.files.values.first.fileType, FileType.other);
    });

    test('should parse mime type', () {
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
            'fileType': 'image/jpeg',
            'preview': '*preview data*',
          },
        },
      };
      final parsed = PrepareUploadRequestDto.fromJson(dto);
      expect(parsed.info.deviceType, DeviceType.mobile);
      expect(parsed.files.length, 1);
      expect(parsed.files.values.first.fileType, FileType.image);
    });

    test('should parse apk mime type', () {
      final dto = {
        'info': {
          'alias': 'Nice Banana',
          'deviceModel': 'Samsung',
          'deviceType': 'mobile',
        },
        'files': {
          'some id': {
            'id': 'some id',
            'fileName': 'myApk.apk',
            'size': 1234,
            'fileType': 'application/vnd.android.package-archive',
          },
        },
      };
      final parsed = PrepareUploadRequestDto.fromJson(dto);
      expect(parsed.info.deviceType, DeviceType.mobile);
      expect(parsed.files.length, 1);
      expect(parsed.files.values.first.fileType, FileType.apk);
    });
  });

  group('serialize PrepareUploadRequestDto', () {
    const info = InfoRegisterDto(
      alias: 'Nice Banana',
      version: '2.0',
      deviceModel: 'Samsung',
      deviceType: DeviceType.mobile,
      fingerprint: '123',
      port: 123,
      protocol: ProtocolType.http,
      download: false,
    );

    test('should serialize in legacy mode', () {
      const dto = PrepareUploadRequestDto(
        info: info,
        files: {
          'some id': FileDto(
            id: 'some id',
            fileName: 'another image.jpg',
            size: 1234,
            fileType: FileType.image,
            hash: '*hash*',
            preview: '*preview data*',
            legacy: true,
            metadata: null,
          ),
          'some id 2': FileDto(
            id: 'some id 2',
            fileName: 'my apk.apk',
            size: 1234,
            fileType: FileType.apk,
            hash: '*hash*',
            preview: '*preview data*',
            legacy: true,
            metadata: null,
          ),
        },
      );
      final serialized = dto.toJson();
      expect(serialized['info']['deviceType'], 'mobile');
      expect(serialized['files'].length, 2);
      expect(serialized['files']['some id']['fileType'], 'image');
      expect(serialized['files']['some id 2']['fileType'], 'apk');
    });

    test('should serialize in mime mode', () {
      final dto = PrepareUploadRequestDto(
        info: info,
        files: {
          'some id': const FileDto(
            id: 'some id',
            fileName: 'another image.jpg',
            size: 1234,
            fileType: FileType.image,
            hash: '*hash*',
            preview: '*preview data*',
            legacy: false,
            metadata: null,
          ),
          'some id 2': FileDto(
            id: 'some id 2',
            fileName: 'my apk.apk',
            size: 1234,
            fileType: FileType.apk,
            hash: '*hash*',
            preview: '*preview data*',
            legacy: false,
            metadata: FileMetadata(
              lastModified: DateTime.utc(2020),
              lastAccessed: DateTime.utc(2021),
            ),
          ),
        },
      );
      final serialized = dto.toJson();

      expect(serialized['info']['deviceType'], 'mobile');
      expect(serialized['files'].length, 2);
      expect(serialized['files']['some id']['fileType'], 'image/jpeg');
      expect(serialized['files']['some id 2']['fileType'], 'application/vnd.android.package-archive');
      expect(serialized['files']['some id 2']['metadata'], {
        'modified': '2020-01-01T00:00:00.000Z',
        'accessed': '2021-01-01T00:00:00.000Z',
      });
    });
  });

  test('PrepareUploadResponseDto', () {
    final parsed = PrepareUploadResponseDto.fromJson({
      'sessionId': 'some session id',
      'files': {
        'some id': 'some url',
        'some id 2': 'some url 2',
      },
    });

    expect(parsed.sessionId, 'some session id');
    expect(parsed.files.length, 2);
    expect(parsed.files['some id'], 'some url');
    expect(parsed.files['some id 2'], 'some url 2');
  });
}
