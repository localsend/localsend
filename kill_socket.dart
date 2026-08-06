import 'dart:io';

/// Automatic Socket Killer
///
/// Kills the process occupying a given port (when [kill] is passed) and
/// then finds / returns a port that is not currently in use.
///
/// Usage:
///   dart support/scripts/kill_socket.dart [port] [--kill] [--free]
///
/// Options:
///   port   The port to check / kill (default: 53317, the LocalSend default).
///   --kill Kill the process occupying the port before searching for a free one.
///   --free Skip killing and just print an available port.
///
/// Examples:
///   dart support/scripts/kill_socket.dart
///   dart support/scripts/kill_socket.dart 8080 --kill
///   dart support/scripts/kill_socket.dart --free
void main(List<String> arguments) {
  final port = _parsePort(arguments);
  final shouldKill = arguments.contains('--kill');
  final onlyFree = arguments.contains('--free');

  print('=== Automatic Socket Killer ===');
  print('Target port: $port');
  print('Kill on port: $shouldKill');
  print('Only find free port: $onlyFree');
  print('');

  if (!onlyFree) {
    final pids = _findPidsOnPort(port);
    if (pids.isEmpty) {
      print('No process found on port $port.');
    } else {
      print('Process(es) on port $port: ${pids.join(', ')}');
      if (shouldKill) {
        for (final pid in pids) {
          _killProcess(pid, port);
        }
      }
    }
  }

  // Find and report a free port
  final freePort = _findFreePort();
  print('');
  print('Available port: $freePort');
}

/// Parses the port from command-line arguments.
/// Looks for the first integer argument; defaults to 53317 (LocalSend default).
int _parsePort(List<String> arguments) {
  for (final arg in arguments) {
    final n = int.tryParse(arg);
    if (n != null && n > 0 && n <= 65535) {
      return n;
    }
  }
  return 53317; // defaultPort from packages/localsend_isolates/lib/constants.dart
}

/// Finds all PIDs listening on the given [port].
/// Uses platform-specific commands: lsof on Unix, netstat on Windows.
List<int> _findPidsOnPort(int port) {
  if (Platform.isWindows) {
    return _findPidsWindows(port);
  } else {
    return _findPidsUnix(port);
  }
}

/// Finds PIDs on a port using the `lsof` command (Linux / macOS).
List<int> _findPidsUnix(int port) {
  try {
    final result = Process.runSync('lsof', ['-t', '-i', ':$port']);
    if (result.exitCode == 0) {
      final stdout = result.stdout.toString().trim();
      if (stdout.isNotEmpty) {
        return stdout
            .split('\n')
            .map((l) => l.trim())
            .where((l) => l.isNotEmpty)
            .map((l) => int.tryParse(l))
            .where((n) => n != null)
            .cast<int>()
            .toList();
      }
    }
  } catch (e) {
    print('lsof not available, falling back to ss/netstat');
    return _findPidsUnixFallback(port);
  }
  return [];
}

/// Fallback: uses `ss` or `netstat` when `lsof` is missing.
List<int> _findPidsUnixFallback(int port) {
  // Try ss first
  try {
    final result = Process.runSync('ss', ['-tlnp', "sport = :$port"]);
    if (result.exitCode == 0) {
      return _parsePidsFromNetstatOutput(result.stdout.toString(), port);
    }
  } catch (_) {}

  // Fall back to netstat
  try {
    final result = Process.runSync('netstat', ['-tlnp']);
    if (result.exitCode == 0) {
      return _parsePidsFromNetstatOutput(result.stdout.toString(), port);
    }
  } catch (e) {
    print('Error: could not determine PIDs on port $port (lsof/ss/netstat unavailable)');
  }
  return [];
}

/// Parses PID numbers from `netstat`/`ss` output lines that mention [port].
List<int> _parsePidsFromNetstatOutput(String output, int port) {
  final pids = <int>[];
  for (final line in output.split('\n')) {
    if (!line.contains(':$port')) continue;
    final match = RegExp(r'pid=(\d+)').firstMatch(line);
    if (match != null) {
      final pid = int.tryParse(match.group(1)!);
      if (pid != null && !pids.contains(pid)) {
        pids.add(pid);
      }
    }
  }
  return pids;
}

/// Finds PIDs on a port using `netstat` + `findstr` (Windows).
List<int> _findPidsWindows(int port) {
  try {
    final result = Process.runSync('cmd', ['/c', 'netstat -ano | findstr :$port']);
    if (result.exitCode == 0) {
      final pids = <int>[];
      final lines = result.stdout.toString().trim().split('\n');
      for (final line in lines) {
        if (!line.contains(':$port')) continue;
        final parts = line.trim().split(RegExp(r'\s+'));
        if (parts.isNotEmpty) {
          final pid = int.tryParse(parts.last);
          if (pid != null && pid != 0 && !pids.contains(pid)) {
            pids.add(pid);
          }
        }
      }
      return pids;
    }
  } catch (e) {
    print('Error: could not determine PIDs on port $port');
  }
  return [];
}

/// Kills the process with [pid] and reports the result.
void _killProcess(int pid, int port) {
  print('Killing PID $pid (port $port)...');
  try {
    if (Platform.isWindows) {
      Process.runSync('taskkill', ['/PID', pid.toString(), '/F']);
    } else {
      Process.runSync('kill', ['-9', pid.toString()]);
    }
    print('  Successfully killed PID $pid');
  } catch (e) {
    print('  Failed to kill PID $pid: $e');
  }

  // Verify the port is now free
  sleep(Duration(milliseconds: 500));
  final remaining = _findPidsOnPort(port);
  if (remaining.isEmpty) {
    print('Port $port is now free.');
  } else {
    print('Warning: port $port is still in use by ${remaining.join(', ')}');
  }
}

/// Finds and returns a TCP port that is not currently in use.
/// Binds to port 0 to let the OS assign an ephemeral port, then releases it.
int _findFreePort() {
  final socket = ServerSocket.bind(InternetAddress.anyIPv4, 0);
  final port = socket.port;
  socket.close();
  // Give the OS a moment to release the port
  sleep(Duration(milliseconds: 100));
  return port;
}
