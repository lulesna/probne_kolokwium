# korzysta z minimalnego, oficjalnego obrazu bazowego z Node.js w wersji 20
FROM node:20-alpine

WORKDIR /app

# instalacja zależności wykonywana jest w warstwie poprzedzającej kopiowanie kodu źródłowego, w sposób
# pozwalający na efektywne wykorzystanie cache warstw
COPY package*.json .
# instalowane są wyłącznie zależności wymagane do uruchomienia produkcyjnego
RUN npm ci --omit=dev

COPY src/ ./src/
COPY scripts/ ./scripts/

# obraz deklaruje port, na którym aplikacja nasłuchuje
EXPOSE 3000

CMD ["node", "src/server.js"]
