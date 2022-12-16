package main

import (
	"syscall/js"
)

func CalcNp1(this js.Value, args []js.Value) interface{} {
	lineLen := args[0].Int()
	genN := genGenN()
	genNp1 := make([]any, len(genN))
	for i, _ := range genN {
		alive := aliveNp1(i, &genN, lineLen)
		genNp1[i] = alive
	}
	return genNp1
}

func genGenN() []any {
	jsGenN := js.Global().Get("genN")
	n := make([]any, jsGenN.Length())
	for i := 0; i < len(n); i++ {
		n[i] = jsGenN.Index(i).Truthy()
	}
	return n
}

func aliveNp1(i int, a *[]any, lineLen int) bool {
	aliveNeighbours := 0
	above := i - lineLen
	below := i + lineLen
	neighbourIndexes := []int{above, below}
	l := i % lineLen
	if l != 0 {
		neighbourIndexes = append(neighbourIndexes, i-1, above-1, below-1)
	}
	if (l + 1) != lineLen {
		neighbourIndexes = append(neighbourIndexes, i+1, above+1, below+1)
	}

	al := len(*a)
	for _, n := range neighbourIndexes {
		if n >= 0 && n < al && (*a)[n].(bool) {
			aliveNeighbours++
		}
	}

	cell := (*a)[i].(bool)
	r0 := (!cell && aliveNeighbours == 3)
	r1 := (cell && (aliveNeighbours > 1 && aliveNeighbours < 4))
	r := r0 || r1
	return r
}

func main() {
	js.Global().Set("GoCalcNp1", js.FuncOf(CalcNp1))
	<-make(chan bool)
}
