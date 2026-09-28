import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:uri_content/uri_content.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

const _previewPrefix = 'data:image/png;base64,';
const _maxPreviewBytes = 64 * 1024;
const _maxSourceBytes = 32 * 1024 * 1024;
const _previewSize = 96;

Uint8List? decodeTransferImagePreview(String? preview) {
  if (preview == null || !preview.startsWith(_previewPrefix)) return null;
  final encoded = preview.substring(_previewPrefix.length);
  if (encoded.length > ((_maxPreviewBytes + 2) ~/ 3) * 4) return null;
  try {
    final bytes = base64Decode(encoded);
    if (bytes.length < 24 || bytes.length > _maxPreviewBytes) return null;
    const pngHeader = [137, 80, 78, 71, 13, 10, 26, 10];
    for (var i = 0; i < pngHeader.length; i++) {
      if (bytes[i] != pngHeader[i]) return null;
    }
    if (ascii.decode(bytes.sublist(12, 16)) != 'IHDR') return null;
    final header = ByteData.sublistView(bytes);
    final width = header.getUint32(16);
    final height = header.getUint32(20);
    if (width == 0 || height == 0 || width > 256 || height > 256) return null;
    return bytes;
  } on FormatException {
    return null;
  }
}

Future<String?> createTransferImagePreview(CrossFile file) async {
  if (file.fileType != FileType.image && file.fileType != FileType.video && file.fileType != FileType.apk) return null;
  try {
    Uint8List? source = file.thumbnail;
    if (source == null && file.asset != null) {
      final thumbnail = await file.asset!.thumbnailDataWithSize(const ThumbnailSize.square(_previewSize), format: ThumbnailFormat.jpeg);
      source = thumbnail == null ? null : Uint8List.fromList(thumbnail);
    }
    if (source == null && file.fileType == FileType.image && file.size <= _maxSourceBytes) {
      if (file.bytes != null) {
        source = Uint8List.fromList(file.bytes!);
      } else if (file.path?.startsWith('content://') == true) {
        source = await UriContent().from(Uri.parse(file.path!));
      } else if (file.path != null) {
        source = await File(file.path!).readAsBytes();
      }
    }
    if (source == null || source.isEmpty || source.length > _maxSourceBytes) return null;

    final buffer = await ui.ImmutableBuffer.fromUint8List(source);
    try {
      final descriptor = await ui.ImageDescriptor.encoded(buffer);
      try {
        final scale = math.min(1.0, _previewSize / math.max(descriptor.width, descriptor.height));
        final codec = await descriptor.instantiateCodec(
          targetWidth: math.max(1, (descriptor.width * scale).round()),
          targetHeight: math.max(1, (descriptor.height * scale).round()),
        );
        try {
          final frame = await codec.getNextFrame();
          try {
            final data = await frame.image.toByteData(format: ui.ImageByteFormat.png);
            if (data == null) return null;
            final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
            return bytes.length <= _maxPreviewBytes ? '$_previewPrefix${base64Encode(bytes)}' : null;
          } finally {
            frame.image.dispose();
          }
        } finally {
          codec.dispose();
        }
      } finally {
        descriptor.dispose();
      }
    } finally {
      buffer.dispose();
    }
  } catch (_) {
    return null;
  }
}
