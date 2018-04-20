#! /usr/bin/env python

# Challenges:
# 1. Define a higher-order function (or a function object) memoize in your favorite language.
#    This function takes a pure function f as an argument and returns a function that behaves
#    almost exactly like f, except that it only calls the original function once for every argument,
#    stores the result internally, and subsequently returns this stored result every time it’s
#    called with the same argument. You can tell the memoized function from the original by watching
#    its performance.
#    For instance, try to memoize a function that takes a long time to evaluate. You’ll have to wait
#    for the result the first time you call it, but on subsequent calls, with the same argument,
#    you should get the result immediately.
#

from operator import mul
import time

class Memoized(object):
	def __init__(self, f):
		self.f		= f
		self.memo	= {}

	def call(self, *args):
		if (args in self.memo):
			return self.memo[args]
		else:
			res = self.f(*args)
			self.memo[args] = res
			return res

def fact(x):
	return reduce(mul, range(1, x+1), 1)

def main():
	fact_m	= Memoized(fact)
	arg	= 10000

	t0	= time.time()
	res1	= fact_m.call(arg)
	t1	= time.time()
	res2	= fact_m.call(arg)
	t2	= time.time()
	
	print "{}! = {}, {}".format(arg, res1)
    	print "First call took {} seconds.".format(t1 - t0)
	print "Second call took {} seconds.".format(t2 - t1)

if(__name__ == "__main__"):
    main()
