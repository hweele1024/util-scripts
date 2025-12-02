# Cross-platform Python script
import subprocess

url = input("Enter YouTube link: ")
choice = input("Choose download type (1=MP4, 2=MP3): ")

if choice == "1":
    subprocess.run(["yt-dlp", "-f", "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4", url])
elif choice == "2":
    subprocess.run(["yt-dlp", "-x", "--audio-format", "mp3", "--audio-quality", "0", url])
else:
    print("Invalid choice.")