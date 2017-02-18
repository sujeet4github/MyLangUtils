#

# 20 Use None and Docstrings to Specify Dynamic Default Arguments

import logging
from pprint import pprint
from sys import stdout as STDOUT


# Example 1
from time import sleep
from datetime import datetime

def log(message, when=datetime.now()):
    print('%s: %s' % (when, message))

# problem above is that the when=datetime.now() is fixed for when the function
# is defined, not when the function is called, as can be seen below
log('Hi there!')
sleep(1)
log('Hi again!')


# Example 2
def log(message, when=None):
    """Log a message with a timestamp.

    Args:
        message: Message to print.
        when: datetime of when the message occurred.
            Defaults to the present time.
    """
    when = datetime.now() if when is None else when
    print('%s: %s' % (when, message))


# Example 3
log('Hi there!')
sleep(1)
log('Hi again!')


# Example 4
import json

def decode(data, default={}):
    try:
        return json.loads(data)
    except ValueError:
        return default

# similar as above, the default value is set to a dict object during Function
# defn time.

# Example 5
foo = decode('bad data')
foo['stuff'] = 5
bar = decode('also bad')
bar['meep'] = 1
print('Foo:', foo)
print('Bar:', bar)

assert foo is bar


# Solution below



# Example 7
def decode(data, default=None):
    """Load JSON data from a string.

    Args:
        data: JSON data to decode.
        default: Value to return if decoding fails.
            Defaults to an empty dictionary.
    """
    if default is None:
        default = {}
    try:
        return json.loads(data)
    except ValueError:
        return default


# Example 8
foo = decode('bad data')
foo['stuff'] = 5
bar = decode('also bad')
bar['meep'] = 1
print('Foo:', foo)
print('Bar:', bar)
