-- To run the program:
--
-- Using GHCi:
--		1. Run "ghci main.hs".
--		2. Run the "main" function.
--		3. To reload after changes are made, run ":reload".
--
-- Using GHC:
--		1. Run "./build.sh".
--		2. Run "./guessing". The "guessing" file is the program.

import System.Random

main :: IO ()
main = do
	randomNumber <- randomRIO (1, 100) :: IO Integer
	print randomNumber -- get rid of later

	putStr "Enter a number between 1 and 100: "
	getLine

	return ()