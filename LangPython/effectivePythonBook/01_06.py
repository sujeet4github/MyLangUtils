# https://github.com/bslatkin/effectivepython/blob/master/example_code/item_06.py
#
import logging
from pprint import pprint
from sys import stdout as STDOUT

# Using the 3rd argument (stride) in slice

# Example 1
a = ['red', 'orange', 'yellow', 'green', 'blue', 'purple']
odds = a[::2]
evens = a[1::2]
print(odds)
print(evens)


# Example 2
# reversing a string
x = b'mongoose'
y = x[::-1]
print(y)


# Example 3
# reversing a does not work after encode/decode esp for multi-byte chars
try:
    w = 'unicode - string '
    x = w.encode('utf-8')
    y = x[::-1]
    z = y.decode('utf-8')
except:
    logging.exception('Expected')
else:
    print "would have failed if $w were really an unicode string"
    #assert False


# Example 4
a = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
a[::2]   # ['a', 'c', 'e', 'g']
a[::-2]  # ['h', 'f', 'd', 'b']


# Example 5
a[2::2]     # ['c', 'e', 'g']
# start at -2 ie 3rd last, and give me every 2 backwards
a[-2::-2]   # ['g', 'e', 'c', 'a']
a[-2:2:-2]  # ['g', 'e']
a[2:2:-2]   # []


# Example 6
b = a[::2]   # ['a', 'c', 'e', 'g']
c = b[1:-1]  # ['c', 'e']
print "avoiding all three (start, end, stride) in the same operation by splitting into 2 operations"
print " original list: "
print a
print " strided list: "
print b
print " sliced  list: "
print c
# Note that these creates copies, so each operation, reduce the length as much as possible
