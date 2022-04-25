FROM node:lts-alpine AS builder
WORKDIR '/app'
COPY package.json package-lock.json ./
RUN npm install
COPY angular.json karma.conf.js tsconfig.app.json tsconfig.json tsconfig.spec.json ./
COPY src src/
RUN npm run build

FROM nginx:stable-alpine
COPY ./docker/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY src/robots.txt src/sitemap.xml /var/www/html/
COPY --from=builder /app/dist/idiomaticrustcom/ /var/www/html
