return {
  {
    -- better w,e,b motions
    "chrisgrieser/nvim-spider",
    keys = {
        { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
        { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
        { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
      },
  },
  {
    -- teleport around
    "ggandor/leap.nvim",
    lazy=false,
    config = function()
      require('leap').set_default_mappings()
    end,
  },
  -- change brackets easily
  {
    "tpope/vim-surround",
    event = "BufEnter",
  },
  -- add bracket pairs automatically
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  }
}
