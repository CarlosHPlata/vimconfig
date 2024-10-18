--[[
-- automatically closes all the brackets and string literals
-- it detect any bracket or string character and provide functionality for auto close
]]

local function check_and_close(char, shouldDoublePrint)
  return function()
    local line = vim.fn.getline('.')                    -- Get the current line
    local col = vim.fn.col('.') - 1                     -- Get the current column (adjusted for zero-indexing)
    local preceding_char = vim.fn.strpart(line, col, 1) -- Get the character before the cursor

    -- Check if the preceding character matches the specified character
    if preceding_char == char then
      return "<Right>"
    else
      local prefix = shouldDoublePrint and char .. char or char
      return prefix .. "<Left>"
    end
  end
end

-- Close brackets automatically, with return
vim.keymap.set('i', '{<cr>', '{<cr>}<C-o><S-o>', { silent = true })
vim.keymap.set('i', '(<cr>', '(<cr>)<C-o><S-o>', { silent = true })
vim.keymap.set('i', '[<cr>', '[<cr>]<C-o><S-o>', { silent = true })

-- Close brackets without return
vim.keymap.set('i', '(', '()<Left>', { silent = true })
vim.keymap.set('i', '{', '{}<Left>', { silent = true })
vim.keymap.set('i', '[', '[]<Left>', { silent = true })

-- open a new string literal
vim.keymap.set("i", "'", check_and_close("'", true), { expr = true })
vim.keymap.set("i", '"', check_and_close('"', true), { expr = true })
vim.keymap.set("i", "`", check_and_close("`", true), { expr = true })

-- If you close a bracket that is already closed, it overwrites
vim.keymap.set("i", ')', check_and_close(')', false), { expr = true })
vim.keymap.set("i", '}', check_and_close('}', false), { expr = true })
vim.keymap.set("i", ']', check_and_close(']', false), { expr = true })

-- Enclose a word in normal mode with "'({[
vim.keymap.set('n', "'", "mmbi'<Esc>ea'<Esc>`m<Right>", { silent = true })
vim.keymap.set('n', '"', 'mmbi"<Esc>ea"<Esc>`m<Right>', { silent = true })
vim.keymap.set('n', '(', "mmbi(<Esc>ea)<Esc>`m<Right>", { silent = true })
vim.keymap.set('n', '{', "mmbi{<Esc>ea}<Esc>`m<Right>", { silent = true })
vim.keymap.set('n', '[', "mmbi[<Esc>ea]<Esc>`m<Right>", { silent = true })

-- Enclose a selection in visual mode with "'({[
vim.keymap.set('v', "'", "<Esc><i'<Esc>>a<Right>'<Esc>", { silent = true })
vim.keymap.set('v', '"', '<Esc><i"<Esc>>a<Right>"<Esc>', { silent = true })
vim.keymap.set('v', '(', "<Esc><i(<Esc>>a<Right>)<Esc>", { silent = true })
vim.keymap.set('v', '{', "<Esc><i{<Esc>>a<Right>}<Esc>", { silent = true })
vim.keymap.set('v', '[', "<Esc><i[<Esc>>a<Right>]<Esc>", { silent = true })
