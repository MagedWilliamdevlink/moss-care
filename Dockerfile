# Use an official Node.js runtime as a parent image
FROM node:18-alpine

USER root

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

RUN echo "node version: " && node --version

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run app when the container launches
CMD ["npm", "run", "preview"]