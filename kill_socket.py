#!/usr/bin/env python3
"""
Automatic Socket Killer
=======================

Kills the process occupying a given port (when --kill is passed) and
then finds / returns a port that is not currently in use.

Usage:
  python3 kill_socket.py [port] [--kill] [--free] [--help]

Options:
  port    The port to check / kill.  Default: 53317 (LocalSend default).
  --kill  Kill the process occupying the port before searching for a free one.
  --free  Skip killing and just print an available port.
  --help  Show this help message.

Examples:
  python3 kill_socket.py
  python3 kill_socket.py 8080 --kill
  python3 kill_socket.py --free

Cross-platform: works on Linux, macOS, and Windows (requires Python 3.7+).
"""

import argparse
import os
import platform
import re
import signal
import socket
import subprocess
import sys
import time

# Default port — matches packages/localsend_isolates/lib/constants.dart
DEFAULT_PORT = 53317


def find_pids_on_port(port: int) -> list[int]:
    """Find all PIDs listening on *port* using platform-specific commands."""
    system = platform.system()
    if system == "Windows":
        return _find_pids_windows(port)
    else:
        return _find_pids_unix(port, system)


def _find_pids_unix(port: int, system: str) -> list[int]:
    """Uses lsof on Unix, falls back to ss / netstat."""
    # Try lsof first (most reliable on Linux/macOS)
    try:
        result = subprocess.run(
            ["lsof", "-t", "-i", f":{port}"],
            capture_output=True, text=True, timeout=10,
        )
        if result.returncode == 0 and result.stdout.strip():
            return [int(pid) for pid in result.stdout.strip().split("\n") if pid.strip().isdigit()]
    except (FileNotFoundError, subprocess.TimeoutExpired):
        pass

    # Fallback: ss (Linux)
    try:
        result = subprocess.run(
            ["ss", "-tlnp", f"sport = :{port}"],
            capture_output=True, text=True, timeout=10,
        )
        return _parse_ss_output(result.stdout, port)
    except (FileNotFoundError, subprocess.TimeoutExpired):
        pass

    # Fallback: netstat (macOS, some Linux)
    try:
        result = subprocess.run(
            ["netstat", "-tlnp"],
            capture_output=True, text=True, timeout=10,
        )
        return _parse_netstat_output(result.stdout, port)
    except (FileNotFoundError, subprocess.TimeoutExpired):
        pass

    print(f"  Could not determine PIDs on port {port} "
          f"(lsof/ss/netstat not available on {system})")
    return []


def _parse_ss_output(output: str, port: int) -> list[int]:
    pids = []
    for line in output.split("\n"):
        if f":{port}" not in line:
            continue
        match = re.search(r"pid=(\d+)", line)
        if match:
            pid = int(match.group(1))
            if pid not in pids:
                pids.append(pid)
    return pids


def _parse_netstat_output(output: str, port: int) -> list[int]:
    pids = []
    for line in output.split("\n"):
        if f":{port}" not in line:
            continue
        # macOS netstat: last column is "pid/command"
        match = re.search(r"(\d+)/", line)
        if match:
            pid = int(match.group(1))
            if pid not in pids:
                pids.append(pid)
    return pids


def _find_pids_windows(port: int) -> list[int]:
    """Uses netstat + findstr on Windows."""
    try:
        result = subprocess.run(
            ["cmd", "/c", f"netstat -ano | findstr :{port}"],
            capture_output=True, text=True, timeout=10,
        )
        pids = []
        for line in result.stdout.strip().split("\n"):
            if f":{port}" not in line:
                continue
            parts = line.strip().split()
            if parts:
                pid_str = parts[-1]
                if pid_str.isdigit():
                    pid = int(pid_str)
                    if pid != 0 and pid not in pids:
                        pids.append(pid)
        return pids
    except (FileNotFoundError, subprocess.TimeoutExpired):
        print("  netstat not available")
        return []


def kill_process(pid: int, port: int) -> bool:
    """Kill the process with *pid*. Returns True on success."""
    print(f"  Killing PID {pid} (port {port})...")
    try:
        os.kill(pid, signal.SIGKILL)
        print(f"  Successfully killed PID {pid}")
        return True
    except ProcessLookupError:
        print(f"  PID {pid} no longer exists")
        return True
    except PermissionError:
        print(f"  Permission denied to kill PID {pid} — try running as administrator/sudo")
        return False
    except OSError as e:
        print(f"  Failed to kill PID {pid}: {e}")
        return False


def find_free_port() -> int:
    """Bind to port 0 to let the OS assign an ephemeral free port, then release it."""
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    sock.bind(("", 0))
    port = sock.getsockname()[1]
    sock.close()
    # Give the OS a moment to release the port
    time.sleep(0.1)
    return port


def verify_port_free(port: int) -> bool:
    """Check if *port* is bindable (i.e., free)."""
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.bind(("", port))
        sock.close()
        return True
    except OSError:
        return False


def main():
    parser = argparse.ArgumentParser(
        description="Automatic Socket Killer — kill a process on a port, then find a free port.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument(
        "port", nargs="?", type=int, default=DEFAULT_PORT,
        help=f"Port to check / kill (default: {DEFAULT_PORT})",
    )
    parser.add_argument("--kill", action="store_true",
                        help="Kill the process occupying the port before searching for a free one.")
    parser.add_argument("--free", action="store_true",
                        help="Skip killing and just print an available port.")
    args = parser.parse_args()

    port = args.port
    if not (1 <= port <= 65535):
        print(f"Error: port must be between 1 and 65535, got {port}")
        sys.exit(1)

    print("=== Automatic Socket Killer ===")
    print(f"Target port:  {port}")
    print(f"Kill on port: {args.kill}")
    print(f"Only free:    {args.free}")
    print()

    if not args.free:
        pids = find_pids_on_port(port)
        if not pids:
            print(f"No process found on port {port}.")
        else:
            print(f"Process(es) on port {port}: {', '.join(str(p) for p in pids)}")
            if args.kill:
                for pid in pids:
                    kill_process(pid, port)
                time.sleep(0.5)
                remaining = find_pids_on_port(port)
                if not remaining:
                    print(f"Port {port} is now free.")
                else:
                    print(f"Warning: port {port} still in use by {remaining}")

    free_port = find_free_port()
    print()
    print(f"Available port: {free_port}")


if __name__ == "__main__":
    main()
