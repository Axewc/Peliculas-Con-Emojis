import Data.Char (ord)

f :: Int -> Maybe Int

f 0 = Nothing
f n = Nothing

formato :: [Char] -> [Char]
formato [] = []
formato (x:xs) 
			| (96 < y)&&(y < 125) = x : formato xs
			| (64 < y)&&(y  < 91) = toEnum(y + 32) : formato xs
			| otherwise = formato xs
			where
				y = ord x
jugar :: Int -> Maybe Int
jugar x = do
	putStrLn("Ingrese su respuesta.")
	resp <- getLine
	formato resp
	formato a
	if (a == resp)
		then putStrLn("Bien")
		else putStrLn("Mal")
	putStrln("¿Desea volver a jugar?")
	sal <- getLine
	if (sal == 'y')
		then jugar x
		else Nothing --Random ara
	where a = "El señor de"

resta :: Int -> Int
resta x = x-1
