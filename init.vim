"== VIM PLUG ================================
call plug#begin('~/.vim/plugged')
"------------------------ COC ------------------------
" coc for tslinting, auto complete and prettier
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-eslint']
"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" vim-tsx will do all the coloring for jsx in the .tsx file
Plug 'ianks/vim-tsx'
"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" typescript-vim will do all the coloring for typescript keywords
Plug 'leafgarland/typescript-vim'
" Ale
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'othree/yajs'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

"------------------------ THEME ------------------------
" most importantly you need a good color scheme to write good code :D
Plug 'dikiaap/minimalist'
call plug#end()
" == VIMPLUG END ================================
" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================
let g:jsx_ext_required = 0

let g:ale_fixers = {
\ 'javascript': ['eslint']
\ }
let g:ale_linters = {
\ 'javascript': ['prettier-eslint', 'eslint'],
\ }
"let g:ale_sign_error = '❌'
"let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:user_emmet_leader_key=','
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" LEADER 
let mapleader = '.'

"Mostrar tabs
set list
"set listchars=tab:>-,trail:.
set listchars=tab:>.,trail:-
"Bajar el timeout del doble tecla
"set timeout timeoutlen=150

"set selectmode=mouse
" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

"Intent
set autoindent
set smartindent
"set cindent

"Enable Syntax
set t_Co=256
syntax enable
colorscheme minimalist
set background=dark

"BackSpace
set backspace=indent,eol,start

" plugins por tipo de archivo
filetype plugin on
filetype indent on

" busqueda incremental (a medida que se escribe)
set incsearch
set ruler
set joinspaces
set showmatch
set showcmd
set timeout timeoutlen=150
set wildmenu
set wildmode=list:longest
set tabstop=4
set softtabstop=4
set shiftwidth=4
set mouse=

set number

" resulados de busquedas resaltados
set hlsearch

"permite foldear funciones con za y zc en funcion de la sintaxis
"set foldmethod=indent
"set foldopen=all

if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

map <F2> :NERDTreeToggle <CR>

" Tab control
map <C-l> :tabn <CR>
map <C-h> :tabp <CR>
map <C-n> :tabnew <CR>
map <C-1> :tabm 1<CR>
map <C-2> :tabm 2<CR>
map <C-3> :tabm 3<CR>
map <C-4> :tabm 4<CR>
map <C-5> :tabm 5<CR>
map <C-6> :tabm 6<CR>
map <C-7> :tabm 7<CR>
map <C-8> :tabm 8<CR>
map <C-9> :tabm 9<CR>
map <space> /
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
map <F8> <Plug>(ale_fix)
map <F7> <Plug>(ale_toggle)
vnoremap < <gv
vnoremap > >gv

""folding para javascript
"augroup javascript_folding
"	au!
"	au FileType javascript setlocal foldmethod=syntax
"augroup END

set ic
set smartcase
let g:gitgutter_async=0
setlocal iskeyword-=:
