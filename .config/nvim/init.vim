" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
" Install vim-plug if not found
let data_dir = $HOME . '/.config/nvim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent !curl -fLo  data_dir . '/autoload/plug.vim' --create-dirs
        \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
\| endif

" Add all the plugins
call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'karb94/neoscroll.nvim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Map NERDTree default keybinds
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Set mouse to always enabled (normal, visual, insert, and command modes)
set mouse=a

" Set neoscroll default options with everything enabled
lua require('neoscroll').setup()

" Compatibility mode is force-enabled on some distributions
set nocompatible

" Use the system clipboard by default
set clipboard=unnamedplus

