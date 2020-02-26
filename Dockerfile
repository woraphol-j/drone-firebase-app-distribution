FROM node:12.16.1-alpine3.9

RUN npm install -g firebase-tools

COPY script.sh /app/script.sh

WORKDIR /app

ENTRYPOINT ["/app/script.sh"]
