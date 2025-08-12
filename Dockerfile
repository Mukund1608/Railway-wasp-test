# Use Node.js base image
FROM node:18-alpine

# Install system dependencies
RUN apk add --no-cache curl bash

# Install Wasp
RUN curl -sSL https://get.wasp-lang.dev/installer.sh | sh
ENV PATH="/root/.local/bin:$PATH"

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Install Wasp dependencies
RUN wasp start

# Expose port
EXPOSE 3000

# Start the application
CMD ["wasp", "start"]
