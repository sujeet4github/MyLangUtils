# https://raw.githubusercontent.com/bslatkin/effectivepython/master/example_code/item_08.py
#

# 8 - Avoid More Than Two Expressions in List Comprehensions

## Avoid list comprehension if the alternative is more readable
##  Rule of thumb - more than 2 conditions is too much

import logging
from pprint import pprint
from sys import stdout as STDOUT


# Example 1
# reasonable usage of multiple fpr expressions
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
flat = [x for row in matrix for x in row]
print(flat)


# Example 2
# reasonable usage of multiple fpr expressions
squared = [[x**2 for x in row] for row in matrix]
print(squared)


# Example 3
# here the list comprehension has become long, where it is as noisier than the
# regular python expression
my_lists = [
    [[1, 2, 3], [4, 5, 6]],
    [[7, 8, 9], [10, 11, 12]],
]
flat = [x for sublist1 in my_lists
        for sublist2 in sublist1
        for x in sublist2]
print(flat)


# Example 4
# same length as list comprehension, this makes it more readable
flat = []
for sublist1 in my_lists:
    for sublist2 in sublist1:
        flat.extend(sublist2)
print(flat)


## Some more where LC's are more readable than alternative

# Example 5
a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
b = [x for x in a if x > 4 if x % 2 == 0]
c = [x for x in a if x > 4 and x % 2 == 0]
print(b)
print(c)
assert b and c
assert b == c

# Example 6
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
filtered = [[x for x in row if x % 3 == 0]
            for row in matrix if sum(row) >= 10]
print(filtered)
