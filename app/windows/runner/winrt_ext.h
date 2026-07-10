#ifndef RUNNER_WINRT_EXT_H_
#define RUNNER_WINRT_EXT_H_

#include <string>
#include <vector>
#include <windows.h>
#include <winrt/base.h>

bool IsRunningWithIdentity();
winrt::hstring GetSharedMedia();
std::vector<std::wstring> GetProtocolArgs();

#endif // RUNNER_WINRT_EXT_H_
