" 安装插件包到 plugged 目录
call plug#begin('~/.vim/plugged')

" 个人自定义的一些工具
Plug g:neohome.'/moetools'
" 一组最通用的默认配置
Plug 'tpope/vim-sensible'
" 增强的状态栏
Plug 'vim-airline/vim-airline'
" 状态栏主题包
Plug 'vim-airline/vim-airline-themes'
" 颜色主题
Plug 'liuchengxu/space-vim-dark'
Plug 'joshdick/onedark.vim'
" 彩虹显示匹配的括号
Plug 'luochen1990/rainbow'
" 显示缩进线
Plug 'Yggdroot/indentLine'
" 显示来自版本控制的修改状态
Plug 'mhinz/vim-signify'
" 高亮光标下相同的单词
Plug 'itchyny/vim-cursorword'
" 快捷注释文本
Plug 'scrooloose/nerdcommenter'
" 显示目录树
Plug 'scrooloose/nerdtree'
" 显示文件类型图标
Plug 'ryanoasis/vim-devicons'
" 显示函数签名
Plug 'Shougo/echodoc'
" 侧栏显示文件结构大纲
Plug 'majutsushi/tagbar'
" 模糊搜索
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" 更好的语法高亮
Plug 'sheerun/vim-polyglot'
" Plug 'octol/vim-cpp-enhanced-highlight', { 'for': [ 'c', 'cpp' ] }
" 自动调用 ctags/gtags 为 c/c++ 源码生成tags数据，用于查看和跳转
Plug 'ludovicchabant/vim-gutentags'
" 自动管理 gtags 对多个数据库的连接
Plug 'skywind3000/gutentags_plus'
" 语法检查
Plug 'w0rp/ale'
" 自动补全, lsp-client
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install'}
" Plug 'Valloric/YouCompleteMe'

call plug#end()
