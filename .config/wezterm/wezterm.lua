local wezterm = require 'wezterm'

local config = {}

config.color_scheme = 'catppuccin-mocha'

-- Get home dir
local homeDir = os.getenv('HOME')

-- Font
config.font_dirs = { homeDir .. '/.local/share/fonts' }
config.font = wezterm.font("JetbrainsMono Nerd Font")

config.font_size = 12.0

-- Tab bar
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 16
config.mouse_wheel_scrolls_tabs = false
config.show_new_tab_button_in_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

config.window_background_opacity = 0.8;
config.window_background_image = nil
config.initial_rows = 50;
config.initial_cols = 200;

config.keys = {
    { key = "f", mods = "CTRL|ALT", action = "ToggleFullScreen" },
}

return config
