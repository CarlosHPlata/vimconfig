--[[
  Language Server Protocol (LSP) is a powerful tool that evaluates your file against a language server in the background,
  providing instant feedback about compilation or language errors.

  this will let us see errors, sugestion to those errors, and also the documentation of the function we are using.

  Below you will find details on three different packages for LSP configuration.

  1. mason.nvim
    This package provides the LSP parsers. You can use:
      :Mason
    to check and install LSP parsers.
    More information can be found here: 
    https://github.com/williamboman/mason.nvim

  2. mason-lspconfig.nvim
    This package allows mason to communicate with the LSP configuration servers.
    It also ensures that the language servers are installed before proceeding further.
    More information can be found here:
    https://github.com/williamboman/mason-lspconfig.nvim

  3. nvim-lspconfig
    This package lets Neovim communicate with the language servers installed in the background.
    It serves as a communication channel so Neovim can send messages to the language servers.
    - You can check LSP configuration by using:
      :LspInfo
    - You can check extended functionality of available functions with vim bindings by using:
      :h vim.lsp.buf
    More information can be found here: 
    https://github.com/neovim/nvim-lspconfig

  TO INSTALL A NEW LSP CONFIGURATION:
    1. Check the list of available language servers at:
      https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
    2. Add the server to the mason-lspconfig.nvim configuration
      ensure_installed list.
    3. Add the required configuration setup to nvim-lspconfig.
--]]
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- Add new LSP parsers here for step 2
        ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer" }
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- The following lines are only available if you have an auto_complete plugin file
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspOptions = { capabilities = capabilities }
      --
      -- Otherwise, uncomment this line
      -- local lspOptions = {}
      --
      local lspconfig = require("lspconfig")

      -- Add your new configurations here for step 3
      lspconfig.lua_ls.setup(lspOptions)
      lspconfig.ts_ls.setup(lspOptions)
      lspconfig.rust_analyzer.setup(lspOptions)

      -- Keymaps for LSP configuration
      vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover, {}) -- Open documentation pane for symbol under cursor
      vim.keymap.set("n", "<leader>gt", vim.lsp.buf.definition, {}) -- Go to definition of symbol under cursor
      vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {}) -- Go to implementation of symbol under cursor
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {}) -- Open the code actions pane to help fix errors in your code
    end
  }
}
