local opts = { noremap = true, silent = true }


-- HOP!
-- vim.api.nvim_set_keymap('n', 'z', ":HopChar2<CR>", {silent = true})
-- vim.api.nvim_set_keymap('n', 'Z', ":HopWord<CR>", {silent = true})


-- ctrl+q close buffer
vim.api.nvim_set_keymap('n', '<C-q>', ':bd<CR>', opts)
-- ctrl+s for save
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', opts)
-- ctrl+c for close floating stuff or splits
vim.api.nvim_set_keymap('n', '<C-c>', ':close<CR>', opts)

-- Mapping U to Redo.
vim.api.nvim_set_keymap('', 'U', '<C-r>', opts)
vim.api.nvim_set_keymap('', '<C-r>', '<NOP>', opts)

-- Tab indent in insert mode
vim.api.nvim_set_keymap('i', '<Tab>', '\t', opts)
vim.api.nvim_set_keymap('i', '<S-Tab>', '\b', opts)

-- stay in normal mode after inserting a new line
-- vim.api.nvim_set_keymap('', 'o', 'o <Bs><Esc>', opts)
-- vim.api.nvim_set_keymap('', 'O', 'O <Bs><Esc>', opts)

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true})


--
-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
  if vim.o.mouse == 'a' then
    vim.cmd[[IndentBlanklineDisable]]
    vim.wo.signcolumn='no'
    vim.o.mouse = 'v'
    vim.wo.number = false
    print("Mouse disabled")
  else
    vim.cmd[[IndentBlanklineEnable]]
    vim.wo.signcolumn='yes'
    vim.o.mouse = 'a'
    vim.wo.number = true
    print("Mouse enabled")
  end
end
vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua ToggleMouse()<cr>', { noremap = true })

-- H and L for beggining and end visual line
vim.api.nvim_set_keymap('n', 'H', 'g^',  opts)
vim.api.nvim_set_keymap('n', 'L', 'g$',  opts)
vim.api.nvim_set_keymap('v', 'H', 'g^',  opts)
vim.api.nvim_set_keymap('v', 'L', 'g$',  opts)

-- Resize windows
vim.api.nvim_set_keymap('n', '<M-j>', ':resize -2<CR>',  opts)
vim.api.nvim_set_keymap('n', '<M-k>', ':resize +2<CR>',  opts)
vim.api.nvim_set_keymap('n', '<M-h>', ':vertical resize -2<CR>',  opts)
vim.api.nvim_set_keymap('n', '<M-l>', ':vertical resize +2<CR>',  opts)

-- Nav between splits
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true })

-- Keep selection in visual mode when shifting
vim.api.nvim_set_keymap('v', '<', '<gv',  opts)
vim.api.nvim_set_keymap('v', '>', '>gv',  opts)

-- Escape what I never used
vim.api.nvim_set_keymap('i', 'jk', '<ESC>',  opts)
vim.api.nvim_set_keymap('i', 'kj', '<ESC>',  opts)
vim.api.nvim_set_keymap('i', 'jj', '<ESC>',  opts)

-- Tab buffer toggle
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>',  opts)
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprev<CR>',  opts)

--Autocomplete
-- ctrl + k, j autocomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')
-- tab autocomplete
vim.cmd('inoremap <expr> <TAB> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <S-TAB> (\"\\<C-p>\")')
-- if autocomplete popup menu opens pressing enter will complete the first match
vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? "<C-n><Esc>a" : "<CR>"', { noremap = true, expr = true, silent = true})

-- I like to move it move it!
vim.api.nvim_set_keymap('x', '<A-K>', ':move \'<-2<CR>gv-gv',  opts)
vim.api.nvim_set_keymap('x', '<A-J>', ':move \'>+1<CR>gv-gv',  opts)
vim.api.nvim_set_keymap('n', '<A-K>', ':move -2<CR>==',  opts)
vim.api.nvim_set_keymap('n', '<A-J>', ':move +1<CR>==',  opts)
vim.api.nvim_set_keymap('i', '<A-J>', "<ESC>:move .+1<CR>==gi",  opts)
vim.api.nvim_set_keymap('i', '<A-K>', "<ESC>:move .-2<CR>==gi",  opts)
vim.api.nvim_set_keymap('v', '<A-J>', ":move '>+1<CR>gv=gv",  opts)
vim.api.nvim_set_keymap('v', '<A-K>', ":move '<-2<CR>gv=gv",  opts)

-- LSP
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-m>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)


-- Terminal nav, seems workings
-- vim.api.nvim_set_keymap('t', '<C-h>', [[<C-\><C-N><C-w>h]], opts)
-- vim.api.nvim_set_keymap('t', '<C-k>', [[<C-\><C-N><C-w>k]], opts)
-- vim.api.nvim_set_keymap('t', '<C-l>', [[<C-\><C-N><C-w>l]], opts)
-- vim.api.nvim_set_keymap('t', '<C-j>', [[<C-\><C-N><C-w>j]], opts)
-- vim.api.nvim_set_keymap('i', '<C-h>', [[<C-\><C-N><C-w>h]], opts)
-- vim.api.nvim_set_keymap('i', '<C-j>', [[<C-\><C-N><C-w>j]], opts)
-- vim.api.nvim_set_keymap('i', '<C-k>', [[<C-\><C-N><C-w>k]], opts)
-- vim.api.nvim_set_keymap('i', '<C-l>', [[<C-\><C-N><C-w>l]], opts)
-- vim.api.nvim_set_keymap('i', '<Esc>', [[<C-\><C-n>]], opts)
--Remap escape to leave terminal mode
vim.api.nvim_exec([[
  augroup Terminal
    autocmd!
    au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    au TermOpen * set nonu
  augroup end
]], false)


