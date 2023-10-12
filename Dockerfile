# Use an official Node.js runtime as a parent image
FROM node:18-alpine

RUN mkdir /.npm
RUN mkdir /app

RUN chmod 777 /.npm
RUN chmod 777 /app

# RUN chmod a+rwx /.npm
# RUN chmod a+rwx /app

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

RUN echo "node version: " && node --version

RUN npm install && npm run build

RUN echo '---------------------------------'

RUN cd / && ls -la

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run app when the container launches
ENTRYPOINT ["npm", "run", "preview"]