FROM node:6.9.1

RUN apt-get update
RUN apt-get install -y netcat
RUN apt-get install -y dnsutils

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app


ARG NODE_ENV

ENV NODE_ENV $NODE_ENV
COPY package.json /usr/src/app/
RUN npm install
RUN npm install -g gulp

COPY . /usr/src/app
RUN chmod +x /usr/src/app/test-script.sh