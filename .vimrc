" PLUGINS ---------------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')
" Use release branch (recommended)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'bryanmylee/vim-colorscheme-icons'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/plenary.nvim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/romainl/vim-cool'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'arcticicestudio/nord-vim' " Theme
Plug 'rafi/awesome-vim-colorschemes'
" Use release branch (recommended)
call plug#end()
" }}}

" set color scheme
colorscheme twilight256

" Map the leader key
let g:mapleader=" "


" Macros: Mappings and Abbreviations ----------------------------------------------------------- {{{
" NORMAL MODE MACROS: Use <leader>
" Map Control + s to save
nnoremap <leader>sf :w<CR>

" Quick edit of $MYVIMRC
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Cut, Copy and Paste 
" NOTE: need to fix the functionality of cut
nnoremap <leader>xx <esc>"*y
nnoremap <leader>xw <esc>viw"*yviwD
nnoremap <leader>xl <esc>V"*yVd
nnoremap <leader>xp <esc>vip"*yvipd

nnoremap <leader>cc <esc>"*y
nnoremap <leader>cw <esc>viw"*y
nnoremap <leader>cl <esc>V"*y
nnoremap <leader>cp <esc>vip"*y

nnoremap <leader>v <esc>"*p
 
" Mappings for window nav
nnoremap <leader>wl <C-w>l
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wh <C-w>h

" Mappings for quick comments like and other things 
nnoremap <leader>td iTODO: <esc><Plug>CommentaryLine<esc>A
nnoremap <leader>nt iNOTE: <esc><Plug>CommentaryLine<esc>A

" Strong Beginning and End of Line 
nnoremap H 0
nnoremap L $
" Big scroll up and scroll down
nnoremap J 20j
nnoremap K 20k
 
" Toggle Folds 
nnoremap <leader><F1> za

" upper case a world while in normal mode
nnoremap <leader>u viwoU<esc>e

" source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>:echo "sourced" $MYVIMRC<CR>

