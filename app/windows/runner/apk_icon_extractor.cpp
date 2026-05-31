#include "apk_icon_extractor.h"

#include <windows.h>

#include <flutter/method_channel.h>
#include <flutter/standard_method_codec.h>

#include <algorithm>
#include <filesystem>
#include <regex>
#include <string>
#include <vector>

#include "miniz/miniz.h"

namespace {

    using flutter::EncodableValue;
    using flutter::MethodCall;
    using flutter::MethodChannel;
    using flutter::MethodResult;

    std::wstring Utf8ToWide(const std::string& str) {
        if (str.empty()) return L"";
        int len = MultiByteToWideChar(CP_UTF8, 0, str.c_str(), -1, nullptr, 0);
        std::wstring result(len - 1, L'\0');
        MultiByteToWideChar(CP_UTF8, 0, str.c_str(), -1, result.data(), len);
        return result;
    }

    std::string WideToUtf8(const std::wstring& str) {
        if (str.empty()) return "";
        int len = WideCharToMultiByte(CP_UTF8, 0, str.c_str(), -1, nullptr, 0, nullptr, nullptr);
        std::string result(len - 1, '\0');
        WideCharToMultiByte(CP_UTF8, 0, str.c_str(), -1, result.data(), len, nullptr, nullptr);
        return result;
    }

    // https://developer.android.com/tools/aapt2
    std::filesystem::path GetAapt2Path() {
        wchar_t exePath[MAX_PATH];
        GetModuleFileNameW(nullptr, exePath, MAX_PATH);
        return std::filesystem::path(exePath).parent_path() / L"aapt2.exe";
    }

    // Primary: use aapt2.exe to find and extract the best icon
    bool ExtractApkIconViaAapt2(
            const std::wstring& apkPath,
            std::vector<uint8_t>& iconBytes) {

        auto aapt2 = GetAapt2Path();
        if (!std::filesystem::exists(aapt2))
            return false;

        std::wstring cmd =
            L"\"" + aapt2.wstring() +
            L"\" dump badging \"" + apkPath + L"\"";

        FILE* pipe = _wpopen(cmd.c_str(), L"r");
        if (!pipe)
            return false;

        std::string badging;
        char buffer[4096];
        while (fgets(buffer, sizeof(buffer), pipe))
            badging += buffer;
        _pclose(pipe);

        // Parse application-icon-<density>:'<path>' entries, pick highest density
        std::regex rx(R"(application-icon-(\d+):'([^']+)')");
        std::sregex_iterator begin(badging.begin(), badging.end(), rx);
        std::sregex_iterator end;

        int bestDensity = -1;
        std::string iconPath;

        for (auto it = begin; it != end; ++it) {
            int density = std::stoi((*it)[1].str());
            if (density > bestDensity) {
                bestDensity = density;
                iconPath = (*it)[2].str();
            }
        }

        if (iconPath.empty())
            return false;

        // Extract icon bytes from the APK (ZIP)
        mz_zip_archive zip{};
        if (!mz_zip_reader_init_file(&zip, WideToUtf8(apkPath).c_str(), 0))
            return false;

        int index = mz_zip_reader_locate_file(&zip, iconPath.c_str(), nullptr, 0);
        if (index < 0) {
            mz_zip_reader_end(&zip);
            return false;
        }

        size_t size = 0;
        void* data = mz_zip_reader_extract_to_heap(&zip, index, &size, 0);
        if (!data) {
            mz_zip_reader_end(&zip);
            return false;
        }

        iconBytes.resize(size);
        memcpy(iconBytes.data(), data, size);
        mz_free(data);
        mz_zip_reader_end(&zip);
        return true;
    }

    std::string ToLower(std::string s) {
        std::transform(s.begin(), s.end(), s.begin(), 
                       [](unsigned char c) { return static_cast<char>(::tolower(c)); });
        return s;
    }

