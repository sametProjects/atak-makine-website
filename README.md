## Çalışan comtainer leri görüntüle

docker ps

## Tüm servisleri başlat

docker-compose up -d

## Tüm servisleri durdur

docker-compose down

## Prisma Komutları

**npx prisma generate**

Ne zaman çalıştırılır: schema.prisma dosyasında herhangi bir değişiklik yaptığında
Ne yapar: TypeScript client kodunu yeniden oluşturur
Neden gerekli: TypeScript'te yeni modellerin tiplerini kullanabilmek için

**npx prisma migrate dev --name mesaj_buraya_yaz**

Ne yapar: Hem migration dosyası oluşturur hem de veritabanına uygular.
NOT: 'npx prisma db push' un alternatifidir. Bunu kullanıyorsan diğerini kullanmana gerek yok.
NOT: Tek farkı migration dosyası oluşturur ve geçmişte yaptığın değişiklikleri görebilirsin.

**npx prisma db push**

Ne zaman çalıştırılır: Sadece schema.prisma dosyasında model değişikliği yaptığında
Ne yapar: Schema değişikliklerini database'e uygular (tablolar oluşturur/günceller)
Örnek durumlar:

- Yeni model eklediğinde
- Mevcut modele yeni field eklediğinde
- Field tipini değiştirdiğinde
- İlişki eklediğinde/değiştirdiğinde

npx prisma migrate dev --name add_user_based_tables

## Veritabanına Kolay yoldan veri ekleme

**npx tsx ./db/seed**

Bu komut ile ./db/seed dosyanda oluşturduğun datayı prisma ile veritabanına gönderirsin. Tek tek elle data girmene gerek kalmaz. Ardından 'npx prisma studio' ile eklenen dataları kontrol edebilirsin.

## VPS SERVER e Alırken Notlar:

- NEXTAUTH_URL → Dışarıdan erişilebilecek domain veya IP adresi olmalı.
  Domain varsa: NEXTAUTH_URL=https://senindomainin.com
  Domain yok, IP ile erişiyorsan: NEXTAUTH_URL=http://123.45.67.89:3000
