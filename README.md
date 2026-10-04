# 🍚 Riced by Rice

A minimalist, sharp, and cohesive desktop setup powered by **Arch Linux** and **Hyprland** (configured via Lua), featuring strict square geometry, a unified dynamic theming system, and carefully tuned tooling.

---

## 🖥️ Overview & Setup

This repository is maintained as a **bare Git repository** mapped directly into `$HOME`, keeping configurations cleanly tracked without messy symlink managers.

### Core Stack

| Component | Software / Tool | Description |
|---|---|---|
| **OS** | [Arch Linux](https://archlinux.org/) | Rolling-release base with Linux kernel |
| **Window Manager** | [Hyprland](https://hyprland.org/) | Dynamic tiling Wayland compositor configured natively in Lua (`hyprland.lua`) |
| **Status Bar** | [Waybar](https://github.com/Alexays/Waybar) | Top status bar with custom squared modules, audio slider, hardware stats, and calendar |
| **Terminal** | [Kitty](https://sw.kovidgoyal.net/kitty/) | GPU-accelerated terminal with subtle background blur (`0.82` opacity) and JetBrains Mono |
| **Editor** | [Neovim](https://neovim.io/) ([LazyVim](https://www.lazyvim.org/)) | Customized LazyVim setup dynamically linked to the system color palette |
| **App Launcher** | [hyprlauncher](https://wiki.hyprland.org/Hypr-Ecosystem/hyprlauncher/) | Fast Wayland application launcher and dmenu-compatible prompt |
| **Notifications** | [Mako](https://github.com/emersion/mako) | Lightweight Wayland notification daemon with square borders |
| **Lock Screen & Idle** | [hyprlock](https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/) & [hypridle](https://wiki.hyprland.org/Hypr-Ecosystem/hypridle/) | Screen locker with blurred background & automated sleep/screen dimming |
| **Wallpaper** | [hyprpaper](https://wiki.hyprland.org/Hypr-Ecosystem/hyprpaper/) | Fast Wayland wallpaper daemon |
| **File Manager** | [Dolphin](https://apps.kde.org/dolphin/) | Feature-packed KDE file manager matching the global color scheme |
| **Screenshots** | `grim` + `slurp` + [swappy](https://github.com/jtheoof/swappy) | Area selection screenshots with immediate annotation and editing |
| **Clipboard** | [cliphist](https://github.com/sentriz/cliphist) | Clipboard history manager with a custom `hyprlauncher` dmenu picker (`cliphist-picker`) |
| **Audio & Media** | PipeWire, WirePlumber (`wpctl`), [playerctl](https://github.com/altdesktop/playerctl), [cava](https://github.com/karlstav/cava) | Modern audio stack with PipeWire audio visualizer |
| **System Monitor** | [btop](https://github.com/aristocratos/btop) | Terminal resource monitor |
| **Browser** | [LibreWolf](https://librewolf.net/) | Privacy-focused browser |
| **Theme Coordinator** | `theme` (custom CLI in `~/.local/bin/theme`) | Single-command cross-application theme coordinator |

---

## 🎨 Design Philosophy & Theming

### Strict Square Geometry
All UI elements adhere to a uniform, clean square aesthetic with zero border-radius (`rounding = 0px` across Hyprland, Waybar, GTK 3/4, Mako, and Hyprlauncher). Paired with subtle drop shadows and multi-pass background blur, the environment feels crisp, modern, and distraction-free.

### Universal Theme Coordinator (`theme`)
A custom Python coordinator (`~/.local/bin/theme`) centralizes color definitions. Changing the theme dynamically updates and live-reloads:
- **Hyprland** (`~/.config/hypr/theme_colors.lua` - window borders, shadow colors)
- **Waybar** (`~/.config/waybar/colors.css` - bar backgrounds, accents, hardware status colors)
- **Kitty** (`~/.config/kitty/current-theme.conf` - 16-color ANSI palette, cursor, tabs)
- **Neovim** (`~/.config/theme/palette.lua` -> `tokyonight.nvim` dynamic palette overrides)
- **GTK 3 & GTK 4** (`~/.config/gtk-{3,4}.0/gtk.css` - headerbars, selection, cards, inputs)
- **Qt / KDE / Dolphin** (`~/.local/share/color-schemes/WinterSolitude.colors` & `kdeglobals`)
- **Mako** (`~/.config/mako/config` - notification colors, borders, progress bars)
- **Hyprlauncher** (`~/.config/hypr/hyprlauncher.conf`) & **Hyprtoolkit** (`~/.config/hypr/hyprtoolkit.conf`)
- **Hyprpaper** (wallpaper paths synced automatically)

#### Theme Commands
```bash
theme list              # View available themes (* marks active)
theme set <theme-name>  # Switch theme and instantly reload all apps
theme apply             # Reapply the current theme
theme edit              # Edit current.json in $EDITOR and reapply on save
theme current           # Display active theme colors
```

#### Pre-configured Themes
- **Winter Solitude** *(Default)*: Slate dark tones (`#14171d`), frosty ice-blue highlights (`#88a4c2`, `#6c8aa8`), and balanced pastels.
- **Base2Tone Desert Dark**: Warm earthy tones (`#292724`), copper, and warm amber accents (`#ec9255`).

---

## ⌨️ Keybindings

The primary modifier key is **`SUPER`** (Windows key).

### Applications & Windows
| Shortcut | Action |
|---|---|
| `SUPER + Enter` | Launch Terminal (`kitty`) |
| `SUPER + SHIFT + Enter` | Launch Browser (`librewolf`) |
| `SUPER + Space` | Open Application Launcher (`hyprlauncher`) |
| `SUPER + E` | Open File Manager (`dolphin`) |
| `SUPER + C` | Open Clipboard History (`cliphist-picker`) |
| `SUPER + Q` | Close active window |
| `SUPER + V` | Toggle window floating mode |
| `SUPER + P` | Toggle pseudo-tiling |
| `SUPER + J` | Toggle dwindle split orientation |
| `SUPER + S` | Toggle special scratchpad workspace (`magic`) |
| `SUPER + SHIFT + S` | Move window to scratchpad workspace |

### Navigation & Workspaces
| Shortcut | Action |
|---|---|
| `SUPER + [←/↓/↑/→]` | Move focus between windows |
| `SUPER + [1-9, 0]` | Switch to workspace 1–10 |
| `SUPER + SHIFT + [1-9, 0]` | Move active window to workspace 1–10 |
| `SUPER + Mouse Scroll` | Scroll through active workspaces |
| `SUPER + LMB (drag)` | Move window |
| `SUPER + RMB (drag)` | Resize window |

### Screenshots
| Shortcut | Action |
|---|---|
| `Print` | Interactive region screenshot (`grim` + `slurp` -> `swappy`) |
| `SUPER + Print` | Fullscreen screenshot (`grim` -> `swappy`) |

### Media & Hardware
| Key | Action |
|---|---|
| `XF86AudioRaiseVolume` | Volume +5% (`wpctl`) |
| `XF86AudioLowerVolume` | Volume -5% (`wpctl`) |
| `XF86AudioMute` | Toggle audio mute |
| `XF86AudioMicMute` | Toggle microphone mute |
| `XF86MonBrightnessUp` | Screen brightness +5% (`brightnessctl`) |
| `XF86MonBrightnessDown` | Screen brightness -5% (`brightnessctl`) |
| `XF86AudioPlay` / `Pause` | Toggle play/pause (`playerctl`) |
| `XF86AudioNext` / `Prev` | Next / previous track (`playerctl`) |

---

## 📁 Repository Structure

```
~
├── .bashrc                               # Shell configuration & 'dots' alias
├── .config/
│   ├── btop/btop.conf                    # Resource monitor configuration
│   ├── cava/config                       # Audio visualizer (PipeWire)
│   ├── dolphinrc                         # Dolphin settings
│   ├── kdeglobals                        # KDE global settings & colors
│   ├── environment.d/10-theme.conf       # Wayland / Qt environment flags
│   ├── gtk-3.0/ & gtk-4.0/               # GTK stylesheet overrides (squared geometry)
│   ├── hypr/
│   │   ├── hyprland.lua                  # Main Hyprland configuration (Lua)
│   │   ├── hypridle.conf                 # Idle & screen timeout management
│   │   ├── hyprlock.conf                 # Screen locker with dynamic blur
│   │   ├── hyprpaper.conf                # Wallpaper daemon setup
│   │   ├── hyprlauncher.conf             # App launcher theme & dimensions
│   │   ├── hyprtoolkit.conf              # Hyprtoolkit styling
│   │   └── theme_colors.lua              # Auto-generated Hyprland theme palette
│   ├── kitty/
│   │   ├── kitty.conf                    # Terminal settings, fonts, opacity
│   │   └── current-theme.conf            # Auto-generated Kitty theme palette
│   ├── mako/config                       # Notification daemon settings
│   ├── nvim/                             # LazyVim configuration
│   │   ├── lua/plugins/colorscheme.lua   # Tokyonight synced to theme coordinator
│   │   ├── lua/plugins/coding.lua        # Completion configuration (blink.cmp)
│   │   └── lua/plugins/lua_ls.lua        # Lua LSP configured with 'hl' global
│   ├── swappy/config                     # Screenshot annotation editor configuration
│   ├── theme/
│   │   ├── current.json                  # Active theme definition
│   │   ├── palette.lua                   # Exported Lua palette for Neovim/Hyprland
│   │   └── themes/                       # Theme JSON presets
│   └── waybar/
│       ├── config.jsonc                  # Status bar layout & modules
│       ├── style.css                     # Squared stylesheet with animations
│       ├── colors.css                    # Auto-generated Waybar palette
│       └── power_menu.xml                # Power menu definition
└── .local/
    ├── bin/
    │   ├── theme                         # Universal Theme Coordinator CLI
    │   └── cliphist-picker               # Wayland clipboard history selector
    └── share/color-schemes/              # Qt/KDE color scheme files
```

---

## 🔧 Dotfiles Management

These dotfiles are tracked using a **bare git repository** located at `~/.dotfiles`. This avoids extra tools and symlinks.

### The `dots` Alias
Defined in `~/.bashrc`:
```bash
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Managing dotfiles works just like standard `git`:
```bash
dots status
dots add .config/hypr/hyprland.lua
dots commit -m "feat(hyprland): update window rules"
dots push
```

### Reproducing on a New Machine

1. **Clone repository as a bare repo**:
   ```bash
   git clone --bare git@github.com:Rice-Cameron/dotfiles.git $HOME/.dotfiles
   ```

2. **Define temporary alias**:
   ```bash
   alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
   ```

3. **Checkout working tree**:
   ```bash
   # Backup any existing default configs if needed
   mkdir -p ~/.dotfiles-backup
   dots checkout 2>&1 | egrep "\s+\." | awk '{print $1}' | xargs -I{} mv {} ~/.dotfiles-backup/{}

   # Checkout files
   dots checkout
   ```

4. **Hide untracked files from `dots status`**:
   ```bash
   dots config --local status.showUntrackedFiles no
   ```

5. **Apply system theme**:
   ```bash
   theme apply
   ```
