local wezterm = require 'wezterm'

local config = {}

config.font = wezterm.font 'JetBrains Mono'
config.window_background_opacity = 0.85

config.force_reverse_video_cursor = true
config.colors = {
    foreground = '#d8d8d8',
    background = '#181818',
    ansi = {
        "#181818",
        "#ac4242",
        "#90a959",
        "#f4bf75",
        "#6a9fb5",
        "#aa759f",
        "#75b5aa",
        "#d8d8d8"
    },
    brights = {
        "#6b6b6b",
        "#c55555",
        "#aac474",
        "#feca88",
        "#82b8c8",
        "#c28cb8",
        "#93d3c3",
        "#f8f8f8"
    }

}

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = true

return config
