class Fancy {
  class Compiler : Rubinius Compiler {
    read_write_slots: [ 'parser, 'generator, 'packager, 'writer ]

    def self compiled_name: file {
      """
      Returns a the compiled filename for @file

      If file ends with .fy extention the will return with .fyc extension
      Otherwise it will append .compiled.fyc to the filename.
      """

      if: (file suffix?(".fy")) then: {
        file + "c"
      } else: {
        file + ".compiled.fyc"
      }
    }

    def self from: first_stage to: last_stage {
      """
      Creates a new compiler from @first_stage to @last_stage.
      """

      new(first_stage, last_stage)
    }

    def self compile_code: code vars: scope file: file line: line print: print (false) {
      compiler = from: 'fancy_code to: 'compiled_method
      parser = compiler parser
      parser root: Rubinius AST EvalExpression
      parser input: code file: file line: line
      if: print then: {
        parser print: true
        printer = compiler packager print()
        printer bytecode=(true)
      }
      compiler generator variable_scope: scope
      result = nil
      try {
        result = compiler run()
      } catch StandardError => e {
        compiler_error("Error trying to compile " ++ file, e)
      }
      result
    }

    def self compile_file: file to: output (nil) line: line (1) print: print (false) {
      compiler = from: 'fancy_file to: 'compiled_file
      parser = compiler parser
      parser root: Rubinius AST Script
      parser input: file line: line
      if: print then: {
        parser print: true
        printer = compiler packager print()
        printer bytecode=(true)
      }
      writer = compiler writer
      if: output then: {
        writer name=(output)
      } else: {
        writer name=(compiled_name: file)
      }
      try {
        compiler run()
      } catch Fancy Parser ParseError => e {
        e raise!
      } catch StandardError => e {
        compiler_error("Error trying to compile " ++ file, e)
      }
    }
  }
}
