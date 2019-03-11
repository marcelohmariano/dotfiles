#!/bin/bash

vim::install_plugin_manager() {
  # Install vim-plug
  if [ ! -f vim/autoload/plug.vim ]; then
    mkdir -p vim/autoload
    curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" \
      -o vim/autoload/plug.vim
  fi
}

vim::install() {
  echo 'Installing vim...'

  vim::install_plugin_manager
  installer::install vimrc
  installer::install vim

  # Configure vim for the first time
  vim +PlugInstall +qa
}

vim::uninstall() {
  echo 'Uninstalling vim...'

  installer::uninstall vimrc
  installer::uninstall vim
}
