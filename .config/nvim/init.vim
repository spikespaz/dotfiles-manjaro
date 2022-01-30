" Add all the plugins
call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'karb94/neoscroll.nvim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

# Map NERDTree default keybinds
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

