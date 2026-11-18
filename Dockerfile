# Imagem base oficial do PHP 8.2 com servidor Web Apache embutido
FROM php:8.2-apache

# Instalação de dependências do sistema e extensões de conexão MySQL (PDO/MySQLi)
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    && docker-php-ext-install pdo_mysql mysqli

# Habilita o módulo de reescrita de URL do Apache (mod_rewrite)
RUN a2enmod rewrite

# Define o diretório de trabalho dentro do contêiner
WORKDIR /var/www/html

# Copia os arquivos do projeto local para dentro do contêiner
COPY . /var/www/html/

EXPOSE 80