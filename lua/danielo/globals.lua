-- Fuck it, I'm gonna drop some global utility functions for my personal use!!
_G.D = {} -- But namespaced, obviously!

---Prints whatever argument it gets, and then returns it.
--Useful to add in the middle of any pipeline without much trouble
---@generic T
---@param arg T
---@return T
function D.Peek(arg)
  vim.pretty_print(arg)
  return arg
end

---Make a require of a module in a protected call. If the call succeeds, then call the on_success
---Everything is executed within protected calls
---@generic T
---@param path string
---@param on_success? function
---@param on_fail? function
---@return T
function D.require(path, on_success, on_fail)
  local ok, lib = pcall(require, path)
  on_fail = on_fail or D.noop
  if ok then
    if type(on_success) == "function" then
      pcall(on_success, lib)
    else
      return lib
    end
  else
    vim.notify("Failed to require library: " .. path, vim.log.levels.ERROR, { title = "Danielo" })
    pcall(on_fail, lib)
  end
  return nil
end

local fun = D.require("danielo.fun")

---Requires the configuration module in a protected call
-- and calls its setup or config function if it exists
---@param path string path to the module that needs to be configured
function D.pconf(path, ...)
  local args = { ... }
  D.require(path, function(module)
    local setup_fn = module.config or module.setup
    return D.call(setup_fn, unpack(args))
  end, function(err)
    vim.pretty_print("error", err)
  end)
end

---Tries to require the current file with a require
--clean path. The method is not very good, so it may
--fail if the expected path is not exactly the one you thing
function D.req_current()
  local current_file = vim.fn.expand("%:r"):gsub(".*lua/", "")
  -- return D.call(req       , current_file)
end

---gives you useful elements to use for auto completion
-- about the current context
---@return string[]
function D.get_context_suggestions()
  local currentWord = vim.fn.expand("<cword>")
  local currentFileName = vim.fn.expand("%:t:r")
  local currentFile = vim.fn.expand("%:t")
  local currentPath = vim.fn.expand("%")
  return { currentWord, currentFileName, currentFile, currentPath }
end

-- Yes, a function that does nothing, deal with it
D.noop = function() end
-- Shortcut
_G.preq = D.require

D = fun.assign(D, fun)

-- Shows a input window with some autocomplete suggestions
-- and then calls fzf grep (which uses rg and fzf) with the provided term
function D.fzf_find()
  local fzf = require("fzf-lua")
  local context_completion = D.get_context_suggestions()
  D.vim.input(function(search_term)
    fzf.grep({ search = search_term, multiprocess = true })
  end, context_completion)
end

--Better defaults and interfaces for vim commands
D.vim = D.require("danielo.vim")
D.file = D.require("danielo.file")
D.fun = D.require("danielo.fun")
D.string = D.require("danielo.string")
D.popup = D.require("danielo.ui.PopupKeys")
-- Shortcuts
D.autocmd = D.vim.autocmd
