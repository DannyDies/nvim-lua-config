local opts = { noremap = true, silent = true }

-- Easy easy
vim.cmd'map m <Plug>(easymotion-prefix)'
vim.cmd'nmap mm <Plug>(easymotion-overwin-f2)' -- between splits
vim.cmd'nmap mn <Plug>(easymotion-t2)' -- foward only
-- Easy left-right
vim.cmd'map ml <Plug>(easymotion-lineforward)'
vim.cmd'map mh <Plug>(easymotion-linebackward)'
-- Easy search, enter drop highlight
vim.cmd'map  / <Plug>(easymotion-sn)'
vim.cmd'omap / <Plug>(easymotion-tn)'
-- Next and prev jump
vim.cmd'nmap ; <Plug>(easymotion-next)'
vim.cmd'nmap , <Plug>(easymotion-prev)'
-- next and prev 
vim.cmd'map f <Plug>(easymotion-f)'
vim.cmd'map F <Plug>(easymotion-F)'
vim.cmd'map t <Plug>(easymotion-t)'
vim.cmd'map T <Plug>(easymotion-T)'

-- ctrl+q close buffer
vim.api.nvim_set_keymap('n', '<C-q>', ':BufDel<CR>', opts)
-- ctrl+s for save
vim.api.nvim_set_keymap('n', '<C-s>', ':w!<CR>', opts)
-- ctrl+c for close floating stuff or splits
vim.api.nvim_set_keymap('n', '<C-c>', ':close<CR>', opts)
-- Close 10 splits with :q!? No, thanks!
vim.api.nvim_set_keymap('n', 'ZZ', '<cmd>wqall<cr>', opts)
vim.api.nvim_set_keymap('n', 'ZQ', '<cmd>qall!<cr>', opts)

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true})

-- H and L for beggining and end visual line
vim.cmd'noremap H g^'
vim.cmd'noremap L g$'

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

--Remap escape to leave terminal mode
vim.api.nvim_exec([[
  augroup Terminal
    autocmd!
    au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    au TermOpen * set nonu
  augroup end
]], false)

-- Tab indent in insert mode
vim.api.nvim_set_keymap('i', '<Tab>', '\t', opts)
vim.api.nvim_set_keymap('i', '<S-Tab>', '\b', opts)
