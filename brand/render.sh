#!/usr/bin/env bash
# Render the brand images from the HTML sources with headless Chrome.
#   banner.html          -> ../profile/banner.png   (2560x800, used by profile/README.md)
#   social-preview.html  -> social-preview.png      (1280x640, upload in repo Settings -> Social preview)
set -euo pipefail
cd "$(dirname "$0")"
CHROME="${CHROME:-google-chrome}"
shot() { # html out width height scale
  "$CHROME" --headless=new --no-sandbox --hide-scrollbars \
    --force-device-scale-factor="$5" --window-size="$3,$4" --virtual-time-budget=8000 \
    --screenshot="$PWD/$2" "file://$PWD/$1" >/dev/null 2>&1
}
shot banner.html ../profile/banner.png 1280 400 2
shot social-preview.html social-preview.png 1280 640 1
echo "rendered"
