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
vim.api.nvim_set_keymap("n", "<leader>c", ":bdelete<CR>", {noremap = true, silent = true})

-- Quit
vim.api.nvim_set_keymap("n", "<leader>q", ":q!<CR>", {noremap = true, silent = true})

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
-- change workign dir
-- vim.api.nvim_set_keymap('n', '<Leader>cd', ':cd %:p:h<CR>:pwd<CR>', { noremap = true, silent = true })

local mappings = {
    ["c"] = "Close Buffer",
    ["e"] = "Explorer",
    ["t"] = "Terminal",
    ["n"] = "No Highlight",
    ["l"] = "Lazy Git",
    ["a"] = "Select All",
    ["q"] = "Exit",
    ["="] = "Balance window",
    ["v"] = "Vertical Split",
    ["h"] = "Horizontal Split",
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
  m = {
    name = "+Hop",
    w = {"<cmd>HopWord<CR>", 'Word'},
    m = {"<cmd>HopChar2<CR>", '2 Char'},
    n = {"<cmd>HopChar1<CR>", '1 Char'},
    l = {"<cmd>HopLine<CR>", 'Line'},
    p = {"<cmd>HopPattern<CR>", 'Pattern'}
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

-- local mappings = {
--     ["/"] = "Comment",
--     ["c"] = "Close Buffer",
--     ["e"] = "Explorer",
--     ["f"] = "Find File",
--     ["h"] = "No Highlight",
--     d = {
--         name = "+Debug",
--         b = {"<cmd>DebugToggleBreakpoint<cr>", "Toggle Breakpoint"},
--         c = {"<cmd>DebugContinue<cr>", "Continue"},
--         i = {"<cmd>DebugStepInto<cr>", "Step Into"},
--         o = {"<cmd>DebugStepOver<cr>", "Step Over"},
--         r = {"<cmd>DebugToggleRepl<cr>", "Toggle Repl"},
--         s = {"<cmd>DebugStart<cr>", "Start"}
--     },
--     g = {
--         name = "+Git",
--         j = {"<cmd>NextHunk<cr>", "Next Hunk"},
--         k = {"<cmd>PrevHunk<cr>", "Prev Hunk"},
--         p = {"<cmd>PreviewHunk<cr>", "Preview Hunk"},
--         r = {"<cmd>ResetHunk<cr>", "Reset Hunk"},
--         R = {"<cmd>ResetBuffer<cr>", "Reset Buffer"},
--         s = {"<cmd>StageHunk<cr>", "Stage Hunk"},
--         u = {"<cmd>UndoStageHunk<cr>", "Undo Stage Hunk"},
--         o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
--         b = {"<cmd>Telescope git_branches<cr>", "Checkout branc"},
--         c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
--         C = {"<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)"},
--     },
--     l = {
--         name = "+LSP",
--         a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
--         A = {"<cmd>Lspsaga range_code_action<cr>", "Selected Action"},
--         d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
--         D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
--         f = {"<cmd>LspFormatting<cr>", "Format"},
--         i = {"<cmd>LspInfo<cr>", "Info"},
--         l = {"<cmd>Lspsaga lsp_finder<cr>", "LSP Finder"},
--         L = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
--         p = {"<cmd>Lspsaga preview_definition<cr>", "Preview Definition"},
--         q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
--         r = {"<cmd>Lspsaga rename<cr>", "Rename"},
--         t = {"<cmd>LspTypeDefinition<cr>", "Type Definition"},
--         x = {"<cmd>cclose<cr>", "Close Quickfix"},
--         s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
--         S = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols"}
--     },
--
--     s = {
--         name = "+Search",
--         b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
--         c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
--         d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
--         D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
--         f = {"<cmd>Telescope find_files<cr>", "Find File"},
--         m = {"<cmd>Telescope marks<cr>", "Marks"},
--         M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
--         r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
--         R = {"<cmd>Telescope registers<cr>", "Registers"},
--         t = {"<cmd>Telescope live_grep<cr>", "Text"}
--     },
--     S = {name = "+Session", s = {"<cmd>SessionSave<cr>", "Save Session"}, l = {"<cmd>SessionLoad<cr>", "Load Session"}}
-- }

local wk = require("which-key")
wk.register(mappings, opts)
