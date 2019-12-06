FROM cypress/browsers:node12.13.0-chrome78-ff70

ENV PATH="${PATH}:/app/node_modules/.bin"
WORKDIR /app

COPY ./package.json /app
COPY ./yarn.lock /app

RUN yarn install
RUN cypress verify

CMD cypress run
