" temp supresion of IMP import in latest vim remove after fix is released
if has('python3')
  silent! python3 1
endif

" don't bother with vi compatibility
set nocompatible

" enable syntax highlighting
syntax enable

"if no plug add plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" configure Plug
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] },
Plug 'vim-airline/vim-airline',
Plug 'tpope/vim-vinegar',
Plug 'airblade/vim-gitgutter',
Plug 'tpope/vim-fugitive',
Plug 'editorconfig/editorconfig-vim',
Plug 'edkolev/tmuxline.vim',
Plug 'jiangmiao/auto-pairs',
Plug 'moll/vim-bbye',
Plug 'easymotion/vim-easymotion'
Plug 'rking/ag.vim'
Plug 'Quramy/tsuquyomi'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'takac/vim-hardtime'

" A collection of language packs for Vim.
Plug 'sheerun/vim-polyglot',

"coment comands 
 Plug 'tpope/vim-commentary'

""smipets
"" Track the engine.
"Plug 'SirVer/ultisnips',
"" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets',

call plug#end()

filetype plugin indent on

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=8                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

autocmd BufEnter *.jss :setlocal filetype=javascript
autocmd BufEnter *.theme :setlocal filetype=javascript

"disable polyglot for javascript pangloss/vim-javascript is much better.
" let g:polyglot_disabled = ['javascript', 'jsx', 'typescript.jsx', 'typescript.tsx', 'javascript.jsx']

" diables basic mouse behavior such as resizing buffers.
set mouse-=a
" no arrow keys now were getting serious
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" keyboard shortcuts
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>l :Align
noremap <leader>p :Prettier<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
noremap <leader>a :ALEGoToDefinition<CR>
noremap <leader>s :ALEGoToDefinitionInSplit<CR>
noremap <leader>d :ALEGoToDefinitionInVSplit<CR>
nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
nnoremap <leader>g :GitGutterToggle<CR>
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:gitgutter_enabled = 1

" Vim hard time config start 
let g:hardtime_default_on = 1
let g:list_of_normal_keys = ["h", "j", "k", "l", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = []
" Vim hard time config end


" Vim easy motion config start
let g:EasyMotion_do_mapping = 0 " Disable default mappings
"JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" find word
map <Leader>w <Plug>(easymotion-w)
" find letter
map <Leader>f <Plug>(easymotion-f)
" Vim easy motion config end

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
" extra rails.vim help
autocmd User Rails silent! Rnavcommand decorator      app/decorators            -glob=**/* -suffix=_decorator.rb
autocmd User Rails silent! Rnavcommand observer       app/observers             -glob=**/* -suffix=_observer.rb
autocmd User Rails silent! Rnavcommand feature        features                  -glob=**/* -suffix=.feature
autocmd User Rails silent! Rnavcommand job            app/jobs                  -glob=**/* -suffix=_job.rb
autocmd User Rails silent! Rnavcommand mediator       app/mediators             -glob=**/* -suffix=_mediator.rb
autocmd User Rails silent! Rnavcommand stepdefinition features/step_definitions -glob=**/* -suffix=_steps.rb
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

" ale linter config
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_completion_enabled = 1

let g:jsx_ext_required = 0

set nobackup         " Don't keep a backup before overwriting a file
set nowb             " Don't backup file before overwriting
set noswapfile       " Don't use a swap file

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
ca Ag Ag!


" hi its hybrid line numbers https://jeffkreeftmeijer.com/vim-number/
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

command! ZZ wq

set nocompatible
set nocursorline " don't highlight current line

" keyboard shortcuts
inoremap jj <ESC>

" gui settings
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif

" Enable true color 
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
let g:gruvbox_italic=1
syntax on
colorscheme gruvbox
highlight Comment cterm=italic

"airline show buffers
let g:airline#extensions#tabline#enabled = 1

"buffer navigation
" Move to the previous buffer with "gp"
nnoremap gp :bp<CR>

" Move to the next buffer with "gn"
nnoremap gn :bn<CR>

" List all possible buffers with "gl"
nnoremap gl :ls<CR>

" List all possible buffers with "gb" and accept a new buffer argument [1]
nnoremap gb :ls<CR>:b

" remove current buffer hard (not in memory)
nnoremap gx :bw<CR>

" close file and buffer with vim bye bye 
nnoremap gk :Bdelete<CR>

"ctrl p lets find teh dot files ........
let g:ctrlp_show_hidden = 1

"allow mouse to work all teh way to the right past column 220
set ttymouse=sgr

"custom tab movemoent bindings"
nnoremap <f8> :tabprevious<CR>
nnoremap <f9> :tabnext<CR>
" Remaps for commonly mistyped commands:
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q
:command! VS vs
:command! Vs vs
:command! SP sp
:command! Sp sp
:command! QA qa
:command! Qa qa

" Stop opening that stupid window, you never use it anyway!
map q: :q

" Quickly escape using jk or kj -- can mash the keys :)
inoremap jk <ESC>
inoremap kj <ESC>
vnoremap jk <ESC>
vnoremap kj <ESC>

" Quickly save from normal mode -- double mashing saves :D
nnoremap jk :w<CR>
nnoremap kj :w<CR>

set updatetime=250
set ttimeoutlen=0
set timeoutlen=200

" add some custom key bindings for snipets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" to move blocks up and down
"
" " Normal mode
" nnoremap <C-j> :m .+1<CR>==
" nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


" Disambiguate ,a & ,t from the Align plugin, making them fast again.
"
" This section is here to prevent AlignMaps from adding a bunch of mappings
" that interfere with the very-common ,a and ,t mappings. This will get run
" at every startup to remove the AlignMaps for the *next* vim startup.
"
" If you do want the AlignMaps mappings, remove this section, remove
" ~/.vim/bundle/Align, and re-run rake in maximum-awesome.
function! s:RemoveConflictingAlignMaps()
  if exists("g:loaded_AlignMapsPlugin")
    AlignMapsClean
  endif
endfunction
command! -nargs=0 RemoveConflictingAlignMaps call s:RemoveConflictingAlignMaps()
silent! autocmd VimEnter * RemoveConflictingAlignMaps
