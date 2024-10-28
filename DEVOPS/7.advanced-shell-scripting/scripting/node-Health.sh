#!/bin/bash

########################################
# Good practices for shell scripting
# Author : Kraken
# Date: 28/10/2024
#
# This script outputs the health of the node
#
# Version : v1
########################################

set -x # debug mode

df -h

free -g

nproc

echo "Node health check complete."
