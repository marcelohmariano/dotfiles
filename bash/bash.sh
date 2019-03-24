#!/bin/bash

bash::install() {
  echo 'Installing bash...'
  installer::install bashrc
  installer::install bashrc.d
}

bash::uninstall() {
  echo 'Uninstalling bash...'
  installer::uninstall bashrc
  installer::uninstall bashrc.d
}