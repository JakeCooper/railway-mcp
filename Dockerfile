# Generated by https://smithery.ai. See: https://smithery.ai/docs/config#dockerfile
FROM node:lts-alpine

# Create app directory
WORKDIR /app

# Install dependencies
COPY package*.json ./

# Install packages without running scripts
RUN npm install --ignore-scripts

# Copy source files
COPY . .

# Build the TypeScript project
RUN npm run build

# Expose necessary port(s) if required (MCP typically communicate over stdio, so not needed)

# Start the MCP server
CMD ["node", "build/index.js"]
