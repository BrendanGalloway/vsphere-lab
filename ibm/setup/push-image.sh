#!/bin/bash
set -e
VERSION=$1
PATCH=$(cat k8s-${VERSION}.yml | gojsontoyaml -yamltojson | jq -r '.kubernetes.version')
NAME=TPL-KUBEADM-V${PATCH}-$(git rev-parse --short HEAD)-$(date "+%d%b%g-%H%M%S")

source /dev/stdin < <( sops -d --input-type binary --output-type binary ibm-workload.env.enc  )
echo Pushing image $NAME to $GOVC_FQDN/$GOVC_CLUSTER/$GOVC_DATASTORE, net=$GOVC_NETWORK
if [[ -e  kube-v${VERSION}.ova ]]; then
  konfigadm images upload ova -vv --image kube-v${VERSION}.ova --name $NAME
else
  konfigadm images upload ova -vv --image kube-v${VERSION}.img --name $NAME
fi
echo Adding serial device
govc device.serial.add -vm $NAME -
echo Enabled nested virtualization
govc vm.change -vm $NAME -nested-hv-enabled=true -vpmc-enabled=true
govc vm.upgrade -version=15 -vm $NAME
echo Created $NAME
