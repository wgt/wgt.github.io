# ECS

## INSTALL CODESERVER
bash codeserver.sh 
然后访问8080端口
密码123456
## INSTALL OJ
bash oj.sh
然后访问80端口


----
其它平台安装方式
ubuntu20.04 进入终端
sudo apt-get update && sudo apt-get install -y vim python3-pip curl git  
sudo apt-get -y install docker-compose
git clone -b 2.0 https://github.com/QingdaoU/OnlineJudgeDeploy.git && cd OnlineJudgeDeploy
docker-compose up -d(root用户使用该命令)或sudo -E docker-compose up -d(非root用户使用该命令)



Alibaba Cloud Linux 3：

sudo yum install -y vim python3-pip curl git 
dnf config-manager --add-repo=https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
dnf -y install dnf-plugin-releasever-adapter --repo alinux3-plus
dnf -y install docker-ce --nobest
systemctl start docker
sudo curl -L "https://get.daocloud.io/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
git clone -b 2.0 https://github.com/QingdaoU/OnlineJudgeDeploy.git && cd OnlineJudgeDeploy
docker-compose up -d(root用户使用该命令)或sudo -E docker-compose up -d(非root用户使用该命令)







OJ数据备份与迁移

1. 备份
在backup文件夹下有一个官方写好的备份脚本，我们只需要切换到backup目录下，然后执行sh db_backup.sh，就会生成一个sql文件，就是备份后的数据库文件，保存好。除了数据库文件还有需要备份的数据就是backend/public，backend/test_case 两个目录，一个放的应该是用户上传的头像，另一个放的是题目的测试数据。

2. 迁移
有两种方法，一种是直接将整个项目文件夹移动到另一个机器上然后执行docker-compose up -d即可，这个看起来很方便，但也是最容易引起错误的一种方式，所以我们乖乖用下面这种方法把。
该方法就是在另一台机器上部署好OnlineJudge之后，将原机器备份生成的sql文件放到新机器的backup文件夹中，然后在新机器的backup文件夹中执行以下命令

docker cp db_backup_xxxxxxx.sql oj-postgres:/root
docker exec -it oj-postgres bash
psql -U onlinejudge postgres
drop database onlinejudge;
\q
psql -f /root/db_backup_xxxxxxx.sql -U onlinejudge postgres


接着再将原机器backend目录下的public跟test_case两个目录拷贝过来覆盖新机器中的这两个目录，重新运行该项目即可。

进行文件的传输，然后在新机器上上传文件时文件的所有者会变为root，建议最好将所有者改的与旧机器文件的所有者一样。
可以用下面的指令进行修改：

chown -R 所有者 目录
-----------------


