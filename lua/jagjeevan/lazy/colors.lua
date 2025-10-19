return {
    {
        "datsfilipe/vesper.nvim",
        name = "vesper",
        config = function()
            print("Loading vesper colorscheme")
            require("vesper").setup({
                transparent = false,
                italics = {
                    comments = true,
                    keywords = true,
                    functions = false,
                    strings = false,
                    variables = false,
                },
                overrides = {},
            })

            vim.cmd("colorscheme vesper")
        end
    }
}
