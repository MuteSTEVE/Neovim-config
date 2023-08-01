local status_ok, centered = pcall(require, 'stay-centered')
if not status_ok then
  return
end

centered.setup({
  -- skip_filetypes = {"lua", "typescript"},
})
