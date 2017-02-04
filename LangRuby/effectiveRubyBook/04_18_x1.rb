# multi line comments e.g.
=begin

18 - Prefer lambda instead of proc
 for anonymous callable

proc - does not get a stack frame
	can cause uninitutive behavior
		return will return from the current stack frame
	does not verify arity of arguments

lambda - gets a stack frame
	behaves like a function
	verifies arity of arguments

=end

# Testing procs
# ------------------------------------------------------

p = Proc.new { |arg1, arg2|
	p "block called via proc - got arguments #{arg1} #{arg2}"
}

# example of not checking argument arity

p.call(1)
p.call(1,2,3)

# example of return misbehavior #1

def foo(blk)
	p ["entering", :foo]
	blk.call
	p ["leaving", :foo]
end

def bar(&blk)
	p ["entering", :bar]
	foo(blk)
	p ["leaving", :bar]
end

def baz
	p ["entering", :baz]
	bar { p "reached proc impl, ready to return"; return }
	p ["leaving", :baz]
end

baz

# example of return misbehavior #2
def foo_too
	f = {}
	p f.fetch(:foo)  { |key| p " key not found, returning! " ; return }
	p "here! -  this will never be called"
end

p "calling foo_too"
foo_too
	
# Testing lambdas
# ------------------------------------------------------

# replace all of the procs above with lambdas

l = lambda { |arg1, arg2|
	p "block called via lambda - got arguments #{arg1} #{arg2}"
}

# example of not checking argument arity

begin
	l.call(1)
rescue Exception => e
	puts "Error #{e}"
end
begin
	l.call(1,2,3)
rescue Exception => e
	puts "Error #{e}"
end
l.call(1,2)

# how lambda fixes problem - return misbehavior #1
def baz
	p ["entering", :baz]
	bar &(lambda { p "reached proc impl, ready to return"; return })
	p ["leaving", :baz]
end

baz

# how lambda fixes problem - return misbehavior #2
def foo_too
	f = {}
	p f.fetch(:foo, &(lambda { |key| p " key not found, returning! " ; return }) )
	p "here! -  this will be called since not-found-block was a lambda"
end

p "calling foo_too"
foo_too
