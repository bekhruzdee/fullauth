# FROM node:20
# WORKDIR /app
# COPY ../package*.json ./
# RUN npm install --production
# COPY ../ ./
# RUN npm rebuild bcrypt --build-from-source
# EXPOSE 3000
# CMD ["node", "dist/main.js"]
# 1. Node 20 bazasi

FROM node:20

WORKDIR /app

COPY package*.json ./

# Barcha dependencies'larni o‘rnatish kerak build uchun
RUN npm install

COPY . .

# Bcryptni to'g'ri kompilyatsiya qilish uchun
RUN npm rebuild bcrypt --build-from-source

# NestJS uchun build qilish
RUN npm run build

EXPOSE 3000

CMD ["node", "dist/main.js"]

