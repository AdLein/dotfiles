"----------------------------------------------------------------------------------------------------------------------"
"                                       < My vimrc.vim file configuration >                                            "
"----------------------------------------------------------------------------------------------------------------------"
" Start-Up
" Autocmd Line Return  {{{
	augroup line_return
		au!
		au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\	execute 'normal! g`"zvzz' |
			\ endif
	augroup END
" }}}
" Autocmd Load Session {{{
		" Triger `autoread` when files changes on disk
	autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
	set autoread 
		" Notification after file change
	autocmd FileChangedShellPost *
	  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
" }}}
" Misc {{{
	set dir=/tmp/
	set mouse=a
" }}}
" Navigation
" KeyRemaps {{{
	let mapleader=","
" }}}
" KeyMovement {{{
	nnoremap n nzzzv
	nnoremap N Nzzzv

	nnoremap H 0
	nnoremap L $
	nnoremap J G
	nnoremap K gg
	nnoremap <leader>z zMzvzz
" }}}
" Modes {{{
	nnoremap vv 0v$
" }}}
" File and Window {{{
	inoremap <leader>w <Esc>:wq!<CR>
	nnoremap <leader>w :wq!<CR>

	inoremap <leader>q <ESC>:q!<CR>
	nnoremap <leader>q :q!<CR>

	inoremap <leader>x <ESC>:x<CR>
	nnoremap <leader>x :x<CR>

	nnoremap <leader>e :Ex<CR>
	nnoremap <leader>t :tabnew<CR>:Ex<CR>
	nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
	nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>
" }}}
" Folding {{{ 
	set foldenable
	set foldmethod=marker
	set foldlevel=0
	set foldnestmax=10
	nnoremap <Space> za
" }}}
" Searching {{{
	set incsearch
	set hlsearch
	nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>
" }}}
"Syntax
" Enable Syntax Hightlight {{{
	syntax on
" }}}
" Indentation {{{
	set autoindent
	set backspace=indent,eol,start
" }}}
" Tab {{{
	set listchars=tab:\|\ 
	map <tab> %
	set tabstop=4
	set shiftwidth=4

	so ~/dotfiles/vim/tabs.vim
		
	autocmd Filetype html setlocal sw=2 expandtab
	autocmd Filetype javascript setlocal sw=4 expandtab

	autocmd BufNewFile,BufRead *.ts set syntax=javascript
	autocmd BufNewFile,BufRead *.tsx set syntax=javascript
" }}}
" User Interface
" Color and theme {{{
	set background=dark 
" }}}
" Number {{{
	set number
	set relativenumber
" }}}
" Cursor Line {{{
	set cursorline
	hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
" }}}
