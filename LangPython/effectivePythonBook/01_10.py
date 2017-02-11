# https://raw.githubusercontent.com/bslatkin/effectivepython/master/example_code/item_10.py
#

# 10 - prefer ENUMERATE over RANGE
#

import logging
from pprint import pprint
from sys import stdout as STDOUT


# Example 1
from random import randint
random_bits = 0
for i in range(64):
    if randint(0, 1):
        random_bits |= 1 << i
print(bin(random_bits))


# Example 2
flavor_list = ['vanilla', 'chocolate', 'pecan', 'strawberry']
for flavor in flavor_list:
    print('%s is delicious' % flavor)
print

# Example 3
# to get index - one way is to use range - better way is enumerate below
for i in range(len(flavor_list)):
    flavor = flavor_list[i]
    print('%d: %s' % (i + 1, flavor))
print

# Example 4
# to get index - better way is enumerate - yields tuples of index and value
for i, flavor in enumerate(flavor_list):
    print('%d: %s' % (i + 1, flavor))
print

print enumerate(flavor_list)
print list(enumerate(flavor_list))
print

# Example 5, specifying enumerate starting position
for i, flavor in enumerate(flavor_list, 1):
    print('%d: %s' % (i, flavor))
