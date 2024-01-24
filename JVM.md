# Treinamento JVM


Conteúdo:

- Introdução Java Virtual Machine
- JMX
- Tuning básico


## JVM



```sh
java -XX:+PrintFlagsFinal -version
java -XX:+PrintFlagsFinal -version | wc -l
```

Heap size:



```
-Xms<heap size>[unit] and -Xmx<heap size>[unit]
```

-  **-Xms** minimum heap size
-  **-Xmx** maximum heap size


Exemplos cli:

```sh
java -Xms1G -Xmx4G -cp target/opsapp-1.0-SNAPSHOT-jar-with-dependencies.jar br.com.desktop.ops.App
```

Exemplo tomcat, criar ou adicionar no arquivo **tomcat/bin/setenv.sh**:

```sh
CATALINA_OPTS="-Xms1G -Xmx4G"
```

## JMX


```sh
CATALINA_OPTS="-Xms1G -Xmx4G -Dcom.sun.management.jmxremote.port=5000 -Dcom.sun.management.jmxremote.authenticate=false"
```

```sh
jconsole localhost:5000
```

## Referências


https://www.freecodecamp.org/news/jvm-tutorial-java-virtual-machine-architecture-explained-for-beginners/

https://sematext.com/blog/jvm-performance-tuning/

https://www.oracle.com/technical-resources/articles/javase/jmx.html

https://docs.oracle.com/javase/8/docs/technotes/guides/management/agent.html


