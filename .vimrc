" PLUGINS ---------------------------------------------------------- {{{
" NAV: nav-plug
call plug#begin('~/.vim/plugged')
" Use release branch (recommended)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'bryanmylee/vim-colorscheme-icons'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/plenary.nvim'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/romainl/vim-cool'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Go Plugins
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'arcticicestudio/nord-vim' " Theme
Plug 'rafi/awesome-vim-colorschemes'
" Use release branch (recommended)
call plug#end()
" }}}

" NAV: nav-filetypes
au BufNewFile,BufRead *.tutor set filetype=tutor
au BufNewFile,BufRead *.templ set filetype=templ

" set color scheme
" NAV: nav-colorscheme
colorscheme twilight256
" twilight256
" favorites
" default
" habamax

" Map the leader key
" NAV: nav-leader
let g:mapleader=" "

"LEARNING: ------ {{{

function DisplayName(...)
	echom a:0
endfunction

" NOTE: always need to prefix with a: for locally scoped func args
"}}}

" Functions: fuctions to help with maps, abbreviations, and all things config ----------------------------------------------------------- {{{
" NAV: nav-func

" A useful function for eating a character
" TODO: actually understand what the fuck this function does cause I just C-c
" C-v'ed it from 
function Eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunction
"}}}

" TODO: add a description fo  this function
function! InsertIfEmpty(template_fn)
    if @% == ""
        " No filename for current buffer
		call a:template_fn()
    elseif filereadable(@%) == 0
        " File doesn't exist yet
		call a:template_fn()
    elseif line('$') == 1 && col('$') == 1
        " File is empty
        call a:template_fn()
    endif
endfunction

" Macros: Mappings and Abbreviations ----------------------------------------------------------- {{{
" NAV: nav-map

" NORMAL MODE MACROS: Use <leader> 				
" NAV: nav-map-normal 

" save file
nnoremap <leader>sf :w<CR>

" open nerdtree
nnoremap <F7> :NERDTreeToggle<CR>

" Quick edit of $MYVIMRC
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Cut, Copy and Paste 
" NAV: nav-map-normal-ccp
" NOTE: need to fix the functionality of cut
nnoremap <leader>xw <esc>viw"*yviwD
nnoremap <leader>xl <esc>V"*yVd
nnoremap <leader>xp <esc>vip"*yvipd

nnoremap <leader>cw <esc>viw"*y
nnoremap <leader>cl <esc>V"*y
nnoremap <leader>cp <esc>vip"*y

nnoremap <leader>v <esc>"*p

function ChangeDim()
	let axis = input("H or V: ")
	let amount = input("amount: ")
	if axis ==? "v"
		execute "vertical resize " . amount 
	elseif axis ==? "h"
		execute "horizontal resize " . amount 
	else 
	 	echom "incorrect dimensions for ChangeDim()"
	endif
endfunction

" Mappings for window resizing
nnoremap <leader>rw :call ChangeDim()<CR>

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

" clear the highlighting of :set hl earch.
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

" Mappings for moving buffers
nnoremap <leader>bsh :execute "leftabove vsplit " . bufname("#")<CR>
nnoremap <leader>bsl :execute "rightbelow vsplit " . bufname("#")<CR>
nnoremap <leader>bsk :execute "belowright split " . bufname("#")<CR>
nnoremap <leader>bsj :execute "aboveleft split " . bufname("#")<CR>


" INSERT MODE MACROS: Do not use <leader>
" NAV: nav-map-insert

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

" Mappings for quick comments like and other things 
iabbrev td TODO: <esc><Plug>CommentaryLine<esc>A<c-r>=Eatchar('\s')<cr>
iabbrev nt NOTE: <esc><Plug>CommentaryLine<esc>A<c-r>=Eatchar('\s')<cr>

" VISUAL MODE MACROS: Do not use <leader>
" NAV: nav-map-visual
vnoremap <leader>x "*y<esc>v`>d
" copy selected text 
vnoremap <leader>cc "*y

" indent selected lines
vnoremap <leader>id =<esc>

