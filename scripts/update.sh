#!/bin/bash -x

cd ~/.dotfiles
git fetch
git checkout origin/master

yum -y update
package-cleanup --oldkernels --count=1
rpm -qa | sort > /root/.track/rpm-list
rpm -qa | xargs -n1 rpm -ql | sort | uniq > /root/.track/rpm-files
rpm -qa | xargs -n1 rpm --verify --noghost | sort > /root/.track/rpm-verify
find /bin /etc /lib /lib64 /opt /sbin /usr -type d -name .git -prune -o -print | sort > /root/.track/find-files
cd /root && git add /root/.track && git commit -m "update"
