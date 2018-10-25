FROM node:8
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8082
ENTRYPOINT ["node", "index.js"]