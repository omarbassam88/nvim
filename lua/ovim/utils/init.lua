


-------------------- HELPERS --------------------

Api, Cmd, Fn = vim.api, vim.cmd, vim.fn
Keymap, Execute, G = Api.nvim_set_keymap, Api.nvim_command, vim.g
Scopes = { o = vim.o, b = vim.bo, w = vim.wo }



-- Mappings wrapper, extracted from
-- https://github.com/ojroques/dotfiles/blob/master/nvim/init.lua#L8-L12
function Map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	Keymap(mode, lhs, rhs, options)
end
