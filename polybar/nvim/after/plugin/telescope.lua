local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

pcall(require('telescope').load_extension, 'yank_history')

require('telescope').setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "absolute" },
	}
}
