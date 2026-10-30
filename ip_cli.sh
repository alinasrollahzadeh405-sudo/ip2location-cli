#!/bin/bash

# تعریف کدهای رنگی ANSI برای ترمینال
# این ک همون متغیرهایی هستن که رنگ رو به پیام‌های متنی می‌دن
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # بدون رنگ / ریست کردن رنگ به حالت عادی

# چاپ بنر خوش‌آمدگویی و آدرس گیت‌هاب با رنگ‌های شاداب
echo -e "${CYAN}==================================================${NC}"
echo -e "${GREEN}  Welcome to ip2location-cli!${NC}"
echo -e "${YELLOW}  GitHub: https://github.com/alinasrollahzadeh405-sudo${NC}"
echo -e "${CYAN}==================================================${NC}"
echo

# گرفتن آی‌پی از کاربر
read -rp "Please enter IP you want to lookup: " user_ip

# اگر کاربر چیزی وارد نکرد، خطا بده و خارج شو
if [ -z "$user_ip" ]; then
    echo -e "${RED}[-] Error: No IP entered. Exiting...${NC}"
    exit 1
fi

echo -e "${CYAN}[*] Fetching data for IP: $user_ip ...${NC}"

# درخواست به API و گرفتن خروجی جیسون (بدون نیاز به API Key)
ip_command=$(curl -s "https://api.ip2location.io/?ip=${user_ip}&format=json")

# بررسی موفقیت‌آمیز بودن پاسخ
if [ -n "$ip_command" ]; then
    echo -e "\n${GREEN}[+] IP lookup is successfully!${NC}\n"
    # چاپ بدنه‌ی خامِ جیسون برای اینکه ساختارش خراب نشه
    echo "$ip_command"
else
    echo -e "${RED}[-] Error: Failed to connect or retrieve data.${NC}"
    exit 1
fi
