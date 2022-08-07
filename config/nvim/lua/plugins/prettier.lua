local prettier = require('prettier')

local M = {}

M.setup = function()
  prettier.setup({
    bin = 'prettier', -- or `prettierd`
    filetypes = {
      "css",
      "graphql",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "less",
      "markdown",
      "scss",
      "typescript",
      "typescriptreact",
      "yaml",
    }
  })
end

return M
