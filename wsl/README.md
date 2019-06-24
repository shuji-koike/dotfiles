```sh
sudo apt update
sudo apt upgrade -y

sudo apt install -y openssh-server
sudo service ssh restart

sudo apt install -y zsh vim curl wget htop git tig

# sudo update-alternatives --config editor

mkdir -p .ssh
curl https://github.com/shuji-koike.keys >> .ssh/authorized_keys
```
