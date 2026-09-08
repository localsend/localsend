#!/usr/bin/env python3
"""Re-sign an Xcode-built macOS app without replacing its resolved entitlements."""

import argparse
import plistlib
import subprocess
import tempfile
from pathlib import Path


def entitlements(path):
    result = subprocess.run(
        ["codesign", "--display", "--entitlements", ":-", str(path)],
        check=True,
        capture_output=True,
    )
    return plistlib.loads(result.stdout) if result.stdout.strip() else {}


def check_share_group(app):
    expected = None
    for bundle in (app, app / "Contents/PlugIns/ShareExtension.appex"):
        with (bundle / "Contents/Info.plist").open("rb") as file:
            info = plistlib.load(file)
        prefix = info["AppIdentifierPrefix"]
        group = prefix + "localsend.shared_group"
        permissions = entitlements(bundle)
        if "$" in prefix or not prefix.endswith("."):
            raise ValueError(f"Unresolved AppIdentifierPrefix in {bundle}")
        if b"$(" in plistlib.dumps(permissions) or b"${" in plistlib.dumps(permissions):
            raise ValueError(f"Unresolved build variable in the signed entitlements of {bundle}")
        if not permissions.get("com.apple.security.app-sandbox"):
            raise ValueError(f"App Sandbox is missing from {bundle}")
        if group not in permissions.get("com.apple.security.application-groups", []):
            raise ValueError(f"{bundle} is missing its runtime app group: {group}")
        if expected is not None and group != expected:
            raise ValueError("The app and Share Extension use different app groups")
        expected = group
    print(f"Share app group verified: {expected}", flush=True)


def sign(app, identity):
    # Xcode has already expanded build settings separately for each executable.
    # Capture those entitlements before changing any nested signatures.
    nested = sorted(
        (
            path for path in app.rglob("*")
            if not path.is_symlink()
            and path.suffix in (".app", ".appex", ".xpc", ".framework", ".dylib")
        ),
        key=lambda path: len(path.parts),
        reverse=True,
    )
    targets = nested + [app]
    permissions = {}
    for target in targets:
        # Frameworks and dylibs must not receive the application's entitlements.
        if target.suffix in (".app", ".appex", ".xpc"):
            permissions[target] = entitlements(target)
            # Development signatures can allow debugging; distribution must not.
            permissions[target].pop("com.apple.security.get-task-allow", None)
            encoded = plistlib.dumps(permissions[target])
            if b"$(" in encoded or b"${" in encoded:
                raise ValueError(f"Unresolved build variable in {target}")

    with tempfile.TemporaryDirectory(prefix="localsend-sign-") as directory:
        for index, target in enumerate(targets):
            command = ["codesign", "--force", "--timestamp", "--options", "runtime", "--sign", identity]
            if permissions.get(target):
                file = Path(directory) / f"{index}.entitlements"
                file.write_bytes(plistlib.dumps(permissions[target]))
                command.extend(["--entitlements", str(file)])
            subprocess.run(command + [str(target)], check=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("app", type=Path)
    action = parser.add_mutually_exclusive_group(required=True)
    action.add_argument("--identity", help="Code-signing identity in the keychain")
    action.add_argument("--verify-only", action="store_true")
    args = parser.parse_args()
    app = args.app.resolve()
    # Reject broken inputs before overwriting any signature.
    check_share_group(app)
    if args.identity:
        sign(app, args.identity)
        check_share_group(app)
    subprocess.run(["codesign", "--verify", "--deep", "--strict", str(app)], check=True)


if __name__ == "__main__":
    main()
