-- Melo 补强插件：在独立 nvim 与 vscode-neovim 中均生效
-- 搜索镜头 / 引用高亮 / 颜色预览 / 大小写改写

return {
  -- 搜索时高亮全部匹配 + 计数镜头（1/12），n/N/*/# 带导航
  {
    "kevinhwang91/nvim-hlslens",
    event = "VeryLazy",
    config = function()
      require("hlslens").setup({ calm_down = true })
      local map = vim.keymap.set
      local o = { noremap = true, silent = true }
      map("n", "n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", o)
      map("n", "N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", o)
      map("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], o)
      map("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], o)
    end,
  },

  -- 光标下同名引用自动高亮，]] / [[ 在引用间跳转
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = function()
      require("illuminate").configure({
        delay = 200,
        filetypes_denylist = { "neo-tree", "NvimTree", "Trouble", "qf", "help", "lazy" },
      })
      vim.keymap.set("n", "]]", require("illuminate").goto_next_reference, { desc = "Next reference" })
      vim.keymap.set("n", "[[", require("illuminate").goto_prev_reference, { desc = "Prev reference" })
    end,
  },

  -- #rrggbb / rgb() 等颜色原地显示色块（norcalli 停更版的维护 fork，API 兼容）
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      user_default_options = { names = false }, -- 不把 blue/white 这类普通单词当颜色
    },
  },

  -- 大小写转换神器：crc camelCase / crs snake_case / crm PascalCase / cr- kebab-case
  -- 以及 :Subvert 多形态智能替换
  { "tpope/vim-abolish", event = "VeryLazy" },
}
