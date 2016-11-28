FROM node

#App directorio
WORKDIR /app 

#Instalando dependencias
COPY package.json /app
RUN npm install
#fin instalacion de dependencias

#copiando archivos
COPY . /app
#fin copia archivos

CMD [ "node" , "index.js"]