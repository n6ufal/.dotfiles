# =========================
# modules/fzf.ps1
# =========================

function Init-Fzf {
    if (-not (Get-Module PSFzf)) {
        Import-Module PSFzf
        Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'
        Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t'
    }
}

Set-PSReadLineKeyHandler -Chord Ctrl+r -ScriptBlock { Init-Fzf }
Set-PSReadLineKeyHandler -Chord Ctrl+t -ScriptBlock { Init-Fzf }

$ENV:FZF_DEFAULT_OPTS = @"
--color=fg:#D8DEE9,bg:#2E3440,hl:#EBCB8B
--color=fg+:#ECEFF4,bg+:#3B4252,hl+:#EBCB8B
--color=border:#4C566A,header:#81A1C1,gutter:#2E3440
--color=spinner:#EBCB8B,info:#88C0D0
--color=pointer:#88C0D0,marker:#BF616A,prompt:#81A1C1
"@
