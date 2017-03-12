#!/bin/bash

# install pathogen
mkdir -p ./autoload ./bundle && \
curl -LSso ./autoload/pathogen.vim https://tpo.pe/pathogen.vim

pushd ./bundle

# vim powerline - fancy status line
git clone --depth 1 https://github.com/Lokaltog/vim-powerline
# syntactic - syntax checking
git clone --depth 1 https://github.com/scrooloose/syntastic.git
# ctrlp - file/folder finder
git clone --depth 1 https://github.com/kien/ctrlp.vim.git
# fugitive - git wrapper
git clone --depth 1 https://github.com/tpope/vim-fugitive.git
# NERDTree - file tree
git clone --depth 1 https://github.com/scrooloose/nerdtree.git
# tagbar - sidebar with tags from current file
git clone --depth 1 https://github.com/majutsushi/tagbar
# Python-mode
## git clone --depth 1 https://github.com/klen/python-mode.git
# solarized color scheme
git clone --depth 1 https://github.com/altercation/vim-colors-solarized.git

# Salt syntax hilight
git clone --depth 1 https://github.com/saltstack/salt-vim.git
# Jinja syntax hilight
git clone --depth 1 https://github.com/Glench/Vim-Jinja2-Syntax.git

