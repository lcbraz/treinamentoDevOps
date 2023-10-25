# Treinamento NGINX


Conteúdo:

- Proxy reverso para conteúdo dinâmico
- Exportar arquivos estáticos


## Instalação


```sh
sudo apt install nginx
```


## Proxy reverso e conteúdo estático


```nginx
server {
    listen 80;
    listen [::]:80;
    server_name devops.desktop.com.br;

    access_log /var/log/nginx/devops-access.log;
    error_log /var/log/nginx/devops-error.log;

    index index.html index.htm;

    location / {
        root /var/www/html;
        try_files $uri $uri/ /index.html =404;
    }

    location /OiGalera/ {
        proxy_redirect      off;
        proxy_set_header    X-Real-IP $remote_addr;
        proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header    X-Forwarded-Proto $scheme;
        proxy_set_header    Host $host;
        proxy_pass          http://localhost:8080;
    }
}
```

Mover o index para **static**:

```sh
cd treinamentogit
mkdir static
mv OiGalera/index.html static/
```

Gerar novo war:

```sh
jar -cfv OiGalera.war *
```

Copiar index.html para *root*:

```sh
cp static/index.html /var/www/html/index.html
```

Copiar war:

```sh
cp OiGalera/OiGalera.war ../tomcat/webapps/
```

Configurar **/etc/hosts**:

```
127.0.0.1 devops.desktop.com.br
```

Iniciar tomcat:

```sh

```

Testar:

```sh
curl devops.desktop.com.br
curl devops.desktop.com.br/api/ola
```

## HTTPS

Gerar certificado auto assinado:

```sh
openssl req \
    -newkey rsa:2048 -nodes -keyout devops.desktop.com.br.key \
    -x509 -days 365 -out devops.desktop.com.br.crt
```


Configurar virtualhost ssl:


```nginx
server {
    listen 80;
    listen [::]:80;
    server_name devops.desktop.com.br;

    access_log /var/log/nginx/devops-access.log;
    error_log /var/log/nginx/devops-error.log;

    return 301 https://$host$request_uri;
}

server {
    listen 443;
    listen [::]:443;
    server_name devops.desktop.com.br;

    ssl on;
    ssl_certificate /etc/ssl/devops.desktop.com.br.crt;
    ssl_certificate_key /etc/ssl/devops.desktop.com.br.key;

    access_log /var/log/nginx/devops-access.log;
    error_log /var/log/nginx/devops-error.log;

    index index.html index.htm;

    location / {
        root /var/www/html;
        try_files $uri $uri/ /index.html =404;
    }

    location /OiGalera/ {
        proxy_redirect      off;
        proxy_set_header    X-Real-IP $remote_addr;
        proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header    X-Forwarded-Proto $scheme;
        proxy_set_header    Host $host;
        proxy_pass          http://localhost:8080;
    }
}
```


