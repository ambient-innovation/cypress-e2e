FROM cypress/base:10

WORKDIR /app

COPY ./package.json /app
COPY ./yarn.lock /app

RUN yarn install
RUN $(npm bin)/cypress verify

CMD $(npm bin)/cypress run
