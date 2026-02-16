# Stage 1: Build Flutter Web App
FROM ghcr.io/cirruslabs/flutter:latest AS builder

WORKDIR /app

# Suppress Flutter root user warning
ENV FLUTTER_ROOT_ANDROID="/"

# Copy entire project (required for path dependencies in third_party/)
COPY . .

# Get dependencies
RUN flutter pub get

# Configure project for web
RUN flutter create . --platforms web

# Build web app with optimization flags
RUN flutter build web --release --no-tree-shake-icons

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy built app to nginx
COPY --from=builder /app/build/web /usr/share/nginx/html

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
