FROM nginx:alpine
COPY build /usr/share/nginx/html
COPY deployment/nginx.default.conf /etc/nginx/conf.d/
