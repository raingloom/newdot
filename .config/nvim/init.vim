call plug#begin('~/.config/nvim/plugged')

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
"    !./install.sh
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()

syntax on
let tabsize = 4
execute "set tabstop=".tabsize
execute "set shiftwidth=".tabsize
execute "set softtabstop=".tabsize
set noexpandtab
set breakindent
set ruler
set number
set ai
set nowrap
