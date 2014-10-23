#!/bin/bash

fancy_echo() {
  echo $1
}

info() {
  fancy_echo " INFO | $1"
}

warn() {
  fancy_echo " WARN | $1"
}

xcode_cli_tools() {
  xcode_status=$(xcode-select --print 2> /dev/null)

  if [ $? -gt 0 ]; then
    info "Installing command line tools"
  else
    warn "Command line tools are already installed"
    return
  fi

  xcode-select --install 2> /dev/null
}

main() {
  xcode_cli_tools
}

if [ $# -eq 0 ]; then
  main
fi
