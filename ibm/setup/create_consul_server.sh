#!/bin/bash

source /dev/stdin < <(sops -d -input-type binary -output-type binary ibm-workload.env.enc)
karina provision vm -c ibm-management.yaml -k ibm-consul.yaml --template Ubuntu-18.04-running-template --name consul -vvv
