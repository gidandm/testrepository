set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" switch backup
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files
set noundofile
" ----------------
set laststatus=2	" status line enable
set number 		" always display number
colo elflord		" color theme elflord
syntax on
""set foldenable          " âêëþ÷èòü ñâoðà÷èâàíèå
""let g:xml_syntax_folding=1
" au FileType xml setlocal foldmethod=syntax
""set foldnestmax=9       "deepest fold is 3 levels
""set foldlevel=3 " Ïåðâûé óðîâåíü âëîæåííîñòè îòêðûò, îñòàëüíûå çàêðûòû
""set foldmethod=syntax    " ñâîðà÷èâàíèå íà îñíîâå îòñòóïîâ
" set foldmethod=manual    " âûäåëÿåì ó÷àñòîê ñ ïîìîùüþ v è ãîâîðèì zf
" set foldmarker=bigin,end " çàäàåì ìàðêåðû íà÷àëà è êîíöà áëîêà
" F3 - ðàñêðûòü/ñâåðíóòü áëîê êîäà
nmap <F3> za
vmap <F3> zai
imap <F3> zai
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$HOME/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'aquach/vim-http-client'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pearofducks/ansible-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
"Plugin 'klen/python-mode'
Plugin 'ervandew/supertab'
Plugin 'tomtom/tlib_vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'FooSoft/vim-argwrap'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-surround'
" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
" Plugin 'tpope/vim-fugitive'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Plugin 'FuzzyFinder'
 " scripts not on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
call vundle#end()            " required
filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x
"
" " CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
"
" " CTRL-V and SHIFT-Insert are Paste
map <C-V>   	"+gP
map <S-Insert>  	"+gP
"
cmap <C-V>  	<C-R>+
cmap <S-Insert> 	<C-R>+
"
" " Pasting blockwise and linewise selections is not possible in Insert and
" " Visual mode without the +virtualedit feature.  They are pasted as if they
" " were characterwise instead.
" " Uses the paste.vim autoload script.
"
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
"
imap <S-Insert> 	<C-V>
vmap <S-Insert> 	<C-V>
"
" " Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>   	<C-V>
let g:pymode_python = 'python'
set encoding=utf-8
set t_Co=256
let g:airline_powerline_fonts = 1
set guifont=PragmataPro\ Mono:h9
let g:Powerline_symbols = "fancy"
let g:airline#extensions#tabline#enabled =1


hi IndentGuidesEven ctermbg=lightgrey
set background=dark

" kien/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" davidhalter/jedi-vim
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" scrooloose/nerdcommenter
"[count]<leader>cc |NERDComComment|
"Comment out the current line or text selected in visual mode.
"[count]<leader>cn |NERDComNestedComment|
"Same as cc but forces nesting.
"[count]<leader>c<space> |NERDComToggleComment|
"Toggles the comment state of the selected line(s). If the topmost selected
"line is commented, all selected lines are uncommented and vice versa.
"[count]<leader>cm |NERDComMinimalComment|
"Comments the given lines using only one set of multipart delimiters.
"[count]<leader>ci |NERDComInvertComment|
"Toggles the comment state of the selected line(s) individually.
"[count]<leader>cs |NERDComSexyComment|
"Comments out the selected lines with a pretty block formatted layout.
"[count]<leader>cy |NERDComYankComment|
"Same as cc except that the commented line(s) are yanked first.
"<leader>c$ |NERDComEOLComment|
"Comments the current line from the cursor to the end of line.
"<leader>cA |NERDComAppendComment|
"Adds comment delimiters to the end of line and goes into insert mode between
"them.
"|NERDComInsertComment|
"Adds comment delimiters at the current cursor position and inserts between.
"Disabled by default.
"<leader>ca |NERDComAltDelim|
"Switches to the alternative set of delimiters.
"[count]<leader>cl
"[count]<leader>cb |NERDComAlignedComment|
"Same as |NERDComComment| except that the delimiters are aligned down the left
"side (<leader>cl) or both sides (<leader>cb).
"[count]<leader>cu |NERDComUncommentLine|

" scrooloose/nerdtree
map <F2> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" majutsushi/tagbar
nmap <F8> :TagbarToggle<CR>

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" marcweber/vim-addon-mw-utils
" call scriptmanager#Activate(["vim-addon-mw-utils"])

" FooSoft/vim-argwrap
nnoremap <silent> <leader>a :ArgWrap<CR>


"
" map <Leader>n <plug>NERDTreeTabsToggle<CR>
