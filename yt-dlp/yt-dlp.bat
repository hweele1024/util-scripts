@echo off
setlocal

REM Prompt for the YouTube link
set /p ytlink=Enter YouTube link: 

REM Prompt for download type
echo Choose download type:
echo 1. MP4 (best quality video)
echo 2. MP3 (best quality audio)
set /p choice=Enter 1 or 2: 

if "%choice%"=="1" (
    yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" "%ytlink%"
) else if "%choice%"=="2" (
    yt-dlp -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s" "%ytlink%"
) else (
    echo Invalid choice.
)

endlocal