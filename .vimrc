"==============================================================================
" Basic .vimrc Configuration
"==============================================================================

"------------------------------------------------------------------------------
" §1. Plugin Management with vim-plug
"------------------------------------------------------------------------------
" Plugins are managed here. After adding a new 'Plug' line, run :PlugInstall

" call plug#begin('~/.vim/plugged')

" Python auto-completion and code intelligence
" Plug 'davidhalter/jedi-vim'

" Ansible
" Plug 'pearofducks/ansible-vim'

" llama.cpp
" Plug 'ggml-org/llama.vim'
" Plug 'madox2/vim-ai'

" call plug#end()


"------------------------------------------------------------------------------
" §2. Core Editor Behavior
"------------------------------------------------------------------------------
" Basic settings to make Vim behave like a modern editor

set encoding=utf-8              " Use UTF-8 encoding
set number                      " Show line numbers
set relativenumber              " Show relative numbers for easier movement
set scrolloff=8                 " Keep 8 lines of context around the cursor

" Searching
set incsearch                   " Show search results as you type
set hlsearch                    " Highlight all search results
set ignorecase                  " Ignore case when searching...
set smartcase                   " ...unless the query contains an uppercase letter

" Window and Buffer Management
set hidden                      " Allow switching buffers without saving
set autoread                    " Reload files when they are changed externally
set splitright                  " Open vertical splits to the right
set splitbelow                  " Open horizontal splits below

" Command-line improvements
set wildmenu                    " Show a nice menu for command-line completion
set showcmd                     " Show partial commands in the bottom-right

"------------------------------------------------------------------------------
" §3. Indentation and Whitespace
"------------------------------------------------------------------------------
" Set up rules for tabs and spaces

filetype plugin indent on       " Enable filetype-aware indentation
set autoindent                  " Copy indent from current line when starting a new line
set smartindent                 " Be a little smarter about indentation

" Use 4 spaces for tabs - a common standard
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab                   " Use spaces instead of actual tab characters

" For YAML files, use 2 spaces for indentation
"autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 expandtab

"------------------------------------------------------------------------------
" §4. UI and Appearance 🎨
"------------------------------------------------------------------------------
" Make Vim look good

syntax on                       " Enable syntax highlighting
set termguicolors               " Enable 24-bit RGB color for themes
colorscheme slate               " Set a dark colorscheme matching tmux
set laststatus=2                " Always display the statusline
set cursorline                  " Highlight the current line

" Custom statusline to match tmux design
set statusline=
set statusline+=%#StatusLine#
set statusline+=\ %f            " File path
set statusline+=\ %m            " Modified flag
set statusline+=\ %r            " Readonly flag
set statusline+=%=              " Switch to right side
set statusline+=\ %y            " File type
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}]
set statusline+=\ %p%%          " Percentage through file
set statusline+=\ %l:%c         " Line:column
set statusline+=\ 

" Match tmux colors
hi StatusLine ctermbg=238 ctermfg=81 guibg=#444444 guifg=#5fd7ff
hi StatusLineNC ctermbg=235 ctermfg=138 guibg=#262626 guifg=#af8787
hi VertSplit ctermbg=238 ctermfg=238 guibg=#444444 guifg=#444444
hi CursorLine cterm=NONE ctermbg=236 guibg=#303030
hi CursorLineNr ctermfg=81 guifg=#5fd7ff


"------------------------------------------------------------------------------
" §5. Key Mappings ⌨️
"------------------------------------------------------------------------------
" Custom shortcuts for a better workflow

" Set the Leader key to Space. The Leader is a prefix for custom shortcuts.
let mapleader = " "

" Clear search highlighting by pressing <Leader> and then Space
nnoremap <leader><space> :nohlsearch<CR>

" Close the current buffer without closing the window
nnoremap <leader>q :bdelete<CR>

"==============================================================================
" §6. Plugin-Specific Configurations
"==============================================================================

" --- Tab Completion Navigation ---
" Use Tab to cycle forward and Shift-Tab to cycle backward through completions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"-----------------------------------
" Configure vim-ai for llama.cpp endpoint
let g:vim_ai_edit = {
  \  "provider": "openai",
  \  "options": {
  \    "model": "granite-4.0-h-1b",
  \    "endpoint_url": "http://localhost:8012/v1/chat/completions",
  \    "auth_type": "none",
  \    "temperature": 0.0,
  \    "stream": 1,
  \  }
\}

let g:vim_ai_chat = {
  \  "provider": "openai",
  \  "options": {
  \    "model": "granite-4.0-h-1b",
  \    "endpoint_url": "http://localhost:8012/v1/chat/completions",
  \    "auth_type": "none",
  \    "temperature": 0.0,
  \    "stream": 1,
  \  },
  \  "ui": {
  \    "open_chat_command": "preset_below",
  \  }
\}

let g:vim_ai_complete = {
  \  "provider": "openai",
  \  "options": {
  \    "model": "granite-4.0-h-1b",
  \    "endpoint_url": "http://localhost:8012/v1/chat/completions",
  \    "auth_type": "none",
  \    "temperature": 0.0,
  \    "stream": 1,
  \  }
\}
