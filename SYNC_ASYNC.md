# Consultas síncronas e assíncronas

- Sincrona: bloqueia esperando o retorno
- Assíncrona: retorna imediatamente mas sem os dados solicitados
    - Quando finalizado o processamnto e servidor "informa" o cliente

Maneiras de informar a disponibiliade dos dados:

- Consultar de tempos em tempos (polling)
- Servidor retorna a informações para um serviço do lado do cliente (callback)
- Manter um canal de retorno aberto independente da consulta original (ex.: message broker)


Ref.:

https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Asynchronous/Introducing

https://blog.postman.com/understanding-asynchronous-apis/

https://dev.to/anubhavitis/push-vs-pull-api-architecture-1djo

