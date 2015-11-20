" enable syntax highlighting 
syntax enable 

" load filetype specific tab loading 
filetype plugin indent on

" number of visual space per TAB
set tabstop=4

" number of space in tab when editing 
set softtabstop=0 

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" tabs are spaces 
set noexpandtab

" show line numbers
set number 

" show the commaned line 
set showcmd 

" set current line highlight 
set cursorline 

" search as characters are entered
set incsearch

" highlight search matches
set hlsearch

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" set comma as leader 
let mapleader=","

augroup configgroup
	autocmd!
	autocmd VimEnter * highlight clear SignColumn
	autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
				\:call <SID>StripTrailingWhitespaces()
	autocmd FileType java setlocal noexpandtab
	autocmd FileType java setlocal list
	autocmd FileType java setlocal listchars=tab:+\ ,eol:-
	autocmd FileType java setlocal formatprg=par\ -w80\ -T4
	autocmd FileType php setlocal list
	autocmd FileType php setlocal listchars=tab:+\ ,eol:-
	autocmd FileType php setlocal formatprg=par\ -w80\ -T4
	autocmd FileType ruby setlocal tabstop=2
	autocmd FileType ruby setlocal shiftwidth=2
	autocmd FileType ruby setlocal softtabstop=2
	autocmd FileType ruby setlocal commentstring=#\ %s
	autocmd FileType python setlocal commentstring=#\ %s
	autocmd BufEnter *.cls setlocal filetype=java
	autocmd BufEnter *.zsh-theme setlocal filetype=zsh
	autocmd BufEnter Makefile setlocal noexpandtab
	autocmd BufEnter *.sh setlocal tabstop=2
	autocmd BufEnter *.sh setlocal shiftwidth=2
	autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
 function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
	let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
