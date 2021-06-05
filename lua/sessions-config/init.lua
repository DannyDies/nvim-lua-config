local opts = {
  log_level = 'error',
  auto_session_enable_last_session = false,
  -- auto_session_root_dir = "/home/dannydies/.config/nvim/sessions/",
  auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  auto_session_enabled = false,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = nil
}

require('auto-session').setup(opts)
require('session-lens').setup {
  shorten_path = false,
  theme_conf = { border = true },
  -- previewer = true
}

require("telescope").load_extension("session-lens")
