// We want to describe chemical elements by combining:
// two strings, name and symbol;
// and an integer, the atomic number;
// into one data structure.
//
// We could use a tuple (String, String, Int) for this
// but a more expressive way to do it is:
//
data Element = Element { name         :: String
                       , symbol       :: String
                       , atomicNumber :: Int }

// This is isomorphic with the tuple, because of the conversion functions
// note that the conversion functions are inverses of each other

tupleToElem :: (String, String, Int) -> Element
tupleToElem (n, s, an) = Element { name = n
                                 , symbol = s
                                 , atomicNumber = an }

elemToTuple :: Element -> (String, String, Int)
elemToTuple e = (name e, symbol e, atomicNumber e)

