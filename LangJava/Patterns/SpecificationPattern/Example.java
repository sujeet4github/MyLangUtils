// Folder: <MyLangUtils>\LangJava\SpecificationPattern
// https://www.martinfowler.com/apsupp/spec.pdf
// https://dzone.com/articles/specification-pattern-quickly

import java.util.*;

class Product {
	String uin;
	double price;
	int units;

	// Tell, don't Ask... Let the product tell us if it meets a critera
	public boolean satisfies(SearchCriteria criteria) {
		return criteria.isSatisfiedBy(this);
	}
}

class TV extends Product {
	int resolution;
	int screenSize;

	@Override
	public String toString() {
		return "< TV:" + "Price=" + price + ">";
	}
}

interface SearchCriteria{
	boolean isSatisfiedBy(Product product);
}
class PriceCriterion implements SearchCriteria {
	private String operator;
	private double target;
	PriceCriterion(String operator, double target) {
		this.operator = operator;
		this.target = target;
	}

	public boolean isSatisfiedBy (Product product) {
		if (operator.equals(">"))
			return product.price > target;
		else if (operator.equals("<"))
			return product.price < target;
		else
			return false;
	}

	@Override
	public String toString() {
		return "[" + operator + " " + target + "]";
	}
}

class PriceCriterionTest {
	void testGT_works_productPrice_GT_criteriaPrice() {
		Product tv = new TV();
		tv.price = 499.98;
		PriceCriterion c = new PriceCriterion("<", 499.99);
		assert(c.isSatisfiedBy(tv)) : "GT operator fails with " + tv + ". Spec = " + c;
	}
}

// Composite Pattern
class Criteria implements SearchCriteria {

	private List<SearchCriteria> criteria ;

	public Criteria(List<SearchCriteria> criteria) {

		this.criteria = criteria;
	}

	//We could also add the operators add, not, or for combining criteria, here it is AND
	public boolean isSatisfiedBy(Product product) {

		for (SearchCriteria oneCriterion : criteria)
			if (! oneCriterion.isSatisfiedBy(product))
				return false;

		return true;
	}
}

// Builder Pattern
class SearchCriteriaBuilder {

	protected List<SearchCriteria> criteria = new ArrayList<>();

	private PriceCriteriaBuilder priceCriteriaBuilder;
	private ScreenSizeCriteriaBuilder screenSizeCriteriaBuilder;

	public PriceCriteriaBuilder withPrice() {
		return new PriceCriteriaBuilder(this);
	}

	public ScreenSizeCriteriaBuilder withScreenSize() {
		return new ScreenSizeCriteriaBuilder(this);
	}

	public SearchCriteria build(){
		return new Criteria(criteria);
	}
}
abstract class CommonBuilder {
	private SearchCriteriaBuilder master;
	public CommonBuilder(SearchCriteriaBuilder master) {
		this.master = master;
	}
	public SearchCriteriaBuilder and(){
		return master;
	}
}
abstract class ComparatorCriteriaBuilder extends CommonBuilder{
	String operator;
	double target;

	public ComparatorCriteriaBuilder(SearchCriteriaBuilder master) {
		super(master);
	}
	public ComparatorCriteriaBuilder being(String operator) {
		this.operator = operator;
		return this;
	}
	public ComparatorCriteriaBuilder value(double target) {
		this.target = target;
		return this;
	}
}
class PriceCriteriaBuilder extends ComparatorCriteriaBuilder{
	public PriceCriteriaBuilder(SearchCriteriaBuilder master) {
		super(master);
	}
}
class ScreenSizeCriteriaBuilder extends ComparatorCriteriaBuilder{
	public ScreenSizeCriteriaBuilder(SearchCriteriaBuilder master) {
		super(master);
	}
}


class Example {
	public static void main(String[] args) {

		PriceCriterionTest pct = new PriceCriterionTest();
		pct.testGT_works_productPrice_GT_criteriaPrice();
		System.out.println(" criteria tests met");

		SearchCriteria criteria = new SearchCriteriaBuilder()
			.withPrice()
				.being("<")
				.value(3000)
			.and()
			.withScreenSize()
				.being(">").value(33)
			.and()
			.build();

		TV tv = new TV();
		tv.price = 499.98;
		tv.screenSize = 34;
		System.out.println(tv.satisfies(criteria));
	}
}
