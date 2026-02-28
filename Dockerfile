FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --prefer-offline

COPY slides.md .
COPY vite.config.ts .
COPY components/ ./components/
COPY start.sh .
RUN chmod +x start.sh

EXPOSE 3030

ENTRYPOINT ["./start.sh"]
