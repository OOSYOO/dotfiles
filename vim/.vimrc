" vim 启动时的初始化文件 see :help vimrc

" 如果要同时应用于 neovim，可以创建以下符号链接:
" ~/.config/nvim           -->  ~/.vim
" ~/.config/nvim/init.vim  -->  ~/.vimrc

" 自动检查并安装 vim-plug 包管理器
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 安装插件包到 ~/.vim/plugged 目录
call plug#begin('~/.vim/plugged')
" 一组最通用的默认配置
Plug 'tpope/vim-sensible'
" 增强的状态栏
Plug 'vim-airline/vim-airline'
" 状态栏主题包
Plug 'vim-airline/vim-airline-themes'
" 颜色主题
Plug 'liuchengxu/space-vim-dark'
" 彩虹显示匹配的括号
Plug 'luochen1990/rainbow'
" 显示缩进线
Plug 'Yggdroot/indentLine'
" 高亮光标下相同的单词
Plug 'itchyny/vim-cursorword'
" 显示目录树
Plug 'scrooloose/nerdtree'
" 显示文件类型图标
Plug 'ryanoasis/vim-devicons'
" 显示函数签名
Plug 'Shougo/echodoc'
" 侧栏显示文件结构大纲
Plug 'majutsushi/tagbar'
" 自动调用 ctags/gtags 为 c/c++ 源码生成tags数据，用于查看和跳转
Plug 'ludovicchabant/vim-gutentags'
" 高亮光标下相同的单词
Plug 'itchyny/vim-cursorword'
" 自动管理 gtags 对多个数据库的连接
Plug 'skywind3000/gutentags_plus'
" 自动补全，并为部分语言提供 语法诊断 跳转 信息提示 重构
Plug 'Valloric/YouCompleteMe'
call plug#end()

" 设置编码为 utf-8
set encoding=utf-8
" 设置 <Leader> 键
let mapleader = " "
" 设置读取当前目录下配置，并且禁用危险命令
set exrc secure
" 显示行号 高亮光标所在的行
set nu cursorline
" 总是显示指示列
set signcolumn=yes
" 开启新行时对齐到当前行; 使用合适的空格替代插入 <Tab>
set autoindent smartindent expandtab
" 设置缩进为4个空格 一个 <Tab> 等同于4个空格 每4个空格等同于一个 <Tab>
set shiftround shiftwidth=4 tabstop=4 softtabstop=4
" 设置窗口分割线为连续实线
set fillchars=vert:\│
" 设置搜索高亮
set hlsearch incsearch

" 设置背景颜色
set background=dark
" 在终端中使用gui高亮色，以支持 true color
set termguicolors
" 设置 true color 之后，以下设置纠正部分终端的颜色问题
" see :help xterm-true-color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" 使用 space-vim-dark 色彩方案
colorscheme space-vim-dark
" 设置背景色深度
let g:space_vim_dark_background = 235
" 设置注释使用斜体，使背景色透明
hi Comment    cterm=italic guifg=#5c6370 ctermfg=59
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

" 使用增强状态栏后不再需要 vim 的模式提示
set noshowmode
" 设置命令行高为2，提供足够的显示空间
set cmdheight=2
" 状态栏使用 powerline 字体
let g:airline_powerline_fonts = 1
" 选择一个状态栏主题
let g:airline_theme = 'minimalist'
" 自动启用彩虹括号，设置为0以手动启用
let g:rainbow_active = 1
" 默认不显示缩进线
let g:indentLine_enabled = 0

set tags=./.tags;,.tags,~/.cache/tags/sys-.tags
set path=.,/usr/include,/usr/include/*,/usr/lib/*/include,/usr/lib/gcc/**/include
" 使用 pygments 辅助 gtags 支持更多的语言
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/share/gtags/gtags.conf'
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = ["ctags", "gtags_cscope"]

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')
" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px', '--c-kinds=+px']
" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings = 1
let g:ycm_confirm_extra_conf = 0
" let g:ycm_global_ycm_extra_conf = expand('~/.vim/ycm_extra_conf.py')

let g:ycm_semantic_triggers =  {
\   'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
\   'cs,lua,javascript': ['re!\w{2}'],
\}

" 顺手一点的窗口宽度调整
nnoremap <silent> <C-w>[ :vertical resize -5<CR>
nnoremap <silent> <C-w>] :vertical resize +5<CR>
" 快速编辑和生效 .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" 默认显示隐藏文件
let NERDTreeShowHidden=1
" 切换显示目录树
noremap <silent> <C-h> :NERDTreeToggle<CR>
" 快速保存
nnoremap <silent> <leader>sf :write<CR>
vnoremap <silent> <leader>sf <Esc>:write<CR>
inoremap <silent> <leader>sf <Esc>:write<CR>

