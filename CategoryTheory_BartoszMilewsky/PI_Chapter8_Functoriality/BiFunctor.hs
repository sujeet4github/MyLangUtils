// Let’s define a bifunctor in Haskell.
// In this case all three categories are the same: the category of Haskell types.
//
// A bifunctor is a type constructor that takes two type arguments.
//

// Here’s the definition of the Bifunctor typeclass taken directly from the library Control.Bifunctor:
//
class Bifunctor f where
    bimap :: (a -> c) -> (b -> d) -> f a b -> f c d
    bimap g h = first g . second h
    
    first :: (a -> c) -> f a b -> f c b
    first g = bimap g id
    
    second :: (b -> d) -> f a b -> f a d
    second = bimap id

// the type variable 'f' represents the bifunctor - it is always applied to two type arguments

// the bimap definition lifts (a -> c) -> (b -> d)   into   f a b -> f c d
//

// Category C  X Category D   = Category E
//   a -> c       b -> d      =  (f a b) -> (f c d)
//
// See Diagram: https://bartoszmilewski.files.wordpress.com/2015/01/bimap.jpg

// The two other type signatures, first and second, are the two fmaps
// witnessing the functoriality of f in the first and the second argument, respectively.
//
// See Diagram: https://bartoszmilewski.files.wordpress.com/2015/01/first.jpg and second.jpg

// NOTE: The typeclass definition provides:
// 1. the default implementation of bimap is in terms of first and second
// 2. default implementations for both of first and second in terms of bimap.
//
// When declaring an instance of Bifunctor, you have a choice of either implementing bimap and
// accepting the defaults for first and second, or implementing both first and second and
// accepting the default for bimap (of course, you may implement all three of them, but then
// it’s up to you to make sure they are related to each other in this manner).
