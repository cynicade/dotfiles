require('auto-session').setup {
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
  auto_session_enabled = true,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  aut_session_allowed_dirs = { "/home/cyn/Dev", "/home/cyn/Uni" },
  auto_session_use_git_branch = true,
  -- the configs below are lua only
  bypass_session_save_file_types = nil
}
