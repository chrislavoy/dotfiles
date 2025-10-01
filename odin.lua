return {
  { "Tetralux/odin.vim" },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("ols", {
        filetypes = { "odin" },
      })
      vim.lsp.enable("ols")
    end,
  },
}
