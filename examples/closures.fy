# closure.fy
# Example of closures in fancy

# method that returns a closure
def create_counter: number {
  { number = number + 1 }
}

# create a counter from 100 upwards
closure = create_counter: 100
# this will print numbers 100 - 120
20 times: {
  Console println: $ closure call
}

# create a counter from 500 upwards
closure = create_counter: 500
# this will print numbers 500 - 510
10 times: {
  Console println: $ closure call
}
