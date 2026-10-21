import 'dart:async';
import 'dart:typed_data';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_isolates/rust/api/cancel.dart';
import 'package:localsend_isolates/rust/api/content_source.dart' as rust;
import 'package:localsend_isolates/rust/api/content_stream.dart' as rust_stream;
import 'package:localsend_isolates/util/android_channel.dart';

part 'content_source.mapper.dart';

/// A source of bytes. Data recipes can cross isolates; stream callbacks stay local.
@MappableClass(discriminatorKey: 'type')
sealed class ContentSource with ContentSourceMappable {
  const ContentSource();

  const factory ContentSource.fromPath(String path) = PathContentSource;
  const factory ContentSource.fromBytes(List<int> bytes) = BytesContentSource;
  const factory ContentSource._fromPrepared(String descriptor) = PreparedContentSource;

  /// A local-only source. Create it inside the isolate that consumes it.
  factory ContentSource.fromStream(Stream<List<int>> Function() createStream) = _StreamContentSource;

  String? get path => switch (this) {
    PathContentSource(:final path) => path,
    _ => null,
  };

  List<int>? get bytes => switch (this) {
    BytesContentSource(:final bytes) => bytes,
    _ => null,
  };

  /// Opens Android content URIs afresh, so retries receive a usable descriptor.
  Future<rust.ContentSource> resolve() async => switch (this) {
    PathContentSource(:final path) when path.startsWith('content://') => rust.ContentSource.fileDescriptor(
      fd: await getFileDescriptorAndroid(uri: path),
    ),
    PathContentSource(:final path) => rust.ContentSource.path(path: path),
    BytesContentSource(:final bytes) => rust.ContentSource.bytes(bytes: bytes is Uint8List ? bytes : Uint8List.fromList(bytes)),
    PreparedContentSource(:final descriptor) => rust.ContentSource.generated(descriptor: descriptor),
    _StreamContentSource() => throw UnsupportedError('A callback source cannot be resolved as a native recipe'),
  };

  /// Opens a fresh stream. Native recipes are read lazily on subscription.
  Stream<List<int>> openRead() => switch (this) {
    _StreamContentSource(:final createStream) => createStream(),
    _ => _NativeContentStream(this),
  };

