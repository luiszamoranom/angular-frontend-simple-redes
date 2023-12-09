FROM node:20 as build

WORKDIR /app

COPY package*.json /app/

RUN npm install

COPY . /app

RUN npm run build 

FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf

RUN rm -rf /usr/share/nginx/html/*

COPY --from=build /app/dist/angular-frontend-simple-redes/browser /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]