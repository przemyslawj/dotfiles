" Automatic reloading of .vimrc
" let g:miniBufExplMapCTabSwitchBufs = 1
autocmd! bufwritepost .vimrc source %

" Set colour scheme
syntax enable
set background=dark
colorscheme solarized

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a
set bs=2 "backspace working as normal

set encoding=utf-8
set nocompatible
set showmode
set showcmd
set wildmode=longest,list

:set cursorline

" Tabs as spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

set nolinebreak

" Remove trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

"set list listchars=tab:>-,trail:.,extends:>

" Line numbers and length
set number
set tw=79 " width of the document
set fo-=t " don't wrap text when typing
set nowrap " don't wrap on load
set colorcolumn=80

" Search
set hlsearch " highlight all matches
set ignorecase " case insensitive
set incsearch
set smartcase " case insensitive

" No backups or swaps of file
set nobackup
set nowritebackup
set noswapfile

set autoindent
"set spelllang=en
"set spell

"set wildmenu
filetype off

filetype plugin indent on

"autocmd FileType python set omnifunc=pythoncomplete#Complete
"set ofu=syntaxcomplete#Complete

syntax on

" Remember position of the cursor in the file after reopening
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal g`\"" |
	\ endif

" New files opened in insert mode (conflicts with quick doc of YCM)
" autocmd BufNewFile * startinsert

" Don't allow modification of readonly files
au BufReadPost * :call CheckReadonly()
function! CheckReadonly()
    if version >= 600
        if &readonly
            setlocal nomodifiable
        endif
    endif
endfunction

let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplModSelTarget = 1


" Key remappings

" Rebind <Leader> key
let mapleader = ","

" Don't loose selection of code after shift right or left
vnoremap < <gv
vnoremap > >gv

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim
" https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
call pathogen#infect()

" ============================================================================
" Python IDE Setup
" ============================================================================

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#documentation_command = "<leader>q"
let g:jedi#usages_command = "<leader>n"
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim
" http://www.vim.org/scripts/download_script.php?src_id=5492
"" set nofoldenable

map <Leader>n <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1
