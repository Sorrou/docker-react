FROM node:alpine as builder
ENV https_proxy http://au07459:Ryzk9955@138.21.72.170:3128
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html