import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/state/send/web/web_download_state.dart';

part 'web_share_state.mapper.dart';

/// Which web share is active, i.e. which page the server serves to browsers.
/// `null` on [ServerState.web] means no web share is active.
///
/// The [pin] protects the served page. It is enforced by the Rust server;
/// changing it requires a server restart.
@MappableClass()
sealed class WebShareState with WebShareStateMappable {
  final String? pin;

  const WebShareState({required this.pin});
}

/// Web download: the download page is served, offering the files in [state] for
/// download by web browsers.
@MappableClass()
class WebShareDownload extends WebShareState with WebShareDownloadMappable {
  final WebDownloadState state;

  const WebShareDownload({required this.state, required super.pin});
}

/// The upload page is served so web browsers can upload files.
/// The [pin] replaces the receive pin from settings.
@MappableClass()
class WebShareUpload extends WebShareState with WebShareUploadMappable {
  const WebShareUpload({required super.pin});
}
