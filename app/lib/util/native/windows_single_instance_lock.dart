import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

const _errorAlreadyExists = 183;
const _lockName = r'Local\LocalSendNgNativeWindowsSingleInstance';

typedef _CreateEventNative = IntPtr Function(Pointer<Void> lpEventAttributes, Int32 bManualReset, Int32 bInitialState, Pointer<Utf16> lpName);
typedef _CreateEventDart = int Function(Pointer<Void> lpEventAttributes, int bManualReset, int bInitialState, Pointer<Utf16> lpName);
typedef _GetLastErrorNative = Uint32 Function();
typedef _GetLastErrorDart = int Function();
typedef _CloseHandleNative = Int32 Function(IntPtr hObject);
typedef _CloseHandleDart = int Function(int hObject);

/// Holds a named Windows kernel object for the lifetime of the process.
///
/// The existing HTTP-based instance check depends on the LocalSend server port,
/// so it can be bypassed when two instances have different stored ports. This
/// lock is process-level and is acquired before any server socket is created.
///
/// Policy: only one native Windows LocalSend NG process is allowed per Windows
/// logon session. WSL, VMs, Docker containers and other isolated OS boundaries
/// do not share this Win32 kernel namespace, so they remain intentionally
/// separate environments instead of being killed from the host app.
class WindowsSingleInstanceLock {
  WindowsSingleInstanceLock._();

  static final instance = WindowsSingleInstanceLock._();

  DynamicLibrary? _kernel32;
  int? _handle;

  bool acquire() {
    if (!Platform.isWindows || _handle != null) {
      return true;
    }

    final kernel32 = _kernel32 ??= DynamicLibrary.open('kernel32.dll');
    final createEvent = kernel32.lookupFunction<_CreateEventNative, _CreateEventDart>('CreateEventW');
    final getLastError = kernel32.lookupFunction<_GetLastErrorNative, _GetLastErrorDart>('GetLastError');
    final closeHandle = kernel32.lookupFunction<_CloseHandleNative, _CloseHandleDart>('CloseHandle');

    final name = _lockName.toNativeUtf16();
    final int handle;
    final int lastError;
    try {
      handle = createEvent(nullptr, 1, 0, name);
      lastError = getLastError();
    } finally {
      calloc.free(name);
    }

    if (handle == 0) {
      return false;
    }

    if (lastError == _errorAlreadyExists) {
      closeHandle(handle);
      return false;
    }

    _handle = handle;
    return true;
  }

  void release() {
    final handle = _handle;
    if (handle == null) {
      return;
    }

    final kernel32 = _kernel32 ??= DynamicLibrary.open('kernel32.dll');
    final closeHandle = kernel32.lookupFunction<_CloseHandleNative, _CloseHandleDart>('CloseHandle');
    closeHandle(handle);
    _handle = null;
  }
}
