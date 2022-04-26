
npm install

sudo docker build -t dvcanton/wordle-generator-app:latest .
sudo docker push dvcanton/wordle-generator-app:latest

# sudo docker run -it -p 3000:3000 -e BACKEND_SERVER=http://localhost -e BACKEND_PORT=9090 -d --name generator-app dvcanton/wordle-generator-app:latest