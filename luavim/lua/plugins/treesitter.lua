--[[
  Tree sitter is an amazing tool that creates an abstract tree of the files.
  An abstract tree is later used by a parser for better understanding of the language
  it helps with highlighting code in the right syntaxt and format, and with identation

  check here
  https://github.com/nvim-treesitter/nvim-treesitte

  add this line for specific language support:
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },

  or this one for all languages
  ensure_installed = "maintained"
]]
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		auto_install = true, -- this will auto install language support when opening a file
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
	},
}
