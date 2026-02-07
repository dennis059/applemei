#!/bin/bash
# 蘋果妹的電源與狀態監控指令碼

# 1. 偵測開機
BOOT_TIME=$(/usr/sbin/sysctl -n kern.boottime | awk '{print $4}' | tr -d ',')
HISTORY_FILE="/Users/dennis/.openclaw/workspace/memory/last_boot.txt"
CURRENT_LAST_BOOT=$(cat "$HISTORY_FILE" 2>/dev/null)

if [ "$BOOT_TIME" != "$CURRENT_LAST_BOOT" ]; then
    # 偵測到新開機
    /opt/homebrew/bin/openclaw message send --target "8220853568" --message "偉榮哥早安！🍎✨ 偵測到 Mac mini 已重新啟動，蘋果妹已在線守護中！"
    echo "$BOOT_TIME" > "$HISTORY_FILE"
fi

# 2. 自動睡眠維護
# 確保 10 分鐘螢幕黑掉，30 分鐘後進入睡眠 (黃金比例)
/usr/bin/pmset -g | grep "sleep.*30" > /dev/null
if [ $? -ne 0 ]; then
    # 只有當設定跑掉時才重新鎖定
    /usr/bin/sudo /usr/bin/pmset displaysleep 10 sleep 30
fi
