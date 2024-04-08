-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

local keymaps = require("keymaps")

-- key maps
config.disable_default_key_bindings = true
config.keys = keymaps.keys

-- This is where you actually apply your config choices

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- For example, changing the color scheme:
config.color_scheme = "tokyonight_night"
-- config.color_scheme = "Oxocarbon Dark"
--config.window_background_opacity = 0.85
--config.macos_window_background_blur = 20

config.font = wezterm.font("Fira Code", { weight = "Medium" })
--config.font = wezterm.font("Monaspace Neon", { weight = "Medium" })
config.font_size = 14.0
config.harfbuzz_features = {
	"calt",
	"liga",
	"dlig",
	"ss01",
	"ss02",
}

-- and finally, return the configuration to wezterm
return config
