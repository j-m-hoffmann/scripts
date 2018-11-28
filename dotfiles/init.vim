if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'iCyMind/NeoSolarized'

Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'kassio/neoterm'

Plug 'roman/golden-ratio'

"Plug 'w0rp/ale'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'vimlab/split-term.vim'
"Plug 'jpalardy/vim-slime'

call plug#end()

set autoread
set clipboard=unnamedplus
set cmdheight=2
set colorcolumn=80
set cursorline
set lazyredraw "Don't redraw while executing macros, good for performance
set number
" set so=0 "Set 7 lines to the cursor when moving vertically

" Turn backup off
" set nobackup
" set nowb
set noswapfile

let mapleader = " "

map <leader>ev :tabedit $MYVIMRC<cr>
map <leader>rv :source $MYVIMRC<cr>

" disable highlighting
map <silent> <leader>ho :noh<cr>

map <leader>bd :q<cr>
map <leader>bD :q!<cr>
map <leader>bw :ls<cr>
nmap <leader>fs :w<cr>
nmap <leader>bz :wq<cr>

" map <leader>gc :Gcommit %<cr>
map <leader>gd :Gdiff<cr>
map <leader>gs :Gstatus<cr>

map <leader>td :q<cr>
map <leader>te :tabedit 
map <leader>tt :tab Tnew<cr>

map <leader>wd <C-W>c 
map <leader>wo <C-W>o 
map <leader>ww <C-W>w 

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" ALE
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_completion_enabled = 1
"let g:ale_reason_ols_executable = '/home/user/.local/bin/reason-language-server.exe'

" Deoplete
" let g:deoplete#enable_at_startup = 1

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript,reason,jsx,babel EmmetInstall

" Gitgutter
set updatetime=100

" NeoSolarized
set termguicolors
" high | normal | low
let g:neosolarized_contrast = "normal"
let g:neosolarized_visibility = "normal"
" I make vertSplitBar a transparent background color. 
" If you like the origin solarized vertSplitBar style more, set this value to 0.
let g:neosolarized_vertSplitBgTrans = 1
" enable/disable NeoSolarized to display bold, underlined or italicized typefaces
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0
colorscheme NeoSolarized
" Set background according to current time of day.
let hr = str2nr(strftime('%H'))
if hr <= 6 || hr > 18
    set background=dark
else
    set background=light
endif

" Netrw linenumbers
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" OCaml
" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"
" execute "set rtp+=" . g:opamshare . "/ocp-indent/vim"
" if executable('ocamlmerlin') && has('python')
"   let s:ocamlmerlin = substitute(system('opam config var share'), '\n$', '', '''') . "/merlin"
"   execute "set rtp+=".s:ocamlmerlin."/vim"
"   execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
" endif
" autocmd FileType ocaml execute "set rtp+=" . substitute(system('opam config var share'), '\n$', '', '''') . "/ocp-indent/vim/indent/ocaml.vim"
"
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
" let s:opam_share_dir = system("opam config var share")
" let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

" let s:opam_configuration = {}

" function! OpamConfOcpIndent()
"   execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
" endfunction
" let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

" function! OpamConfOcpIndex()
"   execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
" endfunction
" let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

" function! OpamConfMerlin()
"   let l:dir = s:opam_share_dir . "/merlin/vim"
"   execute "set rtp+=" . l:dir
" endfunction
" let s:opam_configuration['merlin'] = function('OpamConfMerlin')

" let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
" let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
" let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
" for tool in s:opam_packages
"   " Respect package order (merlin should be after ocp-index)
"   if count(s:opam_available_tools, tool) > 0
"     call s:opam_configuration[tool]()
"   endif
" endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line

" Reason
au VimEnter,BufRead,BufNewFile *.re set filetype=reason
au VimEnter,BufRead,BufNewFile *.rei set filetype=reason

" LanguageClient
set hidden " required for operations modifying multiple buffers like rename.
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'ocaml': ['reason-language-server.exe'],
    \ 'reason': ['reason-language-server.exe'],
    \ }
    " \ 'ocaml': ['ocaml-language-server --stdio'],

let g:LanguageClient_autoStart = 1

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> gx :call LanguageClient#explainErrorAtPoint()<CR>

" Slime
"let g:slime_target = "neovim"
"set splitright
"set splitbelow

" Terminal
:au BufEnter * if &buftype == 'terminal' | :startinsert | endif
highlight TermCursor ctermfg=red guifg=red
tnoremap <Leader><ESC> <C-\><C-n>
tnoremap <Leader>tp <C-\><C-n>:tabprevious<cr>
tnoremap <Leader>tn <C-\><C-n>:tabnext<cr>
tnoremap <Leader>bd <C-\><C-n>:q!<cr>

" vim-surround 
nmap s <Plug>Ysurround
nmap S <Plug>YSurround

" Visual mode 
" pressing * or # searches for the current selection idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Whitespace
set tabstop=4 shiftwidth=4 sts=4 expandtab
autocmd FileType css setlocal tabstop=2 shiftwidth=2 sts=2 expandtab
autocmd FileType html setlocal tabstop=2 shiftwidth=2 sts=2 expandtab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 sts=2 expandtab
autocmd FileType ocaml setlocal tabstop=2 shiftwidth=2 sts=2 expandtab
autocmd FileType reason setlocal tabstop=2 shiftwidth=2 sts=2 expandtab
