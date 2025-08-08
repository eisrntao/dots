return {
	{
		-- pretty rendering
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			completions = { blink = { enabled = true } },
		},
	},
	{
		-- markdown editing tools
		"tadmccorkle/markdown.nvim",
		ft = "markdown", -- or 'event = "VeryLazy"'
		opts = {},
		keys = {
			{ "<localleader>c", "<CMD>MDToc<CR>", desc = "Show table of contents for this file", ft = "markdown" },
			{ "<localleader>t", "<CMD>MDTaskToggle<CR>", desc = "Toggle checkbox", ft = "markdown" },
			{ "<S-CR>", "<CMD>MDListItemBelow<CR>", mode = "i", desc = "Insert list item", ft = "markdown" },
		},
	},
}
