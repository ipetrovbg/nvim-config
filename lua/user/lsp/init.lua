local status_ok, autotag = pcall(require('nvim-ts-autotag'))
if status_ok then
	autotag.setup {}
end

-- local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

-- if not status_ok then
-- 	print("nvim-lsp-installer was not OK")
-- 	print(lsp_installer)
-- end

-- if status_ok then
-- 	lsp_installer.on_server_ready(function(server)
-- 		local opts = {
-- 			on_attach = require("user.lsp.handlers").on_attach,
-- 			capabilities = require("user.lsp.handlers").capabilities,
-- 		}

-- 		if server.name == "jsonls" then
-- 			-- local jsonls_opts = require("user.lsp.settings.jsonls")
-- 			-- opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
-- 		end

-- 		if server.name == "sumneko_lua" then
-- 			-- local sumneko_opts = require("user.lsp.settings.sumneko_lua")
-- 			opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
-- 		end

-- 		-- This setup() function is exactly the same as lspconfig's setup function.
-- 		-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- 		server:setup(opts)
-- 	end)
-- end


require("telescope").setup {
	extensions = {
		["ui-select"] = {
			-- Custom picket
			lsp_buff_errors = {
				make_index = vim.diagnostic.setloclist
			}
		}
	}
}

require('user.lsp.mason')
require("telescope").load_extension("ui-select")
require("telescope").load_extension('harpoon')
require("telescope").load_extension('zoxide')
require('user.lsp.indent-blankline')
-- vim.o.hidden = true
-- require('nvim-terminal').setup()
