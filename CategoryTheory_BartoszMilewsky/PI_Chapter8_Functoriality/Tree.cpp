// C++ implementation of Tree.hs
// For simplicity, I decided to ignore memory and resource management issues,
// but in production code you would probably use smart pointers (unique or shared, depending on your policy).

// one way of implementing sum types in C++ is through class hierarchies.
// It would be natural, in an object-oriented language, to implement fmap
// as a virtual function of the base class Functor and then override it
// in all subclasses.

// Unfortunately this is impossible because fmap is a template,
// parameterized not only by the type of the object it’s acting
// upon (the this pointer) but also by the return type of the
// function that’s been applied to it.
// Virtual functions cannot be templatized in C++.
// We’ll implement fmap as a generic free function, and we’ll
// replace pattern matching with dynamic_cast.

template<class T>
struct Tree {
    virtual ~Tree() {};
};

// The Leaf is just an Identity functor in disguise:
template<class T>
struct Leaf : public Tree<T> {
    T _label;
    Leaf(T l) : _label(l) {}
};

// The Node is a product type
template <class T>
struct Node : public Tree<T> {
	Tree<T>* _left;
	Tree<T>* _right;

	Node(Tree<T>* left, Tree<T>* right) : _left(left), _right(right) {}
};


// When implementing fmap we take advantage of dynamic dispatching on
// the type of the Tree.
//
// The Leaf case applies the Identity version of fmap,
// and the Node case is treated like a bifunctor composed with two copies of the Tree functor.
// As a C++ programmer, you’re probably not used to analyzing code in these terms,
// but it’s a good exercise in categorical thinking.
//
template<class A, class B>>
Tree<B>* fmap (std::function<B(A)> f, Tree<A>* t)
{
	Leaf<A>* p1 = dynamic_cast<Leaf<A>*>(t);
	if (p1) {
		B bLabel = f(p1->_label);
		return new Leaf<B>(bLabel);
	}

	Node<A>* pn = dynamic_cast<Node<A>*>(t);
	if (pn) {
		Tree<B>* bLeft  = f(pn->left);
		Tree<B>* bRight = f(pn->right);
		return new Node<B>(bLeft, bRight);
	}

	return nullptr;
}
