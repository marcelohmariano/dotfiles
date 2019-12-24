#!/bin/bash

pushd "$(realpath "$(dirname "$0")")" >/dev/null && trap "popd >/dev/null" EXIT

source src/runner.sh
source src/installer.sh

show_usage_and_exit() {
  echo "Usage: $(basename "$0") <install|uninstall|reinstall>" >&2
  exit 1
}

is_valid_action() {
  case $1 in
    install|uninstall|reinstall)
      return 0
      ;;
    *)
      return 1
  esac
}

main() {
  if ! is_valid_action "$1"; then
    show_usage_and_exit
  fi

  local directories
  local script

  directories="$(find . -mindepth 1 -maxdepth 1 -not -path '*/\.*' -type d)"

  for directory in $directories; do
    script="$directory/$(basename "$directory").sh"

    if [ -f "$script" ]; then
      if [ "$1" == "reinstall" ]; then
        runner::run "$script" uninstall
        runner::run "$script" install
      else
        runner::run "$script" "$1"
      fi
    fi
  done
}

main "$@"