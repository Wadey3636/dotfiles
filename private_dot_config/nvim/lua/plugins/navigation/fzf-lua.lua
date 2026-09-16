return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    ---@module "fzf-lua"
    ---@type fzf-lua.Config|{}
    ---@diagnostic disable: missing-fields
    ---@diagnostic enable: missing-fields
    opts = {
        files = {
            find_opts = [[-type f \! -path '*/.git/*' \! -path '*/.yoga/*' \! -path '*/.nanovg/*']],
            rg_opts   = [[--color=never --files -g "!.git" -g "!.jj"]],
            fd_opts   = [[--color=never --type f --type l --exclude .git --exclude .yoga --exclude zig-out --exclude zig-pkg --exclude .nanovg --exclude .zig-cache]],
        },
    }
}
