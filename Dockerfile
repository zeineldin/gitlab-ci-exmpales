FROM node:latest as build
COPY . /app
WORKDIR /app
RUN npm config set registry <YOUR NPM REGISTRY URL> && npm install
RUN npm run build

FROM abiosoft/caddy
RUN mkdir -p /srv/<YOUR PATH>
COPY --from=build /app/public /srv/<YOUR PATH>
COPY Caddyfile /etc/Caddyfile
