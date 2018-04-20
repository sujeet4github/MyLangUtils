/*
A function that is not defined for all possible values of its argument
is called a partial function.
It’s not really a function in the mathematical sense, so it doesn’t fit
the standard categorical mold. It can, however, be represented by a
function that returns an embellished type optional:
*/
template<class A> class optional
{
    bool _isValid;
    A    _value;
public:
    optional()    : _isValid(false) {}
    optional(A v) : _isValid(true), _value(v) {}
    bool isValid() const { return _isValid; }
    A value() const { return _value; }
};

// As an example, here’s the implementation of the embellished function safe_root:

optional<double> safe_root(double x)
{
    if (x >= 0)
    	return optional<double>{sqrt(x)};
    else
    	return optional<double>{};
}

// 1. Construct the Kleisli category for partial functions (define composition and identity).
// A-1-Compose
template <class A, class B>
function<optional<B>> compose(function<optional<A>(A)> m1, function<optional<B>(B)> m2)
{
	return [m1, m2](A x) {
		auto p1 = m1(x);
		return p1.isValid()
					? m2(p1.value()
					: p1;
}
// A-1-identity
optional<A> identity(A x)
{
	return new optional(x);
}

// 2. Implement the embellished function safe_reciprocal that returns a valid reciprocal of its
// argument, if it’s different from zero.
optional<double> safe_reciprocal(double x) {
	return if (x != 0) ? new optional(1/x) : new optional();
}
optional<double> safe_root_reciprocal(double x) {
	return compose(safe_root, safe_reciprocal)(x);
}
