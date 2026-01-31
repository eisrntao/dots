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
		"https://codeberg.org/andyg/leap.nvim",
		lazy = false,
		config = function()
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
			vim.keymap.set("n", "gs", "<Plug>(leap-from-window)")
			vim.keymap.set({ "n", "x", "o" }, "S", function()
				require("leap.treesitter").select({
					opts = require("leap.user").with_traversal_keys("R", "r"),
				})
			end)
			require("leap").opts.preview = function(ch0, ch1, ch2)
				return not (ch1:match("%s") or (ch0:match("%a") and ch1:match("%a") and ch2:match("%a")))
			end
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
		config = true,
	},
}
