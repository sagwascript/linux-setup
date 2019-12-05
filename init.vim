call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'skielbasa/vim-material-monokai'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'phanviet/vim-monokai-pro'
Plug 'chriskempson/base16-vim'
Plug 'tomasr/molokai'
Plug 'ryanoasis/vim-devicons'
Plug 'ajh17/VimCompletesMe'
Plug 'terryma/vim-smooth-scroll'
if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

set ttyfast
set lazyredraw
" enable file based terminal title
set title
" enable truecolor
set termguicolors
" set theme
colorscheme molokai
" enable syntax highlighting
syntax on
" enable cursor highlighting
set cursorline
" enable text nowrap
set nowrap
" change cursorline background
" hi CursorLine guibg=Gray8
" change background color
" hi Normal guibg=None
" change background color of Line number
hi LineNr guibg=None
" change background color of Focused Line number
" hi CursorLineNr guibg=Gray8
" enable powerline in airline
let g:airline_powerline_fonts = 1
" change airline theme
let g:airline_theme='minimalist'
" enable filetype plugin
" filetype plugin on

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

let g:ale_linters = {
\  'javascript': ['eslint'],
\}

let g:ale_fixers = {'javascript': ['prettier']}

let g:airline#extensions#ale#enabled = 1

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:vim_jsx_pretty_colorful_config = 1
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" vim smooth scrolling
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

set shiftwidth=2
set tabstop=4
set expandtab
set number
set noautoindent
set nocindent
set nosmartindent
set wildignore+=*/tmp/*,*/node_modules/*,*/vendor/*,*/dist/*,*.so,*.swp,*.zip
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:user_emmet_mode='a'
" Set the working directory to wherever the open file lives
" set autochdir
" autocmd vimenter * NERDTree
let g:NERDTreeIgnore = ['^vendor$']
set encoding=UTF-8

nnoremap <silent><C-b> :Denite buffer<CR>
nnoremap <silent><C-p> :Denite file/rec -start-filter<CR>
" Define denite mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

" call denite#custom#var('file/rec', 'command', 
      " \['scantree.py', '--ignore',
        " \'node_modules,.git,vendor,vendor-example,dist,fonts,cache,
        " \.sass-cache,*.jpeg,*.docx,*.jpg,*.png,*.mp3,*.mp4,*.eot,*.ttf,*.otf,*.pdf,*.xlsx'])

call denite#custom#var('file/rec', 'command',
  \ ['ag', '--follow', '--nocolor', '--column', '--nogroup', '-g', ''])

" key mapping
nnoremap gf :vertical <C-W><CR>
nnoremap <silent> <C-\> :NERDTreeToggle<CR>
