FROM node:alpine
WORKDIR '/app'
COPY package.json .
#RUN npm config set proxy http://proxylp.ihc.com:8080
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html