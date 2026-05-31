#include "exe_icon_extractor.h"

#include <windows.h>
#include <shobjidl.h>
#include <wincodec.h>

#include <flutter/method_channel.h>
#include <flutter/standard_method_codec.h>

#include <vector>
#include <string>

#pragma comment(lib, "windowscodecs.lib")
#pragma comment(lib, "ole32.lib")
#pragma comment(lib, "shell32.lib")

namespace {

    using flutter::EncodableValue;
    using flutter::MethodCall;
    using flutter::MethodChannel;
    using flutter::MethodResult;

    class ComInit {
    public:
        ComInit() { CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED); }
        ~ComInit() { CoUninitialize(); }
    };


    std::wstring Utf8ToWide(const std::string& str) {
        if (str.empty()) return L"";

        int len = MultiByteToWideChar(CP_UTF8, 0, str.c_str(), -1, nullptr, 0);

        std::wstring result(len - 1, L'\0');

        MultiByteToWideChar(CP_UTF8, 0, str.c_str(), -1, result.data(), len);

        return result;
    }

    bool EncodePng(
            IWICImagingFactory* factory,
            IWICBitmapSource* bitmap,
            std::vector<uint8_t>& out) {

        IStream* stream = nullptr;

        if (FAILED(CreateStreamOnHGlobal(nullptr, TRUE, &stream)))
            return false;

        IWICBitmapEncoder* encoder = nullptr;

        if (FAILED(factory->CreateEncoder(
                GUID_ContainerFormatPng,
                nullptr,
                &encoder))) {
            stream->Release();
            return false;
        }

        encoder->Initialize(stream, WICBitmapEncoderNoCache);

        IWICBitmapFrameEncode* frame = nullptr;
        IPropertyBag2* bag = nullptr;

        encoder->CreateNewFrame(&frame, &bag);

        frame->Initialize(bag);
        frame->WriteSource(bitmap, nullptr);
        frame->Commit();
        encoder->Commit();

        HGLOBAL hGlobal = nullptr;
        GetHGlobalFromStream(stream, &hGlobal);

        SIZE_T size = GlobalSize(hGlobal);
        void* data = GlobalLock(hGlobal);

        out.resize(size);
        memcpy(out.data(), data, size);

        GlobalUnlock(hGlobal);

        frame->Release();
        if (bag) bag->Release();
        encoder->Release();
        stream->Release();

        return true;
    }

    bool ExtractBestIcon(
            const std::wstring& path,
            std::vector<uint8_t>& outPng) {

        HBITMAP hBitmap = nullptr;

        // extract using modern Shell API
        IShellItem* item = nullptr;

        HRESULT hr = SHCreateItemFromParsingName(
                path.c_str(),
                nullptr,
                IID_PPV_ARGS(&item));

        if (SUCCEEDED(hr)) {

            IShellItemImageFactory* factory = nullptr;

            hr = item->QueryInterface(IID_PPV_ARGS(&factory));
            item->Release();

            if (SUCCEEDED(hr) && factory) {

                SIZE size = {256, 256};

                hr = factory->GetImage(
                        size,
                        SIIGBF_RESIZETOFIT |
                        SIIGBF_BIGGERSIZEOK |
                        SIIGBF_ICONONLY,
                        &hBitmap);

                factory->Release();
            }
        }

        if (!hBitmap) {
            SHFILEINFOW info{};

            SHGetFileInfoW(
                    path.c_str(),
                    FILE_ATTRIBUTE_NORMAL,
                    &info,
                    sizeof(info),
                    SHGFI_ICON |
                    SHGFI_LARGEICON);

            hBitmap = (HBITMAP)info.hIcon;
        }

        if (!hBitmap)
            return false;


        IWICImagingFactory* wicFactory = nullptr;

        if (FAILED(CoCreateInstance(
                CLSID_WICImagingFactory,
                nullptr,
                CLSCTX_INPROC_SERVER,
                IID_PPV_ARGS(&wicFactory)))) {
            return false;
        }

        IWICBitmap* bitmap = nullptr;

        HRESULT hr2 = wicFactory->CreateBitmapFromHBITMAP(
                hBitmap,
                nullptr,
                WICBitmapUseAlpha,
                &bitmap);

        if (FAILED(hr2)) {
            wicFactory->Release();
            return false;
        }

        IWICFormatConverter* converter = nullptr;

        HRESULT hr3 = wicFactory->CreateFormatConverter(&converter);

        if (FAILED(hr3)) {
            bitmap->Release();
            wicFactory->Release();
            return false;
        }

        hr3 = converter->Initialize(
                bitmap,
                GUID_WICPixelFormat32bppPBGRA,
                WICBitmapDitherTypeNone,
                nullptr,
                0.0,
                WICBitmapPaletteTypeCustom);

        if (FAILED(hr3)) {
            converter->Release();
            bitmap->Release();
            wicFactory->Release();
            return false;
        }

        // encode converter instead of bitmap
        bool ok = EncodePng(wicFactory, converter, outPng);

        converter->Release();
        bitmap->Release();
        wicFactory->Release();

        if (hBitmap)
            DeleteObject(hBitmap);

        return ok;
    }

} // namespace


void RegisterExeIconExtractorChannel(
        flutter::FlutterEngine* engine) {

    auto channel =
            std::make_unique<
            flutter::MethodChannel<flutter::EncodableValue>>(
                    engine->messenger(),
                            "exe_icon_extractor",
                            &flutter::StandardMethodCodec::GetInstance());

    channel->SetMethodCallHandler(
            [](const MethodCall<EncodableValue>& call,
               std::unique_ptr<MethodResult<EncodableValue>> result) {

                if (call.method_name() != "extractIcon") {
                    result->NotImplemented();
                    return;
                }

                const auto* arg =
                        std::get_if<std::string>(call.arguments());

                if (!arg) {
                    result->Error("bad_args", "Expected file path");
                    return;
                }

                ComInit com;

                std::wstring path = Utf8ToWide(*arg);

                std::vector<uint8_t> png;

                if (!ExtractBestIcon(path, png)) {
                    result->Success();
                    return;
                }

                result->Success(EncodableValue(png));
            });

    static auto* keep_alive = channel.release();
    (void)keep_alive;
}