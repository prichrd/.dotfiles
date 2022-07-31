local M = {}

M._select_callbacks = {}

M.picker = function(cfg)
  local ui = vim.api.nvim_list_uis()[1]
  local height = math.floor(ui.height * cfg.height_percent)
  local width = math.floor(ui.width * cfg.width_percent)

  local bufnr = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(bufnr, "bufhidden", "wipe")

  local win_id = vim.api.nvim_open_win(bufnr, true, {
    relative = 'editor',
    width = width,
    height = height,
    col = (ui.width - width) / 2,
    row = (ui.height - height) / 2,
    style = 'minimal',
    focusable = true,
    border = 'none'
  })

  if cfg.cursorline then
    vim.api.nvim_win_set_option(win_id, 'cursorline', true)
  end

  if cfg.select_callback then
    M._select_callbacks[bufnr] = function()
      local row, _ = unpack(vim.api.nvim_win_get_cursor(win_id))
      cfg.select_callback(cfg.data[row])
      vim.api.nvim_win_close(win_id, true)
    end
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "<CR>",
      '<cmd>lua require("prichrd.ui").execute_select_callback(' .. bufnr .. ')<CR>',
      { noremap = true }
    )
  end

  local lines = {}
  for i = 1, #cfg.data do
    lines[i] = cfg.format(cfg.data[i])
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)
  vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)
  vim.api.nvim_buf_set_keymap(
    bufnr, "n",
    "<ESC>",
    "<cmd>q<CR>",
    { noremap = true }
  )
end

M.execute_select_callback = function(bufnr)
  if M._select_callbacks[bufnr] then
    local fx = M._select_callbacks[bufnr]
    fx()
    M._select_callbacks[bufnr] = nil
  end
end

return M
