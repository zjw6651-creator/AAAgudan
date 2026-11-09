@echo off
setlocal
set "ENGINE=%USERPROFILE%\Downloads\Godot_v4.7.2-stable_win64.exe"
if defined GODOT_EXE set "ENGINE=%GODOT_EXE%"
if exist "%ENGINE%\Godot_v4.7.2-stable_win64.exe" set "ENGINE=%ENGINE%\Godot_v4.7.2-stable_win64.exe"
if exist "%ENGINE%" (
  start "" "%ENGINE%" --path "%~dp0."
  exit /b 0
)
echo Godot 4.7 was not found. Set GODOT_EXE or import project.godot in Godot.
pause
