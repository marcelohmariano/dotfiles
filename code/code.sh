#!/bin/bash

code::install_extension() {
  code --install-extension "$1" 2>/dev/null
}

code::uninstall_extension() {
  code --uninstall-extension "$1" 2>/dev/null
}

code::install() {
  echo 'Installing code...'

  code::install_extension "bierner.markdown-preview-github-styles"
  code::install_extension "davidanson.vscode-markdownlint"
  code::install_extension "dunstontc.viml"
  code::install_extension "formulahendry.terminal"
  code::install_extension "editorconfig.editorconfig"
  code::install_extension "icrawl.discord-vscode"
  code::install_extension "ms-vscode.cpptools"
  code::install_extension "peterjausovec.vscode-docker"
  code::install_extension "twxs.cmake"
}

code::uninstall() {
  echo 'Uninstalling code...'

  code::uninstall_extension "bierner.markdown-preview-github-styles"
  code::uninstall_extension "davidanson.vscode-markdownlint"
  code::uninstall_extension "dunstontc.viml"
  code::uninstall_extension "formulahendry.terminal"
  code::uninstall_extension "editorconfig.editorconfig"
  code::uninstall_extension "icrawl.discord-vscode"
  code::uninstall_extension "ms-vscode.cpptools"
  code::uninstall_extension "peterjausovec.vscode-docker"
  code::uninstall_extension "twxs.cmake"
}
