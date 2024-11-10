--[[
  This configuration file sets up various Vim options to enhance the editing experience.
]]

vim.cmd("set expandtab")        -- Set to use spaces instead of tabs
vim.cmd("set tabstop=2")        -- Set tab width to 2 spaces
vim.cmd("set softtabstop=2")    -- Set the number of spaces that a <Tab> counts for while performing editing operations
vim.cmd("set shiftwidth=2")     -- Set the number of spaces to use for each step of (auto)indent

vim.cmd("set mouse=a")          -- Enable mouse support in all modes

-- NOTE: some systems like wsl2 may not have the en_US locale and have to use the utf-8 version
-- or viseversa
-- vim.cmd("language en_US")      -- Set the language to US English
vim.cmd("language en_US.UTF-8")   -- Set the language to US English with UTF-8 encoding

vim.cmd("set cursorline")       -- Highlight the screen line of the cursor with CursorLine
vim.cmd("set numberwidth=1")    -- Set the number column width to 1
vim.cmd("set clipboard+=unnamedplus") -- Use the system clipboard for all operations
vim.cmd("syntax enable")       -- Enable syntax highlighting
vim.cmd("set showcmd")          -- Show (partial) command in the last line of the screen
vim.cmd("set encoding=utf-8")   -- Set the encoding to UTF-8
vim.cmd("set number relativenumber")           -- Show line numbers

vim.opt.conceallevel = 1 -- Enable concealing text

vim.opt.smartindent = true -- Enable smart indent to automatically insert indent where needed
vim.opt.wrap = false -- Disable line wrapping meaning that long lines will not wrap to the next line

-- Disable search highlighting
-- When hlsearch is set to false, Neovim will not highlight all matches of a search pattern.
-- This can help reduce visual clutter and improve performance, especially in large files.
vim.opt.hlsearch = false
-- Enable incremental search
-- When incsearch is set to true, Neovim will show matches for the search pattern as you type.
-- This provides immediate feedback and helps in quickly locating the desired text.
vim.opt.incsearch = true


-- Enable true color support
-- When termguicolors is set to true, Neovim will use 24-bit RGB colors in the terminal.
-- This allows for a wider range of colors and better visual appearance of themes and syntax highlighting.
vim.opt.termguicolors = true

-- Set the number of context lines above and below the cursor
-- When scrolloff is set to 8, Neovim will keep at least 8 lines visible above and below the cursor.
-- This helps maintain context and improves navigation, especially in large files.
vim.opt.scrolloff = 8

-- Always show the sign column
-- When signcolumn is set to "yes", Neovim will always display the sign column.
-- This prevents the text from shifting when signs (e.g., for linting or version control) are added or removed.
vim.opt.signcolumn = "yes"

-- Append '@-@' to the 'isfname' option
-- This allows the '@' character to be part of filenames, which can be useful for certain file naming conventions.
vim.opt.isfname:append("@-@")
