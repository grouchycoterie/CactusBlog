#!/bin/bash

if ! [ -d "../grouchycoterie.github.io" ]; then
  # Control will enter here if grouchycoterie.github.io exists.
  cd ../
  git clone git@github.com:grouchycoterie/grouchycoterie.github.io.git
  cd CactusBlog
fi

if ! [ -d "env" ]; then
  # Create python virtual env
  virtualenv -p python3 env
fi

#activate env and install requirements
source env/bin/activate
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