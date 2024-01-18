local lint = require('lint')
lint.linters_by_ft = {
    cpp = {'clangtidy', }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        lint.try_lint()
    end,
})
local pattern = '[^:]+:(%d+):(%d+):(%w+):(.+)'
local groups = { 'lnum', 'col', 'code', 'message' }
local default_severity = {
    ['error'] = vim.diagnostic.severity.ERROR,
    ['warning'] = vim.diagnostic.severity.WARN,
    ['information'] = vim.diagnostic.severity.INFO,
    ['hint'] = vim.diagnostic.severity.HINT,
}
require('lint.parser').from_pattern(pattern, groups, default_severity)
vim.diagnostic.config({ virtual_text = true })

LP = function()
  local linters = require("lint").get_running()
  if #linters == 0 then
      return "󰦕"
  end
  return "󱉶 " .. table.concat(linters, ", ")
end
