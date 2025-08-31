FROM node:18-alpine

WORKDIR /app

# package.json ve package-lock.json'ı kopyala
COPY package*.json ./

# Dependencies'leri yükle (prisma generate olmadan)
RUN npm ci --only=production --ignore-scripts

# Uygulama kodunu kopyala (prisma dahil)
COPY . .

# Şimdi prisma generate çalıştır
RUN npx prisma generate

# Next.js uygulamasını build et
RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]