-- To run the program:
--
-- Using GHCi:
--		1. Run "ghci main.hs".
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

	putStr "Guess a number between 1 and 100: "
	getGuessAndCheckAgainst randomNumber 10

getGuessAndCheckAgainst :: Integer -> Integer -> IO ()
getGuessAndCheckAgainst _ 0 = putStrLn "You Lose. Boo."
getGuessAndCheckAgainst realNumber guessesLeft = do
	guess <- getLine
	b <- checkGuess (read guess) realNumber

	-- if CONDITION then TRUE else FALSE
	if b
		then return ()
		else getGuessAndCheckAgainst realNumber $ guessesLeft - 1

checkGuess :: Integer -> Integer -> IO Bool
checkGuess guess realNumber
	| guess < realNumber = do
		putStrLn "Too low. Guess again."
		return False

	| guess > realNumber = do
		putStrLn "Too high. Guess again."
		return False

	| otherwise = do
		putStrLn "Good guess. You win."
		return True