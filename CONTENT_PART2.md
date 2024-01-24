# Introdução diagnósticos de problemas em aplicações

A ideia do treinamento é fornecer uma visão introdutória ao diagnóstico de problemas em aplicações desenvolvidas para atender as demandas das áreas de negócio da Desktop.

Na primeira etapa, foram apresentados os componentes básicos e ferramentas usadas nos principais sistema: Git, Java, Tomcat, JVM, Nginx.

A próximo etapa contará com uma introdução a Containers e apresentará conceitos básicos de desenvolvimento usando aplicações simples que exemplificam situações reais e possibilitam o entendimento do funcionamento dos sistemas a serem mantidos.


## Conteúdo

- Introdução a containers
- Protocolo HTTP
- Introdução a aplicações WEB
- Introdução a APIs RESTFul
- Serviços síncronos e assíncronos
- Metodologias de monitoração: USE e RED
- Cenário de simulação de erros


**Introdução a containers**

Introdução básica a tecnologia de containers e laboratório prático com criação e execução de um container.

**Protocolo HTTP**

Demonstração do Protocolo HTTP, formato da requisição e respostas, códigos de retorno.


**Introdução a aplicações WEB**

Exemplo prático de aplicação WEB e componentes envolvidos.

**Introdução a APIs RESTFul**

Demonstração de um API RESTful e interação prática com as chamadas.


**Serviços síncronos e assíncronos**

Diferenças entre sistema síncronos e assíncronos e implicações no diagnóstico de problemas.


**Metodologias de monitoração: USE e RED**

Introdução de metodologias de monitoração e importância no diagnóstico de problemas.

**Cenário de simulação de erros**

Cenário básico com 3 aplicações e banco dados:

```
              +--------------+
              |              |
       +------+ API 1 Front  +-----+
       |      |              |     |
       |      +--------------+     |
       |                           |
+------v--------+           +------v---------+
|               |           |                |
| API 2 Backend |           |  API 3 Backend |
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


## Carga horária

Carga horário prevista de 8 horas para todo o conteúdo.

Os cenários de demonstração serão preparados e customizados para o conteúdo do curso.

