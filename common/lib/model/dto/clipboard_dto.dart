import 'dart:convert';
import 'dart:typed_data';
import 'package:common/model/clipboard_data.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'clipboard_dto.mapper.dart';

/// DTO for clipboard data transfer between devices
@MappableClass()
class ClipboardDto with ClipboardDtoMappable {
  final String id;
  final String type; // MIME type or custom type
  final String? data; // Base64 encoded data for binary content
  final String? text; // Plain text content
  final String? html; // HTML content
  final String? url; // URL content
  final List<String>? filePaths; // File paths
  final int? size;
  final String timestamp; // ISO 8601 timestamp

  const ClipboardDto({
    required this.id,
    required this.type,
    this.data,
    this.text,
    this.html,
    this.url,
    this.filePaths,
    this.size,
    required this.timestamp,
  });

  /// Create from ClipboardData
  factory ClipboardDto.fromClipboardData(ClipboardData clipboardData) {
    return ClipboardDto(
      id: clipboardData.id,
      type: clipboardData.mimeType ?? 'text/plain',
      data: clipboardData.imageData != null 
          ? base64Encode(clipboardData.imageData!) 
          : null,
      text: clipboardData.text,
      html: clipboardData.html,
      url: clipboardData.url,
      filePaths: clipboardData.filePaths,
      size: clipboardData.size,
      timestamp: clipboardData.timestamp.toIso8601String(),
    );
  }

  /// Convert to ClipboardData
  ClipboardData toClipboardData() {
    final timestamp = DateTime.parse(this.timestamp);
    
    if (data != null) {
      // Binary data (image)
      return ClipboardData.image(
        id: id,
        imageData: base64Decode(data!),
        mimeType: type,
        timestamp: timestamp,
      );
    } else if (text != null) {
      return ClipboardData.text(
        id: id,
        text: text!,
        timestamp: timestamp,
      );
    } else if (html != null) {
      return ClipboardData.html(
        id: id,
        html: html!,
        timestamp: timestamp,
      );
    } else if (url != null) {
      return ClipboardData.url(
        id: id,
        url: url!,
        timestamp: timestamp,
      );
    } else if (filePaths != null) {
      return ClipboardData.files(
        id: id,
        filePaths: filePaths!,
        timestamp: timestamp,
      );
    } else {
      // Fallback to text
      return ClipboardData.text(
        id: id,
        text: '',
        timestamp: timestamp,
      );
    }
  }
}

// Helper functions for base64 encoding/decoding
String base64Encode(Uint8List data) {
  return base64.encode(data);
}

Uint8List base64Decode(String data) {
  return base64.decode(data);
}
