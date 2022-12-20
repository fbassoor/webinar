#!/bin/bash
DIR=$(pwd)

if [ -z "$(kubectl get namespace | grep hello-oke)" ]; then 
  kubectl create namespace ${OCINAMESPACE};
  kubectl create secret docker-registry ocirsecret --docker-server=${REGION}/${REGISTRY_NAMESPACE} --docker-username=${OCIUSER} --docker-password="${TOKEN}" -n ${OCINAMESPACE};
fi

sudo runuser -l opc -c "kubectl apply -f ${DIR}/deployment.yaml
