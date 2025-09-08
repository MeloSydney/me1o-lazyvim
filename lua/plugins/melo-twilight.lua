-- Melo for twilight
return {
  {
    "folke/twilight.nvim",
    event = "VeryLazy",
    opts = {
      dimming = {
        alpha = 0.25,
        color = { "Normal", "#ffffff" },
        term_bg = "#000000",
        inactive = false,
      },
      context = 10,
      treesitter = true,
      expand = {
        "function",
        "method",
        "table",
        "if_statement",
        "for_statement",
        "while_statement",
        "repeat_statement",
      },
      exclude = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "NvimTree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
    config = function(_, opts)
      require("twilight").setup(opts)
      
      -- 开机自动启用
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.defer_fn(function()
            pcall(require("twilight").enable)
          end, 200)
        end,
      })
    end,
    keys = {
      {
        "<leader>ut",
        function()
          require("twilight").toggle()
        end,
        desc = "Toggle Twilight",
      },
    },
  },
}
