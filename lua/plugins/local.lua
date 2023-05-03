local base = vim.fn.system("chezmoi source-path")
if not base or base == "" then
  vim.notify("Chezmoi path didn not suceed")
  return nil
end
local dir = vim.fn.fnamemodify(base, ":p:h") .. "/haxe-nvim"
return { {
  dir = dir,
} }
