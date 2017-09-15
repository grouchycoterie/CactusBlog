#!/bin/bash

cp -r .build/. ../grouchycoterie.github.io
git pull origin master
git add .
git commit -m '$1'
git push origin master