require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        php = { "pint" },
        blade = { "blade-formatter" },
        cpp = { "clang-format" },
        rust = { "rustfmt" },
    },

    format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 1500,
    },
})
