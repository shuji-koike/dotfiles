# https://docs.brew.sh/Homebrew-on-Linux

# https://qiita.com/ucan-lab/items/568db1c68dab9d62169c
yum -y install https://centos7.iuscommunity.org/ius-release.rpm
yum-config-manager --disable ius
yum -y remove git
yum -y install --enablerepo=ius git2u tig
