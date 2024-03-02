return {
	"smjonas/inc-rename.nvim",
	config = function()
		require("inc_rename").setup({
			cmd_name = "IncRename", -- the name of the command
		})

		vim.keymap.set("n", "<leader>rn", ":IncRename ")
	end,
}
