#!/bin/bash

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

# Welcome banner
echo -e "${CYAN}==================================================${NC}"
echo -e "${GREEN}  Welcome to ip2location-cli!${NC}"
echo -e "${YELLOW}  GitHub: https://github.com/alinasrollahzadeh405-sudo${NC}"
echo -e "${CYAN}==================================================${NC}"
echo

# Get IP from the first argument, or ask the user
user_ip="${1:-}"
if [ -z "$user_ip" ]; then
    read -rp "Please enter IP you want to lookup: " user_ip
fi

# Empty input
if [ -z "$user_ip" ]; then
    echo -e "${RED}[-] Error: No IP entered. Exiting...${NC}"
    exit 1
fi

# Basic format validation (IPv4 or IPv6)
if ! [[ "$user_ip" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]] && ! [[ "$user_ip" =~ ^[0-9a-fA-F:]+$ && "$user_ip" == *:* ]]; then
    echo -e "${RED}[-] Error: Invalid IP format.${NC}"
    exit 1
fi

# Output format menu
read -rp $'Please select how to show IP:\n  1. Show output with jq (recommended)\n  2. Print raw output\nChoice [1/2]: ' show_format
show_format="${show_format:-1}"

case "$show_format" in
    1|2) ;;
    *)
        echo -e "${RED}[-] Error: Invalid choice. Exiting...${NC}"
        exit 1
        ;;
esac

# jq availability check
if [ "$show_format" = "1" ] && ! command -v jq >/dev/null 2>&1; then
    echo -e "${YELLOW}[!] jq is not installed. Falling back to raw output.${NC}"
    show_format=2
fi

echo
echo -e "${CYAN}[*] Fetching data for IP: $user_ip ...${NC}"

# Request to the API
ip_command=$(curl -s --max-time 10 "https://api.ip2location.io/?ip=${user_ip}&format=json")
curl_status=$?

if [ $curl_status -ne 0 ] || [ -z "$ip_command" ]; then
    echo -e "${RED}[-] Error: Failed to connect or retrieve data.${NC}"
    exit 1
fi

# API-level error (invalid IP, rate limit, ...)
if echo "$ip_command" | grep -q '"error"'; then
    echo -e "${RED}[-] Error: API returned an error:${NC}"
    echo "$ip_command"
    exit 1
fi

echo -e "\n${GREEN}[+] IP lookup was successful!${NC}\n"

if [ "$show_format" = "1" ]; then
    echo "$ip_command" | jq .
else
    echo "$ip_command"
fi
