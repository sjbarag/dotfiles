local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Copied from https://wezfurlong.org/wezterm/config/lua/wezterm.gui/get_appearance.html
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'rose-pine'
  else
    return 'rose-pine-dawn'
  end
end
config.color_scheme = scheme_for_appearance(get_appearance())

config.font = wezterm.font 'Iosevka Fixed SS04'
config.font_size = 15.0

-- Hide the tab bar.
config.enable_tab_bar = false

-- And almost all of the window chrome.
-- On macOS, you can still grab the top few pixels of a window to drag it
-- around.
config.window_decorations = "RESIZE"

-- Add tmux pane separator to keep it out of the double-click selection.
config.selection_word_boundary = " \t\n{}[]()\"'`│"
-- default value:                 ~~~~~~~~~~~~~~~
-- tmux pane separator:                          ~

-- Use the more advanced wezterm terminfo defs
config.term = 'wezterm'

-- Disable the terminal bell. No beep pls.
config.audible_bell = "Disabled"

return config
