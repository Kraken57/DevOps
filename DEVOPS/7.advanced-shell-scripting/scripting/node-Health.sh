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

echo "Checking disk usage..."
df -h

echo "Checking memory usage (in GB)..."
free -g

echo "Checking the number of processing units..."
nproc

echo "Node health check complete."
