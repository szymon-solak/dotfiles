local status_ok, feline = pcall(require, "feline")
if not status_ok then
	return
end

local config = require("tokyonight.config")
local colors = require("tokyonight.colors").setup(config)

local theme = {
	fg = colors.fg,
	bg = colors.bg_statusline,
}

local lsp = require "feline.providers.lsp"
local lsp_severity = vim.diagnostic.severity
local vi_mode_utils = require "feline.providers.vi_mode"

local diagnostic = {
	error = {
		provider = "diagnostic_errors",
		enabled = function()
			return lsp.diagnostics_exist(lsp_severity.ERROR)
		end,

		hl = { fg = colors.red },
		icon = "   ",
	},

	warning = {
		provider = "diagnostic_warnings",
		enabled = function()
			return lsp.diagnostics_exist(lsp_severity.WARN)
		end,

		hl = { fg = colors.yellow },
		icon = "   ",
	},

	hint = {
		provider = "diagnostic_hints",
		enabled = function()
			return lsp.diagnostics_exist(lsp_severity.HINT)
		end,

		hl = { fg = colors.green },
		icon = "   ",
	},

	info = {
		provider = "diagnostic_info",
		enabled = function()
			return lsp.diagnostics_exist(lsp_severity.INFO)
		end,

		-- hl = "Feline_LspInfo",
		hl = { fg = colors.teal },
		icon = "   ",
	},
}

local lsp_icon = {
	provider = function()
		if next(vim.lsp.buf_get_clients()) ~= nil then
			local lsp_name = vim.lsp.get_active_clients()[1].name

			return "   LSP ~ " .. lsp_name .. " "
		else
			return ""
		end
	end,

	hl = { fg = colors.fg_gutter },
	-- hl = "Feline_LspIcon",
}

local lsp_progress = {
	provider = function()
		local Lsp = vim.lsp.util.get_progress_messages()[1]

		if Lsp then
			local msg = Lsp.message or ""
			local percentage = Lsp.percentage or 0
			local title = Lsp.title or ""
			local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }

			local success_icon = {
				"",
				"",
				"",
			}

			local ms = vim.loop.hrtime() / 1000000
			local frame = math.floor(ms / 120) % #spinners

			if percentage >= 70 then
				return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
			end

			return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
		end

		return ""
	end,
	-- hl = "Feline_LspProgress",
}

-- MODES

local mode_hlgroups = {
	["n"] = { "NORMAL", colors.blue },
	["no"] = { "N-PENDING", colors.blue },
	["i"] = { "INSERT", colors.green },
	["ic"] = { "INSERT", colors.green },
	["v"] = { "VISUAL", colors.magenta },
	["V"] = { "V-LINE", colors.magenta },
	[""] = { "V-BLOCK", colors.magenta },
	["R"] = { "REPLACE", colors.red },
	["Rv"] = { "V-REPLACE", colors.red },
	["s"] = { "SELECT", colors.purple },
	["S"] = { "S-LINE", colors.purple },
	[""] = { "S-BLOCK", colors.purple },
	["c"] = { "COMMAND", colors.teal },
	["cv"] = { "COMMAND", colors.teal },
	["ce"] = { "COMMAND", colors.teal },
	["r"] = { "PROMPT", colors.orange },
	["rm"] = { "MORE", colors.orange },
	["r?"] = { "CONFIRM", colors.orange },
	["t"] = { "TERMINAL", colors.yellow },
	["!"] = { "SHELL", colors.yellow },
}

local mode_name = {
	provider = function()
		return mode_hlgroups[vim.fn.mode()][1]
	end,
	hl = function()
	   return { fg = mode_hlgroups[vim.fn.mode()][2] }
	end,
}

local encoding = {
	provider = 'file_encoding',
}

local position = {
	provider = 'position',
}

local line_percentage = {
	provider = 'line_percentage',
}

local spacer = {
	provider = function()
		return " "
	end
}

local components = {
	active = {
		-- left
		{ spacer, mode_name, lsp_icon, lsp_progress, diagnostic.error, diagnostic.warning },
		-- middle
		{},
		-- right
		{ encoding, spacer, position, spacer, line_percentage, spacer },
	}
}

feline.setup {
	theme = theme,
	components = components,
}

-- TreeSitter
-- local ts_utils = require("nvim-treesitter.ts_utils")
-- local ts_parsers = require("nvim-treesitter.parsers")
-- local ts_queries = require("nvim-treesitter.query")
--[[ table.insert(components.active[2], {
  provider = function()
    local node = require("nvim-treesitter.ts_utils").get_node_at_cursor()
    return ("%d:%s [%d, %d] - [%d, %d]")
      :format(node:symbol(), node:type(), node:range())
  end,
  enabled = function()
    local ok, ts_parsers = pcall(require, "nvim-treesitter.parsers")
    return ok and ts_parsers.has_parser()
  end
}) ]]
