#!/bin/bash
# autopush.sh
# Monitors the Skillbridge AI repository for changes and pushes them automatically.

echo "Starting autopush for Skillbridge AI... (Press Ctrl+C to stop)"

while true; do
  # Check if there are any uncommitted changes
  if [[ -n $(git status -s) ]]; then
    echo "============================================="
    echo "Changes detected at $(date). Committing and pushing..."
    git add .
    git commit -m "Auto-commit: $(date)"
    git push origin main
    echo "Push successful!"
    echo "============================================="
  fi
  
  # Wait for 30 seconds before checking again
  sleep 30
done
