local treesitter = require('nvim-treesitter.configs')
local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

local M = {}

M.setup = function()
  treesitter.setup {
    highlight = {
      enable = true,
      disable = {},
    },
    indent = {
      enable = true,
      disable = {},
    },
    ensure_installed = {
      "tsx",
      "toml",
      "fish",
      "php",
      "json",
      "yaml",
      "swift",
      "html",
      "scss"
    },
    autotag = {
      enable = true,
    }
  }

  parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
end

return M
