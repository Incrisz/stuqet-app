# Stage 1: Build Flutter Web App
FROM ghcr.io/cirruslabs/flutter:latest AS builder

WORKDIR /app

# Copy pubspec files
COPY pubspec.yaml pubspec.lock* ./

# Get dependencies
RUN flutter pub get

# Copy entire project
COPY . .

# Build web app
RUN flutter build web --release

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy built app to nginx
COPY --from=builder /app/build/web /usr/share/nginx/html

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
