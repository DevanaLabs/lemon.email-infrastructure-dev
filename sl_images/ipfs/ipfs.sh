#!/bin/bash

ipfs init
sed -i s/127.0.0.1/0.0.0.0/g /root/.ipfs/config
ipfs daemon
