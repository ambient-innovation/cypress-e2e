FROM cypress/browsers:node10.2.1-chrome74

ENV PATH="${PATH}:/app/node_modules/.bin"
WORKDIR /app

COPY ./package.json /app
COPY ./yarn.lock /app

RUN yarn install
RUN cypress verify

CMD cypress run
