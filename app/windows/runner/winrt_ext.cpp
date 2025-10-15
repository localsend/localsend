#include "winrt_ext.h"

#include <windows.h>
#include <appmodel.h>
#include <winrt/windows.foundation.h>
#include <winrt/windows.foundation.collections.h>
#include <winrt/windows.storage.h>
#include <winrt/windows.storage.streams.h>
#include <winrt/windows.applicationmodel.activation.h>
#include <winrt/windows.applicationmodel.datatransfer.h>
#include <winrt/windows.applicationmodel.datatransfer.sharetarget.h>
#include <winrt/windows.data.json.h>

using winrt::Windows::ApplicationModel::AppInstance;
using winrt::Windows::ApplicationModel::Activation::ActivationKind;
using winrt::Windows::ApplicationModel::Activation::ShareTargetActivatedEventArgs;
using winrt::Windows::ApplicationModel::DataTransfer::DataPackageView;
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
    json.SetNamedValue(L"content", JsonValue::CreateStringValue(uri.ToString()));
  }
  if (data.Contains(StandardDataFormats::StorageItems())) {
    JsonArray attachments;
    auto storage_items = data.GetStorageItemsAsync().get();
    for (const auto& item : storage_items) {
      JsonObject attachment;
      attachment.SetNamedValue(L"type", JsonValue::CreateNumberValue(double(SharedAttachmentType::FILE)));
      attachment.SetNamedValue(L"path", JsonValue::CreateStringValue(item.Path()));
      attachments.Append(attachment);
    }
    json.SetNamedValue(L"attachments", attachments);
  }
  return json.Stringify();
}