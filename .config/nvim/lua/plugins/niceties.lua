return {
	{
		-- nicer help pages
		"OXY2DEV/helpview.nvim",
		lazy = false,
	},
	{
		"saxon1964/neovim-tips",
		version = "*", -- Only update on tagged releases
		lazy = false, -- Load on startup for daily tip
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			-- OPTIONAL: Daily tip mode (default: 1)
			daily_tip = 1, -- 0 = off, 1 = once per day, 2 = every startup
			bookmark_symbol = " ",
		},
		init = function()
			local map = vim.keymap.set
			map("n", "<leader>tt", ":NeovimTips<CR>", { desc = " Neovim tips", silent = true })
			map("n", "<leader>tb", ":NeovimTipsBookmarks<CR>", { desc = " Bookmarked tips", silent = true })
			map("n", "<leader>tr", ":NeovimTipsRandom<CR>", { desc = " Show random tip", silent = true })
			map("n", "<leader>ta", ":NeovimTipsAdd<CR>", { desc = "󰗛 Add your Neovim tip", silent = true })
			map("n", "<leader>te", ":NeovimTipsEdit<CR>", { desc = " Edit your Neovim tips", silent = true })
			map("n", "<leader>tp", ":NeovimTipsPdf<CR>", { desc = " Open Neovim tips PDF", silent = true })
			map("n", "<leader>th", ":help neovim-tips<CR>", { desc = "󰮥 Neovim tips help", silent = true })
		end,
	},
	{
		-- better folds
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		event = "BufEnter",
		config = function()
			vim.o.foldcolumn = "1" -- '0' is not bad
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})
		end,
	},
}
