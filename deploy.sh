#!/bin/bash

# Copy Build to Github Directory
cp -r .build/. ../grouchycoterie.github.io
cd ../grouchycoterie.github.io

#Pull Master, Commit and & Merge
git pull origin master
git add .
git commit -m '$1'
git push origin master