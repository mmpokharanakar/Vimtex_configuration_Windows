" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" Begin plugin section for vim-plug
call plug#begin('C:/Program Files/Vim/vimfiles/plugged')

" Add your plugins below:
Plug 'lervag/vimtex'

Plug 'sirver/ultisnips'

call plug#end()

" VimTeX configuration with Delek theme
filetype plugin indent on
syntax enable
colorscheme Delek
set termguicolors

let g:vimtex_view_method = 'general'
let g:vimtex_view_general_viewer = 'C:/Users/dmpok/AppData/Local/SumatraPDF/SumatraPDF.exe'
"let g:vimtex_view_general_options = '--reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_compiler_method = 'latexmk'
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=1
set conceallevel=1
let g:tex_conceal='abdmg'
highlight Conceal ctermfg=blue guifg=blue
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" Map Ctrl+S in normal and insert modes to save the current file
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Clipboard mappings for Windows Vim
vnoremap <C-c> "+y
vnoremap <C-x> "+d
inoremap <C-v> <C-r>+
nnoremap <C-v> "+p

" Undo mapping
inoremap <C-z> <C-o>u
nnoremap <C-z> u

" Add line numbers
set number

" Spelling check
setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u