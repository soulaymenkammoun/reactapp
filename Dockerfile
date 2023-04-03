FROM node:latest as build
WORKDIR /reactapp
COPY . .
RUN npm install
RUN npm run build

FROM nginx:latest
COPY --from=build /reactapp/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
