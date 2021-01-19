#!/bin/bash

sops exec-env vpn.env.enc `sshuttle --dns -r $SSH_USER@$SSH_JUMP_HOST $VPN_NETWORK`
