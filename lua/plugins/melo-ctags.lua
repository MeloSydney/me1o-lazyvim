return {
    "ukyouz/telescope-gtags",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require('telescope').load_extension('gtags')
    end,
}
