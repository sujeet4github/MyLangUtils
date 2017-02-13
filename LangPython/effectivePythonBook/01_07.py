# https://github.com/bslatkin/effectivepython/blob/master/example_code/item_07.py
#
# Preamble to mimick book environment
import logging
from pprint import pprint
from sys import stdout as STDOUT


# 7 - Use List Comprehensions Instead of map and filter
#

# Example 1
a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
squares = [x**2 for x in a]
print(squares)


# Example 2
# not as clear as the list comprehension above  => noisier
squares = map(lambda x: x ** 2, a)
print(list(squares))

############################################

# Example 3
# advantage of list comprehension, lets you filter out items with less noise
even_squares = [x**2 for x in a if x % 2 == 0]
print(even_squares)


# Example 4
# noisier way using lambdas - map + filter, compare with (3) above
alt = map(lambda x: x**2, filter(lambda x: x % 2 == 0, a))
assert even_squares == list(alt)

############################################

# comprehensions are available for dicts and sets, not just list

# Example 5
chile_ranks = {'ghost': 1, 'habanero': 2, 'cayenne': 3}
# comprehension for dict - to invert dict
rank_dict = {rank: name for name, rank in chile_ranks.items()}
print(rank_dict)
# comprehension for set
chile_len_set = {len(name) for name in rank_dict.values()}
print(chile_len_set)
