FROM node:14 AS build
WORKDIR /app
COPY package.json package-lock.json ./
 COPY build ./

#RUN npm install

COPY . .

 #RUN npm run build

# Stage 2: Serve the app using Nginx
FROM nginx:latest

COPY --from=build /app/build /usr/share/nginx/html
# Optionally, copy custom Nginx configuration
 COPY ./default.conf /etc/nginx/conf.d/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

