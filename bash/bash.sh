#!/bin/bash

bash::install() {
  echo 'Installing bash...'
  installer::install bashrc
}

bash::uninstall() {
  echo 'Uninstalling bash...'
  installer::uninstall bashrc
}