" quick wrap of words
nnoremap <leader>"w viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>'w viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>`w viw<esc>a`<esc>bi`<esc>lel
nnoremap <leader>(w viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>[w viw<esc>a]<esc>bi[<esc>lel
nnoremap <leader>{w viw<esc>a}<esc>bi{<esc>lel
nnoremap <leader><w viw<esc>a><esc>bi<<esc>lel

" clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" buffer-nav
" jump to specific buffer
nnoremap <leader>bb :ls<CR>:b<space>
" delete current buffer 
nnoremap <leader>bd :bd<CR>
" jump to next buffer
nnoremap <leader>bn :bn<CR>
" jump to prev buffer
nnoremap <leader>bp :bp<CR>

" INSERT MODE MACROS: Do not use <leader>
" quick escape with jk
" NOTE: if this is used frequently, change the key combination appropriately
inoremap jk <esc>

" delete line in insert mode
inoremap <C-d> dd

" upper case a word while in insert mode
inoremap <C-u> <esc>lviwoU<esc>lel

" lower case a word while in insert mode
inoremap <C-l> <esc>lviwou<esc>lel

" delete line in insert mode
inoremap <C-d> <esc>ddi

" paste
inoremap <c-v> <esc>"*pi

" VISUAL MODE MACROS: Do not use <leader>
" NOTE: need to add cut functionality
" copy selected text 
 noremap <S-c> "*y

" Surround selected text with character
vnoremap "" <esc>`>a"<esc>`<i"<esc>b
vnoremap '' <esc>`>a'<esc>`<i'<esc>b
vnoremap (( <esc>`>a)<esc>`<i(<esc>b
vnoremap [[ <esc>`>a]<esc>`<i[<esc>b
vnoremap {{ <esc>`>a}<esc>`<i{<esc>b
vnoremap << <esc>`>a><esc>`<i<<esc>b

" }}}

" Training Wheels ----------------------------------------------------------- {{{
" macros 
nnoremap 0 :echoe "Use H"<CR>
nnoremap $ :echoe "Use L"<CR>
noremap :w :echoe "Use \<leader\>sf"<CR>
noremap :wq :echoe "Use \<leader\>sf"<CR>
inoremap <esc> <esc>:echoe "Use jk"<CR>

" navigation tools
nnoremap 25j :echoe "Use J"<CR>
nnoremap 25k :echoe "Use K"<CR>

" only allow vim motions
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
" }}}

" Generic Configuration ----------------------------------------------------------- {{{
" line number 
set number relativenumber numberwidth=8

" defaults with open folds
set foldlevel=99

" enables useful vim functionality
set nocompatible

" enables syntax highlighting
syntax on

" allow backspace over anything
set backspace=indent,eol,start

" Adjust tab/space width
" Modify this depending on file type
set shiftwidth=4
set tabstop=4

" Set indentation to be automatic 
set autoindent
 
" set cursorline as true
set cursorline

" Allow hidden buffers (buffers not shown in any window)
set hidden

" searches are case-insensitive when string is lowercase and case-sensitive
" when string has uppercase
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Show partial command you type in the last line of the screen.
set showcmd

" Show matching words during a search.
set showmatch

" Change split barrier to |.
set fillchars=vert:\│
set fillchars+=fold:· " for folds

" set line space 0
set linespace=0

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion
set wildmode=list:longest

" wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Get rid of color column
set colorcolumn=0

" }}}

" Highlight Config ----------------------------------------------------------- {{{
hi CursorLineNr cterm=Bold ctermbg=8 ctermfg=4

" Change highlight groups
hi Todo ctermbg=NONE cterm=Bold ctermfg=11
hi Error ctermbg=NONE cterm=Bold ctermfg=9 ctermbg=NONE
hi ErrorMsg ctermbg=NONE

" Change parenthesis matching
hi MatchParen ctermbg=NONE cterm=Underline ctermfg=4

" Change normal font color
hi Normal ctermfg=7

" Highlight cursor line underneath the cursor vertically.
hi CursorLine cterm=NONE ctermbg=8 
" To edit the cursor color, do it in shell settings

hi VertSplit cterm=bold ctermbg=NONE ctermfg=NONE
hi HoriSplit cterm=bold ctermbg=NONE ctermfg=NONE

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
hi SignColumn ctermbg=NONE
hi LineNr ctermbg=NONE

" Change highlight color of visual mode
hi Visual cterm=NONE ctermbg=0

" Change highlighting of QuickFixLine popup
hi QuickFixLine ctermbg=NONE

" Adjust highlighting for Folded tabs
hi Folded ctermfg=5 ctermbg=NONE 

" WildMenu Highlights
hi WildMenu ctermbg=7 cterm=bold ctermfg=6 guibg=NONE
hi StatusLineNC ctermbg=7 ctermfg=8
hi StatusLine ctermbg=7 ctermfg=8

" }}}
 
" Custom Highlight Groups ----------------------------------------------------------- {{{

" }}}

" AutoCommands ----------------------------------------------------------- {{{
" NOTE: some of these may overwrite generic settings defined above
autocmd BufRead,BufNewFile $MYVIMRC set foldmethod=marker

" templ-group 
augroup templgroup
	au BufRead,BufNewFile *.templ setfiletype go
  	au BufRead,BufNewFile *.templ syntax match TemplTag "^templ"
  	au BufRead,BufNewFile *.templ hi link TemplTag Keyword
	" Additional HTML like matching
  	au BufRead,BufNewFile *.templ hi link TemplTag Keyword
augroup end

autocmd FileType templ CocAction('diagnosticToggle')

" }}}

" MOUSE SETTINGS -------------------------- {{{
set mouse=a
noremap <C-ScrollWheelUp> <nop>
noremap <C-ScrollWheelDown> <nop>
noremap <C-ScrollWheelLeft> <nop>
noremap <C-ScrollWheelRight> <nop>
noremap <S-ScrollWheelUp> <nop>
noremap <S-ScrollWheelDown> <nop>
noremap <S-ScrollWheelLeft> <nop>
noremap <S-ScrollWheelRight> <nop>
noremap <ScrollWheelUp> <nop>
noremap <ScrollWheelDown> <nop>
noremap <ScrollWheelLeft> <nop>
noremap <ScrollWheelRight> <nop>
noremap <LeftMouse> <nop>
noremap <RightMouse> <nop>
noremap <2-LeftMouse> <nop>
noremap <2-RightMouse> <nop>
noremap <3-LeftMouse> <nop>
noremap <3-RightMouse> <nop>
noremap <4-LeftMouse> <nop>
noremap <4-RightMouse> <nop>
noremap! <C-ScrollWheelUp> <nop>
noremap! <C-ScrollWheelDown> <nop>
noremap! <C-ScrollWheelLeft> <nop>
noremap! <C-ScrollWheelRight> <nop>
noremap! <S-ScrollWheelUp> <nop>
noremap! <S-ScrollWheelDown> <nop>
noremap! <S-ScrollWheelLeft> <nop>
noremap! <S-ScrollWheelRight> <nop>
noremap! <ScrollWheelUp> <nop>
noremap! <ScrollWheelDown> <nop>
noremap! <ScrollWheelLeft> <nop>
noremap! <ScrollWheelRight> <nop>
noremap! <LeftMouse> <nop>
noremap! <RightMouse> <nop>
noremap! <2-LeftMouse> <nop>
noremap! <2-RightMouse> <nop>
noremap! <3-LeftMouse> <nop>
noremap! <3-RightMouse> <nop>
noremap! <4-LeftMouse> <nop>

" }}}

" vim-airline Setting -------------------------- {{{
let g:airline_theme='selenized'
let g:airline_powerline_fonts = 1

set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#whitespace#enabled = 0
let g:airline_statusline_ontop = 0
" Powerline symbols
if !exists('g:airline_symbols') 
  let g:airline_symbols = {} 
endif 
let g:airline_symbols.linenr = ' LN:' 
let g:airline_symbols.colnr = ' CN:' 
let g:airline_symbols.maxlinenr = '' 
let g:airline_left_sep = '' 
let g:airline_left_alt_sep = '' 
let g:airline_right_sep = '' 
let g:airline_right_alt_sep = '' 
" }}}

" GoConfig ----------------------------- {{{
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
"}}}

" CocConfig ----------------------------- {{{
" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=UTF-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config

" Coc Setup ----------------------------- {{{
" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=UTF-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Tab Completion
" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nnoremap <leader> gd <Plug>(coc-definition)
nnoremap <leader> gy <Plug>(coc-type-definition)
nnoremap <leader> gi <Plug>(coc-implementation)
nnoremap <leader> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <leader>doc :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
hi CocHighlightText cterm=Bold ctermfg=12 ctermbg=None

" Symbol renaming
nnoremap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xnoremap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xnoremap <leader>a  <Plug>(coc-codeaction-selected)
nnoremap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nnoremap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nnoremap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nnoremap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nnoremap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xnoremap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nnoremap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Map function and class text orrowbjects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xnoremap if <Plug>(coc-funcobj-i)
onoremap if <Plug>(coc-funcobj-i)
xnoremap af <Plug>(coc-funcobj-a)
onoremap af <Plug>(coc-funcobj-a)
xnoremap ic <Plug>(coc-classobj-i)
onoremap ic <Plug>(coc-classobj-i)
xnoremap ac <Plug>(coc-classobj-a)
onoremap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" }}}
