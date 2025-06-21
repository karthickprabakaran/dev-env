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
