# HTTP



## Características

- Protocolo de texto possibilitando a leitura por humanos
- Arquitetura cliente-servidor
- Cliente é chamado de **user-agent**
- Servidor é chamado de **web server**
- Camada intermediária de transporte chamada **proxy**
    - cache
    - filtro
    - balanceamento
    - autenticação
    - logging
- Protocolo sem estado
    - Mas com suporta a sessões (extensão do header, cookies)
- Versões: HTTP/1.1, HTTP/2 e HTTP/3
    - Formato do request e response não muda, somente o transporte é deferente 

**imagem client - proxy - proxy - server**

## Requisição e Resposta


Requisição (Request):

- Método
- Caminho (Path)
- Versão do protocolo
- Cabeçalhos (Headers)

**imagem request**


Resposta (Response):

- Versão do protocolo
- Código (Status code)
- Mensagem (Status message)
- Cabeçalhos (Headers)
- Corpo opcional (Body)

**imagem response**



## Exemplos

Arquivo **/var/www/html/index.html**:

```html
<!DOCTYPE html>
<html>
    <head>
        <!-- head definitions go here -->
        <title>Página de teste</title>
    </head>
    <body>
        <!-- the content goes here -->
        <p>Página de teste</p>
    </body>
</html>
```


```sh
curl -i http://192.168.56.71
```

Requisição de teste:


```
GET / HTTP/1.1
Host: 192.168.56.71
User-Agent: MeuAgente/1.0
Accept: */*

```

Telnet:

```sh
telnet 192.168.56.71 80
```


*TODO* Túnel SSL:

```
openssl s_client -showcerts -connect x.x.x.x:443
openssl s_client -crlf -servername www.example.com -brief -connect www.example.com:443
-ign_eof
echo -e "OPTIONS / HTTP/1.0\r\n\r\n" | openssl s_client -connect site.com:443
echo -e "OPTIONS / HTTP/1.0\r\n\r\n" | openssl -ign_eof s_client -connect site.com:443
openssl s_client -ign_eof -crlf -connect server:port < <(echo "COMMAND1"; sleep 2; echo "COMMAND2";)
```


## Refs

Protocolo:

- https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview
- https://developer.mozilla.org/en-US/docs/Web/HTTP
- https://en.wikipedia.org/wiki/HTTP


HTML caracteres especiais (entity):

- https://developer.mozilla.org/en-US/docs/Glossary/Entity
- https://html.spec.whatwg.org/multipage/named-characters.html#named-character-references
- https://mothereff.in/html-entities



