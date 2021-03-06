"let g:coc_node_path = ""

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'doums/darcula'
Plug 'NLKNguyen/papercolor-theme'
Plug 'myusuf3/numbers.vim'    "switching relative numbers
Plug 'airblade/vim-gitgutter' "git markers

call plug#end()


set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smarttab
set smartindent
set expandtab

set showmatch
set wildmenu
set colorcolumn=80
set encoding=utf-8
set number

set foldmethod=indent   "fold based on indent
set foldnestmax=2      "deepest fold is 10 levels
set foldlevel=1         "this is just what i use

let g:netrw_browse_split=4      "open files prior windows
let g:netrw_altv=1              "open splits to the right

set path=.,**
set wildignore+=*/node_nodules/*

"show non-printable characters
set list
set listchars+=trail:␣
set listchars-=eol:$

set termguicolors
colorscheme darcula
"set bg=light
"colorscheme PaperColor


" GUI is running or is about to start.
if has("gui_running")
  " Maximize gvim window (for an alternative on Windows).
  set guifont=DejaVu_Sans_Mono:h10:cEASTEUROPE:qDRAFT
  set lines=999 columns=999
endif


" ==========================================
" coc config (snippets from coc README)
" ==========================================

" - install python[23] -m pip install neovim
" - install VLS (Vue Lang. server) by:
"   $ yarn global add vls
"   Verify that :echo g:WorkspaceFolders shows root of Vue project directory
" - CoC communicates with language servers, do autocompletion
"   $ yarn global add neovim

" Auto install Coc extensions
let g:coc_global_extensions = ['coc-json',
\'coc-tsserver',
\'coc-vetur',
\'coc-eslint',
\'coc-css',
\'coc-svg',
\'coc-tailwindcss',
\'coc-vimlsp'
\]
" coc-css: display #colors as terminal colors in .[s]css,.less,.sass


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
