require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {"haskell"},
    highlight = {enable = false},
    indent = {enable = {"javascriptreactpython"}},
    autotag = {enable = true},
    rainbow = {
      enable = true,
      extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
      colors = {
          "#d5508f",
          "#bb0099",
          "#ffa6ff",
          "#cf55f0",
          "#ffb7b7",
          "#af60af",
          "#33dbc3"
    }
    }
}
