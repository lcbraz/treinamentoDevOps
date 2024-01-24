# Resources

## OVA


http://144.202.34.241/DevOps.ova



## Install Nginx

```sh
sudo apt install nginx
```

## Install Python


```sh
sudo apt install build-essential zlib zlib1g-dev libssl-dev libbz2-dev \
  libncurses-dev libffi-dev libreadline-dev libsqlite3-dev liblzma-dev \
  default-libmysqlclient-dev pkg-config

curl https://pyenv.run | bash

# Edit:
vim .bashrc

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

bash

pyenv install 3.12.1
pyenv global 3.12.1
# Or
pyenv local 3.12.1
pip install --upgrade pip
```

Requirements:

```
gunicorn
flask
uvicorn
fastapi[all]
SQLAlchemy
mysqlclient
ruff
pyright
yamllint
```


```sh
pip install -r requirements.txt
```



## Run Dynamic

```python
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"
```



```sh
# Dev
flask --app dynamic run --debug
# Production
gunicorn -w 4 --access-logfile=- 'dynamic:app'
```



## Run API

Main app:

```python
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/items/{item_id}")
def read_item(item_id, q = None):
    return {"item_id": item_id, "q": q}
```


```sh
uvicorn --host 0.0.0.0 main:app --reload
uvicorn front_usuarios:app --reload --log-config logging.yaml
```

Teste:

```sh
curl -v 192.168.56.71:8000
```

## DB

Configuração inicial do banco (VM):

```
sudo mariadb -c "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;"
sudo sed -i -E 's/bind-address\s+=\s+127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sudo systemctl restart mariadb
create database dbapps;
```

```
sudo systemctl stop mariadb
sudo mysqld_safe --skip-grant-tables --skip-networking &
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '<senha>';

```


Configuração inicial do banco (container):

```
podman run -d -p 3306:3306 --name mariadb-devops --env MARIADB_ROOT_PASSWORD=${dbpass} docker.io/library/mariadb:11.2.2
podman exec -it mariadb-devops mariadb -p${dbpass}
```




