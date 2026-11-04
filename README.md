# فارسی (persian)

[readme in farsy فارسی](README_FA.md)

# ip2location-cli 🚀

`ip2location-cli` is a lightweight, professional, and zero-barrier Bash CLI tool designed for developers, network engineers, and system administrators. It performs instant IP geolocation, ISP lookup, and security/fraud detection (such as VPN/proxy detection) directly from your terminal using the keyless IP2Location.io API.

No accounts. No API keys. No GUI bloat. Just pure, fast command-line power.

---

## ✨ Key Features

- **🔑 Zero-Barrier Access:** Operates fully via keyless API endpoints—no sign-ups, subscriptions, or secret keys to configure.
- **⚡ Instant One-Liner Installation:** Download and execute the utility in seconds with a single terminal command.
- **🛡️ Security & Fraud Intelligence:** Instantly detects proxies, VPNs, and calculates risk scores to help spot potential threats.
- **🧼 Flexible Output:** Choose between pretty-printed JSON via `jq` (recommended) or the pure, untouched raw API response that is easy to pipe into other tools and logging scripts.
- **🧾 Interactive or Argument Mode:** Type the IP when prompted, or pass it directly as an argument for quick use and scripting.
- **✅ Input Validation:** Checks the IPv4/IPv6 format before sending any request.
- **🧯 Robust Error Handling:** Detects connection failures, timeouts, and API-level errors (such as an invalid IP or a rate limit) instead of reporting false success.
- **🎨 Professional ANSI Interface:** Styled with clean color-coded status messages and a custom developer header.
- **♿ Screen-Reader Friendly:** Clean text structure and straightforward layout optimized for accessibility tools like TalkBack.

---

## 🚀 Quick Installation & Usage

You don't need to clone the whole repository. You can download and run the script instantly using `curl`:

```bash
# Download the script directly
curl -sO https://raw.githubusercontent.com/alinasrollahzadeh405-sudo/ip2location-cli/main/ip_cli.sh

# Make it executable
chmod +x ip_cli.sh

# Run the tool (interactive mode)
./ip_cli.sh

# Or pass the IP directly
./ip_cli.sh 8.8.8.8
```

After entering the IP, a short menu lets you pick the output format:

| Choice | Output |
| ------ | ------ |
| `1` (default) | Pretty-printed JSON using `jq` (recommended) |
| `2` | Raw API output |

Pressing Enter without typing anything selects option 1. If `jq` is not installed, the tool automatically falls back to raw output.

---

## 📋 Requirements

Ensure your environment has the following basic utilities installed:
- `bash` (v4 or higher)
- `curl`
- `jq` *(optional, only needed for formatted output)*

Installing `jq`:

```bash
# Debian / Ubuntu / Kali
sudo apt install jq

# Fedora
sudo dnf install jq

# Arch
sudo pacman -S jq

# macOS (Homebrew)
brew install jq

# Termux (Android)
pkg install jq
```

---

## 💡 Example Output

```text
==================================================
  Welcome to ip2location-cli!
  GitHub: https://github.com/alinasrollahzadeh405-sudo
==================================================

Please enter IP you want to lookup: 149.28.56.202
Please select how to show IP:
  1. Show output with jq (recommended)
  2. Print raw output
Choice [1/2]: 1

[*] Fetching data for IP: 149.28.56.202 ...

[+] IP lookup was successful!

{
  "ip": "149.28.56.202",
  "country_code": "US",
  "country_name": "United States of America",
  "region_name": "New Jersey",
  "city_name": "Piscataway",
  "zip_code": "08854",
  "time_zone": "-04:00",
  "asn": "20473",
  "as": "The Constant Company LLC",
  "is_proxy": true
}
```

---

## ⚠️ Notes & Troubleshooting

- **Rate limits:** The keyless API has a daily request limit. If you hit it, the tool shows the API's error message instead of results. Try again later.
- **Invalid IP format:** Make sure you enter a valid IPv4 (e.g. `8.8.8.8`) or IPv6 address.
- **Connection errors:** The request times out after 10 seconds. Check your internet connection and try again.

---

## 👨‍💻 Author

- **GitHub:** [@alinasrollahzadeh405-sudo](https://github.com/alinasrollahzadeh405-sudo)

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
