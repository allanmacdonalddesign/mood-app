#!/bin/zsh

# Create directory if it doesn't exist
mkdir -p twitter-shares

# List of moods
moods=("angry" "anxious" "calm" "content" "excited" "happy" "sad" "tired")

# Create a Twitter share page for each mood
for mood in "${moods[@]}"; do
    mood_name=$(echo $mood | sed 's/.*/\u&/') # Capitalize first letter
    
    cat > "twitter-shares/twitter-${mood}.html" << EOF
<!DOCTYPE html>
<html>
<head>
  <title>I'm feeling ${mood_name}! - Mood App</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- Open Graph meta tags for social media sharing -->
  <meta property="og:title" content="I'm feeling ${mood_name}! - Mood App">
  <meta property="og:description" content="Track your daily moods with our beautiful mood app!">
  <meta property="og:image" content="https://allanmacdonalddesign.github.io/mood-app/share-gifs-optimized/${mood}-400x400.gif">
  <meta property="og:url" content="https://allanmacdonalddesign.github.io/mood-app/twitter-shares/twitter-${mood}.html">
  <meta property="og:type" content="website">
  
  <!-- Twitter Card meta tags -->
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="I'm feeling ${mood_name}! - Mood App">
  <meta name="twitter:description" content="Track your daily moods with our beautiful mood app!">
  <meta name="twitter:image" content="https://allanmacdonalddesign.github.io/mood-app/share-gifs-optimized/${mood}-400x400.gif">
  
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gabarito:wght@400;700&display=swap" rel="stylesheet">
  
  <style>
    :root {
      --page-bg: white;
      --page-text: #333;
      --page-stroke: #333;
    }
    body {
      margin: 0;
      padding: 0;
      height: 100vh;
      background: var(--page-bg);
      color: var(--page-text);
      font-family: 'Gabarito', sans-serif;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      transition: background-color 0.3s ease, color 0.3s ease;
    }
    .container {
      text-align: center;
      max-width: 600px;
      padding: 20px;
    }
    h1 {
      font-size: 48px;
      font-weight: bold;
      color: var(--page-text);
      margin-bottom: 20px;
    }
    img {
      max-width: 400px;
      width: 100%;
      border-radius: 20px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.2);
    }
    .date {
      font-size: 24px;
      color: var(--page-text);
      margin-top: 30px;
      margin-bottom: 30px;
    }
    .description {
      font-size: 18px;
      color: var(--page-text);
      margin-bottom: 40px;
    }
    .button {
      background: var(--page-stroke);
      color: var(--page-bg);
      border: none;
      padding: 15px 30px;
      border-radius: 25px;
      font-size: 18px;
      font-weight: 700;
      cursor: pointer;
      text-decoration: none;
      transition: all 0.2s ease;
    }
    .button:hover {
      background: var(--page-text);
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>I'm feeling ${mood_name}!</h1>
    <div style="margin-bottom: 30px;">
      <img src="../share-gifs-optimized/${mood}-400x400.gif" alt="${mood_name} mood" style="max-width: 400px; width: 100%; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.2);">
    </div>
    <p class="date">SEPTEMBER 20</p>
    <p class="description">Track your daily moods with our mood app!</p>
    <a href="https://allanmacdonalddesign.github.io/mood-app/" class="button">Try the Mood App</a>
  </div>
</body>
</html>
EOF

    echo "Created twitter-shares/twitter-${mood}.html"
done

echo "✅ Twitter share pages created for all moods!"
echo "📁 Files created in: twitter-shares/"
