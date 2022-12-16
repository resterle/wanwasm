#!/bin/bash
clang --target=wasm32 -O3 -nostdlib  -Wl,--no-entry -Wl,--export-dynamic -Wl,--allow-undefined -Wl,--import-memory -o gol.wasm gol.c