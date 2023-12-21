#!/bin/sh

set -e

mkdir -p build
mkdir -p build/debug

rm -f build/zen-observable.lua
rm -f build/debug/zen-observable.lua

darklua process --config .darklua-bundle.json src/init.lua build/zen-observable.lua
darklua process --config .darklua-bundle-dev.json src/init.lua build/debug/zen-observable.lua
