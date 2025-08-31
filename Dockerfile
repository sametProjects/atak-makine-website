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

# Next.js uygulamasını build et
RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]