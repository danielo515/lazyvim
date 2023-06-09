local keymap = { r = {} }
local M = {}

keymap["r"]["p"] = {
  function()
    D.vim.send_keys(":%s/\\v([^\\)]+)/\\1/g" .. string.rep("<Left>", 15))
  end,
  "capture [p]arens",
}

keymap["r"]["t"] = {
  function()
    D.vim.send_keys(":%s/\vtrue|false/ Bool/g" .. string.rep("<Left>", 5))
  end,
  "[t]rue false to Bool",
}

keymap["r"]["i"] = {
  function()
    D.vim.send_keys(':%s/\v"[^"]*"/ String/g' .. string.rep("<Left>", 5))
  end,
  "literal str[i]ng to type",
}

keymap["r"]["r"] = {
  function()
    D.vim.send_keys(":s/\\v\\i+/\\0/g" .. string.rep("<Left>", 4))
  end,
  "[r]epeat word",
}
keymap["r"]["s"] = {
  function()
    D.vim.send_keys(":s/\\v(\\w+):.*/\\1=\\1,/g" .. string.rep("<Left>", 8))
  end,
  "type arguments to values",
}

function M.objectTypeToDestructure()
  D.vim.send_keys(":s/\\v:.*/,/g" .. string.rep("<Left>", 6))
end

keymap["r"]["T"] = {
  M.objectTypeToDestructure,
  "object [T]ype to destructured",
}

M.keymap = keymap;

return M;
