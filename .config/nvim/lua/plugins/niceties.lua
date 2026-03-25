return {
	{
		-- nicer help pages
		"OXY2DEV/helpview.nvim",
		lazy = false,
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
	{
		"sphamba/smear-cursor.nvim",
		event = "BufEnter",
		opts = {
			stiffness = 0.8,
			trailing_stiffness = 0.6,
			matrix_pixel_threshold = 0.5,
			damping_insert_mode = 0.95,
			distance_stop_animating = 0.5,
		},
		keys = {
			{ "<leader>us", "<cmd>SmearCursorToggle<CR>", desc = "󰂵 Toggle cursor smear" },
		},
	},
}
