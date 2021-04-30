#!/bin/bash

INSTALL_PATH=/usr/local/lib/libxercesc/

PKG_CONFIG_PATH=${PKG_CONFIG_PATH:-/usr/local/lib/pkgconfig}
PKG_CONFIG_FILE_PATH="$PKG_CONFIG_PATH/libxerces.pc"
PKG_CONFIG=$(cat << EOF
prefix=$INSTALL_PATH

Name: libxerces
Description: Xerces-C++ dynamic library
Version: local
Cflags: -I\${prefix}/include
Libs: -lcurses $(
  # For some reason, linking the C++ standard libary is different on Linux and macOS
  [[ "$OSTYPE" == "darwin"* ]] && echo "-lc++" || echo "-lstdc++"
) -L\${prefix}/lib
EOF
)

# Install the package config
if [[ -n "$PKG_CONFIG_FILE_PATH" ]]; then
  echo "Writing pkg-config file to $PKG_CONFIG_FILE_PATH"
  if ! echo "$PKG_CONFIG" > "$PKG_CONFIG_FILE_PATH"; then
    echo "Could not create pkg-config file, please ensure $PKG_CONFIG_FILE_PATH is writable."
    exit 1
  fi
fi
