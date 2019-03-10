#!/bin/bash

installer::install() {
  test -z "$1" && return

  local fullpath
  local dotfile

  for file in $@; do
    fullpath="$(realpath "$file")"
    dotfile=".$(basename "$file")"
    rm -f "$HOME/$dotfile"
    ln -vs "$fullpath" "$HOME/$dotfile"
  done
}

installer::uninstall() {
  test -z "$1" && return
  local fullpath

  for file in $@; do
    dotfile=".$(basename "$file")"
    echo \'rm -rf "$HOME/$dotfile"\'
    rm -rf "$HOME/$dotfile"
  done
}