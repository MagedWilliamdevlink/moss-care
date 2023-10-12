# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory to /app
WORKDIR /

# Copy the current directory contents into the container at /app
COPY . /

RUN echo "node version: " && node --version

RUN chmod 777 -R /

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run app when the container launches
CMD ["npm", "run", "preview"]