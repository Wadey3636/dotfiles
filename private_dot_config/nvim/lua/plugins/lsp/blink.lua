return {
    'saghen/blink.cmp',
    dependencies = {
        'saghen/blink.lib',
        'rafamadriz/friendly-snippets',
    },
    build = function()
        require('blink.cmp').build():pwait()
    end,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = 'default',
            ['<C-e>'] = {
                'select_and_accept',
                'fallback'
            },
        },

        completion = { documentation = { auto_show = false } },

        sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },

        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
}
