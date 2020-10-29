" SPDX-License-Identifier: GPL-3.0-or-later
"
" Copyright (C) 2020 Saurabh Charde <saurabhchardereal@gmail.c
"

" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent call system('mkdir -p ~/.vim/autoload')
  silent call system('curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  execute 'source  ~/.vim/autoload/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'z0mbix/vim-shfmt'
let g:shfmt_extra_args = '-i 4' " use 4 spaces as default indent style

Plug 'tpope/vim-fugitive'

call plug#end()
