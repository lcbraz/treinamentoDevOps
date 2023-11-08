# Treinamento Java

Conteúdo:

- Aplicação cli
- Dependências
- Build manual
- Build usando marven/gradle
- Execução


## CLI

Hello World versão log:

```java
// Arquivo App.java

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class App {

  public static void main(String[] args) {
    Logger logger = LoggerFactory.getLogger(App.class);
    logger.info("Oi Galera!");
  }
}
```

Compilar:


```sh
javac App.java
```


Baixar dependência:

```sh
mkdir lib
cd lib
wget https://repo1.maven.org/maven2/org/slf4j/slf4j-api/2.0.9/slf4j-api-2.0.9.jar
wget https://repo1.maven.org/maven2/org/slf4j/slf4j-simple/2.0.9/slf4j-simple-2.0.9.jar
cd ..
```

Compilar

```sh
export CLASSPATH=".:./lib/*"
javac App.java
# Ou
javac -cp ".:./lib/*" App.java
java App
```

## Maven

Instalação:

```sh
apt install maven
```


Criar repositório:

```sh
mvn archetype:generate -DgroupId=br.com.desktop.ops -DartifactId=opsapp -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false
```

Arquivo **pom.xml**:

```
cd opsapp
cat pom.xml
```

Substituir de acordo com o caso:

- **groupId**: grupo ou individuo que criou o pacote
- **artifactId**: nome da aplicação


Compilar e rodar:

```sh
cd opsapp
mvn compile
ls -l target/classes/br/com/desktop/ops/
mvn package
ls -l target

# -cp alternativa a variável CLASSPATH
java -cp target/opsapp-1.0-SNAPSHOT.jar br.com.desktop.ops.App
```


Alterar aplicação **vim opsapp/src/main/java/br/com/desktop/ops/App.java**:

```java
package br.com.desktop.ops;

/**
 * Oi Galera!
 *
 */

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class App {
  public static void main(String[] args) {
    Logger logger = LoggerFactory.getLogger(App.class);
    logger.info("Oi Galera!");
  }
}
```

Compilar:

```
mvn compile
```

Configurar dependências no **pom.xml**.

Site do projeto: https://www.slf4j.org/download.html

Manual do projeto: https://www.slf4j.org/manual.html

```xml
  <dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-api</artifactId>
    <version>2.0.9</version>
  </dependency>

  <dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-simple</artifactId>
    <version>2.0.9</version>
  </dependency>
```


Compilar e rodar:


```sh
# executar mvn compile
mvn package
java -cp target/opsapp-1.0-SNAPSHOT.jar br.com.desktop.ops.App
```

Embutindo as dependências no jar, editar **pom.xml**:


```xml
<plugins>
<!-- Copiar inicio -->

      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-jar-plugin</artifactId>
        <version>3.1.0</version>
        <configuration>
            <archive>
            <manifest>
                <addClasspath>true</addClasspath>
                <mainClass>br.com.desktop.ops.App</mainClass>
            </manifest>
            </archive>
        </configuration>
      </plugin>
      <!-- Add the assemble plugin with standard configuration -->
      <plugin>
        <artifactId>maven-assembly-plugin</artifactId>
        <configuration>
            <archive>
            <manifest>
                <mainClass>br.com.desktop.ops.App</mainClass>
            </manifest>
            </archive>
            <descriptorRefs>
            <descriptorRef>jar-with-dependencies</descriptorRef>
            </descriptorRefs>
        </configuration>

        <executions>
          <execution>
           <id>make-assembly</id>
           <phase>package</phase>
           <goals>
             <goal>single</goal>
          </goals>
          </execution>
        </executions>

      </plugin>

<!-- Copiar fim -->
</plugins>

```


Compilar e rodar:

```sh
mvn clean compile assembly:single
java -cp target/opsapp-1.0-SNAPSHOT-jar-with-dependencies.jar br.com.desktop.ops.App
```

## Gradle

🚧 Quebrado 🚧


Instalação:

```sh
apt install gradle
```

```sh
mkdir opsapp2
cd opsapp2
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
gradle init
```




## Referências


https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html

https://spring.io/guides/gs/maven/

https://www.baeldung.com/maven

https://www.sohamkamani.com/java/cli-app-with-maven/

https://maven.apache.org/plugins/maven-assembly-plugin/usage.html


