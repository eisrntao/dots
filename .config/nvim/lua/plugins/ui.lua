return {
	{
		-- statusline
		"sschleemilch/slimline.nvim",
		opts = {
			style = "fg",
			bold = true,
			hl = {
				secondary = "Comment",
			},
			configs = {
				mode = {
					hl = {
						normal = "Type",
						visual = "Keyword",
						insert = "Function",
						replace = "Statement",
						command = "String",
						other = "Function",
					},
				},
				path = {
					hl = {
						primary = "Label",
					},
				},
				git = {
					hl = {
						primary = "Function",
					},
				},
				filetype_lsp = {
					hl = {
						primary = "String",
					},
				},
			},
		},
	},
	{
		"nvimdev/indentmini.nvim",
		event = "BufEnter",
		config = function()
			require("indentmini").setup({})
			vim.cmd.highlight("IndentLine guifg=#23233a")
			vim.cmd.highlight("IndentLineCurrent guifg=#23233a")
		end,
	},
}
