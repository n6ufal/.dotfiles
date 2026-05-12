# .dotfiles

Personal config files and settings for funsies.

![1](assets/1.png)

![2](assets/2.png)

![3](assets/3.png)

![cava](assets/cava.gif)

# PowerShell

- Nord color palette throughout all outputs
- Modular
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

## CAVA

- Nord color palette with 8-step gradient from blues to warm reds
- Mono output with averaged channels as it should be
- Reduced noise smoothing (0.98 noise reduction)
- Frequency range: 30 Hz – 15 kHz (covers sub-bass to high treble)

## Starship

- Nord color palette
- SSH-only hostname, sudo indicator, directory, git branch/status, command duration, Python version, then character prompt on new line
- Username hidden by default (root-only for cleaner prompts)
- Git status: conflicts, ahead/behind, diverged, untracked, stashed, modified, staged, renamed, deleted
- Slow command tracking (>2 seconds)
- Directory truncation: 3 parent folders with ellipsis, repo root detection, read-only lock icon
- Chevron reverses (❯ → ❮) in normal mode, green on success, red on error


## Dependencies
- [bottom](https://github.com/ClementTsang/bottom) or [btop4win](https://github.com/aristocratos/btop4win)
- [cava](https://github.com/karlstav/cava)
- [fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [fzf](https://github.com/junegunn/fzf)
- [nerd fonts](https://www.nerdfonts.com/font-downloads)
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
## Homework

- [ ] One-click install script
- [ ] Better screenshots

## Additional Notes

No transparency, tiling, status panels, or other eye candy. These dotfiles are exclusively for my work laptop with a weak iGPU and 8GB RAM. Less overhead = better thermals and efficiency. Ironic, since these dotfiles are still eye candy anyway.

## Credit
[jimmyxd2](https://www.deviantart.com/jimmyxd2) for Mac Tahoe cursor pack, thanks!
