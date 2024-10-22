# Usa la imagen de Node.js
FROM node:20
# Crea un directorio de trabajo
WORKDIR /usr/src/app
# Copia package.json y package-lock.json
COPY package*.json ./
# Instala las dependencias
RUN npm install
# Copia el resto de la aplicación
COPY . .
# Expone el puerto en el que se ejecuta la app (por ejemplo, 3000)
EXPOSE 3000
# Comando para correr la aplicación
CMD [ "node", "server.js" ]
