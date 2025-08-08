return {
	-- fuzzy searcher
	"ibhagwan/fzf-lua",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	opts = { "telescope" },
	keys = {
		{ "<leader><space>", "<cmd>FzfLua buffers<CR>", noremap = true, desc = " Search buffers" },
		{ "<leader>ff", "<cmd>FzfLua files<CR>", noremap = true, desc = " Search files" },
		{
			"<leader>fc",
			"<cmd>FzfLua files cwd=~/config<CR>",
			noremap = true,
			desc = " Search configuration",
		},
		{ "<leader>/", "<cmd>FzfLua grep_curbuf<CR>", noremap = true, desc = " Search current buffer" },
		{ "<leader>fg", "<cmd>FzfLua grep<CR>", noremap = true, desc = " Grep" },
		{ "<leader>fh", "<cmd>FzfLua helptags<CR>", noremap = true, desc = "󰮥 Search help" },
		{ "<leader>fq", "<cmd>FzfLua quickfix<CR>", noremap = true, desc = "󰁨 Search quickfix list" },
	},
}
