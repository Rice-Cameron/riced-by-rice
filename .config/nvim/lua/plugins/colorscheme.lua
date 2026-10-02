return {
  -- Configure tokyonight to perfectly match the system theme (Winter Solitude / Dark Slate & Ice Blue)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = false,
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      on_colors = function(colors)
        local palette_path = vim.fn.expand("~/.config/theme/palette.lua")
        local ok_pal, pal = pcall(dofile, palette_path)
        if not ok_pal or type(pal) ~= "table" then
          pal = {}
        end
        local c = pal.colors or {}

        -- Backgrounds
        local bg = pal.background or "#14171d"
        local bg_dark = pal.surface_alt or "#101318"
        local bg_float = pal.surface or "#161a22"
        local border = pal.accent or "#6c8aa8"
        local highlight = pal.highlight or "#88a4c2"
        local muted = pal.muted or "#474f5f"
        local fg = pal.foreground or "#d0d7de"

        colors.bg = bg
        colors.bg_dark = bg_dark
        colors.bg_dark1 = bg_dark
        colors.bg_float = bg_float
        colors.bg_highlight = pal.surface or "#1f2530"
        colors.bg_popup = bg_float
        colors.bg_search = pal.border_inactive or "#282e3b"
        colors.bg_sidebar = bg_dark
        colors.bg_statusline = bg_dark
        colors.bg_visual = pal.selection_bg or "#282e3b"

        -- Foregrounds
        colors.fg = fg
        colors.fg_dark = muted
        colors.fg_float = fg
        colors.fg_gutter = muted
        colors.fg_sidebar = muted

        -- Borders and UI accents
        colors.border = border
        colors.border_highlight = highlight
        colors.comment = muted

        -- Blues & accents
        colors.blue = c.blue or "#6c8aa8"
        colors.blue0 = pal.border or "#47617b"
        colors.blue1 = c.bright_blue or highlight
        colors.blue2 = c.bright_blue or highlight
        colors.blue5 = highlight
        colors.blue6 = c.bright_cyan or highlight
        colors.blue7 = pal.border or "#282e3b"

        -- Cyans
        colors.cyan = c.cyan or "#638b9e"
        colors.teal = c.bright_cyan or "#7da8bc"

        -- Greens
        colors.green = c.green or "#7a9a88"
        colors.green1 = c.bright_green or "#8eaf9d"
        colors.green2 = c.green or "#7a9a88"

        -- Magentas / Purples
        colors.magenta = c.magenta or "#8c7380"
        colors.magenta2 = c.bright_magenta or "#a38997"
        colors.purple = c.magenta or "#8c7380"

        -- Reds
        colors.red = c.red or "#b85866"
        colors.red1 = c.bright_red or "#cf6d7b"

        -- Yellows / Oranges
        colors.yellow = c.yellow or "#c4a578"
        colors.orange = c.bright_yellow or c.yellow or "#c4a578"

        -- Diagnostics
        colors.error = c.bright_red or c.red or "#cf6d7b"
        colors.warning = c.yellow or "#c4a578"
        colors.info = highlight
        colors.hint = c.bright_cyan or "#7da8bc"
        colors.todo = highlight

        -- Git
        colors.git = {
          add = c.green or "#7a9a88",
          change = border,
          delete = c.red or "#b85866",
          ignore = muted,
        }
      end,
      on_highlights = function(hl, c)
        hl.CursorLine = { bg = c.bg_highlight }
        hl.CursorLineNr = { fg = c.border_highlight, bold = true }
        hl.LineNr = { fg = c.comment }
        hl.FloatBorder = { fg = c.border, bg = c.bg_float }
        hl.NormalFloat = { bg = c.bg_float }
        hl.StatusLine = { fg = c.fg, bg = c.bg_statusline }
        hl.StatusLineNC = { fg = c.comment, bg = c.bg_statusline }
        hl.WinSeparator = { fg = c.border }
        hl.Visual = { bg = c.bg_visual }
        hl.Search = { fg = c.fg, bg = c.blue0 }
        hl.CurSearch = { fg = c.bg, bg = c.border_highlight, bold = true }
      end,
    },
  },

  -- Tell LazyVim to load tokyonight-night
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },

  -- Disable Base2Tone so it does not override the system theme
  {
    "atelierbram/Base2Tone-nvim",
    enabled = false,
  },
}
