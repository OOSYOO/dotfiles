-- keybind.lua
-- Note: <Plug> can NOT be used in noremap

local which_key_map = {}

which_key_map.w = {
  ["name"] = "windows",
  ["p"] = { "<C-W>p", "上一窗口" },
  ["n"] = { "<Cmd>vnew<CR>", "新建窗口" },
  ["c"] = { "<C-W>c", "关闭当前窗口" },
  ["o"] = { "<C-W>o", "关闭其他窗口" },
  ["s"] = { "<C-W>s", "水平分割窗口" },
  ["v"] = { "<C-W>v", "垂直分割窗口" },
  ["w"] = { "<C-W>w", "选择下一个窗口" },
  ["h"] = { "<C-W>h", "选择左边的窗口" },
  ["j"] = { "<C-W>j", "选择下边的窗口" },
  ["l"] = { "<C-W>l", "选择右边的窗口" },
  ["k"] = { "<C-W>k", "选择上边的窗口" },
  ["["] = { "<C-W>5<", "向左扩大窗口" },
  ["]"] = { "<C-W>5>", "向右扩大窗口" },
  ["="] = { "<Cmd>resize +5<CR>", "向下扩大窗口" },
  ["-"] = { "<Cmd>resize -5<CR>", "向上扩大窗口" },
  ["/"] = { "<C-W>=", "令窗口平分长度" },
}

which_key_map.t = {
  ["name"] = "tab/translate/tags",
  ["n"] = { "tabnew", "打开新 tab" },
  ["c"] = { "tabclose", "关闭当前tab" },
  ["o"] = { "tabonly", "关闭其他tab" },
  ["]"] = { "tabnext", "下一个tab" },
  ["["] = { "tabprevious", "上一个tab" },
  ["f"] = { "tabfirst", "第一个tab" },
  ["l"] = { "tablast", "最后一个tab" },
}

which_key_map.b = {
  ["name"] = "buffers",
  ["l"] = { "blast", "last-buffer" },
  ["f"] = { "bfirst", "first-buffer" },
  ["d"] = { "bdelete", "delete-buffer" },
}

which_key_map.f = {
  ["name"] = "files/search",
}

which_key_map.g = {
  ["name"] = "git/goto",
}

which_key_map.c = {
  ["name"] = "coding",
  ["k"] = { "<Cmd>set spell!<CR>", "拼写检查" },
}

which_key_map.y = {
  ["name"] = "yank",
  ["y"] = { "<Cmd>%y+<CR>", "复制全部内容到 clipboard" },
}

which_key_map.v = {
  ["name"] = "vim",
  ["m"] = { "<Cmd>lua require('neo.tools').ToggleMouse()<CR>", "切换鼠标" },
  ["q"] = { "<Cmd>wa<CR>:q<CR>", "保存全部文件并退出" },
  ["Q"] = { "<Cmd>qa!<CR>", "不做任何保存直接退出" },
}

local M = {}

local add_help = function(fk, help)
  first_key = fk:sub(1, 1)
  if not which_key_map[first_key] then
    which_key_map[first_key] = {}
  end

  second_key = fk:sub(2, 2)
  exist_help = which_key_map[first_key][second_key]
  if exist_help then
    vim.notify(
      "keymap <Leader>" .. fk .. " already exists for: " .. exist_help .. " replace to: " .. help,
      vim.log.levels.WARN
    )
  end
  which_key_map[first_key][second_key] = help
end

M.leader_help = function(key_help_tb)
  for k, v in pairs(key_help_tb) do
    add_help(k, v)
  end
end

M.register_keymap = function()
  local U = require("neo.tools")

  U.nmap("<C-s>", "<Cmd>update<CR>")
  U.vmap("<C-s>", "<Esc><Cmd>update<CR>")
  U.imap("<C-s>", "<Esc><Cmd>update<CR>")

  -- normal 模式复制当前行到 clipboard
  U.nmap("<C-y>", "<Cmd>lua require('neo.tools').YankOneLine()<CR>")
  -- 可视化复制选中内容到 clipboard
  U.vmap("<C-y>", [["+y]])
  -- Paste from clipboard
  U.nmap("<C-p>", [["+p]])
  U.vmap("<C-p>", [["+p]])

  local wk = require("which-key")
  -- 元访问器只对 vim.g 有效，因此 vim.g.which_key_map.x
  -- 不会触发元访问器来更新 vim.g.which_key_map 中的 x
  -- vim.g.which_key_map = which_key_map
  wk.register(which_key_map, { prefix = "<Leader>" })
end

return M
