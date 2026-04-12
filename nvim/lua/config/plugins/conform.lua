vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
  formatters_by_ft = {
    go = { "goimports", "gofmt" },
    lua = { "stylua" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    scss = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    tf = { "terraform" },
  },
  format_on_save = {
    timeout_ms = 3000,
    lsp_format = "fallback",
    async = false,
    quiet = false,
  },
})

vim.keymap.set("n", "<leader>cf", function()
  require("conform").format()
end, { desc = "[C]ode [F]ormat" })
