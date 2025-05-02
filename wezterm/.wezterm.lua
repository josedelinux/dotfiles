local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

local config = {}

config.check_for_updates = false

-- config.enable_scroll_bar = true
config.scrollback_lines = 65536

-- config.color_scheme = 'Batman'
-- config.color_scheme = "Catppuccin Frappe"
-- config.color_scheme = "Builtin Solarized Dark"
-- config.color_scheme = 'Molokai (Gogh)'
config.color_scheme = "Molokai"

-- config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
	"JetBrains Mono",
})
config.font_size = 11

config.window_background_opacity = 0.85

config.hide_tab_bar_if_only_one_tab = true

-- Using shell
local launch_menu = {}
local default_prog = {}
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	-- term = '' -- Set to empty so FZF works on windows
	table.insert(launch_menu, {
		label = "PowerShell",
		args = { "pwsh.exe", "-NoLogo" },
	})
	table.insert(launch_menu, {
		label = "Windows PowerShell",
		args = { "powershell.exe", "-NoLogo" },
	})
	table.insert(launch_menu, {
		label = "wsl",
		args = { "wsl.exe", "--cd", "~" },
	})
	default_prog = { "pwsh.exe", "-NoLogo" }
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

local function toggle_override(window, override, params)
	local overrides = window:get_config_overrides() or {}

	print(overrides[override])
	if not overrides[override] then
		overrides[override] = params
	else
		overrides[override] = nil
	end

	window:set_config_overrides(overrides)
end

wezterm.on("toggle-opacity", function(window, _)
	toggle_override(window, "window_background_opacity", 1)
end)

wezterm.on("toggle-ligature", function(window, _)
	toggle_override(window, "harfbuzz_features", {
		"calt=0",
		"clig=0",
		"liga=0",
	})
end)

-- Keybinds
-- `wezterm show-keys --lua` to see assignments

config.keys = {
	{ key = "l", mods = "ALT", action = wezterm.action.ShowLauncher },
	{ key = "o", mods = "ALT", action = wezterm.action.EmitEvent("toggle-opacity") },
	{ key = "e", mods = "ALT", action = wezterm.action.EmitEvent("toggle-ligature") },
}

return config
