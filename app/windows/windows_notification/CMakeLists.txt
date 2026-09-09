# Windows Toast helper shipped as a separate FFI DLL (loaded by Dart via
# dart:ffi). Purely additive; not linked into the runner executable.
add_library(localsend_windows_notify SHARED windows_notification.cpp)

target_compile_features(localsend_windows_notify PRIVATE cxx_std_20)
target_compile_definitions(localsend_windows_notify PRIVATE "UNICODE" "_UNICODE")
target_link_libraries(localsend_windows_notify PRIVATE "runtimeobject.lib" "propsys.lib")

# Ship next to localsend_app.exe so Dart's DynamicLibrary.open can find it.
install(TARGETS localsend_windows_notify
  RUNTIME DESTINATION "${CMAKE_INSTALL_PREFIX}"
  LIBRARY DESTINATION "${CMAKE_INSTALL_PREFIX}"
  COMPONENT Runtime)
