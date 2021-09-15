#!/bin/bash

if [[ "$PACKAGE" == "" ]]; then
  NPMRC_PATH="~/.npmrc"
else
  NPMRC_PATH="packages/$PACKAGE/.npmrc"
fi

if [[ -f "$NPMRC_PATH" ]]; then
  rm "$NPMRC_PATH"
fi

if [[ -n "$ORGANIZATION_NAME" ]]; then
  echo "registry = https://npm.pkg.github.com/$ORGANIZATION_NAME" >> "$NPMRC_PATH"
fi

echo "//npm.pkg.github.com/:_authToken=$GITHUB_PERSONAL_TOKEN" >> "$NPMRC_PATH"
