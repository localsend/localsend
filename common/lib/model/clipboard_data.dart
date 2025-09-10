import 'dart:typed_data';
import 'package:dart_mappable/dart_mappable.dart';

part 'clipboard_data.mapper.dart';

/// Types of clipboard data that can be shared
@MappableEnum()
enum ClipboardDataType {
  text,
  image,
  html,
  url,
  files,
}

/// Represents clipboard data that can be shared between devices
@MappableClass()
class ClipboardData with ClipboardDataMappable {
  final String id;
  final ClipboardDataType type;
  final String? text;
  final Uint8List? imageData;
  final String? html;
  final String? url;
  final List<String>? filePaths;
  final String? mimeType;
  final int? size;
  final DateTime timestamp;

  const ClipboardData({
    required this.id,
    required this.type,
    this.text,
    this.imageData,
    this.html,
    this.url,
    this.filePaths,
    this.mimeType,
    this.size,
    required this.timestamp,
  });

  /// Create a text clipboard data
  factory ClipboardData.text({
    required String id,
    required String text,
    DateTime? timestamp,
  }) {
    return ClipboardData(
      id: id,
      type: ClipboardDataType.text,
      text: text,
      mimeType: 'text/plain',
      size: text.length,
      timestamp: timestamp ?? DateTime.now(),
    );
  }

  /// Create an image clipboard data
  factory ClipboardData.image({
    required String id,
    required Uint8List imageData,
    required String mimeType,
    DateTime? timestamp,
  }) {
    return ClipboardData(
      id: id,
      type: ClipboardDataType.image,
      imageData: imageData,
      mimeType: mimeType,
      size: imageData.length,
      timestamp: timestamp ?? DateTime.now(),
    );
  }

  /// Create an HTML clipboard data
  factory ClipboardData.html({
    required String id,
    required String html,
    DateTime? timestamp,
  }) {
    return ClipboardData(
      id: id,
      type: ClipboardDataType.html,
      html: html,
      mimeType: 'text/html',
      size: html.length,
      timestamp: timestamp ?? DateTime.now(),
    );
  }

  /// Create a URL clipboard data
  factory ClipboardData.url({
    required String id,
    required String url,
    DateTime? timestamp,
  }) {
    return ClipboardData(
      id: id,
      type: ClipboardDataType.url,
      url: url,
      mimeType: 'text/uri-list',
      size: url.length,
      timestamp: timestamp ?? DateTime.now(),
    );
  }

  /// Create a files clipboard data
  factory ClipboardData.files({
    required String id,
    required List<String> filePaths,
    DateTime? timestamp,
  }) {
    return ClipboardData(
      id: id,
      type: ClipboardDataType.files,
      filePaths: filePaths,
      mimeType: 'text/uri-list',
      size: filePaths.join('\n').length,
      timestamp: timestamp ?? DateTime.now(),
    );
  }

  /// Get the display name for this clipboard data
  String get displayName {
    switch (type) {
      case ClipboardDataType.text:
        return 'Text: ${text?.substring(0, text!.length > 50 ? 50 : text!.length)}${text!.length > 50 ? '...' : ''}';
      case ClipboardDataType.image:
        return 'Image (${mimeType ?? 'unknown'})';
      case ClipboardDataType.html:
        return 'HTML: ${html?.substring(0, html!.length > 50 ? 50 : html!.length)}${html!.length > 50 ? '...' : ''}';
      case ClipboardDataType.url:
        return 'URL: $url';
      case ClipboardDataType.files:
        return 'Files (${filePaths?.length ?? 0})';
    }
  }

  /// Get the size in a human-readable format
  String get sizeFormatted {
    if (size == null) return 'Unknown size';
    
    const units = ['B', 'KB', 'MB', 'GB'];
    int unitIndex = 0;
    double sizeInBytes = size!.toDouble();
    
    while (sizeInBytes >= 1024 && unitIndex < units.length - 1) {
      sizeInBytes /= 1024;
      unitIndex++;
    }
    
    return '${sizeInBytes.toStringAsFixed(unitIndex == 0 ? 0 : 1)} ${units[unitIndex]}';
  }
}
