FROM node:20.5.1-alpine
RUN mkdir -p /app
WORKDIR /app
COPY . .
RUN npm cache clean --force
RUN npm install
RUN npm run build
RUN npm install -g serve
EXPOSE 3000
ENTRYPOINT ["serve", "-s", "build", "-l", "3000"]