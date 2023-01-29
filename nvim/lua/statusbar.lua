require('lualine').setup {
  options = {
    theme = 'tokyonight'
    -- ... your lualine config
  },
  sections = {lualine_c = {require('auto-session-library').current_session_name}}
}

