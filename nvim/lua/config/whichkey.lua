local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
	return
end

whichkey.setup {}

local opts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}

local mappings = {
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Quit" },

	b = {
		name = "Buffers",
		b = { "<cmd>Telescope buffers<CR>", "Switch to buffer" },
		c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	},

	s = {
		name = "Search",
		p = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
		s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find Text in current buffer" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
	},

	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = {
			"<cmd>Telescope lsp_document_diagnostics<cr>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>Telescope lsp_workspace_diagnostics<cr>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},

	o = {
		name = "Open",
		p = { "<cmd>NvimTreeToggle<CR>", "Browse Files" },
		-- p = { "<cmd>Telescope file_browser path=%:p:h<CR>", "Browse Files" },
	},

	p = {
		name = "Project",
		p = { "<cmd>Telescope project<CR>", "Projects" },
		f = { "<cmd>Telescope find_files<CR>", "Find File" },
	},

	t = {
		name = "Terminal",
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},

	n = {
		name = "Notes"
		-- c = {  }
	},
}

whichkey.register(mappings, opts)
