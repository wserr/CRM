# Install dependencies
FROM debian:latest AS build-env
RUN apt-get update 
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3 psmisc
RUN apt-get clean

# Clone the flutter repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set flutter path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Enable flutter web
RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-web

# Run flutter doctor
RUN flutter doctor -v

# Copy the app files to the container
COPY . /usr/local/bin/app

# Set the working directory to the app files within the container
WORKDIR /usr/local/bin/app

# Get App Dependencies
RUN flutter pub get

ARG build_command
# Build the app for the web
RUN flutter build web

# use the nginx:alpine image for publishing
FROM nginx:alpine as base

# Copy build files to this image
COPY --from=build-env /usr/local/bin/app/build/web /usr/share/nginx/html 

# Copy nginx configuration
COPY ./web/nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy .env file
COPY ./assets/$environment.env /usr/share/nginx/html/assets/.env

# Expose port 80 on this image
EXPOSE 80