local M = {}

function M.pre() end

local enhance_server_opts = {
  ["sumneko_lua"] = function(opts)
    local runtime_path = vim.split(package.path, ";")
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    opts.settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = runtime_path,
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    }
  end,
  -- ["cland"] = function(opts)
  --   opts.settings = {
  -- 		cmd = {
  -- 			"clangd",
  -- 			"--background-index",
  -- 			"--pch-storage=memory",
  -- 			-- You MUST set this arg ↓ to your clangd executable location (if not included)!
  -- 			"--query-driver=/usr/bin/clang++,/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
  -- 			"--clang-tidy",
  -- 			"--all-scopes-completion",
  -- 			"--cross-file-rename",
  -- 			"--completion-style=detailed",
  -- 			"--header-insertion-decorators",
  -- 			"--header-insertion=iwyu",
  -- 		},
  --   }
  -- end,
}

local lspconfig = function(server_name)
  -- Add additional capabilities supported by nvim-cmp
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- kevinhwang91/nvim-ufo
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  local opts = {
    -- apply to all lsp servers
    -- autostart = false,
    capabilities = capabilities,
    on_attach = function(client)
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false
    end,
  }

  if enhance_server_opts[server_name] then
    enhance_server_opts[server_name](opts)
  end
  if server_name == "clangd" then
    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    opts.capabilities.offsetEncoding = { "utf-16" }
    -- require("lspconfig").clangd.setup({ capabilities = capabilities })
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })

  require("lspconfig")[server_name].setup(opts)
end

function M.post()
  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })

  require("mason-lspconfig").setup({
    ensure_installed = {
      "sumneko_lua",
      "rust_analyzer",
      "tsserver",
      "pylsp",
      "gopls",
      "clangd",
    },
  })

  require("mason-lspconfig").setup_handlers({ lspconfig })
end

function M.keybind() end

return M
