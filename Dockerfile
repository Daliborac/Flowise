# Use Node 20
FROM node:20

# Create app directory
WORKDIR /usr/src/app

# Copy everything
COPY . .

# Install dependencies
RUN npm install

# Build the Flowise app
RUN npm run build

# Make the run script executable
RUN chmod +x packages/server/bin/run

# Create missing log directory (this fixes your error)
RUN mkdir -p /opt/render/.flowise/logs

# Expose the port
EXPOSE 3000

# Start Flowise
CMD ["packages/server/bin/run", "start"]
