#!/bin/bash

INITIAL_BINARY_PATH=$1
SYMLINK_PATH=$2

SYMLINK_TARGET=$(readlink -m "$SYMLINK_PATH")

if [ ! -f "$SYMLINK_TARGET" ]; then
  cp "$INITIAL_BINARY_PATH" "$SYMLINK_TARGET"

  PERMS=$(stat -c "%a" "$INITIAL_BINARY_PATH")
  chmod "$PERMS" "$SYMLINK_TARGET"

  OWNER_GROUP=$(stat -c "%u:%g" "$INITIAL_BINARY_PATH")
  chown "$OWNER_GROUP" "$SYMLINK_TARGET"
fi
