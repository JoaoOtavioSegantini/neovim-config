return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		require("dapui").setup()
		require("dap-go").setup()

		local dap, dapui = require("dap"), require("dapui")

		--local mason_registry = require("mason-registry")
		--local codelldb = mason_registry.get_package("codelldb")
		--local extension_path = codelldb:get_install_path() .. "/extension/"
		--local codelldb_path = extension_path .. "adapter/codelldb"
		--local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
		--local cfg = require("rustaceanvim.config")

		--dap.configurations.rust = { cfg.get_codelldb_adapter(codelldb_path, liblldb_path) }

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
		vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
		vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
	end,
}
