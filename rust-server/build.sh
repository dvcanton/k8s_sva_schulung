#!/usr/bin/env sh
set -ex

cargo build --release
cp target/release/rust_app ./app
docker build -t dvcanton/wordle-generator-server:latest .

# docker push dvcanton/wordle-generator-app:latest

sudo sudo docker run -it -p 9090:9090 -d --name generator-server dvcanton/wordle-generator-server:latest