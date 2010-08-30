# Problem 2
# Each new term in the Fibonacci sequence is generated by adding the
# previous two terms. By starting with 1 and 2, the first 10 terms will
# be:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# Find the sum of all the even-valued terms in the sequence which do
# not exceed four million.

fibs = [1, 2];

# insert into fibs as long as the sum of the last two numbers doesn't
# exceed 4000000
{ fibs[-1] + (fibs[-2]) <= 4000000 } while_true: {
  fibs << (fibs last: 2 . sum)
};

"fibonacci sequence:" println;
fibs inspect println;

"sum: " print;
fibs select: 'even? . sum println
