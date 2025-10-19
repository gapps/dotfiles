-- https://github.com/folke/flash.nvim
return {
  "folke/flash.nvim",
  lazy = false,
  --@type Flash.Config
  opts = {
    -- Remove q and p to avoid pinky stretch
    labels = "asdfghjklwertyuiozxcvbnm",
    modes = {
      char = {
        jump_labels = true,
      },
    },
  },
  keys = {
    {
      -- "s",
      "<C-f>",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
}
