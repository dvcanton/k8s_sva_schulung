#!/bin/sh

ROOT_DIR=/usr/share/nginx/html

# Replacing env constants in JS
for file in src/components/*.vue* ;
do
  sed -i 's|BACKEND_SERVER|'${BACKEND_SERVER}'|g' $file
  sed -i 's|BACKEND_PORT|'${BACKEND_PORT}'|g' $file
done

npm run dev --host 0.0.0.0