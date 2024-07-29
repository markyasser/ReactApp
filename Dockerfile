# Use an official Node.js runtime as a parent image
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React app
RUN npm run build

# Install a simple web server to serve the static files
RUN npm install -g serve

# Set the command to run the web server on the build output
CMD ["serve", "-s", "build", "-l", "5000"]

# Expose the port the app runs on
EXPOSE 5000
