#
# Ubuntu Dockerfile
#
# Use for valgrind mem-checking
#

# Pull base image
FROM ubuntu

# This is the working directory of the docker image
WORKDIR /projects

# Copy files from local machine to Docker container
# COPY /src /dest
COPY ./src .

# Run terminal commands to install packages
RUN \
	apt-get update && \
	apt-get install -y build-essential vim git tmux valgrind
