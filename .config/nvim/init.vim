" Install vim-plug if not found
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
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
    Plug 'sainnhe/sonokai'
    Plug 'vim-airline/vim-airline'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'karb94/neoscroll.nvim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Allow loading plugins based on file type
filetype plugin on

" Allow truecolor support if possible
if has('termguicolors')
    set termguicolors
endif

" Disable backgrounds for using the terminal's transparency
autocmd VimEnter * highlight Normal ctermbg=NONE guibg=NONE
autocmd VimEnter * highlight EndOfBuffer ctermbg=NONE guibg=NONE

" Configure Sonokai theme (before loading it)
" https://github.com/sainnhe/sonokai/blob/master/doc/sonokai.txt
let g:sonokai_enable_italic = 1
let g:sonokai_better_performance = 1

function! s:sonokai_custom() abort
    let l:configuration = sonokai#get_configuration()
    let l:palette = sonokai#get_palette(l:configuration.style)
    call sonokai#highlight('VertSplit', l:palette.grey, l:palette.bg1)
endfunction

autocmd ColorScheme sonokai call s:sonokai_custom()

" Set the color scheme to Sonokai
colorscheme sonokai

" Configure Airline
let g:airline_theme = 'sonokai'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Having the angled separarors by default looks funny for tabs.
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" Map NERDTree default keybinds
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Set neoscroll default options with everything enabled
lua require('neoscroll').setup()

" Compatibility mode is force-enabled on some distributions
set nocompatible
" Use the system clipboard by default
set clipboard=unnamedplus
" Set mouse to always enabled (normal, visual, insert, and command modes)
set mouse=a
" Display this number of spaces for tab characters
set tabstop=4
" Setting this allows backspace to match tabstop
set softtabstop=4
" Insert spaces when the tab key is pressed
set expandtab
" Show absolute line numbers by default
set number


