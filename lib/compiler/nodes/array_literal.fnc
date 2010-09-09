def class AST {
  def class ArrayLiteral : Node {
    read_slots: ['array]
    def initialize: array {
      @array = array
    }

    def ArrayLiteral from_sexp: sexp {
      ArrayLiteral new: $ sexp second
    }

    def to_ruby: out indent: ilvl {
      out print: $ (" " * ilvl) ++ "["
      @array each: |e| {
        e to_ast to_ruby: out
      } in_between: {
        out print: ", "
      }
      out print: "]"
    }
  }
}
