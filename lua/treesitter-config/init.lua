require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {enable = false},
    indent = {enable = true},
    autotag = {enable = true},
    rainbow = {
      enable = true,
      extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    --   colors = {
    --       "#d5508f",
    --       "#ff0099",
    --       "#ff46eb",
    --       "#cf55f0",
    --       "#ffb7b7",
    --       "#af30af",
    --       "#ffb9fa",
    -- }
    }
}
