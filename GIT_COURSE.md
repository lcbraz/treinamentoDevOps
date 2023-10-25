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

Clonar conteúdo:


```sh

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




## Criar um repositório


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

- Repository settings
  - Repository details
    - Access level:  This is a private repository
  - Access keys


## Clonar um repositório remoto

```sh
git clone git@bitbucket.org:treinamentodskgit/treinamentogit.git
```





## Referências

https://git-scm.com/book/en/v2
https://git-scm.com/book/pt-br/v2
