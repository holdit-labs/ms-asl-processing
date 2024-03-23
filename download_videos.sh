#!/bin/bash

# Path to your text file
FILE="video_list.txt"

LOG_FILE="./yt-dlp-logs/download_errors.log"


: > "$LOG_FILE"

# Read each line in the text file
while IFS=, read -r url section
do
  # Use yt-dlp to download the specified section of each video into the video-files directory
  yt-dlp -o "./video-files/%(title)s-%(id)s.%(ext)s" --download-sections "$section" "$url" 2>> "$LOG_FILE"
done < "$FILE"
