local M = {}

function M.pre() end

function M.post()
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  local kind_icons = {
    Text = "",
    Method = "𝑚",
    Function = "𝑓",
    Constructor = "⎅",
    Field = "⚇",
    Variable = "𝜈",
    Class = "𝒞",
    Interface = "⚯",
    Module = "",
    Property = "",
    Unit = "⛣",
    Value = "",
    Enum = "☷",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "🅲",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "𝒯",
  }

  cmp.setup.global({
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
    }, {
      { name = "buffer" },
      { name = "path" },
    }),
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    formatting = {
      fields = { "abbr", "menu", "kind" },
      format = function(entry, item)
        item.kind = string.format("%s %s ", kind_icons[item.kind] or item.kind, entry.source.name)
        return item
      end,
    },
    mapping = {
      ["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end,
      ["<S-Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end,
    },
  })

  cmp.setup.cmdline("/", {
    sources = {
      { name = "buffer" },
    },
  })

  cmp.setup.cmdline(":", {
    sources = {
      { name = "path" },
      { name = "cmdline" },
    },
  })
end

function M.keybind() end

return M
