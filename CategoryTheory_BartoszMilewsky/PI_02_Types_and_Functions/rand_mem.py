#! /usr/bin/env python

# Challenges:
# 1. Try to memoize a function from your standard library that you normally use
#	to produce random numbers. Does it work?
#
# It wouldnt work, unlike the random number with a given seed

import time
from random import random
from memoize import Memoized

def main():
	rand_m	= Memoized(random)

	t0	= time.time()
	res1	= fact_m.call()
	t1	= time.time()
	res2	= fact_m.call()
	t2	= time.time()
	
	print "First result: {}; Second result: {}, {}".format(res1, res2)
    	print "First call took {} seconds.".format(t1 - t0)
	print "Second call took {} seconds.".format(t2 - t1)
	print "Keys of memo: {}".format(rand_m.memo.keys())

if(__name__ == "__main__"):
    main()
