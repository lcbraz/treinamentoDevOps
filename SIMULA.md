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


