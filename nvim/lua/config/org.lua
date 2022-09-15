local status_ok, orgmode = pcall(require, "orgmode")
if not status_ok then
	return
end

orgmode.setup {
	org_default_notes_file = '~/projects/notebook/scratch.org',
	org_capture_templates = {
		t = "Todo",
		tp = {
			description = 'Personal Todo',
			template = '* TODO %?\n %u',
			target = '~/projects/notebook/todo.org',
		},
		tw = {
			description = 'Work Todo',
			template = '* TODO %?\n %u',
			target = '~/projects/notebook/work-todo.org',
		},
		l = "Log",
		ll = {
			description = "Learning Log",
			template = '* [[%?link][description]] %u',
			target = "~/projects/notebook/learning-log.org"
		}
	}
}

orgmode.setup_ts_grammar()
