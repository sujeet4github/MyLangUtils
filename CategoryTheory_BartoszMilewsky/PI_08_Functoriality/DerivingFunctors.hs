{-# LANGUAGE DeriveFunctor #-}

// A perceptive reader might ask the question:
// If the derivation of the Functor instance for algebraic data types is so mechanical,
// can’t it be automated and performed by the compiler?
// Indeed, it can, and it is. You need to enable a particular Haskell extension by including 
// this line at the top of your source file: {-# LANGUAGE DeriveFunctor #-}
//
// and then add deriving Functor to your data structure:

data Maybe a = Nothing | Just a
  deriving Functor
// the corresponding fmap will be implemented for you.
