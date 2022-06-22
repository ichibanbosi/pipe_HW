FROM ubuntu:latest
RUN apt-get update && apt-get install -y docker.io git ssh
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa