"=============================================================================
" Custom Autocommands
"=============================================================================
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup FOSS_KING
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END

autocmd TermClose * if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif

    " NOTE: added lazygit check to avoid lua error
    " NOTE: added "silent!" to avoid error when FZF terminal window is closed.
    autocmd TermClose * if &filetype != 'lazygit' && !v:event.status | silent! exe 'bdelete! '..expand('<abuf>') | endif
