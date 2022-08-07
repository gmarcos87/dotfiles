local lspconfig = require('lspconfig')
local cmpNvimLsp = require('cmp_nvim_lsp')

local M = {}

M.setup = function()
  local actual_capabilities = vim.lsp.protocol.make_client_capabilities()
  local capabilities = cmpNvimLsp.update_capabilities(actual_capabilities)
  local on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.keymap.set("n", "<Leader>bf", vim.lsp.buf.formatting)
      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    end
  end

  lspconfig.eslint.setup {
    capabilities = capabilities,
    on_attach = on_attach
  }

  lspconfig.tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach
  }

  lspconfig.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = on_attach,

    -- I only use lua for neovim, this is the most convenient
    -- configuration for it.
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    }
  }

end

return M
