vim.cmd'set nocompatible'
vim.cmd'filetype plugin on'
vim.cmd'syntax on'
vim.o.conceallevel = 0 -- show conceal text normally. I can see `` in markdown files

vim.g.vimwiki_list = {
{
    path = '/home/dannydies/Second-Brain/',
    syntax = 'default',
    ext = '.md',
    name = 'Scratchpad',
    index = '-000 Scratchpad'
}
}
-- vim.cmd'autocmd FileType vimwiki set ft=markdown'

vim.cmd'autocmd BufEnter * silent! lcd %:p:h'


-- vim.api.nvim_set_keymap('n', '<C-CR>', '<NOP>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<C-CR>', '<Plug>VimwikiVSplitLink', {noremap = true, silent = true})

--Autocomplete
-- ctrl + k, j autocomplete
-- vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')
-- tab autocomplete
-- vim.cmd('inoremap <expr> <TAB> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <S-TAB> (\"\\<C-p>\")')

-- Give me my tab back! 
vim.cmd'map <leader>j <Plug>VimwikiNextLink'
vim.cmd'map <leader>k <Plug>VimwikiPrevLink'
-- Split! Work! 
vim.cmd'map <leader>wv <Plug>VimwikiSplitLink'
vim.cmd'map <leader>ws <Plug>VimwikiVSplitLink'

-- vim.cmd'map <leader>ww <Plug>VimwikiIndex<bar>:cd %:p:h<CR>'

