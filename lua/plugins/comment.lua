return {
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = {
			enable_autocmd = false,
		},
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		},
        config = function ()
            require('mini.comment').setup({
                mappings = {
                    comment = 'gc',
                    comment_line = "<leader>/",
                    comment_visual = "<leader>/",
                    textobject = "gc",
                }
            })
        end
	},
}
