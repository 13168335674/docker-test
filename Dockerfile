FROM node AS builder

WORKDIR /app

COPY . /app

RUN npm config set registry https://registry.npm.taobao.org && npm install  && npm run build

FROM nginx

COPY --from=builder app/dist /usr/share/nginx/html/

COPY --from=builder app/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
