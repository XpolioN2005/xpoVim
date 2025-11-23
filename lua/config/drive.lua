local M = {}

M.select_drive_popup = function()
  local drives = { "CWD", "C:/", "D:/" }
  local buf = vim.api.nvim_create_buf(false, true)

  local lines = {}
  for i, d in ipairs(drives) do
    table.insert(lines, string.format("%d. %s", i, d))
  end
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local width = 25
  local height = #lines
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    style = "minimal",
    border = "rounded",
  })

  vim.api.nvim_win_set_option(win, "cursorline", true)
  vim.cmd("hi CursorLine cterm=NONE ctermbg=236 guibg=Grey20")

  -- Number keys
  for i, d in ipairs(drives) do
    vim.api.nvim_buf_set_keymap(buf, "n", tostring(i),
      string.format("<cmd>lua vim.api.nvim_win_close(%d,true); require('telescope').extensions.file_browser.file_browser({ cwd='%s' })<CR>", 
        win, d == "Current" and vim.loop.cwd() or d),
      { noremap = true, silent = true }
    )
  end

  -- Enter key
  vim.api.nvim_buf_set_keymap(buf, "n", "<CR>",
    "",
    { noremap = true, silent = true, callback = function()
        local line = vim.api.nvim_get_current_line()
        local drive = line:match("%S+$")
        vim.api.nvim_win_close(win, true)
        local cwd = drive == "Current" and vim.loop.cwd() or drive
        require('telescope').extensions.file_browser.file_browser({ cwd = cwd })
    end }
  )

  -- Esc closes the window
  vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>",
    string.format("<cmd>lua vim.api.nvim_win_close(%d,true)<CR>", win),
    { noremap = true, silent = true }
  )
end

return M
