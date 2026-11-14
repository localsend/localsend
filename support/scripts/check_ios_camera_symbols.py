#!/usr/bin/env python3
"""Reject unused camera capture code in a built LocalSend iOS app.

Run against the exported .app before upload. This catches camera-capable native
dependencies even when Dart never calls them; it is not a complete privacy scan.
"""

import argparse
import plistlib
import re
import subprocess
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("app", type=Path, help="Exported LocalSend .app bundle")
    app = parser.parse_args().app
    if app.suffix != ".app" or not (app / "Info.plist").is_file():
        parser.error("Expected an exported .app with Info.plist")

    bundles = [app] + sorted(app.rglob("*.framework")) + sorted(app.rglob("*.appex"))
    forbidden = re.compile(r"AVCapture|UIImagePickerController|CMMotionManager")
    failures = []
    checked = 0
    for bundle in bundles:
        info = plistlib.loads((bundle / "Info.plist").read_bytes())
        binary = bundle / info["CFBundleExecutable"]
        result = subprocess.run(["/usr/bin/nm", "-u", str(binary)], capture_output=True, text=True, check=True)
        references = sorted({line.strip() for line in result.stdout.splitlines() if forbidden.search(line)})
        checked += 1
        if references:
            failures.append(f"{binary.relative_to(app)}: " + ", ".join(references))

    if failures:
        raise SystemExit("Unused camera/motion API references found:\n" + "\n".join(failures))
    print(f"No unused camera/motion API references in {checked} app, extension and framework binaries.")


if __name__ == "__main__":
    main()