    // Returns a score >= 0 if the ZIP entry looks like an app icon PNG, else -1.
    int ScoreIconEntry(const std::string& entryName) {
        std::string lower = ToLower(entryName);

        if (lower.size() < 4 || lower.compare(lower.size() - 4, 4, ".png") != 0)
            return -1;

        if (lower.find("res/mipmap") == std::string::npos &&
            lower.find("res/drawable") == std::string::npos)
            return -1;

        auto slash = lower.rfind('/');
        std::string fname  = (slash == std::string::npos) ? lower : lower.substr(slash + 1);
        std::string folder = (slash == std::string::npos) ? ""    : lower.substr(0, slash);

        if (fname.find("ic_launcher") == std::string::npos &&
            fname.find("app_icon")    == std::string::npos &&
            fname.find("icon")        == std::string::npos)
            return -1;

        int density = 0;
        if      (folder.find("xxxhdpi") != std::string::npos) density = 640;
        else if (folder.find("xxhdpi")  != std::string::npos) density = 480;
        else if (folder.find("xhdpi")   != std::string::npos) density = 320;
        else if (folder.find("hdpi")    != std::string::npos) density = 240;
        else if (folder.find("mdpi")    != std::string::npos) density = 160;
        else if (folder.find("ldpi")    != std::string::npos) density = 120;

        int namePref = 0;
        if      (fname == "ic_launcher.png") namePref = 20;
        else if (fname == "app_icon.png")    namePref = 15;
        else if (fname.find("round") == std::string::npos) namePref = 5;

        return density * 100 + namePref;
    }

    // Fallback: scan the APK ZIP directly for the best-matching icon PNG
    bool ExtractApkIconFromZip(
            const std::wstring& apkPath,
            std::vector<uint8_t>& iconBytes) {

        mz_zip_archive zip{};
        if (!mz_zip_reader_init_file(&zip, WideToUtf8(apkPath).c_str(), 0))
            return false;

        mz_uint numFiles = mz_zip_reader_get_num_files(&zip);
        int bestIndex = -1;
        int bestScore = -1;

        for (mz_uint i = 0; i < numFiles; ++i) {
            mz_zip_archive_file_stat stat{};
            if (!mz_zip_reader_file_stat(&zip, i, &stat)) continue;
            int score = ScoreIconEntry(stat.m_filename);
            if (score > bestScore) {
                bestScore = score;
                bestIndex = static_cast<int>(i);
            }
        }

        if (bestIndex < 0) {
            mz_zip_reader_end(&zip);
            return false;
        }

        size_t size = 0;
        void* data = mz_zip_reader_extract_to_heap(&zip, bestIndex, &size, 0);
        if (!data) {
            mz_zip_reader_end(&zip);
            return false;
        }

        iconBytes.resize(size);
        memcpy(iconBytes.data(), data, size);
        mz_free(data);
        mz_zip_reader_end(&zip);
        return true;
    }

    bool ExtractApkIcon(
            const std::wstring& apkPath,
            std::vector<uint8_t>& iconBytes) {

        if (ExtractApkIconViaAapt2(apkPath, iconBytes))
            return true;

        return ExtractApkIconFromZip(apkPath, iconBytes);
    }

} // namespace

void RegisterApkIconExtractorChannel(
        flutter::FlutterEngine* engine) {

    auto channel =
        std::make_unique<MethodChannel<EncodableValue>>(
            engine->messenger(),
            "apk_icon_extractor",
            &flutter::StandardMethodCodec::GetInstance());

    channel->SetMethodCallHandler(
        [](const MethodCall<EncodableValue>& call,
           std::unique_ptr<MethodResult<EncodableValue>> result) {

            if (call.method_name() != "extractIcon") {
                result->NotImplemented();
                return;
            }

            const auto* arg = std::get_if<std::string>(call.arguments());
            if (!arg) {
                result->Error("invalid_argument", "Expected APK path");
                return;
            }

            std::vector<uint8_t> bytes;
            if (!ExtractApkIcon(Utf8ToWide(*arg), bytes)) {
                result->Success();
                return;
            }

            result->Success(EncodableValue(bytes));
        });

    static auto* keep_alive = channel.release();
    (void)keep_alive;
}
