return {
    "chipsenkbeil/distant.nvim",
    branch = "v0.3",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = {
        "DistantClientLaunch",
        "DistantConnect",
        "DistantInstall",
        "DistantLaunch",
        "DistantMetadata",
        "DistantMkdir",
        "DistantOpen",
        "DistantRemove",
        "DistantRename",
        "DistantSessionInfo",
        "DistantShell",
    },
    keys = {
        { "<leader>dc", "<cmd>DistantConnect<cr>", desc = "Distant Connect" },
        { "<leader>dl", "<cmd>DistantLaunch<cr>", desc = "Distant Launch" },
        { "<leader>ds", "<cmd>DistantShell<cr>", desc = "Distant Shell" },
    },
    config = function()
        require("distant"):setup({})
    end,
}
