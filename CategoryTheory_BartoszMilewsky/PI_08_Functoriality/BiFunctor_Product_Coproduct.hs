// An important example of a bifunctor is the categorical product — a product of two objects that
// is defined by a universal construction.
// If the product exists for any pair of objects, the mapping from those objects to the product is bifunctorial.

// Bifunctor instance for a pair constructor - the simplest product type
instance Bifunctor (,) where
    bimap f g (x, y) = (f x, g y)

// By duality, a coproduct, if it’s defined for every pair of objects in a category, is also a bifunctor.

// Bifunctor instance for the Either type:
instance Bifunctor Either where
   bimap f _ (Left x)  = Left (f x)
   bimap _ g (Right y) = Right (g y)

