module Util where

splitOn :: (Eq a) => a -> [a] -> [[a]]
splitOn s l = case dropWhile (==s) l of
  [] -> []
  s' -> w : splitOn s s''
    where (w, s'') = break (==s) s'

windows :: Int -> [a] -> [[a]]
windows a bs =
  if length bs < a
  then []
  else take a bs : windows a (drop a bs)

twoTuple :: [a] -> (a, a)
twoTuple [a, b] = (a, b)

threeTuple :: [a] -> (a, a, a)
threeTuple [a, b, c] = (a, b, c)

one :: [a] -> Maybe a
one [a] = Just a
one [] = Nothing

removeSpace :: String -> String
removeSpace = filter (/=' ')

vertSlice :: Int -> [[a]] -> [a]
vertSlice a = map ((flip (!!)) a)

readInts :: [String] -> [Int]
readInts = map (read :: String -> Int)

sequences :: Int -> [a] -> [[a]]
sequences a bs =
  if length cs == a
  then cs : sequences a (tail bs)
  else []
  where cs = take a bs

allUnique :: (Eq a) => [a] -> Bool
allUnique [] = True
allUnique (x:xs) = (not $ elem x xs) && allUnique xs
