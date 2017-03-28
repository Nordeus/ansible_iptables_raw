#!/bin/bash

# This is run by vagrant to install python on the debian box

if ! hash python 2>/dev/null; then
  if [[ -f /etc/debian_version ]]; then
    sudo apt-get update
    sudo apt-get -y --no-install-recommends install python
  else
    sudo yum install -y python
  fi
fi    