  /// Passes a native recipe directly, or pumps a local Dart stream with backpressure.
  /// A successful early acknowledgement from [consume] does not stop the pump.
  Future<T> transfer<T>(
    Future<T> Function(rust.RsContentSource) consume, {
    RsCancellationToken? cancelToken,
    int? contentLength,
  }) async {
    try {
      return await _transfer(consume, contentLength: contentLength);
    } catch (error, stackTrace) {
      cancelToken?.cancel();
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<T> _transfer<T>(Future<T> Function(rust.RsContentSource) consume, {int? contentLength}) async {
    final stream = openRead();
    if (stream is _NativeContentStream) {
      return consume(rust.RsContentSource.native(source: await stream.recipe.resolve()));
    }

    final (sink, receiver) = await rust_stream.createContentStream();
    final iterator = StreamIterator<List<int>>(stream);
    final monitor = _TransferMonitor();
    monitor.watchReceiver(sink.waitClosed());
    Future<T> consumed;
    try {
      consumed = consume(rust.RsContentSource.stream(receiver: receiver));
    } catch (error, stackTrace) {
      try {
        await sink.close();
      } catch (_) {}
      _cancelIteratorInBackground(iterator);
      Error.throwWithStackTrace(error, stackTrace);
    }
    monitor.watchConsumer(consumed);

    var closed = false;
    var completed = false;
    try {
      List<int>? heldChunk;
      var produced = 0;
      while (await monitor.race(iterator.moveNext, watchClosed: contentLength != 0)) {
        produced += iterator.current.length;
        if (contentLength != null && contentLength >= 0 && produced > contentLength) {
          throw StateError('Content source produced more than $contentLength bytes');
        }
        // Hold only the last 64 KiB block until the producer succeeds.
        // A late error must leave the native reader short of its length.
        heldChunk = await _sendAndHold(sink, iterator.current, heldChunk, monitor);
      }
      if (contentLength != null && contentLength >= 0 && produced != contentLength) {
        throw StateError('Content source produced $produced bytes, expected $contentLength');
      }
      if (heldChunk != null) {
        await monitor.race(() => sink.add(data: heldChunk!));
      }
      await sink.close();
      closed = true;
      final result = await consumed;
      completed = true;
      return result;
    } on _ReceiverClosed catch (closedError, stackTrace) {
      try {
        await consumed;
      } catch (error, nativeStackTrace) {
        Error.throwWithStackTrace(error, nativeStackTrace);
      }
      if (closedError.error != null) {
        Error.throwWithStackTrace(closedError.error!, closedError.stackTrace ?? stackTrace);
      }
      throw StateError('The content receiver closed before the source completed');
    } finally {
      if (!closed) {
        try {
          await sink.close();
        } catch (_) {}
      }
      if (completed) {
        try {
          await iterator.cancel();
        } catch (_) {}
      } else {
        _cancelIteratorInBackground(iterator);
      }
    }
  }

  /// Preserves a native generated source as an isolate-safe Dart value.
  static ContentSource fromRust(rust.ContentSource source) => switch (source) {
    rust.ContentSource_Path(:final path) => ContentSource.fromPath(path),
    rust.ContentSource_Bytes(:final bytes) => ContentSource.fromBytes(bytes),
    rust.ContentSource_Generated(:final descriptor) => ContentSource._fromPrepared(descriptor),
    rust.ContentSource_FileDescriptor() => throw UnsupportedError('An open file descriptor cannot be stored as a replayable source'),
  };
}

/// The callback and its stream cannot cross isolate or persistence boundaries.
class _StreamContentSource extends ContentSource {
  final Stream<List<int>> Function() createStream;

  const _StreamContentSource(this.createStream);

  Never _notSerializable() => throw UnsupportedError('A callback source is local to its creating isolate');

  @override
  String serialize() => _notSerializable();

  @override
  Map<String, dynamic> toJson() => _notSerializable();

  @override
  Never get copyWith => _notSerializable();
}

/// A marker that lets [transfer] pass native sources through without a Dart round trip.
class _NativeContentStream extends Stream<List<int>> {
  final ContentSource recipe;

  const _NativeContentStream(this.recipe);

  @override
  StreamSubscription<List<int>> listen(void Function(List<int> event)? onData, {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    late final StreamController<List<int>> controller;
    rust_stream.RsContentReader? reader;
    Completer<void>? resumed;
    var canceled = false;

    Future<void> pump() async {
      try {
        final opened = await rust_stream.openContentSource(source: rust.RsContentSource.native(source: await recipe.resolve()));
        reader = opened;
        if (canceled) {
          return;
        }
        while (!canceled) {
          if (controller.isPaused) {
            resumed ??= Completer<void>();
            await resumed!.future;
            continue;
          }
          final chunk = await opened.nextChunk();
          if (canceled || chunk == null) {
            break;
          }
          controller.add(chunk);
        }
      } catch (error, stackTrace) {
        if (!canceled) {
          controller.addError(error, stackTrace);
        }
      } finally {
        await reader?.close();
        if (!canceled) {
          unawaited(controller.close());
        }
      }
    }

    controller = StreamController<List<int>>(
      onListen: () => unawaited(pump()),
      onResume: () {
        resumed?.complete();
        resumed = null;
      },
      onCancel: () async {
        canceled = true;
        resumed?.complete();
        resumed = null;
        await reader?.close();
      },
    );
    return controller.stream.listen(onData, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }
}

void _cancelIteratorInBackground(StreamIterator<List<int>> iterator) {
  // A callback's async* generator can be awaiting an uninterruptible Future.
  // Request cancellation without delaying a transfer error indefinitely.
  try {
    unawaited(iterator.cancel().then<void>((_) {}, onError: (Object _, StackTrace _) {}));
  } catch (_) {}
}

class _TransferFailure {
  final Object error;
  final StackTrace stackTrace;

  const _TransferFailure(this.error, this.stackTrace);
}

class _TransferValue<T> {
  final T value;

  const _TransferValue(this.value);
}

class _ReceiverClosed {
  final Object? error;
  final StackTrace? stackTrace;

  const _ReceiverClosed([this.error, this.stackTrace]);
}

/// Watches each terminal signal once and wakes only the current read or write.
class _TransferMonitor {
  _TransferFailure? _failure;
  _ReceiverClosed? _closed;
  void Function(Object)? _active;

  void watchConsumer<T>(Future<T> consumed) {
    unawaited(
      consumed.then<void>(
        (_) {},
        onError: (Object error, StackTrace stackTrace) {
          _failure = _TransferFailure(error, stackTrace);
          _active?.call(_failure!);
        },
      ),
    );
  }

  void watchReceiver(Future<bool> receiverClosed) {
    unawaited(
      receiverClosed.then<void>(
        (closed) {
          if (closed) {
            _closed = const _ReceiverClosed();
            _active?.call(_closed!);
          }
        },
        onError: (Object error, StackTrace stackTrace) {
          _closed = _ReceiverClosed(error, stackTrace);
          _active?.call(_closed!);
        },
      ),
    );
  }

  Future<T> race<T>(Future<T> Function() operation, {bool watchClosed = false}) async {
    final failure = _failure;
    if (failure != null) {
      Error.throwWithStackTrace(failure.error, failure.stackTrace);
    }
    if (watchClosed && _closed != null) {
      throw _closed!;
    }

    assert(_active == null);
    final result = Completer<Object>();
    void onSignal(Object signal) {
      if ((signal is _TransferFailure || watchClosed) && !result.isCompleted) {
        result.complete(signal);
      }
    }

    _active = onSignal;
    try {
      final future = operation();
      unawaited(
        future.then<void>(
          (value) {
            if (!result.isCompleted) {
              result.complete(_TransferValue<T>(value));
            }
          },
          onError: (Object error, StackTrace stackTrace) {
            if (!result.isCompleted) {
              result.complete(_TransferFailure(error, stackTrace));
            }
          },
        ),
      );

      final outcome = await result.future;
      if (outcome is _TransferFailure) {
        Error.throwWithStackTrace(outcome.error, outcome.stackTrace);
      }
      if (outcome is _ReceiverClosed) {
        throw outcome;
      }
      return (outcome as _TransferValue<T>).value;
    } finally {
      _active = null;
    }
  }
}

Future<List<int>?> _sendAndHold(
  rust_stream.RsContentStreamSink sink,
  List<int> chunk,
  List<int>? heldChunk,
  _TransferMonitor monitor,
) async {
  const maxChunk = 64 * 1024;
  for (var offset = 0; offset < chunk.length; offset += maxChunk) {
    if (heldChunk != null) {
      await monitor.race(() => sink.add(data: heldChunk!));
    }
    final end = offset + maxChunk < chunk.length ? offset + maxChunk : chunk.length;
    heldChunk = chunk.sublist(offset, end);
  }
  return heldChunk;
}

@MappableClass(discriminatorValue: 'path')
class PathContentSource extends ContentSource with PathContentSourceMappable {
  @override
  final String path;

  const PathContentSource(this.path);
}

@MappableClass(discriminatorValue: 'bytes')
class BytesContentSource extends ContentSource with BytesContentSourceMappable {
  @override
  final List<int> bytes;

  const BytesContentSource(this.bytes);
}

@MappableClass(discriminatorValue: 'generated')
class PreparedContentSource extends ContentSource with PreparedContentSourceMappable {
  final String descriptor;

  const PreparedContentSource(this.descriptor);
}
