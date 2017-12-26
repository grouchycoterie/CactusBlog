#!/bin/bash
set -e

_current_directory="$(pwd)"
_virtuanlenvwrapper="mcw"

if [[ -z "$1" ]]; then
    echo "Must provide a git message as the 1st positional argument! " 1>&2
    exit 1
fi



if ! [ -d "../grouchycoterie.github.io" ]; then
  # Control will enter here if grouchycoterie.github.io exists.
  cd ../
  git clone git@github.com:grouchycoterie/grouchycoterie.github.iogit.git
  cd _current_directory
fi

# Copy Build to Github Directory
source $WORKON_HOME/$_virtuanlenvwrapper/bin/activate || echo "Must create virtualenvwrapper with name $_virtuanlenvwrapper!" 1>&2
cactus build
cp -r .build/. ../grouchycoterie.github.io
cd ../grouchycoterie.github.io

# If I need to confiture who I am 
git config user.email "michael@magan.info"
git config user.name "Michael Magan"

# Pull Master, Commit and & Merge
git pull origin master
git add .
git commit -m "$1"
git push origin master