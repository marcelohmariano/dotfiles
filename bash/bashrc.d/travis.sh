#!/bin/bash

travis() {
  docker run -it --rm \
    -v travis:/home/dev/.travis \
    -v "$PWD":/home/dev/work \
    -w /home/dev/work \
    marcelohmariano/travis-cli "$@"
}