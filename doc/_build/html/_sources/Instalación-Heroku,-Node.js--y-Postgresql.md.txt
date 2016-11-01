Heroku-Node-Postgresql
============================================
## 1- Descargar el proyecto del GitHub:   
 
git clone -b [branch] [remote_repo] en nuestro caso seria:
  
      git clone -b sharedServer https://github.com/tomasmussi/taller2.git 
  

## 2- Instalar Node.js:
  
    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
  
    sudo apt-get install -y nodejs
  
Ejecutar:
  
    node -version 
  
y verificar que sea V4.5.0
  

## 3- Instalar Heroku: 
  
Chequear que ruby este instalado con:
  
    ruby -version
  
y si esta instalado ejecutar:
  
    wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
  

## 4- Instalar Postgresql:
  
    sudo apt-get install postgresql
  
para chequear:  
 
      sudo su postgres 
  
cambio de usuario -> postgres@alfredo-GFAST:/home/alfredo/Jobify/taller2/SharedServerHeroku$
  
ejecutar:
  
    exit
  
para volver al usuario -> alfredo@alfredo-GFAST:/home/alfredo/Jobify/taller2/SharedServerHeroku$
  

## 5- Ingresar a la carpeta taller2/SharedServer y ejecutar:
  
    heroku local database  

## 6- Luego ejecutar:
  
    heroku local web
  

## 7- Ingresar a: 
  
    http://localhost:5000/
  
    http://localhost:5000/job_positions  
