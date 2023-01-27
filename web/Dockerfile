FROM nginx:alpine

RUN rm /usr/share/nginx/html/*

ADD bundle.zip
RUN unzip bundle.zip -d /usr/share/nginx/html
RUN rm bundle.zip

COPY nginx.conf /etc/nginx/conf.d/default.conf
