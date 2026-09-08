"""Signing regression tests; run without Apple credentials or third-party packages."""

import contextlib
import copy
import io
import plistlib
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import sign_mac_app


class SigningTests(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory()
        self.addCleanup(temporary.cleanup)
        self.app = Path(temporary.name).resolve() / "LocalSend Test.app"
        self.extension = self.app / "Contents/PlugIns/ShareExtension.appex"
        self.helper = self.app / "Contents/Library/LoginItems/Helper.app"
        self.library = self.extension / "Contents/Frameworks/libswift.dylib"
        self.library.parent.mkdir(parents=True)
        self.library.touch()
        self.framework = self.app / "Contents/Frameworks/Example.framework"
        self.framework.mkdir(parents=True)
        (self.framework.parent / "Alias.framework").symlink_to(self.framework)
        self.helper.mkdir(parents=True)
        self.prefix = "TESTTEAM01."
        self.permissions = {}
        for bundle in (self.app, self.extension):
            self.write_prefix(bundle, self.prefix)
            self.permissions[bundle] = {
                "com.apple.security.app-sandbox": True,
                "com.apple.security.application-groups": [self.prefix + "localsend.shared_group"],
                "com.apple.security.files.user-selected.read-write": True,
            }
        self.permissions[self.app]["com.apple.security.network.server"] = True
        self.permissions[self.app]["com.apple.security.get-task-allow"] = True
        self.permissions[self.helper] = {
            "com.apple.security.app-sandbox": True,
            "com.apple.security.inherit": True,
        }
        self.signatures = []
        self.events = []
        self.fail_signing = False
        codesign = patch.object(sign_mac_app.subprocess, "run", side_effect=self.codesign)
        codesign.start()
        self.addCleanup(codesign.stop)
        self.output = io.StringIO()

    def write_prefix(self, bundle, prefix):
        info = bundle / "Contents/Info.plist"
        info.parent.mkdir(parents=True, exist_ok=True)
        info.write_bytes(plistlib.dumps({"AppIdentifierPrefix": prefix}))

    def codesign(self, command, **kwargs):
        self.assertTrue(kwargs.get("check"))
        target = Path(command[-1])
        if "--display" in command:
            self.events.append(("read", target))
            data = self.permissions.get(target)
            return subprocess.CompletedProcess(command, 0, stdout=plistlib.dumps(data) if data else b"")
        if "--force" in command:
            self.events.append(("sign", target))
            if self.fail_signing:
                raise subprocess.CalledProcessError(1, command)
            permissions = {}
            if "--entitlements" in command:
                file = Path(command[command.index("--entitlements") + 1])
                permissions = plistlib.loads(file.read_bytes())
            self.signatures.append((target, permissions, command))
            self.permissions[target] = permissions
        return subprocess.CompletedProcess(command, 0)

    def run_cli(self, *arguments):
        with patch.object(sys, "argv", ["sign_mac_app.py", str(self.app), *arguments]):
            with contextlib.redirect_stdout(self.output):
                sign_mac_app.main()

    def test_preserves_per_executable_entitlements_and_signs_inside_out(self):
        expected = copy.deepcopy(self.permissions)
        expected[self.app].pop("com.apple.security.get-task-allow")
        self.run_cli("--identity", "Test Identity")
        paths = [target for target, _, _ in self.signatures]
        self.assertEqual(set(paths), {self.app, self.extension, self.helper, self.framework, self.library})
        self.assertEqual(paths[-1], self.app)
        self.assertLess(paths.index(self.library), paths.index(self.extension))
        for target, permissions, command in self.signatures:
            self.assertEqual(permissions, expected.get(target, {}))
            self.assertNotIn("--deep", command)
        first_sign = next(i for i, event in enumerate(self.events) if event[0] == "sign")
        for bundle in (self.app, self.extension, self.helper):
            self.assertIn(("read", bundle), self.events[:first_sign])

    def test_rejects_literal_xcode_variable_before_signing(self):
        for bundle in (self.app, self.extension):
            for placeholder in ("$(AppIdentifierPrefix)", "${TeamIdentifierPrefix}"):
                with self.subTest(bundle=bundle.name, placeholder=placeholder):
                    original = copy.deepcopy(self.permissions[bundle])
                    self.permissions[bundle]["com.apple.security.application-groups"] = [
                        placeholder + "localsend.shared_group"
                    ]
                    with self.assertRaisesRegex(ValueError, "Unresolved build variable"):
                        self.run_cli("--identity", "Test Identity")
                    self.permissions[bundle] = original
        self.assertEqual(self.signatures, [])

    def test_rejects_missing_runtime_group(self):
        self.permissions[self.extension]["com.apple.security.application-groups"] = ["OTHER.group"]
        with self.assertRaisesRegex(ValueError, "missing its runtime app group"):
            self.run_cli("--identity", "Test Identity")
        self.assertEqual(self.signatures, [])

    def test_rejects_different_runtime_groups(self):
        self.write_prefix(self.extension, "OTHERTEAM1.")
        self.permissions[self.extension]["com.apple.security.application-groups"] = [
            "OTHERTEAM1.localsend.shared_group"
        ]
        with self.assertRaisesRegex(ValueError, "different app groups"):
            self.run_cli("--identity", "Test Identity")
        self.assertEqual(self.signatures, [])

    def test_rejects_unresolved_info_prefix(self):
        self.write_prefix(self.app, "$(AppIdentifierPrefix)")
        with self.assertRaisesRegex(ValueError, "Unresolved AppIdentifierPrefix"):
            self.run_cli("--identity", "Test Identity")
        self.assertEqual(self.signatures, [])

    def test_rejects_missing_sandbox(self):
        self.permissions[self.extension].pop("com.apple.security.app-sandbox")
        with self.assertRaisesRegex(ValueError, "App Sandbox is missing"):
            self.run_cli("--identity", "Test Identity")
        self.assertEqual(self.signatures, [])

    def test_verify_only_does_not_sign(self):
        self.run_cli("--verify-only")
        self.assertEqual(self.signatures, [])
        sign_mac_app.subprocess.run.assert_any_call(
            ["codesign", "--verify", "--deep", "--strict", str(self.app)], check=True
        )

    def test_signing_failure_stops_before_signing_the_app(self):
        self.fail_signing = True
        with self.assertRaises(subprocess.CalledProcessError):
            self.run_cli("--identity", "Test Identity")
        self.assertNotIn(("sign", self.app), self.events)


if __name__ == "__main__":
    unittest.main()
