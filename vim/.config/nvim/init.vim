" nvim 启动时的初始化文件
" see :help vimrc

let g:neohome = fnameescape(fnamemodify(resolve(expand('<sfile>:p')), ':h'))

command! -nargs=1 IncScript execute 'source '.g:neohome.'/'.'<args>'


IncScript neoup/myconf.vim
IncScript neoup/plugins.vim
IncScript neoup/plugconf.vim
IncScript neoup/keymap.vim
