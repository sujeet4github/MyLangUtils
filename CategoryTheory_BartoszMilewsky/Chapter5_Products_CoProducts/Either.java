import java.util.Objects;

// 4. Implement the equivalent of Haskell Either as a generic type in your favorite language (other than Haskell).
//
public class Either<L, R>  {

	private L _lObj = null;
	private R _rObj = null;

	private Either(L lObj, R rObj) {
		this._lObj = lObj;
		this._rObj = rObj;
	}

	public static <L,R> Either<L,R> left(L obj) {
		return new Either<L,R>(obj, null);
	}

	public static <L,R> Either right(R obj) {
		return new Either<L,R>(null, obj);
	}

	public boolean isLeft() {
		return getLeft() != null;
	}

	public boolean isRight() {
		return getRight() != null;
	}

	public L getLeft() {
		return _lObj;
	}

	public R getRight() {
		return _rObj;
	}

	@Override
	public String toString() {
		String output = String.format("L:%s : R:%s", Objects.toString(getLeft(), "Null"), Objects.toString(getRight(), "Null"));
		return output;
	}
}
