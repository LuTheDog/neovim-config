return {
    { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            --ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "go" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end, },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function ()
            local config = require("treesitter-context")
            config.setup({
                max_lines = 3,
                mode = "topline",
                multiline_threshold = 2,
            })
        end
    }
}
