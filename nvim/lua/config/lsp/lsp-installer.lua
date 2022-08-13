local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- TODO: Migrate to mason.nvim as lsp-installer is no longer maintained

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("config.lsp.handlers").on_attach,
		capabilities = require("config.lsp.handlers").capabilities,
	}

	local server_config_path = "config.lsp.settings." .. server.name

	local settings_exist, server_settings = pcall(require, server_config_path)

	if settings_exist then
		local old_on_attach = opts.on_attach

		opts = vim.tbl_deep_extend("force", server_settings, opts)

		opts.on_attach = function (client, bufnr)
			old_on_attach(client, bufnr)

			if type(server_settings.on_attach) == 'function' then
				server_settings.on_attach(client, bufnr)
			end
		end
	end

	server:setup(opts)
end)
