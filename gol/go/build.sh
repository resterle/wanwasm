#!/bin/bash
tinygo build -no-debug -wasm-abi=generic -target=wasi -printir -o main.wasm main.go