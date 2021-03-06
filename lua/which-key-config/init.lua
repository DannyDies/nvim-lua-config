require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
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

-- terminal
vim.api.nvim_set_keymap('n', '<Leader>t', ":ToggleTerm<CR>", {silent = true})

-- Lazy git
vim.api.nvim_set_keymap('n', '<Leader>g', ':LazyGit<CR>', {noremap = true, silent = true})

-- Select All
vim.api.nvim_set_keymap('n', '<Leader>a', 'ggVG', { noremap = true, silent = true })

-- Balance window
vim.api.nvim_set_keymap('n', '<Leader>=', '<C-W>=', { noremap = true, silent = true })
-- Do split
vim.api.nvim_set_keymap('n', '<Leader>v', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>h', ':split<CR>', { noremap = true, silent = true })

-- Change 2 split windows from vert to horiz or horiz to vert
vim.api.nvim_set_keymap('n', '<Leader>[', '<C-w>t<C-w>K', { noremap = true, silent = true }) -- from vertical to horizontal
vim.api.nvim_set_keymap('n', '<Leader>]', '<C-w>t<C-w>H', { noremap = true, silent = true }) -- from horizontal to vertical

local mappings = {
    ["c"] = "Close Buffer",
    ["e"] = "Explorer",
    ["t"] = "Terminal",
    ["n"] = "No Highlight",
    ["g"] = "Lazy Git",
    ["a"] = "Select All",
    ["="] = "Balance window",
    ["v"] = "Vertical Split",
    ["h"] = "Horizontal Split",
    ["["] = "From ver to hor",
    ["]"] = "From hor to ver",
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
    },
    l = {
        name = "+LSP",
        a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
        A = {"<cmd>Lspsaga range_code_action<cr>", "Selected Action"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        l = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
        L = {"<cmd>Lspsaga lsp_finder<cr>", "LSP Finder"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
        x = {"<cmd>cclose<cr>", "Close Quickfix"},
        p = {"<cmd>Lspsaga preview_definition<cr>", "Preview Definition"},
        r = {"<cmd>Lspsaga rename<cr>", "Rename"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        S = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols"},
        -- f = {"<cmd>LspFormatting<cr>", "Format"},
        -- t = {"<cmd>LspTypeDefinition<cr>", "Type Definition"},
        -- b = {"<cmd>lua vim.lsp.buf.rename()<CR>", "Rename buffer"},
        w = {
          name = "+Workspace",
          a = {"<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add workspace"},
          r = {"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Delete workspace"},
          l = {"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List workspaces"}
          }
    }

}

local wk = require("which-key")
wk.register(mappings, opts)
