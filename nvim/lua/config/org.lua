local status_ok, orgmode = pcall(require, "orgmode")
if not status_ok then
	return
end

orgmode.setup {
	org_default_notes_file = '~/projects/notebook/scratch.org'
}
orgmode.setup_ts_grammar()
