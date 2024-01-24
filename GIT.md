# Treinamento Git

Conteúdo:

- Versionamento de código
- Organização de repositórios
- Branches
- Staging e Merge
- Operação básica
- Github e Bitbucket


## Instalação

```sh
apt install git
```

Chave ssh:

```sh
ssh-keygen -t ed25519
```

⚠️  proteger a chave com senha


Clonar conteúdo:


```sh
git clone https://github.com/lcbraz/treinamentoDevOps.git
```


## Configuração global

```sh
git config --list --show-origin

git config --global user.name "John Doe"
git config --global user.email johndoe@example.com

git config --global core.editor vim
git config --global init.defaultBranch main

git config --list
git config user.name
```

## Documentação

```sh
git help <verb>
git <verb> --help
man git-<verb>

git help add
git add -h
```



## Criar um repositório local


Primeiro commit:

```sh
git init
git status
vim teste.md
git status
git add teste.md
git status
git commit -m"arquivo de teste"
git status
git log
```

Modificando arquivo:


```sh
vim teste.md
git status
git add teste.md
git restore --staged teste.md
git diff
vim teste.md
git add teste.md
git commit
git log -p -2
```


Revertendo primeiro 'add':

```sh
git status
git add outro_teste.md
git reset outro_teste.md
git status
rm outro_teste.md
```

Ignorando arquivos


```sh
mkdir temp
git status

vim .gitignore

temp

git add .gitignore
git commit -m"gitignore"
git status
```

Revertendo edição:

```sh
vim teste.md
git restore teste.md
```

Removendo arquivo do versionamento:


```sh
vim outro_teste.md
git add outro_teste.md
git commit -m"outro teste"
git log

git rm outro_teste.md
git status
git commit -m"outro teste apagado"
```

Renomeando arquivo:


```sh
git mv teste.md README.md
git status
git commit -m"renomeado README"
```

## Criar repositório Bitbucket

https://bitbucket.org


Criação:

- Include a README? **No**
- Include .gitignore? **No**

- Repository settings
  - Repository details
    - Access level: ☑️  This is a private repository
  - Access keys


## Subir reposittório para o Bitbucket


- Personal settings 
  - SSH keys
  - App passwords

Configurar chave no ssh:

```
## Bitbucket ##
Host bitbucket.org
    AddKeysToAgent yes
    IdentityFile ~/.ssh/id_ed25519_bitbucket
```

```sh
git remote add origin https://lcbraz@bitbucket.org/treinamentodskgit/treinamentogit.git
# Ou
git remote add origin git@bitbucket.org:treinamentodskgit/treinamentogit.git

# para trocar:
# git remote remove origin

git push -u origin main
```


## Trabalando com branches


```sh
git branch
git branch develop
git branch
git checkout develop
git branch

```

## Java Hello World


Instalar jdk:

```sh
apt install openjdk-18-jdk
```


```java
// Arquivo App.java
// Java hello world, também conhecido como Oi galera
class App {
    public static void main(String[] args) {
        System.out.println("Oi galera!");
    }
}
```

Compilar e executar:

```sh
javac App.java
java App
```

## Enviar alterações para a repositório remoto

```sh
git status
vim .gitignore

# *.class

git status
git add .
git status

git commit -m"java hello world"
git push --set-upstream origin develop
# check Bitbucket
```


## Merge no branch main



```sh
git branch
git checkout main
git merge develop
git status
git push
```




## Referências

https://git-scm.com/book/en/v2

https://git-scm.com/book/pt-br/v2

