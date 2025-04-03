return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
      automatic_installation = true,
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"dockerls",
				"sqlls",
				"cucumber_language_server",
				"docker_compose_language_service",
				"dockerls",
				"lua_ls",
				"emmet_ls",
				"gopls",
				"jdtls",
				"lemminx",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"eslint_d",
				"sql-formatter",
				"xmlformatter",
				"java-debug-adapter",
				"java-test",
        "js-debug-adapter"
			},
		})
	end,
}
