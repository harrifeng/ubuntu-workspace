echo "DNS1=8.8.8.8" | sudo tee -a /etc/network/interface
mkdir -p /home/vagrant/github

DOT_FILES='/home/vagrant/github/dotfiles'
if [ ! -d "$DOT_FILES" ]; then
    git clone https://github.com/harrifeng/dotfiles.git ${DOT_FILES}
    bash ${DOT_FILES}/run.sh
fi

chown -R vagrant:vagrant /home/vagrant/github

echo "
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
" | sudo tee /etc/apt/sources.list

sudo apt update
sudo apt install -y emacs git silversearcher-ag lrzsz python-pip python3-distutils tmux

echo "<----------finishing provision--------------->"
