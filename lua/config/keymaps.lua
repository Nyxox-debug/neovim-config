-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local discipline = require("craftzdog.discipline")

discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"3p')
keymap.set("n", "<Leader>P", '"3P')
keymap.set("v", "<Leader>p", '"3p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Map jj to <Esc> in insert mode
keymap.set("i", "jj", "<Esc>", opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
  require("craftzdog.hsl").replaceHexWithHSL()
end)

keymap.set("n", "<leader>i", function()
  require("craftzdog.lsp").toggleInlayHints()
end)

vim.api.nvim_create_user_command("ToggleAutoformat", function()
  require("craftzdog.lsp").toggleAutoformat()
end, {})

-- Tab completion navigation
-- keymap.set("i", "<Tab>", function()
--   if vim.fn.pumvisible() == 4 then
--     return "<C-n>"
--   else
--     return "<Tab>"
--   end
-- end, { expr = true })
--
-- keymap.set("i", "<S-Tab>", function()
--   if vim.fn.pumvisible() == 4 then
--     return "<C-p>"
--   else
--     return "<S-Tab>"
--   end
-- end, { expr = true })

-- Option 1: Simple and most reliable approach
-- keymap.set("i", "<Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true, silent = true })
-- keymap.set("i", "<S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true, silent = true })

-- Option 2: Using functions with proper termcode handling
-- keymap.set("i", "<Tab>", function()
--   if vim.fn.pumvisible() == 1 then
--     return "<C-n>"
--   else
--     return "<Tab>"
--   end
-- end, { expr = true, silent = true })
--
-- keymap.set("i", "<S-Tab>", function()
--   if vim.fn.pumvisible() == 1 then
--     return "<C-p>"
--   else
--     return "<S-Tab>"
--   end
-- end, { expr = true, silent = true })
--
-- Option 3: More robust with fallback handling
-- keymap.set("i", "<Tab>", function()
--   local cmp = require("cmp")
--   if cmp.visible() then
--     cmp.select_next_item()
--   elseif vim.fn.pumvisible() == 1 then
--     return "<C-n>"
--   else
--     return "<Tab>"
--   end
-- end, { expr = true, silent = true })
--
-- keymap.set("i", "<S-Tab>", function()
--   local cmp = require("cmp")
--   if cmp.visible() then
--     cmp.select_prev_item()
--   elseif vim.fn.pumvisible() == 1 then
--     return "<C-p>"
--   else
--     return "<S-Tab>"
--   end
-- end, { expr = true, silent = true })

-- Option 4: LazyVim compatible approach
keymap.set("i", "<Tab>", function()
  if vim.snippet.active({ direction = 1 }) then
    return "<cmd>lua vim.snippet.jump(1)<cr>"
  elseif vim.fn.pumvisible() == 1 then
    return "<C-n>"
  else
    return "<Tab>"
  end
end, { expr = true, silent = true })

keymap.set("i", "<S-Tab>", function()
  if vim.snippet.active({ direction = -1 }) then
    return "<cmd>lua vim.snippet.jump(-1)<cr>"
  elseif vim.fn.pumvisible() == 1 then
    return "<C-p>"
  else
    return "<S-Tab>"
  end
end, { expr = true, silent = true })
