# Use Node 20
FROM node:20

# Install pnpm globally
RUN npm install -g pnpm

# Create app directory
WORKDIR /usr/src/app

# Copy everything
COPY . .

# Install dependencies using pnpm
RUN pnpm install

# Build the Flowise app
RUN pnpm run build

# Make the run script executable
RUN chmod +x packages/server/bin/run

# Create required log directory
RUN mkdir -p /opt/render/.flowise/logs

# Expose the port
EXPOSE 3000

# Start Flowise
CMD ["packages/server/bin/run", "start"]
