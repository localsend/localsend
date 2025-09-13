#include "winrt_ext.h"

#include <appmodel.h>
#include <shlobj.h>
#include <windows.h>
#include <winrt/windows.applicationmodel.activation.h>
#include <winrt/windows.applicationmodel.datatransfer.h>
#include <winrt/windows.applicationmodel.datatransfer.sharetarget.h>
#include <winrt/windows.data.json.h>
#include <winrt/windows.foundation.collections.h>
#include <winrt/windows.foundation.h>
#include <winrt/windows.storage.h>
#include <winrt/windows.storage.streams.h>

using winrt::Windows::ApplicationModel::AppInstance;
using winrt::Windows::ApplicationModel::Activation::ActivationKind;
using winrt::Windows::ApplicationModel::Activation::ProtocolActivatedEventArgs;
using winrt::Windows::ApplicationModel::Activation::
    ShareTargetActivatedEventArgs;
using winrt::Windows::ApplicationModel::DataTransfer::DataPackageView;
using winrt::Windows::ApplicationModel::DataTransfer::DataRequestedEventArgs;
using winrt::Windows::ApplicationModel::DataTransfer::DataTransferManager;
using winrt::Windows::ApplicationModel::DataTransfer::StandardDataFormats;
using winrt::Windows::Data::Json::JsonArray;
using winrt::Windows::Data::Json::JsonObject;
using winrt::Windows::Data::Json::JsonValue;

enum class SharedAttachmentType {
  IMAGE,
  VIDEO,
  AUDIO,
  FILE,
};

bool IsRunningWithIdentity() {
  constexpr SIZE_T kPackageNameMaxLength = 1024;
  UINT32 length = kPackageNameMaxLength;
  wchar_t packageName[kPackageNameMaxLength];
  LONG result = GetCurrentPackageFullName(&length, packageName);

  return (result == ERROR_SUCCESS);
}

winrt::hstring GetSharedMedia() {
  auto args = AppInstance::GetActivatedEventArgs();
  if (args == nullptr)
    return winrt::hstring();
  if (args.Kind() != ActivationKind::ShareTarget)
    return winrt::hstring();
  auto share_target_args = args.as<ShareTargetActivatedEventArgs>();
  auto op = share_target_args.ShareOperation();
  auto data = op.Data();
  JsonObject json;
  if (data.Contains(StandardDataFormats::Text())) {
    auto text = data.GetTextAsync().get();
    json.SetNamedValue(L"content", JsonValue::CreateStringValue(text));
  }
  if (data.Contains(StandardDataFormats::Uri())) {
    auto uri = data.GetUriAsync().get();
    json.SetNamedValue(L"content",
                       JsonValue::CreateStringValue(uri.ToString()));
  }
  if (data.Contains(StandardDataFormats::StorageItems())) {
    JsonArray attachments;
    auto storage_items = data.GetStorageItemsAsync().get();
    for (const auto &item : storage_items) {
      JsonObject attachment;
      attachment.SetNamedValue(L"type", JsonValue::CreateNumberValue(double(
                                            SharedAttachmentType::FILE)));
      attachment.SetNamedValue(L"path",
                               JsonValue::CreateStringValue(item.Path()));
      attachments.Append(attachment);
    }
    json.SetNamedValue(L"attachments", attachments);
  }
  return json.Stringify();
}

std::vector<std::wstring> GetProtocolArgs() {
  std::vector<std::wstring> result;
  auto args = AppInstance::GetActivatedEventArgs();
  if (args == nullptr)
    return result;
  if (args.Kind() != ActivationKind::Protocol)
    return result;
  auto proto_args = args.as<ProtocolActivatedEventArgs>();
  auto uri = proto_args.Uri();
  auto path = uri.Path();
  if (path != L"/addfile" && path != L"/addfile/")
    return result;
  auto decoder = uri.QueryParsed();
  for (const auto &pair : decoder) {
    auto name = pair.Name();
    auto value = pair.Value();
    if (name == L"openwindow") {
      if (value == L"0") {
        result.push_back(L"--hidden");
      }
      continue;
    }
    if (name == L"shareui" && value == L"1") {
      result.push_back(L"--shareui");
      continue;
    }
    std::wstring name_str = name.c_str();
    if (name_str.rfind(L"file", 0) == 0) {
      result.push_back(value.c_str());
    }
  }
  return result;
}

void ShowShareUI(HWND hwnd, const std::vector<std::wstring> &files) {
  if (files.empty())
    return;
  auto interop = winrt::get_activation_factory<DataTransferManager,
                                               IDataTransferManagerInterop>();
  DataTransferManager manager{nullptr};
  interop->GetForWindow(hwnd, winrt::guid_of<DataTransferManager>(),
                        winrt::put_abi(manager));
  auto revoker = manager.DataRequested(
      winrt::auto_revoke,
      [files](DataTransferManager const &, DataRequestedEventArgs const &args) {
        auto deferral = args.Request().GetDeferral();
        auto data = args.Request().Data();
        auto items = winrt::single_threaded_vector<
            winrt::Windows::Storage::IStorageItem>();
        for (const auto &path : files) {
          auto file =
              winrt::Windows::Storage::StorageFile::GetFileFromPathAsync(path)
                  .get();
          items.Append(file);
        }
        data.Properties().Title(L"Share files");
        data.SetStorageItems(items);
        deferral.Complete();
      });
  interop->ShowShareUIForWindow(hwnd);
}
