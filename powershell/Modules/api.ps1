# =========================
# modules/api.ps1
# Nord color theme + API utilities
# =========================

# Nord palette
$nord0  = "`e[38;2;46;52;64m"
$nord1  = "`e[38;2;59;66;82m"
$nord4  = "`e[38;2;216;222;233m"
$nord6  = "`e[38;2;236;239;244m"
$nord8  = "`e[38;2;143;188;187m"
$nord9  = "`e[38;2;136;192;208m"
$nord10 = "`e[38;2;129;161;193m"
$nord11 = "`e[38;2;191;97;106m"
$nord13 = "`e[38;2;235;203;139m"
$nord14 = "`e[38;2;163;190;140m"
$nord15 = "`e[38;2;180;142;173m"
$reset  = "`e[0m"

# Aliases
$red       = $nord11
$orange    = "`e[38;2;208;135;112m"
$yellow    = $nord13
$green     = $nord14
$cyan      = $nord8
$blue      = $nord9
$purple    = $nord15
$lavender  = $nord10
$subtext   = $nord4

# ===== Get-Weather =====
function Get-Weather {
    [CmdletBinding()]
    param(
        [string]$Location = "",
        [ValidateSet("Full", "Short", "Line", "Moon")]
        [string]$Mode = "Full"
    )
    $format = switch ($Mode) { "Full"{"?1m"} "Short"{"?0m"} "Line"{"?format=3"} "Moon"{"?moon"} default{"?1m"} }
    try {
        Invoke-RestMethod "http://wttr.in/$Location$format" -UserAgent "curl" -TimeoutSec 10 -ErrorAction Stop
    } catch {
        Write-Host "${red}✘ Weather API failed${reset} — $($_.Exception.Message)" -ForegroundColor Gray
    }
}
Set-Alias -Name weather -Value Get-Weather -Force

# ===== Get-Advice =====
function Get-Advice {
    try {
        $advice = (Invoke-RestMethod "https://api.adviceslip.com/advice" -TimeoutSec 10 -ErrorAction Stop).slip.advice
        Write-Host "`n ${cyan}›${reset} $advice`n"
    } catch {
        Write-Host "`n${red}✘ Advice API failed${reset} — $($_.Exception.Message)`n" -ForegroundColor Gray
    }
}
Set-Alias -Name advice -Value Get-Advice -Force

# ===== Get-Trivia =====
function Get-Trivia {
    [CmdletBinding()]
    param(
        [ValidateSet("Event", "Birth", "Death", "Mixed")]
        [string]$Source = "Mixed"
    )

    $month = (Get-Date).ToString("MM")
    $day   = (Get-Date).ToString("dd")
    $baseUrl = "https://en.wikipedia.org/api/rest_v1/feed/onthisday/all/$month/$day"

    try {
        $histData = Invoke-RestMethod -Uri $baseUrl -UserAgent "curl" -TimeoutSec 10 -ErrorAction Stop

        # Helper to format and print an item
        function Write-TriviaItem($item, $type) {
            $color = switch($type){ "event"{$yellow} "birth"{$green} "death"{$orange} }
            $label = switch($type){ "event"{"Event"} "birth"{"Born"} "death"{"Died"} }
            Write-Host "  ${color}[$($item.year)]${reset} ${lavender}$($label):${reset} ${subtext}$($item.text)${reset}"
        }

        Write-Host "`n  ${cyan}On this day ($month/$day)${reset}"

        if ($Source -eq "Mixed") {
            # Pick one random from each available category
            if ($histData.events) { Write-TriviaItem ($histData.events | Get-Random) "event" }
            if ($histData.births) { Write-TriviaItem ($histData.births | Get-Random) "birth" }
            if ($histData.deaths) { Write-TriviaItem ($histData.deaths | Get-Random) "death" }
        }
        else {
            # Single type mode
            $target = switch($Source){ "Event"{"events"} "Birth"{"births"} "Death"{"deaths"} }
            if ($histData.$target) {
                Write-TriviaItem ($histData.$target | Get-Random) ($Source.ToLower())
            } else {
                throw "No $Source data available."
            }
        }
        Write-Host ""
    }
    catch {
        Write-Host "`n  ${red}✘ Trivia fetch failed${reset} — $($_.Exception.Message)`n" -ForegroundColor Gray
    }
}
Set-Alias -Name t -Value Get-Trivia -Force
