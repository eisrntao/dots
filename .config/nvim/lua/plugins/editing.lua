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

			-- Return an argument table for `leap()`, tailored for f/t-motions.
			local function as_ft(key_specific_args)
				local common_args = {
					inputlen = 1,
					inclusive = true,
					-- To limit search scope to the current line:
					-- pattern = function (pat) return '\\%.l'..pat end,
					opts = {
						labels = "", -- force autojump
						safe_labels = vim.fn.mode(1):match("[no]") and "" or nil, -- [1]
					},
				}
				return vim.tbl_deep_extend("keep", common_args, key_specific_args)
			end

			local clever = require("leap.user").with_traversal_keys -- [2]
			local clever_f = clever("f", "F")
			local clever_t = clever("t", "T")

			for key, key_specific_args in pairs({
				f = { opts = clever_f },
				F = { backward = true, opts = clever_f },
				t = { offset = -1, opts = clever_t },
				T = { backward = true, offset = 1, opts = clever_t },
			}) do
				vim.keymap.set({ "n", "x", "o" }, key, function()
					require("leap").leap(as_ft(key_specific_args))
				end)
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
