FROM node:20 AS build
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM httpd
COPY --from=build /usr/src/app/dist/angular-frontend-simple-redes/browser /usr/local/apache2/htdocs/
EXPOSE 80