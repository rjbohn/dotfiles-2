#!/bin/sh

vim_plugin() {
  repo="$1"
  basedir="$HOME/.vim/bundle"
  name="$(basename ${repo%%.git})"
  dir="$basedir/$name"

  [ ! -d "$basedir" ] && mkdir -p "$basedir"

  if [ -d "$dir/.git" ] ; then
    echo "vim plugin: Updating $name"
    (cd $dir; git fetch; git reset --hard origin/$(git branch | grep '^\* ' | cut -b 3-))
  else
    echo "vim plugin: Cloning $name"
    (cd $basedir; git clone $repo)
  fi
}

# Sync vim plugins
vim_plugin https://github.com/mileszs/ack.vim.git
vim_plugin https://github.com/jordansissel/vim-ackmore.git
vim_plugin https://github.com/scrooloose/nerdtree.git
vim_plugin https://github.com/majutsushi/tagbar.git
vim_plugin https://github.com/vim-scripts/DrawIt.git
vim_plugin https://github.com/jpalardy/vim-slime.git
vim_plugin https://github.com/altercation/vim-colors-solarized.git
#vim_plugin https://github.com/pydave/AsyncCommand.git
rm -rf $HOME/.vim/bundle/AsyncCommand
vim_plugin https://github.com/Lokaltog/vim-powerline.git
vim_plugin https://github.com/tpope/vim-fugitive.git
vim_plugin https://github.com/tpope/vim-unimpaired.git


# Compiling required for Command-T
#vim_plugin https://github.com/wincent/Command-T.git
#(
  #cd $HOME/.vim/bundle/Command-T/ruby/command-t/
  #ruby extconf.rb
  #make
#)
[ -d $HOME/.vim/bundle/Command-T ] && rm -rf $HOME/.vim/bundle/Command-T

# I have a fork of ruby-matchit to make it a proper ftplugin
vim_plugin https://github.com/jordansissel/ruby-matchit.git

#rm -rf $HOME/.vim/bundle/conque_2.3
#vim_plugin https://github.com/jordansissel/conque

#vim_plugin https://github.com/vim-scripts/taglist.vim.git
rm -rf $HOME/.vim/bundle/taglist.vim
