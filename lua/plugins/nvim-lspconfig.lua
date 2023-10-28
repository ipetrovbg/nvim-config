local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

	-- Option + m
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<M-m>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>df", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gl",
		'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format { async = true }' ]])
end

local on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.document_formatting = true
	end
	if client.name == "eslint" then
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local config = function()
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")

	-- for type, icon in pairs(diagnostic_signs) do
	--	local hl = "DiagnosticSign" .. type
	--	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	-- end
	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- json
	lspconfig.jsonls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "json", "jsonc" },
		cmd = { "vscode-json-language-server", "--stdio" },
		init_options = {
			provideFormatter = true,
		},
	})

	-- Typescript additional settins
	lspconfig.tsserver.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
		cmd = { "typescript-language-server", "--stdio" },
		single_file_support = true,
		init_options = {
			hostInfo = "neovim",
		},
		settins = {
			completions = {
				completeFunctionCalls = true,
			},
		},
	})

	-- yaml
	lspconfig.yamlls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			yaml = {
				schemas = {
					["https://raw.githubusercontent.com/lalcebo/json-schema/master/serverless/reference.json"] = "serverless.yml",
					["https://raw.githubusercontent.com/aws/serverless-application-model/main/samtranslator/schema/schema.json"] = {
						"resources/**.yml",
					},
				},
			},
		},
	})

	-- Grpaql additional settins
	lspconfig.graphql.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "graphql", "typescriptreact", "javascriptreact" },
		cmd = { "graphql-lsp", "server", "-m", "stream" },
		settings = {
			graphql = {
				["graphql-config.load.legacy"] = true,
			},
		},
	})

	-- html, typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
	lspconfig.emmet_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"html",
			"typescriptreact",
			"javascriptreact",
			"javascript",
			"css",
			"sass",
			"scss",
			"less",
			"svelte",
			"vue",
		},
	})

	-- Elm
	lspconfig.elmls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		init_options = {
			elmAnalyseTrigger = "change",
			elmFormatPath = "elm-format",
		},
	})

	lspconfig.rust_analyzer.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			["rust-analyzer"] = {
				procMacro = {
					enable = true,
				},
				inlayHints = {
					chainingHints = {
						enable = false,
					},
				},
				closingBraceHints = {
					enable = false,
				},
				closureReturnTypeHints = {
					enable = false,
				},
				renderColons = false,
				parameterHints = {
					enable = false,
				},
				typeHints = {
					enable = false,
				},
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		-- "creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}
