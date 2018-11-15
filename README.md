# AI cypress docker base

This docker image is supposed to make the integration of cypress in the CI pipeline easier and faster.
The regular way to use cypress within a CI pipeline is to use one of the ready docker images provided by cypress
and then run `npm install` with your own package.json. This has the advantage that always the latest version of
cypress will be installed and that you can use custom scripts in your package.json. However, installing cypress takes
quite long, which can be very annoying of you depend heavily on the CI pipelines. In order to speed up this process
we provide a docker image with ready installed cypress.

## Usage

You need to mount the custom parts (your tests, cypress.json etc.) into the container. 
Make sure not to mount the whole folder, because this would overwrite the node_modules folder inside the container.
The default command will be `cypress run`.

```
- docker run --rm -v ${PWD}/cypress-e2e/cypress:/app/cypress -v ${PWD}/cypress-e2e/cypress.json:/app/cypress.json -v ${PWD}/cypress-e2e/package.json:/app/package.json --network="host" ambientinnovation/cypress-docker

```

## Development

This project is hosted at https://github.com/ambient-innovation/cypress-e2e
The docker image is hosted on dockerhub.

To make changes, just push to the repo. It is configured as automated build. The branch
"master" will receive the tag "latest" and each Git Tag will create a corresponding docker tag.
