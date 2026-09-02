param(
    [Parameter(Mandatory=$false)]
    [string]$Url = "https://mikkelmanniche.dk"
)

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " 🛡️  MANNICHE LABS — HTTP SECURITY HEADERS AUDITOR" -ForegroundColor Cyan
Write-Host " Target: $Url" -ForegroundColor White
Write-Host "==========================================================" -ForegroundColor Cyan

try {
    $response = Invoke-WebRequest -Uri $Url -Method Head -UseBasicParsing
    $headers = $response.Headers

    $checks = @(
        @{ Name = "Strict-Transport-Security"; Expected = "max-age=" },
        @{ Name = "Content-Security-Policy"; Expected = "default-src" },
        @{ Name = "X-Content-Type-Options"; Expected = "nosniff" },
        @{ Name = "X-Frame-Options"; Expected = "DENY|SAMEORIGIN" },
        @{ Name = "Referrer-Policy"; Expected = "strict-origin" },
        @{ Name = "Permissions-Policy"; Expected = "" },
        @{ Name = "Cross-Origin-Opener-Policy"; Expected = "same-origin" }
    )

    $passed = 0
    foreach ($c in $checks) {
        $val = $headers[$c.Name]
        if ($val) {
            Write-Host " [PASS] " -ForegroundColor Green -NoNewline
            Write-Host "$($c.Name): " -ForegroundColor White -NoNewline
            Write-Host "$val" -ForegroundColor DarkGray
            $passed++
        } else {
            Write-Host " [MISS] " -ForegroundColor Red -NoNewline
            Write-Host "$($c.Name) is missing" -ForegroundColor Yellow
        }
    }

    Write-Host "`nScore: $passed/$($checks.Count) headers passed." -ForegroundColor $(if ($passed -eq $checks.Count) { "Green" } else { "Yellow" })
} catch {
    Write-Host "Failed to query URL: $_" -ForegroundColor Red
}
