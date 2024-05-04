return {
	{
		"mfussenegger/nvim-dap",
		config = function()
            local dap = require("dap")

            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "-i", "dap" }
            }
            dap.configurations.c = {
                {
                    name = "Launch",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false,
                },
            }

            vim.keymap.set("n", "<F5>", function()
                require("dap").continue()
			end)
			vim.keymap.set("n", "<F6>", function()
				require("dap").step_into()
			end)
			vim.keymap.set("n", "<F7>", function()
				require("dap").step_out()
			end)
			vim.keymap.set("n", "<F8>", function()
				require("dap").step_out()
			end)
			vim.keymap.set("n", "<Leader>db", function()
				require("dap").toggle_breakpoint()
			end)
			-- vim.keymap.set("n", "<Leader>dp", function()
			-- 	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			-- end)
			vim.keymap.set("n", "<Leader>dr", function()
				require("dap").repl.open()
			end)
			vim.keymap.set("n", "<Leader>dl", function()
				require("dap").run_last()
			end)
			vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
				require("dap.ui.widgets").hover()
			end)
			vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
				require("dap.ui.widgets").preview()
			end)
			vim.keymap.set("n", "<Leader>df", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end)
			vim.keymap.set("n", "<Leader>ds", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end)
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			local dap_python = require("dap-python")
			dap_python.setup(path)
			-- vim.keymap.set("n", "<leader>dpr", function()
			-- 	require("dap").continue()
			-- 	-- dap_python.test_method()
			-- end, {})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			vim.keymap.set("n", "<leader>dt", function()
				dapui.toggle()
			end)
			-- dap.listeners.before.event_terminated["dapui_config"] = function()
			-- 	dapui.close()
			-- end
			-- dap.listeners.before.event_exited["dapui_config"] = function()
			-- 	dapui.close()
			-- end
		end,
	},
}
