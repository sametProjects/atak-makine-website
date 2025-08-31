FROM node:18-alpine

WORKDIR /app

# package.json ve package-lock.json'ı kopyala
COPY package*.json ./

# Dependencies'leri yükle
RUN npm ci --only=production --ignore-scripts

# Uygulama kodunu kopyala
COPY . .

# Prisma generate
RUN npx prisma generate

# Build sırasında DB bağlantısını geçici olarak devre dışı bırak
ENV SKIP_ENV_VALIDATION=true

# Next.js uygulamasını build et
RUN npm run build

EXPOSE 3000

CMD ["sh", "-c", "npm run build && npm start"]