" Surround selected text with character
vnoremap "" <esc>`>a"<esc>`<i"<esc>b
vnoremap '' <esc>`>a'<esc>`<i'<esc>b
vnoremap (( <esc>`>a)<esc>`<i(<esc>b
vnoremap [[ <esc>`>a]<esc>`<i[<esc>b
vnoremap {{ <esc>`>a}<esc>`<i{<esc>b
vnoremap << <esc>`>a><esc>`<i<<esc>b

" OPERATOR PENDING MACROS: 
" NAV: nav-map-op

" NOTE: workflow for operator pending macros
" 1) Start at cursor
" 2) Enter visual mode
" 3) KEY STEP: map keys
" 4) text you want to include in the movement should be selected
" Rules
" if visually selected, operates on text 
" else operates on text between original cursor position and new position

" use vim motion for inside <sign>: i<sign>
" text until return
onoremap b /return<CR>

" inside last/prev <sign>, inline
onoremap il( :<c-u>normal! F(vi(<cr>
onoremap il{ :<c-u>normal! F{vi{<cr>
onoremap il[ :<c-u>normal! F[vi[<cr>
onoremap il< :<c-u>normal! F<vi<<cr>
onoremap il" :<c-u>normal! F"vi"<cr>
onoremap il' :<c-u>normal! F'vi'<cr>
onoremap il` :<c-u>normal! F`vi`<cr>

" inside next <sign ,  inline
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap in< :<c-u>normal! f<vi<<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap in' :<c-u>normal! f'vi'<cr>
onoremap in` :<c-u>normal! f`vi`<cr>


" }}}

" Training Wheels ----------------------------------------------------------- {{{
" NAV: nav-training
" macros 
nnoremap 0 :echoe "Use H"<CR>
nnoremap $ :echoe "Use L"<CR>
noremap :w :echoe "Use \<leader\>sf"<CR>
noremap :wq :echoe "Use \<leader\>sf"<CR>

" navigation tools
nnoremap 25j :echoe "Use J"<CR>
nnoremap 25k :echoe "Use K"<CR>

" window navigation
nnoremap <C-w><C-w> :echoe "Use \<leader\>ww"<CR>
nnoremap <C-w><C-h> :echoe "Use \<leader\>wh"<CR>
nnoremap <C-w><C-l> :echoe "Use \<leader\>wl"<CR>
nnoremap <C-w><C-k> :echoe "Use \<leader\>wk"<CR>
nnoremap <C-w><C-j> :echoe "Use \<leader\>wj"<CR>

" only allow vim motions
" TODO: need to update motions that use <Left>, <Right>, <Up>, <Down>
nnoremap <Left>  :echoe Use h<CR>
nnoremap <Right> :echoe Use l<CR>
nnoremap <Up>    :echoe Use k<CR>
nnoremap <Down>  :echoe Use j<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe Use h<CR>
inoremap <Right> <ESC>:echoe Use l<CR>
inoremap <Up>    <ESC>:echoe Use k<CR>
inoremap <Down>  <ESC>:echoe Use j<CR>

" }}}

" Generic Configuration ----------------------------------------------------------- {{{
" NAV: nav-config
" TODO: does it make sense to cover all generic configuration in an augroup?
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
" for folds
set fillchars+=fold:· 

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

" word wrap without line breaks
set wrap linebreak nolist textwidth=0

" Get rid of color column
set colorcolumn=0

" utf-8 byte sequence
set encoding=UTF-8

" Some servers have issues with backup files (coc issue #649)
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300
" }}}

" set highlight search
set hlsearch


" Highlight Config ----------------------------------------------------------- {{{
" NAV: nav-highlight
highlight CursorLineNr cterm=Bold ctermbg=8 ctermfg=4

" Change highlight groups
highlight Todo ctermbg=NONE cterm=Bold ctermfg=11
highlight Error ctermbg=NONE cterm=Bold ctermfg=9 ctermbg=NONE
highlight ErrorMsg ctermfg=0

" Change parenthesis matching
highlight MatchParen ctermbg=NONE cterm=Bold,Underline ctermfg=4

" Change normal font color
highlight Normal ctermfg=7 ctermbg=NONE


" Highlight cursor line underneath the cursor vertically.
highlight CursorLine cterm=NONE ctermbg=8 
" To edit the cursor color, do it in shell settings

highlight VertSplit cterm=bold ctermbg=NONE ctermfg=NONE
highlight HoriSplit cterm=bold ctermbg=NONE ctermfg=NONE

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
highlight SignColumn ctermbg=NONE
highlight LineNr ctermbg=NONE

" Change highlighting of QuickFixLine popup
highlight QuickFixLine ctermbg=NONE

" Adjust highlighting for Folded tabs
highlight Folded ctermfg=5 ctermbg=NONE 

" WildMenu Highlights
highlight WildMenu ctermbg=7 cterm=bold ctermfg=6 guibg=NONE
highlight StatusLineNC ctermbg=7 ctermfg=8
highlight StatusLine ctermbg=7 ctermfg=8

" ModeMsg 
highlight ModeMsg ctermbg=NONE ctermfg=7

" Visual mode settings
highlight Visual cterm=NONE ctermbg=0
" Search settings
highlight Search ctermbg=13 ctermfg=15
highlight CurSearch cterm=bold ctermbg=11 ctermfg=0

" }}}

" Custom Highlight Groups ----------------------------------------------------------- {{{

" }}}

" AutoCommands ----------------------------------------------------------- {{{
" NAV: nav-auto

" NOTE: debating on moving some functionality to ~/.vim/after/ftplugin/<filetype>.vim
" TODO: create a function for specific filetypes so that I can have a split screen or checklist of lines where bugs are
" TODO: find a way to rerun autogroups upon sourcing ~/.vimrc

" NOTE: colorschemes
" TODO: need to actually apply these to the original colorscheme file
" NAV: nav-augroup-twilight256
augroup twilight256_config
	autocmd!
	autocmd ColorScheme twilight256 highlight Normal ctermbg=NONE
	autocmd ColorSchemePre,ColorScheme twilight256 highlight Visual cterm=NONE ctermbg=0
	autocmd ColorSchemePre,ColorScheme twilight256 highlight Search ctermbg=13 ctermfg=15
	autocmd ColorSchemePre,ColorScheme twilight256 highlight CurSearch cterm=bold ctermbg=11 ctermfg=0
augroup end

" NAV: nav-augroup-habamax
augroup habamax_config
	autocmd!
	autocmd ColorSchemePre,ColorScheme habamax highlight Visual ctermfg=15 ctermbg=8
	autocmd ColorSchemePre,ColorScheme habamax highlight Search ctermbg=15 ctermfg=8
	autocmd ColorSchemePre,ColorScheme habamax highlight CurSearch cterm=bold ctermbg=4 ctermfg=8
augroup end

" NOTE: some of these may overwrite generic settings defined above
augroup foldconfig
	autocmd!
	autocmd BufRead,BufNewFile * setlocal foldmethod=syntax
augroup end

" NAV: nav-augroup-vimrc
augroup vimrc
	autocmd!
	autocmd BufRead,BufNewFile $MYVIMRC setlocal foldmethod=marker
augroup end

" *.html
" NAV: nav-augroup-html
function! NewHTMLElem()
	let elem = input('elem: ')
	execute "normal! i<".elem.">\n\n</".elem.">\e2k$"
	call feedkeys('i')
endfunction

augroup htmlgroup
	autocmd!
	autocmd FileType templ,html nnoremap <leader>ne :call NewHTMLElem()<CR>
	autocmd FileType templ,html inoremap <leader>ne <esc>:call NewHTMLElem()<CR>
augroup end

" *.zig
" NAV: nav-augroup-zig
augroup ziggroup
	" compile: 
	autocmd FileType zig nnoremap <leader>ru :execute "!zig build"<CR>
augroup end

" *.tex
" NAV: nav-augroup-latex
function! NewEnvironment()
	let env = input('env: ')
	execute "normal! i\\begin{".env."}\n\n\\end{".env."}\ek$"
	execute "normal! kV2j=\ej"
	call feedkeys('i')
endfunction

augroup texgroup
	autocmd!
	" abbreviations for faster latex
	autocmd FileType plaintex,tex :iabbrev <buffer> mk $$<esc>i<c-r>=Eatchar('\s')<cr>
	autocmd FileType plaintex,tex :iabbrev <buffer> mca \mathcal{}<esc>i<c-r>=Eatchar('\s')<cr>
	autocmd FileType plaintex,tex :iabbrev <buffer> mbb \mathbb{}<esc>i<c-r>=Eatchar('\s')<cr>
	autocmd FileType plaintex,tex :iabbrev <buffer> mbf \mathbf{}<esc>i<c-r>=Eatchar('\s')<cr>
	autocmd FileType plaintex,tex :iabbrev <buffer> dm $$$$<left><esc>i<c-r>=Eatchar('\s')<cr>
	autocmd FileType plaintex,tex :iabbrev <buffer> sl \<esc>a<c-r>=Eatchar('\s')<cr>
	autocmd FileType plaintex,tex :iabbrev <buffer> @a \alpha
	autocmd FileType plaintex,tex :iabbrev <buffer> @A \Alpha
	autocmd FileType plaintex,tex :iabbrev <buffer> @b \beta
	autocmd FileType plaintex,tex :iabbrev <buffer> @B \Beta
	autocmd FileType plaintex,tex :iabbrev <buffer> @c \chi
	autocmd FileType plaintex,tex :iabbrev <buffer> @C \Chi
	autocmd FileType plaintex,tex :iabbrev <buffer> @g \gamma
	autocmd FileType plaintex,tex :iabbrev <buffer> @G \Gamma
	autocmd FileType plaintex,tex :iabbrev <buffer> @d \delta
	autocmd FileType plaintex,tex :iabbrev <buffer> @D \Delta
	autocmd FileType plaintex,tex :iabbrev <buffer> @e \epsilon
	autocmd FileType plaintex,tex :iabbrev <buffer> @E \Epsilon
	autocmd FileType plaintex,tex :iabbrev <buffer> @z \zeta
	autocmd FileType plaintex,tex :iabbrev <buffer> @Z \Zeta
	autocmd FileType plaintex,tex :iabbrev <buffer> @t \theta
	autocmd FileType plaintex,tex :iabbrev <buffer> @T \Theta
	autocmd FileType plaintex,tex :iabbrev <buffer> @k \kappa
	autocmd FileType plaintex,tex :iabbrev <buffer> @K \Kappa
	autocmd FileType plaintex,tex :iabbrev <buffer> @l \lambda
	autocmd FileType plaintex,tex :iabbrev <buffer> @L \Lambda
	autocmd FileType plaintex,tex :iabbrev <buffer> @m \mu
	autocmd FileType plaintex,tex :iabbrev <buffer> @M \Mu
	autocmd FileType plaintex,tex :iabbrev <buffer> @r \rho
	autocmd FileType plaintex,tex :iabbrev <buffer> @R \Rho
	autocmd FileType plaintex,tex :iabbrev <buffer> @o \omega
	autocmd FileType plaintex,tex :iabbrev <buffer> @O \Omeg
	autocmd FileType plaintex,tex :iabbrev <buffer> @u \upsilon
	autocmd FileType plaintex,tex :iabbrev <buffer> @U \Upsilon

	" latex configuration
	autocmd SourcePost,FileType plaintex,tex set linebreak textwidth=100

 	" latex unique commands
	autocmd FileType plaintex,tex nnoremap <leader>ne :call NewEnvironment()<CR>
	" compile: 
	autocmd FileType plaintex,tex nnoremap <leader>ru :execute "!pdflatex " . @%<CR>
augroup end
 

" *.json
" NAV: nav-augroup-json
function! JsonTemplate()
	execute "normal! i{\n\n\b}\ek"
endfunction	

function! NewEntryJSON()
	let key = input('k: ')
	let val = input('v: ')
	execute "normal! i\"" . key . "\": " . val . ",\n"
endfunction

augroup jsongroup
	autocmd!
	autocmd BufNewFile *.json call InsertIfEmpty(function('JsonTemplate'))
	autocmd FileType json nnoremap <leader>ne :call NewEntryJSON()<CR>
	autocmd FileType json inoremap <leader>ne <esc>:call NewEntryJSON()<CR>
augroup end

" *.py
" NOTE: function taken from https://stackoverflow.com/questions/64583892/execute-lines-of-python-script-in-vim

python3 << EOL
import vim
def ExecuteSelectedLine(l1, l2):
    for i in range(l1-1,l2):
        print(">>" + vim.current.buffer[i])
        exec(vim.current.buffer[i],globals())
EOL

" NAV: nav-augroup-python
augroup pythongroup
	autocmd!
	autocmd FileType python :iabbrev <buffer> iff if:<esc>i
	autocmd FileType python command! -range Run <line1>,<line2> python3 ExecuteSelectedLine(<line1>, <line2>)
	" ru - run entire script
	autocmd FileType python nnoremap <leader>ru :execute "!clear"<CR>:execute "!python3 %"<CR>
augroup end

augroup mdgroup
	autocmd SourcePost,FileType markdown set linebreak breakat=100 textwidth=100
augroup end

" *.templ files
" NAV: nav-augroup-templ
" augroup templgroup
" 	" Additional HTML like matching
" 	autocmd!
" 	autocmd BufRead,BufNewFile,BufWritePost *.templ setfiletype go
" 	autocmd BufRead,BufNewFile *.templ highlight link TemplTag Keyword
" 	autocmd BufRead,BufNewFile *.templ syntax match TemplTag "^templ"
" 	autocmd BufRead,BufNewFile *.templ nnoremap <buffer> <leader>ne :call NewHTMLElem()<CR>
" 	autocmd BufRead,BufNewFile *.templ inoremap <buffer> <leader>ne <esc>:call NewHTMLElem()<CR>
" 	autocmd BufRead,BufNewFile *.templ let g:go_fmt_autosave = 0
" 	autocmd BufRead,BufNewFile *.templ syntax region HTMLBlock start="\\ STRT" end="\\ END" contains=html
" augroup end

" autocmd FileType templ CocAction('diagnosticToggle')

" }}}

" MOUSE SETTINGS -------------------------- {{{
" NAV: nav-mouse
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
" NAV: nav-airline
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
" NAV: nav-goconfig
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" disables keyword lookup; need this since K is already binded to 25k
let g:go_doc_keywordprg_enabled = 0
"}}}

" CocConfig ----------------------------- {{{
" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim
" NAV: nav-cocconfig

" FEATURE: Tab Completion
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
highlight CocHighlightText cterm=Bold ctermfg=12 ctermbg=None

" Symbol renaming
nnoremap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xnoremap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s)
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
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
