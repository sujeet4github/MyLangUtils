#!/usr/bin/env python3
# https://raw.githubusercontent.com/bslatkin/effectivepython/master/example_code/item_15.py

# 15 Know How Closures Interact with Variable Scope

# Preamble to mimick book environment
import logging
from pprint import pprint
from sys import stdout as STDOUT
from sys import version_info as PY_VER

# Example 1
def sort_priority(values, group):
    def helper(x):
        if x in group:
            return (0, x)
        return (1, x)
    values.sort(key=helper)


# Example 2
numbers = [8, 3, 1, 2, 5, 4, 7, 6]
group = {2, 3, 5, 7}
sort_priority(numbers, group)
print(numbers)


# Example 3
def sort_priority2(numbers, group):
    foundInSpecialGroup = False
    def helper(x):
        if x in group:
            foundInSpecialGroup = True  # Seems simple
                            # this creates a new variable in the local scope
                            # does not refer to the variable in the outer scope
            return (0, x)
        return (1, x)
    numbers.sort(key=helper)
    return foundInSpecialGroup


# Example 4
foundInSpecialGroup = sort_priority2(numbers, group)
print('Found in high priority group:', foundInSpecialGroup)
print(numbers)


# Example 5
# Explanation of the problem (in 3, 4) above...
#
def sort_priority2(numbers, group):
    found = False         # Scope: 'sort_priority2'
    def helper(x):
        if x in group:
            found = True  # Scope: 'helper' -- Bad!
            return (0, x)
        return (1, x)
    numbers.sort(key=helper)
    return found


# Example 6
def sort_priority3(numbers, group):
    found = False
    def helper(x):
        # does not work in python 2, work around is to use found as array
        nonlocal found
        if x in group:
            found = True
            return (0, x)
        return (1, x)
    numbers.sort(key=helper)
    return found


# Example 7
found = sort_priority3(numbers, group)
print('Found:', found)
print(numbers)

# A better way to solve the problem

# Example 8
class Sorter(object):
    def __init__(self, group):
        self.group = group
        self.found = False

    def __call__(self, x):
        if x in self.group:
            self.found = True
            return (0, x)
        return (1, x)

sorter = Sorter(group)
numbers.sort(key=sorter)
assert sorter.found is True
print('Found:', sorter.found)
print(numbers)
