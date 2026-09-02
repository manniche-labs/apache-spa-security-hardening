#!/usr/bin/env bash
# ==============================================================================
# MANNICHE LABS — HTTP SECURITY HEADERS AUDITOR
# ==============================================================================

TARGET="${1:-https://mikkelmanniche.dk}"
echo -e "\033[1;36m==========================================================\033[0m"
echo -e "\033[1;36m 🛡️  MANNICHE LABS — SECURITY HEADERS AUDITOR\033[0m"
echo -e "\033[1;37m Target: $TARGET\033[0m"
echo -e "\033[1;36m==========================================================\033[0m"

HEADERS=$(curl -s -I "$TARGET")

check_header() {
    local header="$1"
    if echo "$HEADERS" | grep -iq "^$header:"; then
        echo -e " \033[32m[PASS]\033[0m $header"
        return 0
    else
        echo -e " \033[31m[MISS]\033[0m $header is missing"
        return 1
    fi
}

passed=0
check_header "Strict-Transport-Security" && ((passed++))
check_header "Content-Security-Policy" && ((passed++))
check_header "X-Content-Type-Options" && ((passed++))
check_header "X-Frame-Options" && ((passed++))
check_header "Referrer-Policy" && ((passed++))
check_header "Permissions-Policy" && ((passed++))
check_header "Cross-Origin-Opener-Policy" && ((passed++))

echo -e "\n\033[1;32mTotal: $passed/7 security headers verified.\033[0m"
