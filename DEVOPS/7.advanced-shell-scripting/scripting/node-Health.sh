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

# this is a best practice when you use pipe '|' in shell scripting
set -e          # exit the script when there is an error
set -o pipefail # use this to avoid error due to command after |

df -h

# doaisdjiosdlhslkas | echo | kjfbadbadbaw | echo  ------ here it see last command as echo so it exceutes but it should not
#                   so that's why we use 'set -o pipefail'

free -g

nproc

ps -ef | grep snapfuse | awk -F" " '{print $2}'

echo "Node health check complete."
