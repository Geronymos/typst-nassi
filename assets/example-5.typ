#import "@preview/cetz:0.2.2"

#import "../src/nassi.typ"

#set page(width: auto, height:auto, margin: 5mm)

#let strukt = nassi.parse-strukt(```
  function inorder(tree t)
    if t has left child
      inorder(left child of t)
    end if
    process(root of t)
    if t has right child
      inorder(right child of t)
    end if
  endfunction
```.text)

#cetz.canvas({
  import nassi.draw: diagram, layout-elements, draw-elements
  import cetz.draw: *

  diagram((4,4), strukt)

  circle((rel:(.65,0), to:"e1-text"), stroke:red, fill:red.transparentize(80%), radius:.5, name: "a")
  content((5,5), "current subtree", name: "b", frame:"rect", padding:.1, stroke:red, fill:red.transparentize(90%))
  line("a", "b", stroke:red)

  content((1,2), "recursion", name: "rec", frame:"rect", padding:.1, stroke:red, fill:red.transparentize(90%))
  line("rec", (rel:(.15,0), to:"e3.west"), stroke:red, mark:(end: ">"))
  line("rec", (rel:(.15,0), to:"e7.west"), stroke:red, mark:(end: ">"))

  content((17, 2.7), [empty\ branches], name: "empty", frame:"rect", padding:.1, stroke:red, fill:red.transparentize(90%))
  line("empty", (rel:(.15,0), to:"e4-text.east"), stroke:red, mark:(end: ">"))
  line("empty", (rel:(.15,0), to:"e8"), stroke:red, mark:(end: ">"))
})
