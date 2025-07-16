# Use Node 20
FROM node:20

# Install pnpm globally
RUN npm install -g pnpm

# Set working directory
WORKDIR /usr/src/app

# Copy all files
COPY . .

# Install dependencies using pnpm
RUN pnpm install

# Build the Flowise app
RUN pnpm run build

# Fix permissions for run script
RUN chmod +x packages/server/bin/run

# Create log directory that Flowise expects
RUN mkdir -p /opt/render/.flowise/logs

# Expose default Flowise port
EXPOSE 3000

# Start Flowise
CMD ["packages/server/bin/run", "start"]
