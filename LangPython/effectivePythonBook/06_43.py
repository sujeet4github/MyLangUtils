# https://raw.githubusercontent.com/bslatkin/effectivepython/master/example_code/item_43.py
#

# 43 consider CONTEXTLIB and with statements for reusable TRY/FINALLY behavior
#

import logging
from pprint import pprint
from sys import stdout as STDOUT


# Example 1
from threading import Lock
lock = Lock()
with lock:
    print('Lock is held')


# Example 2 - above code same as, but this one has a lot of boilerplate
lock.acquire()
try:
    print('Lock is held')
finally:
    lock.release()


# Example 3
import logging
logging.getLogger().setLevel(logging.WARNING)
def my_function():
    logging.debug('Some debug data')
    logging.error('Error log here')
    logging.debug('More debug data')

my_function()


# Example 5 - use lib contextlib , to temporarily change the debug level
# create a contextmanager called debug_logging
#
from contextlib import contextmanager
@contextmanager
def debug_logging(level):
    logger = logging.getLogger()
    old_level = logger.getEffectiveLevel()
    logger.setLevel(level)
    try:
        yield
    finally:
        logger.setLevel(old_level)


# Example 6 - using the context manager debug_logging
with debug_logging(logging.DEBUG):
    print('Inside:')
    my_function()
print('After:')
my_function()


# Example 7
with open('my_output.txt', 'w') as handle:
    handle.write('This is some data!')


# Example 8 - the context manager here yields a value that can be used just as
# (file) handle is being used in Example 7
@contextmanager
def log_level(level, name):
    logger = logging.getLogger(name)
    old_level = logger.getEffectiveLevel()
    logger.setLevel(level)
    try:
        yield logger
    finally:
        logger.setLevel(old_level)


# Example 9
with log_level(logging.DEBUG, 'my-log') as logger:
    logger.debug('This is my message!')
    logging.debug('This will not print')


# Example 10 - we can get the my-log outside the context
logger = logging.getLogger('my-log')
logger.debug('Debug will not print')
logger.error('Error will print')

# Example - A Context Manager to swallow exceptions
@contextmanager
def swallow_exception(cls):
	try:
		yield
	except cls:
		logging.exception('swallowing exception')

value=20
with swallow_exception(ZeroDivisionError):
	value /= 0
print "... and merrily we go along after swallowing the exception"
