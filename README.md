# ip2location-cli 🚀

`ip2location-cli` is a lightweight, professional, and zero-barrier Bash CLI tool designed for developers, network engineers, and system administrators. It performs instant IP geolocation, ISP lookup, and security/fraud detection (such as VPN/proxy detection) directly from your terminal using the keyless IP2Location.io API.

No accounts. No API keys. No GUI bloat. Just pure, fast command-line power.

---

## ✨ Key Features

- **🔑 Zero-Barrier Access:** Operates fully via keyless API endpoints—no sign-ups, subscriptions, or secret keys to configure.
- **⚡ Instant One-Liner Installation:** Download and execute the utility in seconds with a single terminal command.
- **🛡️ Security & Fraud Intelligence:** Instantly detects proxies, VPNs, and calculates risk scores to help spot potential threats.
- **🧼 Pure Raw JSON Output:** Keeps API responses completely untainted and structured, making it effortless to pipe into other tools like `jq` or logging scripts.
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

# Run the tool
./ip_cli.sh
```

---

## 📋 Requirements

Ensure your environment has the following basic utilities installed:
- `bash` (v4 or higher)
- `curl`

---

## 💡 Example Output

```text
==================================================
  Welcome to ip2location-cli!
  GitHub: https://github.com/alinasrollahzadeh405-sudo
==================================================

Please enter IP you want to lookup: 149.28.56.202
[*] Fetching data for IP: 149.28.56.202 ...

[+] IP lookup is successfully!

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

## 👨‍💻 Author

- **GitHub:** [@alinasrollahzadeh405-sudo](https://github.com/alinasrollahzadeh405-sudo)

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
