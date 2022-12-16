Was'n WASM

A few sinple webAssembly examples.

Tools needed:
* [LLVM](https://llvm.org/) 
* [WABT](https://github.com/WebAssembly/wabt)
* [golang](https://go.dev/)

To run the examples build it with the `build.sh` script that is provided in the folder of the example.
Then start a web server e.g. `python3 -m http.server 8080` and open the page with a browser.

The examples are:

* super_simple -> A add function written in web assembly text format and called from js.
* simple -> Shows how imports and exports work.
* memory -> How to use share memory between js and wasm
* go -> Implementations of conway's game of life in JavaScript go and c. 