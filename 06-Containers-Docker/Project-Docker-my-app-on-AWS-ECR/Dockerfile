FROM node:26-alpine3.23

RUN mkdir -p /home/app

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PASSWORD=password

COPY ./app /home/app

WORKDIR /home/app

RUN npm install

CMD ["node", "server.js"]
