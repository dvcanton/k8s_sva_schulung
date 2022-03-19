#!/usr/bin/env sh
set -ex

cargo build --release
cp target/debug/rust_app ./app
docker build -t dvcanton/wordle-generator-app:latest .

# docker push dvcanton/wordle-generator-app:latest