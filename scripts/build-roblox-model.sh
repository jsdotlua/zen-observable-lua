#!/bin/sh

set -e

build_with_darklua_config () {
    DARKLUA_CONFIG=$1
    OUTPUT=build/$2

    rm -rf roblox

    mkdir -p roblox

    cp -r src/ roblox/

    rojo sourcemap model.project.json -o sourcemap.json

    darklua process --config $DARKLUA_CONFIG src roblox/src
    darklua process --config $DARKLUA_CONFIG node_modules roblox/node_modules

    ./scripts/remove-tests.sh roblox

    cp model.project.json roblox/

    mkdir -p build
    mkdir -p $(dirname $OUTPUT)

    rojo build roblox/model.project.json -o $OUTPUT
}

build_with_darklua_config .darklua.json zen-observable.rbxm
build_with_darklua_config .darklua-dev.json debug/zen-observable.rbxm
