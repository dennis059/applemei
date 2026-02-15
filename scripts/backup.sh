#!/bin/bash
# 🍎Apple 自動備份腳本 (安全版)

# 讀取隱藏的 Token
TOKEN_FILE="/Users/dennis/.openclaw/.git_token"
if [ ! -f "$TOKEN_FILE" ]; then
    echo "錯誤：找不到 Token 檔案"
    exit 1
fi

TOKEN=$(cat "$TOKEN_FILE")
REPO="github.com/dennis059/applemei.git"

cd /Users/dennis/.openclaw/workspace

# 執行備份
git add .
git commit -m "🍎Apple Backup: $(date +'%Y-%m-%d %H:%M:%S')"

# 推送 (URL 不會被記錄在 commit 中)
git push "https://dennis059:${TOKEN}@${REPO}" main
