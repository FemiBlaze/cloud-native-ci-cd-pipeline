# Stage 1: Build the Application
FROM node:20-alpine AS builder

WORKDIR /app

COPY app/package*.json ./
RUN npm install

COPY app/ .
RUN npm run build


# Stage 2: Serve the Application
FROM nginx:alpine

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

