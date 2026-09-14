# Changelog

## [Unreleased]

### Changed
- README no longer claims an OWASP/Observatory A+ rating, Brotli, or testing on specific hosts; it lists requirements and explains the `'unsafe-inline'` CSP trade-off.
- Removed `Header unset Server`, which has no effect in Apache.

### Fixed
- Every request returned **500 Internal Server Error**: line 25 used `RewriteMatch`, which is not an Apache directive, so Apache rejected the whole `.htaccess`. The rule now uses `mod_rewrite` like the rest of the file, so it does not depend on `mod_alias` being enabled.
- `/.well-known/` was blocked by the hidden-files rule, so Let's Encrypt (ACME HTTP-01) could not renew certificates. Only `/.well-known/acme-challenge/<token>` is now allowed; everything else under hidden paths, including `/.well-known/.git/`, is still blocked.

## [1.0.0] - 2026-09-02

### Added
- HTTP security headers
- Content Security Policy (CSP)
- HTTP Strict Transport Security (HSTS)
- X-Frame-Options, X-Content-Type-Options, Referrer-Policy
- Permissions-Policy
- SPA fallback routing for React/Next.js/Vite
- Gzip compression
- Browser caching for static assets
- Server signature removal
