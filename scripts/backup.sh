#!/bin/bash
# 備份到 GitHub
cd /Users/dennis/.openclaw/workspace
git add .
git commit -m "Auto backup $(date +'%Y-%m-%d %H:%M:%S')"
git push origin main
