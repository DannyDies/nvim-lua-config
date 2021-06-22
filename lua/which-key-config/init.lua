require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

-- Set leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- no hl
vim.api.nvim_set_keymap('n', '<Leader>n', ':set hlsearch!<CR>', {noremap = true, silent = true})

-- explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- close buffer
vim.api.nvim_set_keymap("n", "<leader>c", ":BufDel<CR>", {noremap = true, silent = true})

-- Quit
-- vim.api.nvim_set_keymap("n", "<leader>q", ":q!<CR>", {noremap = true, silent = true})

-- terminal
vim.api.nvim_set_keymap('n', '<Leader>t', ":ToggleTerm<CR>", {silent = true})

-- Lazy git
vim.api.nvim_set_keymap('n', '<Leader>l', ':LazyGit<CR>', {noremap = true, silent = true})
-- Select All
vim.api.nvim_set_keymap('n', '<Leader>a', 'ggVG', { noremap = true, silent = true })

-- Balance window
vim.api.nvim_set_keymap('n', '<Leader>=', '<C-W>=', { noremap = true, silent = true })
-- Do split
vim.api.nvim_set_keymap('n', '<Leader>v', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>h', ':split<CR>', { noremap = true, silent = true })
-- depens on debugpy venv
-- vim.api.nvim_set_keymap('n', '<Leader>b', '<cmd>call Black()<cr>', { noremap = true, silent = true })
-- change workign dir
-- vim.api.nvim_set_keymap('n', '<Leader>cd', ':cd %:p:h<CR>:pwd<CR>', { noremap = true, silent = true })

local mappings = {
    ["c"] = "Close Buffer",
    ["e"] = "Explorer",
    ["t"] = "Terminal",
    ["n"] = "No Highlight",
    ["l"] = "Lazy Git",
    ["a"] = "Select All",
    -- ["q"] = "Exit",
    ["="] = "Balance window",
    ["v"] = "Vertical Split",
    ["h"] = "Horizontal Split",
    -- ["b"] = "Black Formatter",
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
  s = {
    name = '+Session',
    c = {":SClose<CR>", 'Close Session'},
    d = {":SDelete<CR>", "Delete Session"},
    l = {":SLoad<CR>", "Load Session"},
    s = {":Startify<CR>", 'Start Page'},
    S = {":SSave<CR>", "Save Session"}
  },
  f = {
    name = '+Telescope',

    s =  {"<Cmd>lua require(\'telescope.builtin\').find_files()<CR>", "Default Files Search"},
    f =  {"<Cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>", "Find files"},
    g =  {"<Cmd>lua require(\'telescope.builtin\').live_grep()<CR>", "Text Search"},
    b =  {"<Cmd>lua require(\'telescope.builtin\').buffers()<CR>", "Buffers"},
    c =  {"<Cmd>lua require'telescope-config.finders'.fd_in_nvim()<cr>", "Nvim config"},
    n =  {"<Cmd>lua require'telescope-config.finders'.fd_in_notes()<cr>", "Notes"}
  },
  d = {

        name = "+Debug",
        b = {"<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint"},
        l = {"<cmd>lua require'dap'.continue()<CR>", "Continue"},
        k = {"<cmd>lua require'dap'.step_over()<CR>", "Step over"},
        j = {"<cmd>lua require'dap'.step_into()<CR>", "Step into"},
        r = {"<cmd>lua require'dap'.repl.open()<CR>", "Repl state"},
        m = {"<cmd>lua require('dap-python').test_method()<CR>", "Test py-method"},
        c = {"<cmd>lua require('dap-python').test_class()<CR>", "Test py-class"}
        -- s = {"<ESC><cmd>lua require('dap-python').debug_selection()<CR>", "Start py-debug session"},
    },
    l = {
        name = "+LSP",
        a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
        A = {"<cmd>Lspsaga range_code_action<cr>", "Selected Action"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = {"<cmd>LspFormatting<cr>", "Format"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        l = {"<cmd>Lspsaga lsp_finder<cr>", "LSP Finder"},
        L = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
        p = {"<cmd>Lspsaga preview_definition<cr>", "Preview Definition"},
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
        r = {"<cmd>Lspsaga rename<cr>", "Rename"},
        t = {"<cmd>LspTypeDefinition<cr>", "Type Definition"},
        x = {"<cmd>cclose<cr>", "Close Quickfix"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        S = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols"}
    }

}

--[[ vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>")
vim.cmd("nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>")
vim.cmd("nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>")
vim.cmd("nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>")
vim.cmd("nnoremap <silent> ca :Lspsaga code_action<CR>")
vim.cmd("nnoremap <silent> K :Lspsaga hover_doc<CR>")
-- vim.cmd('nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>')
vim.cmd("nnoremap <silent> <C-p> :Lspsaga diagnostic_jump_prev<CR>")
vim.cmd("nnoremap <silent> <C-n> :Lspsaga diagnostic_jump_next<CR>")
-- scroll down hover doc or scroll in definition preview
vim.cmd("nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
-- scroll up hover doc
vim.cmd("nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()') ]]

-- LSP
--[[ vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-m>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts) ]]
----------------------------------------
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
-- TODO remap this stuff
--[[ nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>

-- scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
-- scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>


nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>


-- show
nnoremap <silent><leader>cd <cmd>lua
require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
-- only show diagnostic if cursor is over the area
nnoremap <silent><leader>cc <cmd>lua
require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
-- jump diagnostic
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>


-- float terminal also you can pass the cli command in open_float_terminal function
nnoremap <silent> <A-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR> -- or open_float_terminal('lazygit')<CR>
tnoremap <silent> <A-d> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>
 ]]

local wk = require("which-key")
wk.register(mappings, opts)
