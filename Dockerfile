# Use an official Node.js runtime as a parent image
FROM node:18-alpine

RUN mkdir /.npm
RUN mkdir /app

RUN chown -R root:root /.npm
RUN chmod g+rwx /.npm

RUN chown -R root:root /app
RUN chmod g+rwx /app

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app


RUN echo "node version: " && node --version

RUN echo '>>> version 4 ' && whoami && npm i  --loglevel verbose && npm run build --loglevel verbose

RUN npm install http-server --loglevel verbose

RUN apk add sudo

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run app when the container launches
CMD ["npm", "run", "preview"]