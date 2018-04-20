#! /usr/bin/env python

# Challenge 3
# Implement the reader functor in your second favorite language (the first being Haskell, of course).

def fmap(g, f):
    return lambda x: g(f(x))

def f(x):
    return x + 1

def g(x):
    return x * 2

def main():
    h = fmap(g, f)
    res = h(3)
    print res

if(__name__ == '__main__'):
    main()
