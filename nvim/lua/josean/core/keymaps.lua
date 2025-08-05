vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- file explorer toggle and focus
-- navigate between split windows
keymap.set("n", "<leader>sp", "<C-w>W", { desc = "Go to previous split" }) -- reverse order
keymap.set("n", "<leader>sn", "<C-w>w", { desc = "Go to next split" })


-- Leader + e + e: Toggle file explorer
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })


vim.keymap.set("n", "<leader>a", "ggVG", { desc = "Select all text" })

-- keymaps for the wasd navigation 



-- Leader + e + f: Focus file explorer or find current file
vim.keymap.set("n", "<leader>ef", function()
  local view = require("nvim-tree.view")
  if view.is_visible() then
    if view.get_winnr() == vim.api.nvim_get_current_win() then
      -- If already in NvimTree, find and focus the current file
      vim.cmd("NvimTreeFindFile")
    else
      -- Focus the NvimTree window
      vim.cmd("NvimTreeFocus")
    end
  else
    -- If NvimTree is not visible, open it and find current file
    vim.cmd("NvimTreeFindFile")
  end
end, { desc = "Focus file explorer or find current file" })



-- Delete the current line
keymap.set("n", "<leader>dd", "dd", { desc = "Delete current line" })



-- Move visual selection up and replace line above
function MoveSelectionUpReplace()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  if start_line <= 1 then return end

  -- Delete line above and move selection
  vim.cmd((start_line - 1) .. "delete _")
  vim.cmd("normal! gv")
  vim.cmd(":m '<-2")
  vim.cmd("normal! gv=gv")
end

-- Move visual selection down and replace line below
function MoveSelectionDownReplace()
  local end_line = vim.fn.line("'>")
  local total_lines = vim.fn.line("$")
  if end_line >= total_lines then return end

  -- Delete line below and move selection
  vim.cmd((end_line + 1) .. "delete _")
  vim.cmd("normal! gv")
  vim.cmd(":m '>+1")
  vim.cmd("normal! gv=gv")
end


keymap.set("v", "<leader>u", MoveSelectionUpReplace, { desc = "Move selection up and replace", silent = true })
keymap.set("v", "<leader>n", MoveSelectionDownReplace, { desc = "Move selection down and replace", silent = true })

keymap.set("n", "<leader>fr", [[:%s///g<Left><Left><Left>]], { desc = "Find and replace in entire file" })


vim.keymap.set("n", "<leader>fa", [[:%s///g<Left><Left><Left>]], { desc = "Find and replace (manual)" })











vim.keymap.set("v", "<leader>c", function()
  -- Get the visual selection range
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")
  
  -- Ensure start_line <= end_line
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  
  -- Copy the lines
  vim.cmd(start_line .. "," .. end_line .. "copy " .. end_line)
end, { desc = "Duplicate selected lines below" })
