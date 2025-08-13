-- lua/plugins/yazi.lua
-- Yazi integration: opens in the current iTerm2 window, new tab, in current cwd

local M = {}

function M.open_yazi()
  -- Get Neovim's current working directory
  local cwd = vim.fn.getcwd()

  -- AppleScript: open a new tab in the current iTerm2 window
  -- cd into the current working directory, then launch Yazi
  local cmd = [[osascript -e 'tell application "iTerm2"
      tell current window
          create tab with default profile
          tell current session of current tab
              write text "cd " & "'" .. cwd .. "'; yazi"
          end tell
      end tell
  end tell']]

  os.execute(cmd)
end

-- Keybinding
vim.keymap.set("n", "<leader>y", M.open_yazi, { desc = "Open Yazi in new tab in current cwd" })

return M
