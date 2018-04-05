

class TestMain {

	public static void main(String[] args) {

		System.out.println("Hello");

		// 5. Show that Either is a “better” coproduct than int equipped with two injections: i and j
		// And define m : Either -> IntCoProduct
		// And show that m factorizes i and j with left/right that is
		// i = left . m
		// j = right . m

		Either<Integer,Boolean> c1 = Either.left(10);
		IntCoProduct c1Factorized = IntCoProduct.m(c1);
		IntCoProduct c1Dash = IntCoProduct.i(10);
		if (c1Dash.getN() == c1Factorized.getN()) {
			System.out.println("works for left side of Either<Integer, Boolean>, IntCoProduct.i can be factorized in terms of left");
		}
		Either<Integer,Boolean> c2 = Either.right(Boolean.TRUE);
		IntCoProduct c2Factorized = IntCoProduct.m(c2);
		IntCoProduct c2Dash = IntCoProduct.j(Boolean.TRUE);
		if (c2Dash.getN() == c2Factorized.getN()) {
			System.out.println("works for right side of Either<Integer, Boolean>, IntCoProduct.j can be factorized in terms of right");
		}

		// 6. Continuing the previous problem: How would you argue that int with the two injections i and j cannot be “better” than Either?
		// there is no m' that does it the other way

		IntCoProduct c1Alternate = IntCoProduct.i(100);
		Either<Integer,Boolean> c1AlternateDash = Either.left(100);
		Either<Integer,Boolean> c1AlternateFactorized = IntCoProduct.mDash(c1Alternate.getN());
		boolean checkIfEqualVal = checkIfEqual(c1AlternateDash.toString(), c1AlternateFactorized.toString());
		if (checkIfEqualVal)
			System.out.println("works for left side of Either<Integer, Boolean>, left can be factorized in terms of IntCoProduct.i");

		IntCoProduct c2Alternate = IntCoProduct.j(Boolean.TRUE);
		Either<Integer,Boolean> c2AlternateDash = Either.right(Boolean.TRUE);
		Either<Integer,Boolean> c2AlternateFactorized = IntCoProduct.mDash(c2Alternate.getN());
		checkIfEqualVal = checkIfEqual(c2AlternateDash.toString(), c2AlternateFactorized.toString());
		if (!checkIfEqualVal)
			System.out.println("Either<Integer,Boolean> can not be factorized from IntCoProduct.j using mDash - IntCoProduct not a better co-product");
	}

	static boolean checkIfEqual(String s1, String s2) {
		return s1.equals(s2);
	}
}



// 5. Show that Either is a “better” coproduct than int equipped with two injections:
class IntCoProduct {

	private int _n;

	public static IntCoProduct i(int n) {
		IntCoProduct retVal = new IntCoProduct();
		retVal._n = n;
		return retVal;
	}
	public static IntCoProduct j(Boolean b) {
		IntCoProduct retVal = new IntCoProduct();
		retVal._n = b ? 0 : 1;
		return retVal;
	}

	public int getN() { return _n; }


// To Show that Either is a “better” coproduct than int equipped with two injections:
// define m : Either -> IntCoProduct
	static IntCoProduct m(Either<Integer,Boolean> e) {
		if (e.isLeft()) {
			return IntCoProduct.i(e.getLeft());
		} else {
			return IntCoProduct.j(e.getRight());
		}
	}

// 6. Continuing the previous problem: How would you argue that int with the two injections i and j cannot be “better” than Either?
// there is no m' that does it the other way
	static Either<Integer,Boolean> mDash(int n) {

		// We can just map it to Left side not to right
		return Either.left(n);
	}


}

