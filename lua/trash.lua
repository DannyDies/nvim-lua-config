-------------------------- which-key.lua
  -- s = {
  --   name = '+Dashboard',
  --   s = {":SearchSession<CR>", 'Search Sessions'},
  --   d = {":Dashboard<CR>", 'Dashboard'},
  --   S = {":SaveSession<CR>", "Save Session"},
  --   r = {":RestoreSession<CR>", "Restore Session"},
  --   d = {":DeleteSession<CR>", "Delete Session"}
    -- l = {":SessionLoad<CR>", "Load Session"},
    -- S = {":SessionSave<CR>", "Save Session"}
  -- s = {
  --   name = '+Dashboard',
  --   s = {":SearchSession<CR>", 'Search Sessions'},
  --   d = {":Dashboard<CR>", 'Dashboard'},
  --   S = {":SaveSession<CR>", "Save Session"},
  --   r = {":RestoreSession<CR>", "Restore Session"},
  --   d = {":DeleteSession<CR>", "Delete Session"}
    -- l = {":SessionLoad<CR>", "Load Session"},
    -- S = {":SessionSave<CR>", "Save Session"}
  -- },


-- depens on debugpy venv
-- vim.api.nvim_set_keymap('n', '<Leader>b', '<cmd>call Black()<cr>', { noremap = true, silent = true })
-- change workign dir
-- vim.api.nvim_set_keymap('n', '<Leader>cd', ':cd %:p:h<CR>:pwd<CR>', { noremap = true, silent = true })

---------------------------- keymapping.lua

--[[ vim.api.nvim_set_keymap('n', 'H', 'g0',  opts)
vim.api.nvim_set_keymap('n', 'L', 'g$',  opts)
vim.api.nvim_set_keymap('v', 'H', 'g0',  opts)
vim.api.nvim_set_keymap('v', 'L', 'g$',  opts) ]]


-- things I never need
-- capslock esc
--[[ vim.api.nvim_set_keymap('n', '<capslock>', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<capslock>', '<ESC>', {noremap = true, silent = true}) ]]
-- Insert mode escape
--[[ vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'ii', '<ESC>', {noremap = true, silent = true}) ]]




  --[[ t = {
    name = '+Term',
    t = {":ToggleTerm<CR>", 'Toggle terminal'},
    f = {":Lspsaga open_floaterm<CR>", "Float Term"}
  }, ]]



--[[ vim.cmd"nnoremap <silent> <Leader>tf <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>" -- or open_float_terminal('lazygit')<CR>
vim.cmd"nnoremap <silent> <Leader>tf <C-\\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>"
vim.cmd"nnoremap <silent> <Leader>tc <C-\\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>"  ]]



-- float terminal also you can pass the cli command in open_float_terminal function
--[[ vim.cmd"nnoremap <silent> <A-w> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>" -- or open_float_terminal('lazygit')<CR>
vim.cmd"tnoremap <silent> <A-w> <C-\\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>" ]]
