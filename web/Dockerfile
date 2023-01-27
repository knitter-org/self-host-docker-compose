FROM nginx:alpine

RUN wget $(curl -s https://api.github.com/repos/knitter-org/app/releases/latest | grep "\/bundle\.zip" | cut -d : -f 2,3 | tr -d \")
RUN rm /usr/share/nginx/html/*
RUN unzip bundle.zip -d /usr/share/nginx/html
RUN rm bundle.zip

COPY nginx.conf /etc/nginx/conf.d/default.conf
