#!/bin/sh
if [ -n "$SLIDEV_PASSWORD" ]; then
  exec node_modules/.bin/slidev --remote="$SLIDEV_PASSWORD" --port 3030
else
  exec node_modules/.bin/slidev --remote --port 3030
fi
