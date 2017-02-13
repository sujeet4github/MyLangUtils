# https://raw.githubusercontent.com/bslatkin/effectivepython/master/example_code/item_09.py
#


# 9 - Consider Generator Expressions for Large Comprehensions
#
# List Comprehensions can generate large lists, making it lazy can reduce the
# memory footprint.

import logging
from pprint import pprint
from sys import stdout as STDOUT


# Example 1
import random
with open('my_file.txt', 'w') as f:
    for _ in range(10):
        f.write('a' * random.randint(0, 100))
        f.write('\n')

# list comprehension, would be a problem if the file were large or the filter
# were from a network socket...
#
value = [len(x) for x in open('my_file.txt')]
print(value)

# convert the list comprehension to a generator expressions
# [] changed to ()
# the return value is an iterator, yielding one item at a time
#
# Example 2
it = (len(x) for x in open('my_file.txt'))
print(it)

# once I have an iterator, I can retrieve the next value, 1 at a time

# Example 3
print(next(it))
print(next(it))


# Another advantage of generator, I can create a new generator building on an
# existing generator
#
# Example 4
roots = ((x, x**0.5) for x in it)

# Example 5
print(next(roots))
