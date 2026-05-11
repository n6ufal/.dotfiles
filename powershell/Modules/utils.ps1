# =========================
# modules/utils.ps1
# =========================

function home { Set-Location ~ }
function pingtest { ping -n 4 8.8.8.8 }
function cl { clear }

function Search-Google {
    param([Parameter(Mandatory=$true)][string]$Query)

    Write-Host "  ${teal}✦${reset} ${subtext}Searching Google for:${reset} ${yellow}$Query${reset}..."

    $EncodedQuery = [uri]::EscapeDataString($Query)
    Start-Process "https://www.google.com/search?q=$EncodedQuery"
}

Set-Alias g Search-Google
Set-Alias google Search-Google
