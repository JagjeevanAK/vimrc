function ColorMyPencils(color)
    color = color or "vesper"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

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
            ColorMyPencils()
        end
    }
}
