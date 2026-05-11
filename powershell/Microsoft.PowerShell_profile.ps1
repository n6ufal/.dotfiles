# =========================
# profile.ps1 (MAIN ENTRY)
# =========================

# Load modules
. "$PSScriptRoot/modules/ui.ps1"
. "$PSScriptRoot/modules/core.ps1"
. "$PSScriptRoot/modules/fzf.ps1"
. "$PSScriptRoot/modules/api.ps1"
. "$PSScriptRoot/modules/utils.ps1"

# Init prompt
Invoke-Expression (& starship init powershell)

# Init zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# Greeting
Show-Greeting

# Set PSReadLine prediction view to ListView by default
Set-PSReadLineOption -PredictionViewStyle ListView
