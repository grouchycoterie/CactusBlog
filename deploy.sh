#!/bin/bash

if ! [ -d "../grouchycoterie.github.io" ]; then
  # Control will enter here if grouchycoterie.github.io exists.
  cd ../
  git clone git@github.com:grouchycoterie/grouchycoterie.github.iogit.git
  cd CactusBlog
fi

if ! [ -d "~/.pyenv/versions/env-3.5.4" ]; then
  # Create python virtual env
  pyenv virtualenv 3.5.4 env-3.5.4
fi

#activate env and install requirements
source activate env-3.5.4
pip install --upgrade pip
pip install -r requirements.txt

# Copy Build to Github Directory
cp -r .build/. ../grouchycoterie.github.io
cd ../grouchycoterie.github.io

pwd
#who I am 
git config user.email "michael@magan.info"
git config user.name "Michael Magan"

#Pull Master, Commit and & Merge
git pull origin master
git add .
git commit -m '$1'
git push origin master