#!/bin/bash

sops exec-env vpn.enc.env `sshuttle --dns -r $SSH_USER@$SSH_JUMP_HOST $VPN_NETWORK`
