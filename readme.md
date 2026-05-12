# .dotfiles

Personal config files and settings for funsies.

![1](assets/1.png)

![2](assets/2.png)

![3](assets/3.png)

![cava](assets/cava.gif)

# What's this?

A PowerShell profile with Nord color theme, API integrations, fuzzy search, and utilities.

## Features

- Nord color theme throughout all outputs
- Dynamic time-based greeting with icons
- Weather reports for any location (Full, Short, Line, Moon modes)
- Daily historical trivia from Wikipedia
- Random advice generation
- Google search from terminal
- Fuzzy search for command history (Ctrl+R) and files (Ctrl+T)
- Starship prompt integration
- Zoxide smart directory jumping

## Commands

| Command | Aliases | Description |
|---------|---------|-------------|
| weather [city] | - | Get weather forecast |
| advice | - | Random life advice |
| t | Get-Trivia | Daily historical events |
| g query | google | Open Google search in browser |
| h | helpme | Show all commands |
| home | - | Go to home directory |
| cl | - | Clear screen |
| pingtest | - | Ping Google DNS |
| ff | - | Show system info (fastfetch) |
| z dir | - | Smart directory jump (zoxide) |

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| Ctrl+R | Fuzzy search command history |
| Ctrl+T | Fuzzy search files |

## Dependencies
- [bottom](https://github.com/ClementTsang/bottom) or [btop4win](https://github.com/aristocratos/btop4win)
- [cava](https://github.com/karlstav/cava)
- [fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [fzf](https://github.com/junegunn/fzf)
- [speedtest cli](https://www.speedtest.net/apps/cli)
- [starship](https://github.com/starship/starship)
- [zoxide](https://github.com/ajeetdsouza/zoxide)

## Folder Structure

```
.dotfiles/
├── readme.md                          # This file
├── assets/                            # Miscellaneous assets
├── config/                            # Configuration files
│   ├── starship.toml
│   ├── cava/
│   └── fastfetch/
├── cursor/                            # Cursor pack + install script
├── powershell/                        # PowerShell configuration
│   ├── Microsoft.PowerShell_profile.ps1  # PowerShell profile
│   └── Modules/                       # Custom PowerShell modules
│       ├── api.ps1                    # API utilities
│       ├── core.ps1                   # Core functions
│       ├── fzf.ps1                    # Fuzzy finder integration
│       ├── ui.ps1                     # UI utilities
│       └── utils.ps1                  # General utilities
├── sublime text/                      # Sublime Text configuration
│   └── Preferences.sublime-settings
└── wallpapers/                        # Desktop wallpapers
```
## TODO

- [ ] One-click install script

## CREDIT
[jimmyxd2](https://www.deviantart.com/jimmyxd2) for Mac Tahoe Cursor pack
