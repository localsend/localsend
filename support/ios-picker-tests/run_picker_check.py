"""Drive the real iOS system folder picker while Flutter owns the test app."""
import os
from pathlib import Path
import signal
import subprocess
import sys
import time

root = Path(__file__).resolve().parents[2]
device = os.environ['IOS_DEVICE_ID']
flutter = Path(os.environ['FLUTTER_SDK']) / 'bin/flutter'
derived = Path(os.environ['PICKER_DERIVED_DATA'])
logs = root / '.agent-learning/ios-picker'
logs.mkdir(parents=True, exist_ok=True)
reuse = '--reuse' in sys.argv
suffix = 'reuse' if reuse else 'selection'
native_log = logs / (suffix + '-native.log')
ui_log = logs / (suffix + '-ui.log')
command = [str(flutter), 'test', '--no-pub', '--no-uninstall', '--concurrency=1', 'integration_test/native_transfer_test.dart', '-d', device]
if reuse:
    command.append('--dart-define=REUSE_IOS_FOLDER=true')
if not reuse:
    with (logs / 'ui-build.log').open('w') as build_log:
        subprocess.run(['xcodebuild', 'build-for-testing', '-project', str(root / 'support/ios-picker-tests/PickerDriver.xcodeproj'), '-scheme', 'PickerDriver', '-destination', 'platform=iOS Simulator,id=' + device, '-derivedDataPath', str(derived), '-jobs', '2'], stdout=build_log, stderr=subprocess.STDOUT, check=True, timeout=180)
with native_log.open('w') as stream:
    process = subprocess.Popen(command, cwd=root / 'app', stdout=stream, stderr=subprocess.STDOUT, start_new_session=True)
    try:
        if not reuse:
            deadline = time.monotonic() + 180
            while 'iOS chosen destination and whole-folder picker' not in native_log.read_text():
                if process.poll() is not None or time.monotonic() > deadline:
                    raise RuntimeError('Native folder fixture did not start: ' + native_log.read_text()[-3000:])
                time.sleep(1)
            runs = list((derived / 'Build/Products').glob('PickerDriver_*.xctestrun'))
            if len(runs) != 1:
                raise RuntimeError('Expected exactly one built UI test configuration')
            with ui_log.open('w') as ui:
                result = subprocess.run(['xcodebuild', 'test-without-building', '-xctestrun', str(runs[0]), '-destination', 'platform=iOS Simulator,id=' + device, '-parallel-testing-enabled', 'NO', '-jobs', '1'], stdout=ui, stderr=subprocess.STDOUT, timeout=150)
            if result.returncode:
                raise RuntimeError('System picker automation failed: ' + str(ui_log))
        result = process.wait(timeout=180)
        native = native_log.read_text()
        if result or 'IOS_FOLDER_PICKER_CHECKS_PASSED' not in native or 'All tests passed!' not in native:
            raise RuntimeError('Native folder assertions failed: ' + native[-4000:])
        print(native[-1800:])
    finally:
        if process.poll() is None:
            os.killpg(process.pid, signal.SIGINT)
            try:
                process.wait(timeout=15)
            except subprocess.TimeoutExpired:
                os.killpg(process.pid, signal.SIGKILL)
                process.wait()
