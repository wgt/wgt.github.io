 #! /bin/bash

cd ~
yum install -y git vim g++ tmux
git clone https://gitee.com/cpp-njuer-org/codeserver
#cp codeserver/code-server-4.0.2-linux-amd64.tar.gz  ./
cat codeserver/code-server-4.0.2-linux-amd64.tar.gz.0* | tar xvzf -
#cd code-server-4.0.2-linux-amd64
export PASSWORD=123456 && ./code-server-4.0.2-linux-amd64/code-server --host 0.0.0.0 --port 8080
