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

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})
