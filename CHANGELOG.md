# Changelog

## [Unreleased]

### Fixed
- Every request returned **500 Internal Server Error**: line 25 used `RewriteMatch`, which is not an Apache directive, so Apache rejected the whole `.htaccess`. It is now `RedirectMatch` inside `<IfModule mod_alias.c>`.
- `/.well-known/` was blocked by the hidden-files rule, so Let's Encrypt (ACME HTTP-01) could not renew certificates. It is now allowed; `.git`, `.env` and other dotfiles are still blocked.

## [1.0.0] - 2026-09-02

### Added
- OWASP A+ rated HTTP security headers
- Content Security Policy (CSP)
- HTTP Strict Transport Security (HSTS)
- X-Frame-Options, X-Content-Type-Options, Referrer-Policy
- Permissions-Policy
- SPA fallback routing for React/Next.js/Vite
- Gzip compression
- Browser caching for static assets
- Server signature removal
