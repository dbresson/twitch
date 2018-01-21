#!/bin/sh
case "$1" in
lint)
  npm run ci:lint
  ;;
test)
  npm run ci:test
  ;;
build)
  npm run ci:build >&2
  node -e 'process.stdout._handle.setBlocking(true)'
  tar cf - build deployment Dockerfile
  ;;
*)
  exec "$@"
esac
