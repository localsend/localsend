// Windows Toast notification helper (WinRT), shipped as a standalone FFI DLL.
//
// Loaded dynamically by app/lib/util/native/windows_notification.dart via
// dart:ffi (no MethodChannel, no modification of the Flutter runner).
// Pure additive: this DLL is not referenced by the official executable.
//
// Design notes (see .docs/2026-09-09_Windows弹窗通知模块):
// - Toast activation is NOT handled via COM here: clicking a toast launches
//   the shortcut target (the LocalSend exe); the app's existing single
//   instance handshake brings the window to front and Dart routes the action.
// - Unpackaged (non-MSIX) apps need a Start Menu shortcut carrying an
//   AppUserModelID before ToastNotificationManager can create a notifier.
//
// Debugging: every call writes a line to %TEMP%\localsend_windows_notify.log.
#ifndef WINVER
#define WINVER 0x0A00
#endif
#ifndef _WIN32_WINNT
#define _WIN32_WINNT 0x0A00
#endif
#include <windows.h>

#include <winrt/base.h>
#include <winrt/Windows.Data.Xml.Dom.h>
#include <winrt/Windows.Foundation.h>
#include <winrt/Windows.UI.Notifications.h>

#include <propkey.h>
#include <propsys.h>
#include <shlobj.h>
#include <shobjidl.h>

#include <cstdarg>
#include <cstdio>
#include <cwchar>
#include <string>

namespace {

constexpr wchar_t kLnkFileName[] = L"LocalSend Notification.lnk";
constexpr wchar_t kLnkName[] = L"LocalSend Notification";

void NotifyLog(const wchar_t* format, ...) {
  wchar_t buf[1024];
  va_list args;
  va_start(args, format);
  vswprintf_s(buf, 1024, format, args);
  va_end(args);
  wchar_t temp_dir[MAX_PATH]{};
  if (GetTempPathW(MAX_PATH, temp_dir) == 0) {
    return;
  }
  std::wstring path(temp_dir);
  if (!path.empty() && path.back() != L'\\') {
    path += L'\\';
  }
  path += L"localsend_windows_notify.log";
  FILE* f = nullptr;
  if (_wfopen_s(&f, path.c_str(), L"a, ccs=UTF-8") == 0 && f != nullptr) {
    fwprintf(f, L"%s\n", buf);
    fclose(f);
  }
}

std::wstring XmlEscape(const std::wstring& in) {
  std::wstring out;
  out.reserve(in.size() + 16);
  for (const wchar_t c : in) {
    switch (c) {
      case L'&': out += L"&amp;"; break;
      case L'<': out += L"&lt;"; break;
      case L'>': out += L"&gt;"; break;
      case L'"': out += L"&quot;"; break;
      case L'\'': out += L"&apos;"; break;
      default: out += c; break;
    }
  }
  return out;
}

std::wstring StartMenuLnkPath() {
  PWSTR programs = nullptr;
  if (FAILED(SHGetKnownFolderPath(FOLDERID_Programs, 0, nullptr, &programs))) {
    return std::wstring();
  }
  std::wstring path(programs);
  CoTaskMemFree(programs);
  if (!path.empty() && path.back() != L'\\') {
    path += L'\\';
  }
  path += kLnkFileName;
  return path;
}

}  // namespace

