# Cenário de simulação de erros

Cenário básico com 3 aplicações e banco dados:

```
              +--------------+
              |              |
       +------+    Front     +-----+
       |      |  Usuarios    |     |
       |      +--------------+     |
       |                           |
+------v--------+           +------v---------+
|               |           |                |
| API Pagamentos|           |  API Conexoes  |
|               |           |                |
+------+--------+           +------+---------+
       |                           |
       |        +-------+          |
       |        |       |          |
       |        |       |          |
       +-------->  DB   <----------+
                |       |
                |       |
                +-------+
```

Simulação prática de problemas simples e técnicas de diagnóstico.



Autenticação:

```sh
curl -s http://localhost:8001/api/token -X POST -F 'username=devops' -F 'password=D3skT0p' | jq .
```

Pull branch

```sh
git pull
git fetch
git branch -r
git checkout cenario1
git checkout cenario2
git checkout cenario3
```


