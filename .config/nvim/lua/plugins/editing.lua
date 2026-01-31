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
		lazy = false,
		config = function()
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
			vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
			vim.keymap.set("n", "gs", "<Plug>(leap-from-window)")
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