extern "C" {

// Returns 1 if the current Windows build supports toast notifications (>= 10.0.10240).
__declspec(dllexport) int ls_toast_supported(void) noexcept {
  HMODULE ntdll = GetModuleHandleW(L"ntdll.dll");
  if (ntdll == nullptr) {
    NotifyLog(L"supported: ntdll missing");
    return 0;
  }
  typedef LONG(WINAPI* RtlGetVersionFn)(PRTL_OSVERSIONINFOW);
  auto fn = reinterpret_cast<RtlGetVersionFn>(GetProcAddress(ntdll, "RtlGetVersion"));
  if (fn == nullptr) {
    NotifyLog(L"supported: RtlGetVersion missing");
    return 0;
  }
  RTL_OSVERSIONINFOW info{};
  info.dwOSVersionInfoSize = sizeof(info);
  if (fn(&info) != 0) {
    return 0;
  }
  const int supported = (info.dwMajorVersion > 10 || (info.dwMajorVersion == 10 && info.dwBuildNumber >= 10240)) ? 1 : 0;
  NotifyLog(L"supported=%d (win %u.%u.%u)", supported, info.dwMajorVersion, info.dwMinorVersion, info.dwBuildNumber);
  return supported;
}

// Registers a Start Menu shortcut for the current executable carrying the
// given AppUserModelID, so that unpackaged toast notifications can be shown
// and their click can activate the app. Re-runs overwrite the shortcut.
// Returns 0 on success, non-zero on failure.
__declspec(dllexport) int ls_toast_ensure_identity(const wchar_t* app_id) noexcept {
  NotifyLog(L"ensure_identity(app_id=%s)", app_id != nullptr ? app_id : L"(null)");
  if (app_id == nullptr || app_id[0] == L'\0') {
    NotifyLog(L"ensure_identity: bad app_id");
    return -1;
  }
  const std::wstring lnk_path = StartMenuLnkPath();
  if (lnk_path.empty()) {
    NotifyLog(L"ensure_identity: cannot resolve Start Menu path");
    return -2;
  }
  NotifyLog(L"ensure_identity: lnk=%s", lnk_path.c_str());

  wchar_t exe_path[MAX_PATH]{};
  if (GetModuleFileNameW(nullptr, exe_path, MAX_PATH) == 0) {
    NotifyLog(L"ensure_identity: GetModuleFileName failed");
    return -3;
  }
  NotifyLog(L"ensure_identity: exe=%s", exe_path);

  winrt::com_ptr<IShellLinkW> link;
  HRESULT hr = CoCreateInstance(CLSID_ShellLink, nullptr, CLSCTX_INPROC_SERVER,
                                IID_PPV_ARGS(link.put()));
  if (FAILED(hr)) {
    NotifyLog(L"ensure_identity: CoCreate ShellLink hr=0x%08X", hr);
    return -4;
  }
  if (FAILED(link->SetPath(exe_path))) {
    NotifyLog(L"ensure_identity: SetPath failed");
    return -5;
  }
  if (FAILED(link->SetDescription(kLnkName))) {
    NotifyLog(L"ensure_identity: SetDescription failed");
    return -6;
  }
  // Use the executable's own icon (LocalSend logo) for the shortcut; unpackaged
  // toast notifications display the shortcut icon as the app icon.
  if (FAILED(link->SetIconLocation(exe_path, 0))) {
    NotifyLog(L"ensure_identity: SetIconLocation failed");
    return -7;
  }
  auto persist = link.as<IPersistFile>();
  hr = persist->Save(lnk_path.c_str(), TRUE);
  if (FAILED(hr)) {
    NotifyLog(L"ensure_identity: Save lnk hr=0x%08X", hr);
    return -8;
  }

  winrt::com_ptr<IShellItem2> shell_item;
  hr = SHCreateItemFromParsingName(lnk_path.c_str(), nullptr, IID_PPV_ARGS(shell_item.put()));
  if (FAILED(hr)) {
    NotifyLog(L"ensure_identity: SHCreateItem hr=0x%08X", hr);
    return -9;
  }
  winrt::com_ptr<IPropertyStore> store;
  hr = shell_item->GetPropertyStore(GPS_READWRITE, IID_PPV_ARGS(store.put()));
  if (FAILED(hr)) {
    NotifyLog(L"ensure_identity: GetPropertyStore hr=0x%08X", hr);
    return -10;
  }
  PROPVARIANT value{};
  value.vt = VT_LPWSTR;
  value.pwszVal = const_cast<wchar_t*>(app_id);
  hr = store->SetValue(PKEY_AppUserModel_ID, value);
  if (FAILED(hr)) {
    NotifyLog(L"ensure_identity: SetValue hr=0x%08X", hr);
    return -11;
  }
  hr = store->Commit();
  if (FAILED(hr)) {
    NotifyLog(L"ensure_identity: Commit hr=0x%08X", hr);
    return -12;
  }

  // Read back to confirm the AUMID really persisted on the shortcut.
  winrt::com_ptr<IPropertyStore> verify_store;
  if (SUCCEEDED(shell_item->GetPropertyStore(GPS_READWRITE, IID_PPV_ARGS(verify_store.put())))) {
    PROPVARIANT got{};
    if (SUCCEEDED(verify_store->GetValue(PKEY_AppUserModel_ID, &got)) && got.vt == VT_LPWSTR) {
      NotifyLog(L"ensure_identity: AUMID readback '%s' (expect '%s')",
                got.pwszVal != nullptr ? got.pwszVal : L"", app_id);
      PropVariantClear(&got);
    } else {
      NotifyLog(L"ensure_identity: AUMID readback MISSING");
    }
  } else {
    NotifyLog(L"ensure_identity: AUMID verify store unavailable");
  }

  // Desktop (unpackaged) apps must declare the explicit AppUserModelID for the
  // current process; otherwise toast notifications are silently not shown.
  hr = SetCurrentProcessExplicitAppUserModelID(app_id);
  NotifyLog(L"ensure_identity: SetCurrentProcessExplicitAppUserModelID hr=0x%08X", hr);

  // Register a display name for the AUMID so the toast header shows "LocalSend"
  // instead of the shortcut file name ("LocalSend Notification").
  HKEY aumid_key = nullptr;
  const std::wstring aumid_reg_path = L"Software\\Classes\\AppUserModelId\\" + std::wstring(app_id);
  LSTATUS rs = RegCreateKeyExW(HKEY_CURRENT_USER, aumid_reg_path.c_str(), 0, nullptr, 0,
                               KEY_SET_VALUE, nullptr, &aumid_key, nullptr);
  if (rs == ERROR_SUCCESS && aumid_key != nullptr) {
    const wchar_t display_name[] = L"LocalSend";
    rs = RegSetValueExW(aumid_key, L"DisplayName", 0, REG_SZ,
                        reinterpret_cast<const BYTE*>(display_name),
                        static_cast<DWORD>((wcslen(display_name) + 1) * sizeof(wchar_t)));
    RegCloseKey(aumid_key);
    NotifyLog(L"ensure_identity: AUMID DisplayName rs=%ld", static_cast<long>(rs));
  } else {
    NotifyLog(L"ensure_identity: AUMID registry create failed rs=%ld", static_cast<long>(rs));
  }

  return 0;
}

// Shows a toast notification with the given title/body. `tag` may be nullptr.
// Returns 0 on success; -1 invalid args; -2 notifier/identity; -3 other;
// -(100/200 + HRESULT low bits) on WinRT exceptions.
__declspec(dllexport) int ls_toast_show(const wchar_t* app_id, const wchar_t* title,
                                        const wchar_t* body, const wchar_t* tag) noexcept {
  NotifyLog(L"show(app_id=%s, title=%s, tag=%s)", app_id != nullptr ? app_id : L"(null)",
            title != nullptr ? title : L"(null)", tag != nullptr ? tag : L"(null)");
  if (app_id == nullptr || app_id[0] == L'\0' || title == nullptr || body == nullptr) {
    NotifyLog(L"show: invalid args");
    return -1;
  }
  try {
    // Make sure the current thread has a COM apartment; harmless if the thread
    // was already initialized (e.g. STA on the UI thread of a test host).
    try {
      winrt::init_apartment(winrt::apartment_type::multi_threaded);
    } catch (...) {
      // Already initialized on this thread.
    }

    const std::wstring xml =
        L"<toast><visual><binding template=\"ToastGeneric\"><text>" +
        XmlEscape(title) + L"</text><text>" + XmlEscape(body) +
        L"</text></binding></visual></toast>";

    winrt::Windows::Data::Xml::Dom::XmlDocument doc;
    doc.LoadXml(xml);
    winrt::Windows::UI::Notifications::ToastNotification toast(doc);
    if (tag != nullptr && tag[0] != L'\0') {
      toast.Tag(winrt::hstring(tag));
    }

    try {
      auto notifier = winrt::Windows::UI::Notifications::ToastNotificationManager::CreateToastNotifier(
          winrt::hstring(app_id));
      NotifyLog(L"show: notifier created, calling Show()");
      notifier.Show(toast);
      NotifyLog(L"show: Show() returned without exception");
      return 0;
    } catch (winrt::hresult_error const& e) {
      NotifyLog(L"show: notifier/Show hr=0x%08X", e.code());
      return -(200 + (e.code() & 0x7FFF));  // ~ -20105 = E_ILLEGAL_METHOD_CALL etc.
    } catch (...) {
      NotifyLog(L"show: notifier/Show unknown exception");
      return -2;
    }
  } catch (winrt::hresult_error const& e) {
    NotifyLog(L"show: WinRT hr=0x%08X", e.code());
    return -(100 + (e.code() & 0x7FFF));  // carries HRESULT low bits for debugging.
  } catch (...) {
    NotifyLog(L"show: unknown exception");
    return -3;
  }
}

}  // extern "C"
