# Treinamento Tomcat

Conteúdo:

- Aplicação Web
- Página jsp
- Servlet
- Arquivo war: build e deploy


## Instalação

https://tomcat.apache.org/


```sh
wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.15/bin/apache-tomcat-10.1.15.tar.gz
tar xvzf apache-tomcat-10.1.15.tar.gz
mv apache-tomcat-10.1.15 tomcat
cd tomcat

./bin/catalina.sh run

sudo netstat -tlnp
sudo ss -tlnp
```

[Acessar gerência](http://localhost:8080/).



## App Web

Criar estrutura de diretórios dentro do diretório do repo:

```sh
cd treinamentogit
mkdir -p OiGalera/WEB-INF/classes/br/com/desktop/ops
```

Criar arquivo **OiGalera/WEB-INF/classes/br/com/desktop/ops** com o conteúdo:


```java
package br.com.desktop.ops;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ola")
public class OiGaleraServlet extends HttpServlet {

  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException {
    response.setContentType("text/html;");
    response.getWriter().println("<h1>Oi galera!</h1>");
  }
}
```


Criar arquivo **OiGalera/index.html**:


```html
<!DOCTYPE html>
<html>
<head>
<title>Oi Galera</title>
</head>
<body>

<h1>P&aacute;gina principal</h1>
<p>P&aacute;gina principal.</p>

</body>
</html> 
```

Compilar:

```sh
javac -cp "../../tomcat/lib/*" WEB-INF/classes/br/com/desktop/ops/OiGaleraServlet.java
```

Copiar diretório para **webapps** e executar o tomcat:

```sh
cp -r OiGalera ../tomcat/webapps/.
cd ../tomcat
./bin/catalina.sh run
```

Criar WAR e copiar para **webapps**:

```sh
cd OiGalera
jar -cfv OiGalera.war *
cp OiGalera.war ../../tomcat/webapps/
```

Rodar tomcat:

```sh
cd ../../tomcat
./bin/catalina.sh run
```

Verificar arquivo WAR:

```sh
cd ../treinamentogit/OiGalera/
mkdir temp
cd temp
unzip ../OiGalera.war
```





## Referências

https://github.com/docker-library/tomcat/blob/master/10.1/jdk17/temurin-jammy/Dockerfile


https://happycoding.io/tutorials/java-server/tomcat

https://happycoding.io/tutorials/java-server/web-app

https://happycoding.io/tutorials/java-server/web-app



