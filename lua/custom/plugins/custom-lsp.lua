return {
  'neovim/nvim-lspconfig',
  config = function()
    -- 1. Setup clangd using the new native config API
    vim.lsp.config('clangd', {
      cmd = { '/usr/bin/clangd' },
    })

    -- 2. Setup lua_ls using the new native config API
    vim.lsp.config('lua_ls', {
      cmd = { '/data/data/com.termux/files/usr/bin/lua-language-server' },
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })
  end,
}
