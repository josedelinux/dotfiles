local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

local config = {}

config.check_for_updates = false

-- config.enable_scroll_bar = true

-- config.color_scheme = 'Batman'
-- config.color_scheme = "Builtin Solarized Dark"
config.color_scheme = "Catppuccin Frappe"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 11

config.window_background_opacity = 0.85

-- Using shell
local launch_menu = {}
local default_prog = {}
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	-- term = '' -- Set to empty so FZF works on windows
	table.insert(launch_menu, {
		label = "PowerShell",
		args = { "pwsh.exe" },
	})
	table.insert(launch_menu, {
		label = "wsl",
		args = { "wsl.exe", "--cd", "~" },
	})
	default_prog = { "pwsh.exe", "-l" }
elseif wezterm.target_triple == "x86_64-apple-darwin" then
	table.insert(launch_menu, {
		label = "zsh",
		args = { "/bin/zsh", "-l" },
	})
	default_prog = { "zsh" }
elseif wezterm.target_triple == "aarch64-apple-darwin" then
	table.insert(launch_menu, {
		label = "zsh",
		args = { "/opt/homebrew/bin/zsh", "-l" },
	})
	default_prog = { "zsh" }
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
	table.insert(launch_menu, {
		label = "zsh",
		args = { "zsh" },
	})
	table.insert(launch_menu, {
		label = "fish",
		args = { "fish" },
	})
	default_prog = { "fish" }
end

config.default_prog = default_prog
config.launch_menu = launch_menu

return config
