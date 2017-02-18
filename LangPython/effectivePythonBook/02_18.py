#https://raw.githubusercontent.com/bslatkin/effectivepython/master/example_code/item_18.py

#18 Reduce Visual Noise with Variable Positional Arguments

# Preamble to mimick book environment
import logging
from pprint import pprint
from sys import stdout as STDOUT


# Example 1
def log(message, values):
    if not values:
        print(message)
    else:
        values_str = ', '.join(str(x) for x in values)
        print('%s: %s' % (message, values_str))

log('My numbers are', [1, 2])
log('Hi there', [])


# Example 2
def log(message, *values):  # The only difference
    if not values:
        print(message)
    else:
        values_str = ', '.join(str(x) for x in values)
        print('%s: %s' % (message, values_str))

log('My numbers are', 1, 2)
log('Hi there')  # Much better


# Example 3
favorites = [7, 33, 99]
log('Favorite colors', favorites)
# vis-a-vis
log('Favorite colors', *favorites)


# Example 4
def my_generator():
    for i in range(10):
        yield i
log('Ex4: Hi there - the generator is fully expanded into a n-tuple before calling',\
    *my_generator())

def my_func(*args):
    print(args)

it = my_generator()
my_func(*it)


# Example 5
def log(sequence, message, *values):
    if not values:
        print('%s: %s' % (sequence, message))
    else:
        values_str = ', '.join(str(x) for x in values)
        print('%s: %s: %s' % (sequence, message, values_str))

log(1, 'Favorites', 7, 33)      # New usage is OK
log('Favorite numbers', 7, 33)  # Old usage breaks
