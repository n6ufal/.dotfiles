# =========================
# modules/core.ps1
# =========================

function Show-Help {
    function p { param($cmd, $desc, $color=$green) Write-Host "  $color$($cmd.PadRight(12))${subtext}::  $reset$desc" }

    Write-Host ""
    Write-Host "  ${teal}✦${reset} ${lavender}COMMAND CENTER HELP${reset}"
    Write-Host "  ${subtext}──────────────────────────────────────────${reset}"

    p "weather"    "Get weather (Full, Short, Line, Moon)"
    p "Get-Advice" "Get a random bit of wisdom"
    p "home"       "Teleport to home directory (~)"
    p "pingtest"   "Quick 4-packet test to Google DNS"
    p "z <dir>"    "Zoxide: Smart jump to frequent folders"
    p "t"          "Daily trivia (History + Random Fact)"
    p "g <query>"  "Search Google (Opens Browser)"

    Write-Host "`n  ${teal}✦${reset} ${lavender}FUZZY SEARCH (FZF)${reset}"
    Write-Host "  ${subtext}──────────────────────────────────────────${reset}"

    p "Ctrl + R"   "Search command history" $yellow
    p "Ctrl + T"   "Search for files/paths" $yellow

    Write-Host ""
    Write-Host "  ${pink}Tip: Use 'weather <city> -Mode Line' for a clean look.${reset}"
    Write-Host ""
}

Set-Alias h Show-Help
Set-Alias helpme Show-Help
Set-Alias ff fastfetch
