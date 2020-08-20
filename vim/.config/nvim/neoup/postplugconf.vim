" postplugconf.vim
" 与插件定制功能相关的配置，在插件载入后配置（调用型的配置）


" Plug 'liuchengxu/space-vim-theme'
" ================================================================================
colorscheme space_vim_theme

hi Comment    guifg=#00688B ctermfg=59
hi CursorLine ctermbg=238 guibg=#133440
hi WildMenu   ctermfg=172 ctermbg=238 guifg=#d78700 guibg=#444444 guisp=NONE cterm=NONE,bold gui=NONE,bold
hi StatusLine ctermfg=173 ctermbg=233 guifg=#e18254 guibg=#262626 guisp=NONE cterm=NONE gui=NONE


" build-in terminal color
" ================================================================================
" xfce4/terminal/colorschemes/chaney_dark.theme

let g:terminal_color_0  = "#073642"
let g:terminal_color_1  = "#dc322f"
let g:terminal_color_2  = "#EBCB8B"
let g:terminal_color_3  = "#AAB288"
let g:terminal_color_4  = "#9DA786"
let g:terminal_color_5  = "#d33682"
let g:terminal_color_6  = "#16D5B6"
let g:terminal_color_7  = "#eee8d5"
let g:terminal_color_8  = "#22444D"
let g:terminal_color_9  = "#cb4b16"
let g:terminal_color_10 = "#586e75"
let g:terminal_color_11 = "#657b83"
let g:terminal_color_12 = "#839496"
let g:terminal_color_13 = "#6c71c4"
let g:terminal_color_14 = "#93a1a1"
let g:terminal_color_15 = "#fdf6e3"

let g:terminal_ansi_colors = [
    \ "#073642","#dc322f","#EBCB8B","#AAB288","#9DA786","#d33682","#16D5B6","#eee8d5",
    \ "#22444D","#cb4b16","#586e75","#657b83","#839496","#6c71c4","#93a1a1","#fdf6e3"
    \ ]


" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install'}
" ================================================================================

call coc#add_extension(
    \ 'coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-css',
    \ 'coc-json', 'coc-vimlsp', 'coc-yaml', 'coc-snippets',
    \ 'coc-python', 'coc-lists', 'coc-marketplace', 'coc-pairs',
    \ 'coc-dictionary', 'coc-word', 'coc-emoji', 'coc-syntax', 'coc-go'
    \ )


" end preplugconf
