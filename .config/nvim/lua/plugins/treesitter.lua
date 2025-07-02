return {
    {
      "nvim-treesitter/nvim-treesitter",
      branch = 'master',
      lazy = false,
      build = ":TSUpdate",
      config = function()
        require'nvim-treesitter.configs'.setup {
          -- Install languages:
          ensure_installed = {
            "python",
            "lua",
            "vimdoc",
            "markdown",
            "markdown_inline",
            "rust",
            "haskell",
            "bash",
            "html",
            "css",
            "javascript",
            "typst"
          },

          -- Install parsers synchronously (only applied to `ensure_installed`)
          sync_install = false,

          -- Automatically install missing parsers when entering buffer
          -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
          auto_install = false,

          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
        }
      end,
    }
}
