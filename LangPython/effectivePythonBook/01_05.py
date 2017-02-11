
# https://github.com/bslatkin/effectivepython/blob/master/example_code/item_05.py
#
import logging
from pprint import pprint
from sys import stdout as STDOUT

'''
how to slice sequences
	- somelist[start:end]
	- start and end are inclusive index
	- works with any class that defines __getitem__
		- list, tuple, str, bytes
'''

# Example 1
a = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
print('First four:', a[:4])
print('Last four: ', a[-4:])
print('Middle two:', a[3:-3]) #starting from 4th, upto 4th last


# Example 2
#optional empty begin
assert a[:5] == a[0:5]


# Example 3
#optional empty end
assert a[5:] == a[5:len(a)]


# Example 4
print(a[:5])
print(a[:-1])
print(a[4:])
print(a[-3:])
print(a[2:5])
print(a[2:-1])
print(a[-3:-1])


# Example 5
a[:]      # ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
a[:5]     # ['a', 'b', 'c', 'd', 'e']
a[:-1]    # ['a', 'b', 'c', 'd', 'e', 'f', 'g']
a[4:]     #                     ['e', 'f', 'g', 'h']
a[-3:]    #                          ['f', 'g', 'h']
a[2:5]    #           ['c', 'd', 'e']
a[2:-1]   #           ['c', 'd', 'e', 'f', 'g']
a[-3:-1]  #                          ['f', 'g']


# Example 6
first_twenty_items = a[:20]
last_twenty_items = a[-20:]


# Example 7
try:
    a[20]
except:
    logging.exception('Expected')
    print("However doing this in a slicing operation does not raise an exception !!!")
else:
    assert False


# Example 8
# slice creates a new list
b = a[4:]
print('Before:   ', b)
b[1] = 99
print('After:    ', b)
print('No change:', a)


# Example 9
# Splicing - replaces array members with new members
print('Before ', a)
a[2:7] = [99, 22, 14]
print('After  ', a)


# Example 10
# copying a list
b = a[:]
assert b == a and b is not a
assert a == b
assert a is not b
print(id(a))
print(id(b))


# Example 11
b = a
print('Before', a)
a[:] = [101, 102, 103]
assert a is b           # Still the same list object
print('After ', a)      # Now has different contents

a = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']

# Assigning to tuples - give me last 3 elements of a and assign to individual variables
a,b,c = a[-3:]
assert a == 'f'
assert b == 'g'
assert c == 'h'
