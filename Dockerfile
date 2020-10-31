FROM node:11.6.0-alpine as builder

WORKDIR '/app'

COPY package.json . 

RUN npm install

COPY . .

RUN npm run build

FROM nginx:latest
EXPOSE: 80
COPY --from=builder /app/build /usr/share/nginx/html
