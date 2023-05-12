for _, source in ipairs {
  "astronvim.bootstrap",
  "astronvim.options",
  "astronvim.lazy",
  "astronvim.autocmds",
  "astronvim.mappings",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

if astronvim.default_colorscheme then
  if not pcall(vim.cmd.colorscheme, astronvim.default_colorscheme) then
    require("astronvim.utils").notify(
      "Error setting up colorscheme: " .. astronvim.default_colorscheme,
      vim.log.levels.ERROR
    )
  end
end

require("astronvim.utils").conditional_func(astronvim.user_opts("polish", nil, false), true)

require('telescope').setup{ 
  defaults = { 
    file_ignore_patterns = { 
      "node_modules",
      "plugins",
      "www",
      "android",
      "ios" 
    }
  }
}

-- Mapeando y para o próximo buffer
vim.api.nvim_set_keymap('n', 'y', ':bnext<CR>', { noremap = true, silent = true })

-- Mapeando t para o buffer anterior
vim.api.nvim_set_keymap('n', 't', ':bprevious<CR>', { noremap = true, silent = true })

-- Mapeando "vv" para iniciar a seleção visual linhas inteiras
vim.api.nvim_set_keymap('n', 'vv', 'V', { noremap = true })

-- Removendo o mapeamento original de "V"
vim.api.nvim_set_keymap('n', 'V', '<Nop>', { noremap = true })
