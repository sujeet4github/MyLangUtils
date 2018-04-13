# Challenges:
# 1. Implement, as best as you can, the identity function in your favorite language (or the second favorite, if your favorite language happens to be Haskell).
# 2. Implement the composition function in your favorite language. It takes two functions as arguments and returns a function that is their composition.
# 3. Write a program that tries to test that your composition function respects identity.

def identity(x):
	return x

def compose_f_then_g(f, g):
	return lambda x: g(f(x))

def main():
	def f(x):
		return x+2
	
	g = compose_f_then_g(f=f, g=identity)
	h = compose_f_then_g(f=identity, g=f)

	for x in [-1,0,1,2,3]:
		assert g(x) == f(x)
		assert h(x) == f(x)
	
	print "All tests passed."

if (__name__ == "__main__"):
	main()
