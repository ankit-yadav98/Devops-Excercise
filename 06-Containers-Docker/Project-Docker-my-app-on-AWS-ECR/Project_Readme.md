## Demo Project - Containers with Docker

- Use Docker for local development
- Docker Compose - Run multiple Docker Containers
- Dockerize Nodejs application

## Technologies used:

Docker, Nodejs, MongoDB, MongoExpress, AWS ECR (Elastic Container registry)

## Project Description:

- Create Dockerfile for Nodejs application and build Docker image and then push the created app image to aws ECR.
- Run Nodejs application in Docker container and connect to MongoDB database container locally.
- Also run MongoExpress container as a UI of the MongoDB database.
- Image version 1.1 of my-app pushed to AWS ECR.
- my-app images pulled from AWS ECR. MongoDB and MongoExpress images pulled from dockerHub.
- Build Docker compose file to run my-app, MongoDB and MongoExpress Containers.
