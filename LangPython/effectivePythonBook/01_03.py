# https://github.com/bslatkin/effectivepython/blob/master/example_code/item_03.py
#
import logging
from pprint import pprint
from sys import stdout as STDOUT

#
# Know the Differences Between bytes, str, and unicode
# ----------------------------------------------------

# Example 1
def to_str(bytes_or_str):
    if isinstance(bytes_or_str, bytes):
        value = bytes_or_str.decode('utf-8')
        print("decode from utf-8")
    else:
        value = bytes_or_str
    return value  # Instance of str

print(repr(to_str(b'b_foo')))
print(repr(to_str('no_b_foo')))


# Example 28
def to_bytes(bytes_or_str):
    if isinstance(bytes_or_str, str):
        value = bytes_or_str.encode('utf-8')
        print("encode to utf-8")
    else:
        value = bytes_or_str
    return value  # Instance of bytes

print(repr(to_bytes(b'b_foo')))
print(repr(to_bytes('no_b_foo')))

# Example 3
def to_unicode(unicode_or_str):
    if isinstance(unicode_or_str, str):
        value = unicode_or_str.encode('utf-8')
        print("encode to utf-8")
    else:
        value = unicode_or_str
    return value  # Instance of bytes

print(repr(to_unicode(b'b_foo')))
print(repr(to_unicode('no_b_foo')))

# Example 4
def to_str2(unicode_or_str):
    if isinstance(unicode_or_str, unicode):
        value = unicode_or_str.encode('utf-8')
        print("encode to utf-8")
    else:
        value = unicode_or_str
    return value  # Instance of str

print(repr(to_str2(b'b_foo')))
print(repr(to_str2('no_b_foo')))

# Example 5
try:
    import os
    with open('random.bin', 'w') as f:
        f.write(os.urandom(10))
except:
    logging.exception('Expected')
else:
    assert False


# Example 6
with open('random.bin', 'wb') as f:
    f.write(os.urandom(10))
