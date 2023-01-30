# Use a versão LTS do Ubuntu
FROM ubuntu:20.04

# Atualize o sistema
RUN apt-get update && apt-get upgrade -y

# Instale os pacotes necessários
RUN apt-get install -y software-properties-common
RUN add-apt-repository universe
RUN apt-get install -y nginx certbot python3-certbot-nginx wget unzip

# Baixe e instale o Wordpress na versão 6.11
RUN wget https://wordpress.org/wordpress-6.11.tar.gz
RUN tar -xzvf wordpress-6.11.tar.gz
RUN rm wordpress-6.11.tar.gz
RUN mv wordpress /var/www/html/

# Instale o certificado SSL Let's Encrypt
RUN certbot --nginx

# Crie o volume para os arquivos do usuário
VOLUME /var/www/html/wordpress/wp-content

# Expor a porta 80 e 443
EXPOSE 80 443
