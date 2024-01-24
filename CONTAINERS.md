# Containers

Conteúdo:

- introdução a containers
- orquestração visão geral
- docker
- namesapces e cgroups (opcional)
- overlayfs (opcional)
- network (opcional)

## Introdução

Conjunto de tecnologias:

- namesapces https://en.wikipedia.org/wiki/Linux_namespaces
- cgroups https://en.wikipedia.org/wiki/Cgroups
- overlayfs https://linuxconfig.org/introduction-to-the-overlayfs


[Intro](https://medium.com/geekculture/introduction-to-containers-basics-of-containerization-bb60503df931)


## Orquestração

Execução de containers:

- docker https://www.docker.com
- LXD https://ubuntu.com/lxd
- LXC https://linuxcontainers.org/
- podman https://podman.io/ 
- containerd https://containerd.io/

Padrão de imagem:

- Open Container Initiative (OCI) https://opencontainers.org/
- Spec: https://opencontainers.org/posts/blog/2023-07-21-oci-runtime-spec-v1-1/


- Kubernetes (k8s)
  - Openshift (Red Hat)
  - Rancher (Suse)
  - Clouds públicas:
    - AWS EKS
    - Google GKE
    - Azure AKS
- Docker Swarm
- Nomad



## Instalação

Repositório de pacotes do Docker:

```sh
sudo su - 
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/debian \
"$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Instalar pacotes:

```sh
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin \
  docker-compose-plugin docker-compose
```


## Gerar imagem


Dockerfile para configuração:

```dockerfile
FROM ubuntu:23.04
RUN apt update
```

Criar imagem:

```sh
sudo docker build -t tomcat-build .
```

Executar container:

```sh
sudo docker run -v $(pwd):/root/volume -p 8080:8080 -it tomcat-build bash
```

Instalar tomcat, copiar war e iniciar o daemon:

```sh
apt update
apt install -y wget openjdk-18-jdk

wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.17/bin/apache-tomcat-10.1.17.tar.gz
tar xvzf apache-tomcat-10.1.17.tar.gz
mv apache-tomcat-10.1.17 tomcat

cp /root/volume/OiGalera.war /tomcat/webapps

/tomcat/bin/catalina.sh run
```

Salvar histórico:


```sh
history | sed -E 's/^ +[0-9]+ +/RUN /' > /root/volume/history.txt
```

Dockerfile com tomcat:

```sh
FROM ubuntu:23.04
RUN apt update
RUN apt install -y wget openjdk-18-jdk

RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.17/bin/apache-tomcat-10.1.17.tar.gz
RUN tar xvzf apache-tomcat-10.1.17.tar.gz
RUN mv apache-tomcat-10.1.17 tomcat

COPY OiGalera.war /tomcat/webapps

CMD ["/tomcat/bin/catalina.sh", "run"]
```

Construir a imagem:

```sh
docker build -t tomcat-devops .
```


Rodar:

```sh
docker run -d -p 8080:8080 tomcat-devops
```

## Armazenamento efêmero

Demonstrar ciclo de vida e armazemanto efêmero do container.


```sh
sudo docker run -it tomcat-build bash
# criar arquivo
sudo docker ps
sudo docker run -it tomcat-build bash
sudo docker container ls -a

sudo docker run -it -d tomcat-build bash
sudo docker ps

sudo docker exec -it 52f379dc0953 bash
# criar diretório

# start stop
sudo docker stop 07f1d707c1da
sudo docker start 07f1d707c1da

sudo docker container prune
```





## Referencias


Introdução:


https://medium.com/free-code-camp/demystifying-containers-101-a-deep-dive-into-container-technology-for-beginners-d7b60d8511c1

https://www.freecodecamp.org/news/a-beginner-friendly-introduction-to-containers-vms-and-docker-79a9e3e119b/

https://learn.microsoft.com/en-us/dotnet/architecture/microservices/container-docker-introduction/docker-defined#comparing-docker-containers-with-virtual-machines

https://www.digitalocean.com/community/conceptual-articles/introduction-to-containers


Buid:

https://github.com/docker-library/tomcat/blob/master/10.1/jdk17/temurin-jammy/Dockerfile

https://docs.docker.com/engine/reference/builder/#workdir


