 #! /bin/bash

cd ~
sudo yum install -y vim python3-pip curl git tmux
dnf config-manager --add-repo=https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
dnf -y install dnf-plugin-releasever-adapter --repo alinux3-plus
dnf -y install docker-ce --nobest
systemctl start docker
sudo curl -L "https://get.daocloud.io/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
#git clone -b 2.0 https://github.com/QingdaoU/OnlineJudgeDeploy.git && cd OnlineJudgeDeploy
#git clone  https://git.nju.edu.cn/CPP/oj && cd oj
git clone  https://gitee.com/cpp-njuer-org/oj 
cd oj
docker-compose up -d
