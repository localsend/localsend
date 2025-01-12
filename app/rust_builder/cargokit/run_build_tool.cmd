@echo off
setlocal

setlocal ENABLEDELAYEDEXPANSION

SET BASEDIR=%~dp0

if not exist "%CARGOKIT_TOOL_TEMP_DIR%" (
    mkdir "%CARGOKIT_TOOL_TEMP_DIR%"
)
cd /D "%CARGOKIT_TOOL_TEMP_DIR%"

SET BUILD_TOOL_PKG_DIR=%BASEDIR%build_tool
SET DART=%FLUTTER_ROOT%\bin\cache\dart-sdk\bin\dart

set BUILD_TOOL_PKG_DIR_POSIX=%BUILD_TOOL_PKG_DIR:\=/%

(
    echo name: build_tool_runner
    echo version: 1.0.0
    echo publish_to: none
    echo.
    echo environment:
    echo   sdk: '^>=3.0.0 ^<4.0.0'
    echo.
    echo dependencies:
    echo   build_tool:
    echo     path: %BUILD_TOOL_PKG_DIR_POSIX%
) >pubspec.yaml

if not exist bin (
    mkdir bin
)

(
    echo import 'package:build_tool/build_tool.dart' as build_tool;
    echo void main^(List^<String^> args^) ^{
    echo    build_tool.runMain^(args^);
    echo ^}
) >bin\build_tool_runner.dart

SET PRECOMPILED=bin\build_tool_runner.dill

REM To detect changes in package we compare output of DIR /s (recursive)
set PREV_PACKAGE_INFO=.dart_tool\package_info.prev
set CUR_PACKAGE_INFO=.dart_tool\package_info.cur

DIR "%BUILD_TOOL_PKG_DIR%" /s > "%CUR_PACKAGE_INFO%_orig"

REM Last line in dir output is free space on harddrive. That is bound to
REM change between invocation so we need to remove it
(
    Set "Line="
    For /F "UseBackQ Delims=" %%A In ("%CUR_PACKAGE_INFO%_orig") Do (
        SetLocal EnableDelayedExpansion
        If Defined Line Echo !Line!
        EndLocal
        Set "Line=%%A")
) >"%CUR_PACKAGE_INFO%"
DEL "%CUR_PACKAGE_INFO%_orig"

REM Compare current directory listing with previous
FC /B "%CUR_PACKAGE_INFO%" "%PREV_PACKAGE_INFO%" > nul 2>&1

If %ERRORLEVEL% neq 0 (
    REM Changed - copy current to previous and remove precompiled kernel
    if exist "%PREV_PACKAGE_INFO%" (
        DEL "%PREV_PACKAGE_INFO%"
    )
    MOVE /Y "%CUR_PACKAGE_INFO%" "%PREV_PACKAGE_INFO%"
    if exist "%PRECOMPILED%" (
        DEL "%PRECOMPILED%"
    )
)

REM There is no CUR_PACKAGE_INFO it was renamed in previous step to %PREV_PACKAGE_INFO%
REM which means  we need to do pub get and precompile
if not exist "%PRECOMPILED%" (
    echo Running pub get in "%cd%"
    "%DART%" pub get --no-precompile
    "%DART%" compile kernel bin/build_tool_runner.dart
)

"%DART%" "%PRECOMPILED%" %*

REM 253 means invalid snapshot version.
If %ERRORLEVEL% equ 253 (
    "%DART%" pub get --no-precompile
    "%DART%" compile kernel bin/build_tool_runner.dart
    "%DART%" "%PRECOMPILED%" %*
)
