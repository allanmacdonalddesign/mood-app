#!/bin/zsh

# Create social media optimized assets
# MP4s for LinkedIn, optimized GIFs for Twitter

echo "Creating social media assets..."

# Create directories
mkdir -p share-mp4s
mkdir -p share-gifs-optimized

# Array of moods
moods=("angry" "anxious" "calm" "content" "excited" "happy" "sad" "tired")

for mood in "${moods[@]}"; do
    echo "Processing $mood..."
    
    # Create MP4 for LinkedIn (500x500, 3 seconds, optimized for social)
    ffmpeg -i "Mood Videos/${mood}-video.mov" \
        -vf "scale=500:500:force_original_aspect_ratio=increase,crop=500:500" \
        -t 3 \
        -c:v libx264 \
        -preset fast \
        -crf 23 \
        -pix_fmt yuv420p \
        -movflags +faststart \
        "share-mp4s/${mood}-500x500.mp4" \
        -y
    
    # Create optimized GIF for Twitter (smaller file size, under 5MB)
    ffmpeg -i "Mood Videos/${mood}-video.mov" \
        -vf "scale=400:400:force_original_aspect_ratio=increase,crop=400:400" \
        -t 3 \
        -r 15 \
        -f gif \
        "share-gifs-optimized/${mood}-400x400.gif" \
        -y
done

echo "✅ Social media assets created!"
echo "📁 MP4s for LinkedIn: share-mp4s/"
echo "📁 Optimized GIFs for Twitter: share-gifs-optimized/"
