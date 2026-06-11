return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "pylsp",
            "kotlin_lsp",
            "ts_ls",
            "html",
            "cssls",
            "lua_ls",
            "ols",
            "zls"
        },
        automatic_enable = {
            exclude = {
                "rust_analyzer"
            }
        }
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    }
}
