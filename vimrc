scriptencoding utf-8
execute pathogen#infect()

" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" .vimrc
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
"set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1
       
set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
 
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
 
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
 
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
 
set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.

set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.
 
set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
 
set ignorecase      " Ignore case in search patterns.
 
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
 
set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
 
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
 
set textwidth=100    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
 
set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode. 
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)
 
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
 
set background=dark " When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.
 
set mouse=a         " Enable the use of the mouse.

set t_Co=256

filetype plugin indent on
syntax on

colorscheme Chasing_Logic
"colorscheme argonaut
"colorscheme lapis256
set laststatus=2

" syntax
au BufRead,BufNewFile *.as set syntax=cpp
au BufRead,BufNewFile *.angelscript set syntax=cpp
au BufRead,BufNewFile *.krak set syntax=kraken

" Code Folding
set foldmethod=syntax
set nofoldenable
let c_no_comment_fold=1

" TagBar
" ===========
nmap <F8> :TagbarToggle<CR>
autocmd FileType c call Ttoggle()
autocmd FileType cpp call Ttoggle()

function! Ttoggle()
    :call tagbar#autoopen(0)
endfunction

" Neosnippets - Code Snippets
let g:neosnippet#disable_runtime_snippets = {
\ '_' : 1,
\ }

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Plugin key-mappings.
imap <Leader>e     <Plug>(neosnippet_expand_or_jump)
smap <Leader>e     <Plug>(neosnippet_expand_or_jump)
xmap <Leader>e     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif



" YCM
let g:ycm_server_python_interpreter='/usr/sbin/python2'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'


"Enable omni completion
autocmd FileType python setlocal omnifunc=python_complete#Complete


" Remappings for FSwitch
" -----------------------
nmap <silent> ,fh :FSHere<CR>
nmap <silent> ,fl :FSSplitLeft<CR>
nmap <silent> ,fr :FSSplitRight<CR>

" shortcuts for other commands
" ----------------------------
nmap <silent> <Leader>t :tabnew<Space>
nmap <silent> <Leader>. :tabn<CR>
nmap <silent> <Leader>, :tabp<CR>
nmap <silent> <Leader>q :q<CR>
nmap <Leader>a :Ag<Space>


" Splits Navigation
" -------------------
nmap <silent> <A-i> :wincmd k<CR>
nmap <silent> <A-k> :wincmd j<CR>
nmap <silent> <A-j> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>


" Syntastic
" ------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0

"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = ' -std=c++11'
"let g:syntastic_cpp_include_dirs = ['./lib/angelscript/include']

"let g:syntastic_mode_map = {
    "\ "mode": "passive",
    "\ "active_filetypes": [],
    "\ "passive_filetypes": [] }

"nmap <silent> <Leader>s :SyntasticCheck<CR>


" Airline
" -----------
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '¶'
let g:airline#extensions#whitespace#enabled = 0
