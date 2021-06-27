--------------------------- Basics
-- vim.g.python3_host_prog = '/home/dannydies/.virtualenvs/global/bin/'
-- vim.g.python3_host_prog = '/usr/bin/python'
vim.cmd('set inccommand=split') -- Make substitution work in realtime

vim.g.XkbSwitchEnabled = 1 -- remember insert mode layout and return to eng layout in normal mode
vim.o.fileencoding = "utf-8"
vim.o.encoding      = "UTF-8"             -- encodig utf-8
vim.o.mouse = "a" -- mouse support
vim.o.clipboard = vim.o.clipboard .. "unnamedplus" -- oow yeeaah, baby, I can copy right in you!
vim.o.foldlevel = 99 -- unfold all
------------------------- Swapfile global & local config
vim.o.swapfile = false -- can open already open files
vim.bo.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.autoread = true -- auto file change detection
vim.cmd"autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif" -- auto change file on external change
vim.o.hidden = true  -- allows hidden buffers, this means that a modified buffer doesn't need to be saved when changing
------------------------- Tabing and indenting stuff
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.bo.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.expandtab = true    -- expand tabs to spaces
vim.bo.expandtab = true    -- expand tabs to spaces
vim.o.smarttab = true 	  -- tab infront of a line inserts blanks based on shiftwidth

--[[ Tree sitter manages indent now
vim.o.smartindent = true  -- smart indenting on new line for C-like programs
vim.bo.smartindent = true
vim.o.autoindent = true   -- copy the indentation from previous line
vim.bo.autoindent = true
]]

vim.o.backspace = "indent,eol,start"  -- backspaceever work on insert mode
-- vim.o.whichwrap = 'b,s,<,>,[,],h,l' -- move to the next line at the end and start

------------------------ Search stuff
vim.o.ignorecase = true -- Ignorecase when searching
vim.o.incsearch = true	-- start searching on each keystroke
vim.o.smartcase = true	-- ignore case when lowercase, match case when capital case is used
vim.o.hlsearch = true		-- highlight the search results
vim.o.history = 10000 -- numbers of entries in history for ':' commands and search patterns (10000 = max)

------------------------ Visual stuff
vim.o.title = true
vim.wo.number = true -- line numbers
vim.wo.relativenumber = true -- hate this option
vim.go.termguicolors = true
vim.go.t_Co = "256"
vim.o.showmode = false -- doesn't show vim modes. useful with status lines
vim.wo.cursorline = false   -- show the current line.
vim.o.scrolloff = 9 -- keep 9 lines below and up while scrolling
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.showtabline = 2  -- always show tabs
vim.wo.signcolumn = "yes" -- always single column. otherwise it would shift the text each time
vim.o.pumheight = 10 -- max items in popups
vim.o.cmdheight = 2 -- number line for shell
vim.o.conceallevel = 0 -- show conceal text normally. I can see `` in markdown files

-- By the way pep8 doesn't allow long lines
--vim.wo.wrap         = false               -- do not divide the line if it is long.
--vim.o.sidescrolloff = 5                   -- for nowrap. max side size or something about

-- Tree sitter handle syntax now
-- vim.cmd('syntax on') -- syntax highlighting

 
vim.cmd('filetype plugin on') -- Need for disable autotocomment. without it autocmd doesn't work
vim.cmd('filetype indent on') -- tree sitter manage indent too, but let it be
-- vim.cmd'autocmd FileType python set breakindentopt=shift:4' -- tabs size for python files. now work's fine without it.

-------------------------- Completion stuff
  -- menuone - show popup menu also when there is only one match available
  -- preview - show extra information about currently selected completion
  -- noinsert - do not insert any text for match until the user selects it from the menu
vim.o.completeopt = "menuone,noinsert,noselect"
vim.g.completion_enable_auto_popup = 1
vim.o.shortmess = vim.o.shortmess .. 'c' -- don't give ins-completion-menu messages

-------------------------- Perfomance stuff
vim.o.lazyredraw = true -- useful for when executing macros.

-- Those 2 options break commenting plugin
-- vim.o.ttimeoutlen = 10  -- ms to wait for a key code seq to complete
-- vim.o.timeoutlen = 100 -- ms to wait for mapping. By default timeoutlen is 1000 ms

vim.o.updatetime = 300 -- used for CursorHold event (for document highlighting detection)
-- vim.o.synmaxcol = 160  -- show syntax highlight until column number.

-- Disable auto commenting
-- vim.cmd'autocmd VimEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
vim.cmd'au FileType * setlocal formatoptions-=cro'
-- autochange cwd
vim.cmd'autocmd BufEnter * silent! lcd %:p:h'

------------ Bilt ins
  vim.g.nvim_tree_disable_netrw = true 
  vim.g.loaded_gzip              = 1
  vim.g.loaded_tar               = 1
  vim.g.loaded_tarPlugin         = 1
  vim.g.loaded_zip               = 1
  vim.g.loaded_zipPlugin         = 1
  vim.g.loaded_getscript         = 1
  vim.g.loaded_getscriptPlugin   = 1
  vim.g.loaded_vimball           = 1
  vim.g.loaded_vimballPlugin     = 1
  vim.g.loaded_matchit           = 1
  vim.g.loaded_matchparen        = 1
  vim.g.loaded_2html_plugin      = 1
  vim.g.loaded_logiPat           = 1
  vim.g.loaded_rrhelper          = 1
  vim.g.loaded_netrw             = 1
  vim.g.loaded_netrwPlugin       = 1
  vim.g.loaded_netrwSettings     = 1
  vim.g.loaded_netrwFileHandlers = 1

--------------------------------------  Russian mess
-- oh my goddness
-- vim.cmd[[set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>]]
-- vim.cmd'set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'
-- Extra fix
vim.cmd[[

map zе zt
map zи zb
map zя zz

map zф za

map gп gg


map gг gu
map gГ gU

nmap gм gv

map <Space>. /
]]
-- Default fix
vim.cmd[[map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
]]
