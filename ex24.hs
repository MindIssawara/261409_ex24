data Void = Void Void
-- implement functions that have the following types:
-- (a -> b -> c) -> (a -> b) -> a -> c
f1 :: (a -> b -> c) -> (a -> b) -> a -> c
f1 f g x = f x (g x)
--write a proof that corresponds to each of the written functions
-- (A ⇒ B ⇒ C) ⇒ (A ⇒ B) ⇒ (A ⇒ C)
-- Given a function f of type (a -> b -> c), applying a gives a function b -> c.  
-- Given a function g of type (a -> b), applying a gives b.  
-- For a given value x :: a, applying g to x gives g x :: b.  
-- Applying f to x and g x results in f x (g x) :: c.  
-- Thus, we have constructed a function a -> c, proving the proposition.


-- (a, b) -> Either a b
f2 :: (a, b) -> Either a b
f2 (x, _) = Left x
--write a proof that corresponds to each of the written functions
-- A ∧ B ⇒ (A ∨ B)
-- Given a pair (x, y) where x :: a and y :: b, we have access to both x and y.  
-- Since Either a b represents a choice between a and b, we can always construct Left x, which is of type Either a b.  
-- Thus, we have demonstrated that (a, b) can always be mapped to Either a b, proving the proposition.


-- (a -> b, a) -> b
f3 :: (a -> b, a) -> b
f3 (f,x) = f x
--write a proof that corresponds to each of the written functions
-- (A ⇒ B) ∧ A ⇒ B
-- Given a function f of type a -> b and a value x of type a, applying f to x gives f x of type b.  
-- This shows that (a -> b, a) is sufficient to produce b, proving the proposition.

-- Either (a -> Void) b -> a -> b
absurd :: Void -> a
absurd (Void x) = absurd x

f4 :: Either (a -> Void) b -> a -> b
f4 (Right b) _ = b
f4 (Left f) x = absurd (f x) 
--write a proof that corresponds to each of the written functions
-- (¬A ∨ B) ⇒ (A ⇒ B)
--Given Either (a -> Void) b:  
--     If we have Right b, we can immediately return b, since we already have a witness of b.  
--     If we have Left f where f :: a -> Void, we assume an x :: a.  
--     Applying f to x gives f x :: Void, which represents an impossible value.  
--     Since Void has no possible values, the function absurd :: Void -> a allows us to derive any value, including b.  
--     Thus, we have constructed a function of type a -> b, proving the proposition.
