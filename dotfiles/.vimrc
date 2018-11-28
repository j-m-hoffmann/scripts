" Install plug if it's not already installed.

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'roman/golden-ratio'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

" Plug 'reasonml-editor/vim-reason-plus'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ } 
" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'

" Plug 'w0rp/ale'
" Plug 'jiangmiao/auto-pairs'
call plug#end()

" let g:deoplete#enable_at_startup = 1

set autoread
" set clipboard=unnamedplus
set cmdheight=2
set colorcolumn=80
set cursorline
set lazyredraw "Don't redraw while executing macros, good for performance
set number

" Turn backup off
" set nobackup
" set nowb
set noswapfile

let mapleader = " "

map <leader>ev :tabedit $MYVIMRC<cr>
map <leader>rv :source $MYVIMRC<cr>

map <leader>bd :q<cr>
map <leader>bD :q!<cr>
map <leader>bw :ls<cr>
nmap <leader>fs :w<cr>
nmap <leader>bz :wq<cr>

" map <leader>gc :Gcommit %<cr>
map <leader>gd :Gdiff<cr>
map <leader>gs :Gstatus<cr>

" disable highlighting
map <silent> <leader>ho :noh<cr>

map <leader>td :q<cr>
map <leader>te :tabedit 

map <leader>wd <C-W>c 
map <leader>wo <C-W>o 
map <leader>ww <C-W>w 

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Netrw linenumbers
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" vim-surround 
nmap s <Plug>Ysurround
nmap S <Plug>YSurround

" Visual mode 
" pressing * or # searches for the current selection idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"autocmd FileType ocaml setlocal tabstop=2 shiftwidth=2 sts=2 expandtab
"autocmd FileType ocaml setlocal commentstring=(*,*)\ %s

"" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
"let s:opam_share_dir = system("opam config var share")
"let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

"let s:opam_configuration = {}

"function! OpamConfOcpIndent()
"  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
"endfunction
"let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

"function! OpamConfOcpIndex()
"  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
"endfunction
"let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

"function! OpamConfMerlin()
"  let l:dir = s:opam_share_dir . "/merlin/vim"
"  execute "set rtp+=" . l:dir
"endfunction
"let s:opam_configuration['merlin'] = function('OpamConfMerlin')

"let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
"let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
"let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
"for tool in s:opam_packages
"  " Respect package order (merlin should be after ocp-index)
"  if count(s:opam_available_tools, tool) > 0
"    call s:opam_configuration[tool]()
"  endif
"endfor
"" ## end of OPAM user-setup addition for vim / base ## keep this line
"" ## added by OPAM user-setup for vim / ocp-indent ## 8c0d8da6d9d2846588332df1627306e1 ## you can edit, but keep this line
"if count(s:opam_available_tools,"ocp-indent") == 0
"  source "/home/user/.opam/4.06.1/share/ocp-indent/vim/indent/ocaml.vim"
"endif
"" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line

"" ALE
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_completion_enabled = 1
""let g:ale_reason_ols_executable = '/home/user/.local/bin/reason-language-server.exe'
""let g:ale_ocaml_ols_executable='ocaml-language-server'

"" LanguageClient
"set hidden " required for operations modifying multiple buffers like rename.
"let g:LanguageClient_serverCommands = {
"    \ 'ocaml': ['ocaml-language-server --stdio'],
"    \ }

"let g:LanguageClient_autoStart = 1

"nnoremap <F5> :call LanguageClient_contextMenu()<CR>
"nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
"nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gr :call LanguageClient#textDocument_rename()<CR>
"nnoremap <silent> gx :call LanguageClient#explainErrorAtPoint()<CR>

