local M = {}

function M.pre() end

function M.post()
  local actions = require("telescope.actions")
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
      },
      file_ignore_patterns = { "node_modules/", ".git/" },
    },
    pickers = { find_files = { hidden = true } },
  })
end

function M.keybind()
  local U = require("neo.tools")
  U.nmap("<Leader>fb", "<Cmd>Telescope buffers<CR>")
  U.nmap("<Leader>fc", "<Cmd>Telescope grep_string<CR>")
  U.nmap("<Leader>ff", "<Cmd>Telescope find_files<CR>")
  U.nmap("<Leader>fg", "<Cmd>Telescope git_status<CR>")
  U.nmap("<Leader>fr", "<Cmd>Telescope live_grep<CR>")
  U.nmap("<Leader>fs", "<Cmd>Telescope lsp_document_symbols<CR>")
  U.nmap("<Leader>fS", "<Cmd>Telescope lsp_workspace_symbols(<CR>")

  require("neo.keybind").leader_help({
    fb = "查找 buffer",
    fc = "查找光标下的单词",
    ff = "查找文件",
    fg = "查找 git status 文件",
    fr = "查找文件内容",
  })
end

return M
