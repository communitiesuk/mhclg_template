#!/bin/bash
set -e

REPO_PATH='unboxed/hackney_template'

echo "Add config for $REPO_PATH"

git config --global user.name "GOV.UK Patterns & Tools CI User"
git config --global user.email "patterns-and-tools-github-user@digital.cabinet-office.gov.uk"

# This openssl command was generated automatically by `travis encrypt-file`, see `.travis/README.md` for more details
openssl aes-256-cbc -K $encrypted_688746ca6c18_key -iv $encrypted_688746ca6c18_iv -in .travis/secrets.tar.enc -out .travis/secrets.tar -d

tar xvf .travis/secrets.tar
mkdir -p ~/.gem/
mv secrets/gem_credentials ~/.gem/credentials
chmod 0600 ~/.gem/credentials
mv secrets/npmrc ~/.npmrc
