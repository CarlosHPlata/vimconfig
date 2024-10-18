--[[
	!!!!!!!!!!!!!!
  WARNING THIS FILE REQUIRES YOU TO HAVE THE
						lsp_config.lua
	FILE FIRST IN YOUR PLUGINS
  !!!!!!!!!!!!!!

	auto completion is the last of our tools it uses built in LSP

	for this we will require multiple plugins

	nvim-cmp: A completion plugin for Neovim.
	cmp-nvim-lsp: Source for nvim-cmp to provide LSP completions.
	LuaSnip: Snippet engine for Neovim.
	cmp_luasnip: Source for nvim-cmp to provide LuaSnip completions.
	friendly-snippets: A collection of snippets for various languages.

	The configuration sets up nvim-cmp with the following features:
	- Snippet expansion using LuaSnip.
	- Bordered windows for completion and documentation.
	- Key mappings for navigating and confirming completions.
	- Sources for LuaSnip, LSP, and buffer completions.
	- Cmdline completion for search ("/", "?") and command mode (":").
	- LSP configuration (commented out) for integrating with nvim-cmp.

	Note: Ensure you have the required plugins installed and configured properly.

	Note2: ensure you have the lsp_config file first in your plugins
	and additionally there's a couple lines in that file commented out required
--]]
return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						--[[
							vsnip users have to install the following:
						 	https://github.com/hrsh7th/vim-vsnip
							is the same as luasnip but pure vimscript
							add this to the tuple for installation:
							{
								"hrsh7th/vim-vsnip",
								dependencies = {
									"hrsh7th/vim-vsnip-integ",
								},
							}
							then you can use the following line instead of the one below
							vim.fn["vsnip#anonymous"](args.body) -- For vsnip users.
						]]
						require("luasnip").lsp_expand(args.body) -- For luasnip users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set select to false to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "nvim_lsp" },
				}, {
					{ name = "buffer" },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled native_menu, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})

			-- Set up lspconfig.
			-- the following lines have to be added to lsp_config.lua
			-- but don't worry they are already there commented out
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
			-- require("lspconfig")["<YOUR_LSP_SERVER>"].setup({
			-- capabilities = capabilities,
			-- })
		end,
	},
}