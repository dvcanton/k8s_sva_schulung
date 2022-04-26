FROM node:lts-alpine
USER root
# http server for serving static content
RUN npm install -g http-server

WORKDIR /home/node
COPY package*.json ./


# install project dependencies
RUN npm config set user 0
RUN npm install
COPY . .
RUN chmod 777 -R .
RUN chmod 777 -R /root

RUN npm run build

# Copy entrypoint script as /entrypoint.sh
COPY ./entrypoint.sh /entrypoint.sh

# Grant Linux permissions and run entrypoint script
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# CMD [ "http-server", "dist" ]
# CMD [ "bash" ]