FROM node:alpine
WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx
# EXPOSE is used for AWS to see and map ports automatically.
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html