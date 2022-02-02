local M = {}

function M.pre()
  local vg = vim.g

  -- 大纲列表不延迟
  vg.vista_cursor_delay = 0
  vg.vista_executive_for = { python = "coc" }
  -- 大纲列表图标
  vim.g["vista#renderer#icons"] = {
    ["augroup"] = "⋐",
    ["class"] = "𝒞",
    ["const"] = "🅲",
    ["constant"] = "🅲",
    ["default"] = "⎅",
    ["enum"] = "☷",
    ["enumerator"] = "☷",
    ["field"] = "⚆",
    ["fields"] = "⚇",
    ["func"] = "𝑓",
    ["function"] = "𝑓",
    ["functions"] = "𝑓",
    ["implementation"] = "⛣",
    ["interface"] = "⚯",
    ["macro"] = "☢",
    ["macros"] = "☢",
    ["map"] = "❴❵",
    ["member"] = "☌",
    ["method"] = "𝑚",
    ["module"] = "⬢",
    ["modules"] = "⬢",
    ["namespace"] = "",
    ["package"] = "⯄",
    ["packages"] = "⯄",
    ["property"] = "襁",
    ["struct"] = "❴❵",
    ["subroutine"] = "⥹",
    ["target"] = "🞉",
    ["type"] = "𝒯",
    ["typedef"] = "𝒯",
    ["typeParameter"] = "𝒫",
    ["types"] = "𝒯",
    ["union"] = "⚉",
    ["var"] = "𝜈",
    ["variable"] = "𝜈",
    ["variables"] = "𝜈",
  }
end

function M.post() end

return M
