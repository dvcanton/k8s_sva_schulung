
npm install

sudo docker build -t dvcanton/wordle-generator-app:latest .
sudo docker push dvcanton/wordle-generator-app:latest

# sudo docker run -it -p 8081:8080 -d --name generator-app dvcanton/wordle-generator-app:lastest