return {
	"akinsho/flutter-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
	config = function()
		require("flutter-tools").setup({
			debugger = {
				enabled = false,
				run_via_dap = false,
				register_configurations = function(_)
					require("dap").adapters.dart = {
						type = "executable",
						command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
						args = { "flutter" },
					}
					require("dap").configurations.dart = {
						{
							type = "dart",
							request = "launch",
							name = "Launch flutter",
							dartSdkPath = "home/flutter/bin/cache/dart-sdk/",
							flutterSdkPath = "home/flutter",
							program = "${workspaceFolder}/lib/main.dart",
							cwd = "${workspaceFolder}",
						},
					}
				end,
			},
			dev_log = { enabled = false, open_cmd = "tabedit" },
		})
	end,
}
