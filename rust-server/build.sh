#!/usr/bin/env sh
set -ex

cargo build --release
cp target/release/rust_app ./app
sudo docker build -t dvcanton/wordle-generator-server:latest .
sudo docker push dvcanton/wordle-generator-server:latest

# sudo sudo docker run -it -p 9090:9090 -d --name generator-server dvcanton/wordle-generator-server:latest
# sudo sudo docker run -p 4433:4433 -e ENABLE_SERVER_SSL=true -e CERT_PATH=/files/server_cert.pem -e  KEY_PATH=/files/server_key.pem -d --name generator-server dvcanton/wordle-generator-server:latest