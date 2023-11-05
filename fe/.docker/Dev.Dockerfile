# Stage 1: Build the Vite.js application
FROM node:18-alpine as build

# Set the working directory inside the container
WORKDIR /app


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ADD . .

# Copy package.json and package-lock.json to the container
# Install project dependencies with the --legacy-peer-deps flag
RUN npm install --legacy-peer-deps

ENTRYPOINT ["/entrypoint.sh"]


CMD ["npm", "run", "dev"]


# Stage 2: Serve the built Vite.js app using Nginx

