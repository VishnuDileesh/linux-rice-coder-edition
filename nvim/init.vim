" Plugins (VimPlug)
call plug#begin('~/.vim/plugged')
"	Tools
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'airblade/vim-gitgutter'
	Plug 'junegunn/goyo.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
"	Syntax
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'leafgarland/typescript-vim'
  Plug 'tpope/vim-markdown'
	Plug 'ap/vim-css-color'
	Plug 'vim-scripts/fountain.vim'
"	Plug 'morhetz/gruvbox'
  Plug 'vim-python/python-syntax'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'tpope/vim-surround'
  Plug 'mattn/emmet-vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'preservim/nerdtree'
  Plug 'wsdjeg/indentLine'
  Plug 'preservim/nerdcommenter'
  Plug 'google/vim-maktaba'
  Plug 'google/vim-codefmt'
  Plug 'google/vim-glaive'
  Plug 'dense-analysis/ale'
  Plug 'liuchengxu/vim-which-key'
  Plug 'justinmk/vim-sneak'
  Plug 'unblevable/quick-scope'
  Plug 'sheerun/vim-polyglot'
  Plug 'dense-analysis/ale'
" Themes
  Plug 'dracula/vim',{'as':'dracula'}
"  Plug 'cocopon/iceberg.vim'
  Plug 'ghifarit53/tokyonight-vim'
call plug#end()

" General Settings


set encoding=UTF-8
syntax enable
syntax on
set noswapfile
set nobackup
set incsearch
set nohlsearch
set scrolloff=7
set autoread
set wildmenu
set cursorline
set tabstop=2
set smarttab
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set expandtab
" set hls is
set ic
set laststatus=2
set cmdheight=1
filetype plugin on

" Color settings
"colorscheme gruvbox
"set background=dark

" colorscheme dracula 




" hi! Normal ctermbg=NONE guibg=NONE
" hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
"

if(has("termguicolors"))
  set termguicolors
  hi LineNr ctermbg=NONE guibg=NONE
endif

let g:tokyonight_style = 'night' "available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight



"Key Bindings
let mapleader = ","
map <C-Space> :Goyo<CR>
map <C-l> :set background=light<CR>
map <C-b>b :set background=dark<CR>

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Fuzzy finder
nnoremap <C-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" vim-which-key Config
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>


" Coc explorer
map <C-e> :CocCommand explorer<CR>


" NerdTree Config
map <C-o> :NERDTreeToggle<CR>


" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-t>
" " start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" " open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction

nnoremap <c-t> :call OpenTerminal()<CR>


" NerdCommenter Config

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or
" not
let g:NERDToggleCheckAllLines = 1
"  Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
"  Map ++ to call NERD Commenter and use iTerm key bindings 
"  to bind Ctmd+/ to ++
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" Emmet Config
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','


" Quotes key mapping
:nnoremap <Leader>q" ciw""<Esc>P
:nnoremap <Leader>q' ciw''<Esc>P'"

au! BufNewFile,BufRead *.svelte set ft=html


" Coc config
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

let g:coc_user_config = {}

let g:coc_disable_startup_warning = 1

" ALE Config
let g:airline#extensions#ale#enabled = 1

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" " You can disable this option too
" " if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

let g:ale_fixers = {
    \ 'javascript': ['eslint'],
    \ 'typescript': ['prettier', 'eslint'],
    \ 'vue': ['eslint'],
    \ 'scss': ['prettier'],
    \ 'html': ['prettier'],
    \ 'reason': ['refmt'],
    \ 'python': ['autopep8', 'yapf'],
    \}


let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_fix_on_save = 1


" FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

" Autocodefromatting Config
"augroup autoformat_settings
"  autocmd FileType bzl AutoFormatBuffer buildifier
"  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
"  autocmd FileType dart AutoFormatBuffer dartfmt
"  autocmd FileType go AutoFormatBuffer gofmt
"  autocmd FileType gn AutoFormatBuffer gn
  "autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer prettier
"  autocmd FileType java AutoFormatBuffer google-java-format
"  autocmd FileType python AutoFormatBuffer yapf
"  autocmd FileType rust AutoFormatBuffer rustfmt
  "autocmd FileType vue AutoFormatBuffer prettier
"augroup END

