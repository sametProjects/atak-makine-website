FROM node:18-alpine

WORKDIR /app

# package.json ve package-lock.json'ı kopyala
COPY package*.json ./

# Dependencies'leri yükle
RUN npm ci --only=production

# Uygulama kodunu kopyala
COPY . .

# Prisma generate
RUN npx prisma generate

EXPOSE 3000

# Build'i container çalışırken yap, veritabanı hazır olduktan sonra
CMD ["sh", "-c", "npx prisma db push && npm run build && npm start"]