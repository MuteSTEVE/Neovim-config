local status_ok, session = pcall(require, "session_manager")
if not status_ok then
  return
end

local status_ok, Path = pcall(require, "plenary.path")
if not status_ok then
  return
end

local status_ok, config = pcall(require, "session_manager.config")
if not status_ok then
  return
end

session.setup({
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'config'),
  session_filename_to_dir = session_filename_to_dir,
  dir_to_session_filename = dir_to_session_filename,
  autoload_mode = config.AutoloadMode.Disabled,
  autosave_last_session = true,
  autosave_ignore_not_normal = true,
  autosave_ignore_dirs = {},
  autosave_ignore_filetypes = {
    'gitcommit',
    'gitrebase',
  },
  autosave_ignore_buftypes = {},
  autosave_only_in_session = false,
  max_path_length = 80,
})
