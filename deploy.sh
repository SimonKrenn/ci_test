#!/bin/bash
set -xe

if [ $TRAVIS_BRANCH == 'master' ] ; then
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa

  cd public
  git init

  git remote add deploy "travis@159.89.24.218:/var/www/html/react"
  git config user.name "Travis CI"
  git config user.email "skrenn99travis@gmail.com"

  git add .
  git commit -m "Deploy"
  git push --force deploy master
else
  echo "Not deploying, since this branch isn't master."
fi
