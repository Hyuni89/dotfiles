"" Default Setting
" Line Number
set number
set relativenumber

" Indent
set smartindent
set autoindent
set cindent

" Tab
set tabstop=4
set shiftwidth=4

" Search
set hlsearch
set incsearch
set ignorecase 

" Clipboard
set clipboard=unnamedplus

" Fold
set foldmethod=syntax
set nofoldenable
set foldlevel=1

" Fast Redrawing
set ttyfast

if has("mac")
	set backspace=indent,eol,start
endif
syntax on

" Color
set t_Co=256
colorscheme jellybeans

"" Key Map Setting
" PlugIn
map <C-k><C-e> :NERDTreeToggle<Enter>
map <C-k><C-o> :TagbarToggle<Enter>
nnoremap <C-k><C-m> :MarkdownPreview<Enter>
nnoremap <C-k><C-m><C-m> :MarkdownPreviewStop<Enter>
nnoremap <C-p> :FZF<Enter>

" Search
function! Find(word)
    :execute "grep -srnwi --binary-files=text --exclude-dir=.git --exclude=tags . -e " . a:word . " " | copen
endfunction
function! CaseFind(word)
    :execute "grep -srnw --binary-files=text --exclude-dir=.git --exclude=tags . -e " . a:word . " " | copen
endfunction
" set wildignore += "*/*.o,*/tags,*/*.a,*/*.jpg,*/*.jpeg,*/*.png"
" nnoremap // :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
" nnoremap // :execute "grep -srnw --binary-files=text --exclude-dir=.git --exclude=tags . -e " . expand("<cword>") . " " <bar> cwindow<CR>
" nnoremap // :execute "grep -srnw --exclude-dir=.git --exclude={tags,\\*.o,core\\*,cscope\\*,.\\*} . -e " . expand("<cword>") . " " <Bar> cwindow<CR>}
nnoremap // :call CaseFind("<cword>")<CR>
nnoremap <C-]> g<C-]>

" Refresh vimrc
nnoremap <C-k>R :so ~/.vimrc<Enter>

" Move Line
if has("mac")
	map <A-Up> :m .-2<Enter>==
	map <A-Down> :m .+1<Enter>==
	map ∆ <A-Down>
	map ˚ <A-Up>
elseif has("unix")
	" Recognize 'ALT' key
	" There are two way for a terminal emulator to send 'ALT' key (8 bit characters for 'ALT' or escape sequences, ALT-A as ESC-A)
	let c='a'
	while c <= 'z'
	  exec "set <A-".c.">=\e".c
	  exec "imap \e".c." <A-".c.">"
	  let c = nr2char(1+char2nr(c))
	endw
	set timeout ttimeoutlen=50

	nnoremap <A-k> :m .-2<Enter>==
	nnoremap <A-j> :m .+1<Enter>==
	map <A-Down> <A-j>
	map <A-Up> <A-k>
endif
vnoremap <A-j> :'<,'>m '>+1<Enter>gv=gv
vnoremap <A-k> :'<,'>m '<-2<Enter>gv=gv
vmap <A-Up> <A-k>
vmap <A-Down> <A-j>

" Indent
vnoremap < <gv
vnoremap > >gv

" Edit
nnoremap <Space> i<Space><Esc>
nnoremap <Enter> i<Enter><Esc>

" Hightlight
nnoremap <Esc><Esc> :noh<Enter>

" Comment
let s:comment_map = { 
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "rust": '\/\/',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " " 
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else 
            if getline('.') =~ "^\\s*" . comment_leader
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                " Comment the line
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
endfunction

nnoremap <C-?> :call ToggleComment()<cr>
vnoremap <C-?> :call ToggleComment()<cr>

"" Plugin Setting
set nocompatible
filetype off

set rtp+=~/.fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
" Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
Plugin 'keith/swift.vim'
Plugin 'udalov/kotlin-vim'
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'ZoomWin'
Plugin 'mattn/emmet-vim'
Plugin 'ap/vim-css-color'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

"" Option Setting
" Syntastic Setting
let g:syntastic_cpp_compiler_options='-std=c++14'

" Vim-cpp-enhanced-highlight Setting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

" YouCompleteMe Setting
let g:ycm_autoclose_preview_window_after_insertion = 1
