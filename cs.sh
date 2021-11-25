 #! /bin/bash

yum install -y git vim g++ tmux
git clone https://git.nju.edu.cn/CPP/book
cp book/code-server-3.12.0-linux-amd64.tar.gz  ./
tar xvzf  code-server-3.12.0-linux-amd64.tar.gz
cd code-server-3.12.0-linux-amd64
export PASSWORD=123456 && ./code-server --host 0.0.0.0 --port 8080
