#!/bin/sh

docker run --rm -it \
  -v $HOME/.gitconfig:/root/.gitconfig \
  -v $HOME/.bashrc:/root/.bashrc \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -v $(pwd):/var/my-app \
  ruby-editor
