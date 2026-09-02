<div align="center">

  # 🛡️ Apache SPA Security & CSP Hardening Template

  **Turnkey, production-grade `.htaccess` hardening rules and Content Security Policy (CSP) for Single-Page Applications (React, Next.js, Vite, Vue).**

  <br />

  [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
  [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/manniche-labs/apache-spa-security-hardening/pulls)
  [![Security Standard](https://img.shields.io/badge/Security-OWASP_A+-blueviolet.svg)](https://owasp.org)
  [![Project Views](https://komarev.com/ghpvc/?username=manniche-labs-apache-spa-security-hardening&color=2563eb&style=flat-square&label=PROJECT+VIEWS)](https://github.com/manniche-labs/apache-spa-security-hardening)
  [![Studio](https://img.shields.io/badge/Maintained_by-manniche_labs-0f0f0f?logo=github&logoColor=white)](https://github.com/manniche-labs)

  <br />

  <sub>Crafted with precision by <b><a href="https://github.com/mikkelmanniche-dk">Mikkel Manniche</a></b> at <b><a href="https://github.com/manniche-labs">manniche labs</a></b> • <a href="https://mikkelmanniche.dk">mikkelmanniche.dk</a></sub>

</div>

---

## 📌 Why This Template?

Most modern web frameworks (React, Vite, Next.js export, Vue) assume you deploy on serverless platforms like Vercel or Netlify. When deploying to traditional **Apache web servers** (e.g. Simply.com, one.com, cPanel, or self-hosted Ubuntu/Debian), developers frequently encounter:

* ❌ **Broken client-side routing** on page reload (404 errors)
* ❌ **F-grade security on Mozilla Observatory** due to missing headers
* ❌ **CORS errors** on web fonts and static SVGs
* ❌ **Slow page load times** without gzip/brotli compression
* ❌ **Vulnerable exposed files** (`.env`, `.git`, `.sql` leaks)

This repository provides an **OWASP-grade, production-hardened `.htaccess`** ready for immediate deployment.

---

## ⚡ Key Features

| Category | Protection / Optimization | Benefit |
| :--- | :--- | :--- |
| **🛡️ CSP Header** | `Content-Security-Policy` | Mitigates Cross-Site Scripting (XSS) and data injection. |
| **🔒 HSTS** | `Strict-Transport-Security` | Enforces HTTPS for 1 year across all subdomains. |
| **🚫 Anti-Clickjacking** | `X-Frame-Options: DENY` | Prevents malicious framing in iframes. |
| **🔍 MIME Protection** | `X-Content-Type-Options: nosniff` | Blocks malicious executable mime-type sniffing. |
| **⚡ Compression** | `mod_deflate` Gzip/Deflate | Compresses HTML, CSS, JS, SVG and JSON for higher Core Web Vitals. |
| **📦 Asset Caching** | `mod_expires` | 1-year caching on versioned static assets + instant HTML delivery. |
| **🌐 Font CORS** | `Access-Control-Allow-Origin: *` | Fixes missing cross-origin font rendering on CDNs. |
| **🔀 SPA Routing** | `mod_rewrite` fallback | Seamless client-side HTML5 history navigation. |

---

## 🚀 Quick Start

### 1. Copy `.htaccess`
Simply download or copy the [`.htaccess`](.htaccess) file into the root of your web server (e.g., `public_html/`):

```bash
# Clone the repository
git clone https://github.com/manniche-labs/apache-spa-security-hardening.git
cp apache-spa-security-hardening/.htaccess /var/www/html/
```

### 2. Verify Security Headers

Run the included verification script against your domain:

**macOS / Linux:**
```bash
bash verify-security-headers.sh https://yourdomain.com
```

**Windows PowerShell:**
```powershell
.\verify-security-headers.ps1 -Url "https://yourdomain.com"
```

---

## 🧪 Tested Environments

* ✅ **Simply.com** Cloud Hosting (Apache 2.4 + PHP 8)
* ✅ **one.com** Apache Infrastructure
* ✅ **cPanel / WHM** shared & dedicated servers
* ✅ **Ubuntu / Debian / CentOS** with `mod_rewrite` and `mod_headers`

---

## 🤝 Contributing

Issues, feature requests, and pull requests are warmly welcome! If you find this template useful, please consider giving it a **⭐ Star** on GitHub.

---

## 👨‍💻 Author & Maintainer

* **Organization:** [manniche labs](https://github.com/manniche-labs)
* **Lead Engineer:** [Mikkel Manniche](https://github.com/mikkelmanniche-dk)
* **Official Website:** [mikkelmanniche.dk](https://mikkelmanniche.dk)

License: [MIT](LICENSE)
