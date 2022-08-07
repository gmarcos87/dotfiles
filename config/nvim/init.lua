-- Speed up loading Lua modules in Neovim to improve startup time.
local present, impatient = pcall(require, 'impatient')

if present then
  impatient.enable_profile()
end

-- require configuration
local modules = {
  'core.options',
  'core.keymapping',
  'plugins'
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error('Error loading ' .. module .. '\n\n' .. err)
  end
end
