#! /bin/sh
read -n 1 -p "Are you sure you want to create CentOS7 VM (y/[a]): " AMSURE 
[ "$AMSURE" = "y" ] || exit
echo "" 1>&2
virt-install \
--name centos7 \
--description "Test CentOS7 server" \
--ram 2048 \
--disk path=/var/kvm/images/centos7.img,bus=virtio,size=10 \
--vcpus 1 \
--os-type linux \
--os-variant rhel7 \
--network bridge=br0 \
--graphics none \
--console pty,target_type=serial \
--location /var/iso/CentOS-7-x86_64-Minimal-1511.iso \
--extra-args 'console=ttyS0,115200n8 serial' \
