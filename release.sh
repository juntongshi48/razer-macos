#!/bin/bash

export APPLE_ID=""
export APPLE_ID_PASSWORD=""
export NODE_OPTIONS=--openssl-legacy-provider

yarn clean
rm -rf ./node_modules ./dist

yarn

yarn dist

if [[ -z $APPLE_ID ]]
then
  codesign -s - --deep --force ./dist/mac-universal/Razer\ macOS.app
fi

unset APPLE_ID
unset APPLE_ID_PASSWORD