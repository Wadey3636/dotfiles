return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "pylsp",
            "kotlin_lsp",
            "rust_analyzer",
            "ts_ls",
            "html",
            "cssls",
            "lua_ls"
        }
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    }
}
