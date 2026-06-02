param([switch]$Force)

$ErrorActionPreference = "Stop"

# ── Admin check ──
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "`n  [!] Restarting as Administrator..." -ForegroundColor Yellow
    Start-Process pwsh -Verb RunAs -ArgumentList "-NoExit -File `"$PSCommandPath`" $(& { if ($Force) { "-Force" } })"
    exit
}

# ── Scoop bootstrap ──
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "`n  [+] Installing Scoop..." -ForegroundColor Cyan
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    irm get.scoop.sh | iex
}

# ── Buckets ──
$buckets = @("nerd-fonts")
foreach ($b in $buckets) {
    if ((scoop bucket list) -notmatch $b) {
        Write-Host "  [+] Adding bucket: $b" -ForegroundColor Cyan
        scoop bucket add $b
    }
}

# ── Scoop packages ──
$scoopPkgs = @("starship", "fzf", "zoxide", "fastfetch", "btop", "JetBrainsMono-NF")
$installed = scoop list | ForEach-Object { $_.Split()[0] }
$toInstall = $scoopPkgs | Where-Object { $_ -notin $installed }
if ($toInstall) {
    Write-Host "  [+] Installing scoop packages: $($toInstall -join ', ')" -ForegroundColor Cyan
    scoop install $toInstall
}

# ── PSFzf (PowerShell module) ──
if (-not (Get-Module -ListAvailable -Name PSFzf)) {
    Write-Host "  [+] Installing PSFzf module..." -ForegroundColor Cyan
    Install-Module -Name PSFzf -Scope CurrentUser -Force
}

# ── cava ──
if (-not (Get-Command cava -ErrorAction SilentlyContinue)) {
    Write-Host "  [+] Installing cava via winget..." -ForegroundColor Cyan
    winget install -e --id karlstav.cava
}

# ── Summary ──
Write-Host "`n  [✔] All dependencies installed. Restart your terminal." -ForegroundColor Green
