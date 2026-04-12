vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

-- C, Lua, Markdown, Vimscript, Vimdoc are installed by default
-- Run :checkhealth vim.treesitter to see a diagnostic report of
-- detected parsers and their runtime paths.
require("nvim-treesitter").install({ "go", "javascript" })
