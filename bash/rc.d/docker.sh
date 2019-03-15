#!/bin/bash

xdocker-run() {

usage() {
  echo_error "Usage: USER=<user> xdocker-run <args>"
}

if [ -z "$USER" ] || [ -z "$1" ]; then
  usage
  return 1
fi

docker run \
  -e DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/.Xauthority:/home/$USER/.Xauthority \
  --network host \
  --privileged \
  "$@"

}