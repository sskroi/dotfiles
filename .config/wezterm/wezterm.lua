local wezterm = require("wezterm")

local config = {}

config.font = wezterm.font_with_fallback({
    "JetBrainsMonoNL Nerd Font",
})

config.enable_wayland = false

config.window_background_opacity = 1
config.color_scheme = "Gruvbox Material (Gogh)"

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.force_reverse_video_cursor = true
config.hide_tab_bar_if_only_one_tab = true

return config
