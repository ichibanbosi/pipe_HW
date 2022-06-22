FROM ubuntu:latest
RUN apt-get update && apt-get install -y docker.io git
COPY /var/run/docker.sock /var/run/docker.sock
RUN docker login --username --password
