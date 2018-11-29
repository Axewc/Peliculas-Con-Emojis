import Data.Set
import qualified Data.Set
import Data.Char (ord)

f :: Int -> Maybe Int

f 0 = Nothing
f n = Nothing

formato :: [Char] -> [Char]
formato [] = []
formato (x:xs) 
			| (96 < y)&&(y < 125) = x : formato xs
			| (47 < y)&&(y < 58) = x : formato xs
			| (64 < y)&&(y  < 91) = toEnum(y + 32) : formato xs
			| otherwise = formato xs
			where
				y = ord x

jugar :: Int -> IO()
jugar x = do
	putStrLn("Ingrese su respuesta.")
	putStrLn (show x)
----------------------------------------------------------------
jugar :: Int -> Int -> IO()
jugar 0 y = do
	putStrLn "Se te han agotado las vidas. GAME OVER\nScore: 25"  
jugar x y = do
	putStrLn (repite x "<3")
	putStrLn (show x)
	--Selecciona la pelicual de la base de datos
	selecc
	let z = elemAt (selecc) (fromList set)
	putStrLn "¿Cúal es el nombre de la pelicula"
	putStrLn (snd z)
	respuesta <- getLine
	--Compara respuesta
	if ((fst z) == respuesta)
		then do
			putStrLn "CORRECTO"
			continuar <- seguir
			if(continuar)
				then do
					putStrLn ""
					jugar x (y+1)
					putStr ""
				else putStrLn "Saliendo"
		else do
			putStrLn "INCORRECTO" 
			continuar <- seguir
			if(continuar)
				then 
					do
					putStrLn ""
					jugar (x-1) y
					putStr ""
				else putStrLn "Saliendo"
	putStr ""
	where 
		set = [("1", "UNO"),("2", "DOS"),("3", "TRES")]

--Pregunta al usuario si desea continuar jugando
seguir :: IO(Bool)
seguir = do
	putStrLn "¿Quieres volver a jugar?"
	continuar <- getLine
	return (continuar == "s" || continuar == "S")

--Genera un String que consiste en la repeticion del string enviado Int veces
repite :: Int -> String -> String
repite 0 _ = ""
repite x y = y ++ " " ++ repite (x-1) y
