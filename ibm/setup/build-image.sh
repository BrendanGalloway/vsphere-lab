#!/bin/bash
set -x
VERSION=$1
echo Bulding kube-v${VERSION}.img

rm kube* || true

konfigadm version

verbosity="-v"
if [[ "$DEBUG" == "true" ]]; then
   verbosity="-vvv"
fi

UBUNTU_IMAGE=ubuntu1804

if [[ "$VERSION" == *"containerd"* ]]; then
   UBUNTU_IMAGE=ubuntu2004
fi

konfigadm images build $verbosity --image $UBUNTU_IMAGE \
   --resize +15g \
   --output-filename kube-v${VERSION}.img  \
   fs-users.yaml \
   k8s-${VERSION}.yml
