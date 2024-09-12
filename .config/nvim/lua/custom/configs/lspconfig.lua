local base = require("plugins.configs.lspconfig")
local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

local capabilities = base.capabilities
local on_attach = base.on_attach

lspconfig.gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      gofumpt = true,
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        defers = true,
        deprecated = true,
        nonewvars = true,
        slog = true,
        unusedparams = true,
      },
    },
  },
}

lspconfig.ruff.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    settings = {
      configurationPreference = "filesystemFirst",
    },
  },
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"}
})

lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"html", "css", "scss", "markdown", "mdx"}
})

lspconfig.eslint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"}
})

lspconfig.docker_compose_language_service.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
