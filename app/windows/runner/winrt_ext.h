#ifndef RUNNER_WINRT_EXT_H_
#define RUNNER_WINRT_EXT_H_ 

#include <winrt/base.h>

bool IsRunningWithIdentity();
winrt::hstring GetSharedMedia();

#endif  // RUNNER_WINRT_EXT_H_
