@echo off
setlocal
echo ==============================================
echo Building Sayo_CLI for Windows (Static Link)...
echo ==============================================

where g++ >nul 2>nul
if %errorlevel% neq 0 (
    if exist "%LOCALAPPDATA%\Microsoft\WinGet\Packages\MartinStorsjo.LLVM-MinGW.UCRT_Microsoft.Winget.Source_8wekyb3d8bbwe\llvm-mingw-20260616-ucrt-x86_64\bin" (
        set "PATH=%LOCALAPPDATA%\Microsoft\WinGet\Packages\MartinStorsjo.LLVM-MinGW.UCRT_Microsoft.Winget.Source_8wekyb3d8bbwe\llvm-mingw-20260616-ucrt-x86_64\bin;%PATH%"
    )
)

g++ -static -std=c++17 -DWIN32 -D_WIN32 -O2 -I./inc -I./hidapi/hidapi -I./jsoncpp/include main.cpp o2_protocol.cpp src/http.cpp src/tools.cpp hidapi/windows/hid.c jsoncpp/src/lib_json/json_reader.cpp jsoncpp/src/lib_json/json_value.cpp jsoncpp/src/lib_json/json_writer.cpp -lws2_32 -lsetupapi -lhid -lwininet -lpthread -o Sayo_CLI.exe

if %errorlevel% equ 0 (
    echo.
    echo ==============================================
    echo Sayo_CLI.exe built successfully!
    echo ==============================================
) else (
    echo.
    echo ==============================================
    echo Build failed!
    echo ==============================================
)
pause
