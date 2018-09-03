FROM node:latest as build
COPY . /app
WORKDIR /app
RUN npm config set registry <YOUR NPM REGISTRY URL:PORT>
RUN npm install
RUN npm run build

FROM abiosoft/caddy
RUN mkdir -p /srv/app
COPY --from=build /app/build /srv/app
COPY Caddyfile /etc/Caddyfile
