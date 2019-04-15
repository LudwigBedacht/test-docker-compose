# First instruction of a dockerfile. Defines the base image which will be used for compilation
# In our case we use an image containing nodejs in the latest version
FROM node:latest
ARG author
#defines the working directory. Ever command executed on the docker container will be in the scope of /app
WORKDIR /app

# copies package.json and package.lock.json to the container
COPY package.* .


RUN npm i

# Copies all contents of the current directory to the container
COPY . .

# Exposes a port which can be mapped to the host system
# IMPORTANT: The port is not mapped automatically, it has to be mapped with docker run -p <any port on the host>:3000
EXPOSE 3000
LABEL Author=${author}
# Defines the execution command for the startup of a docker container
CMD [ "node", "index.js" ]

