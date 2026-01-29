# ---------- Build stage ----------
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .

# ---------- Runtime stage ----------
FROM node:18-alpine
WORKDIR /app
COPY --from=build /app .
EXPOSE 8080
CMD ["node", "index.js"]

