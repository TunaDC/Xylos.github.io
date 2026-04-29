@echo off

echo installing xylos
set "url=https://github.com/TunaDC/Xylos.github.io/blob/main/photo_2026-04-29_18-38-10.jpg?raw=true"
set "wallpaperPath=%TEMP%\wallpaper.jpg"

powershell -Command "(New-Object Net.WebClient).DownloadFile('%url%', '%wallpaperPath%')"
powershell -Command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\", CharSet = CharSet.Auto)] public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(0x0014, 0, '%wallpaperPath%', 0x01 -bor 0x02)"

pause