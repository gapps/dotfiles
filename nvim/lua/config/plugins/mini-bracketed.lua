-- https://github.com/echasnovski/mini.bracketed
--
-- Go forward/backward with square brackets
--
return {
  {
    "echasnovski/mini.bracketed",
    version = "*",
    lazy = false,
    config = function()
      require("mini.bracketed").setup()
    end,
  },
}
