# https://raw.githubusercontent.com/bslatkin/effectivepython/master/example_code/item_11.py
#

# use ZIP to process iterators in parallel
#

import logging
from pprint import pprint
from sys import stdout as STDOUT


# Example 1
names = ['Cecilia', 'Lise', 'Marie']
letters = [len(n) for n in names]
print(letters)


# Example 2 - to find longest name
longest_name = None
max_letters = 0

for i in range(len(names)):
    count = letters[i]
    if count > max_letters:
        longest_name = names[i]
        max_letters = count

print(longest_name)


# Example 3 - to find longest name - easier way #1 - using enumerate
longest_name = None
max_letters = 0
for i, name in enumerate(names):
    count = letters[i]
    if count > max_letters:
        longest_name = name
        max_letters = count
print(longest_name)

#easier way #2 - using zip generator
print(zip(names, letters))
# Note: in python 2 - zip is not a lazy generator, use itertools.izip instead
#
print(list(zip(names, letters)))

# Example 4 - to find longest name, easier way using zip generator
longest_name = None
max_letters = 0
for name, count in zip(names, letters):
    if count > max_letters:
        longest_name = name
        max_letters = count
print('%s is the longest' % longest_name)


# Example 5 - zip works till the first iterator exhausts,
#  there is itertools.zip_longest which works till all iterators exhaust
names.append('Rosalind')
for name, count in zip(names, letters):
    print('%s has %d letters' %(name, count))
