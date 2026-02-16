# Stage 1: Build Flutter Android APK
FROM ghcr.io/cirruslabs/flutter:latest AS builder

WORKDIR /app

# Suppress Flutter root user warning
ENV FLUTTER_ROOT_ANDROID="/"

# Copy entire project (required for path dependencies in third_party/)
COPY . .

# Get dependencies
RUN flutter pub get

# Build Android APK
RUN flutter build apk --release

# Stage 2: Serve APK for download
FROM nginx:alpine

# Copy built APK to nginx
COPY --from=builder /app/build/app/outputs/flutter-app-release.apk /usr/share/nginx/html/app.apk

# Copy custom nginx config
COPY nginx-apk.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
