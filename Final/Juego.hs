 import Pelicula
 import Text.Read
 import System.Random
 import Data.Set
 import Data.Char (ord)
 import Data.Emoji

 main :: IO()
 main = do
	opc <- usuario
	menu (opc)
	putStrLn "Bye Bye! \129303 \129303 \129303"

--Imprime en pantalla las instruccion del juego
 instruccion :: IO()
 instruccion = do
	putStrLn "INSTRUCIIONES DEL JUEGO\nAparecerán emojis que describan una película, tu tienes que escribir el nombre de la película.\nCada respuesta incorrecta te quita una vida, si la respueata es correcta tu score aumentara.\nObten tantos puntos puedas emojiretador  \128074 \128074 \128074"
	espera<- getLine
	putStr ""

--Dado un int que representa la opcion seleccionada por el usuario, realiza
--la accion correspondiente del menú.
 menu :: Int -> IO()
--Inicia el juego
 menu 1 = do 
 	putStrLn ""
	jugar 5 0
	z <- usuario
	menu z
	putStr ""
--Imprime las instrucciones
 menu 2 = do 
	instruccion
	z <- usuario
	menu z
	putStr ""
--Salir
 menu 3 = do
	putStr ""
--Si el usuario ingresa un numero invalido
 menu x = do
	putStrLn "No es una opción valida del menú"
	z <- usuario
	menu z

--Regresa un numero ingresado por el usuario
 usuario :: IO(Int)
 usuario = do
	putStrLn "-----MENÚ-----\n 1)Jugar \127918 \n 2)Instrucciones \128221 \n 3)Salir \10060"
	coman <- getLine 
	--Nos aseguramos que la cadena ingresada por el usuario sea un numero
	case readMaybe coman :: Maybe Int of
		Just x -> return x
		Nothing -> putStrLn "Solo ingrese el numero de la instrucción correspondiente" >> usuario

--Dada una cadena, elimina los espacios y caracteres especiales ademas de pasarla
--a minusculas
 formato :: [Char] -> [Char]
 formato [] = []
 formato (x:xs) 
			| (96 < y)&&(y < 125) = x : formato xs
			| (47 < y)&&(y < 58) = x : formato xs
			| (64 < y)&&(y  < 91) = toEnum(y + 32) : formato xs
			| otherwise = formato xs
			where
				y = ord x

--La funcion genera el juego de adivida la pelicula. El primer int representa 
--las vidas del jugador, mientras que el segundo int representa su score. Si 
--y solo si el jugador tiene vidas mayores a 0 el juego continua hasta que el 
--usuario decida deternerlo.
 jugar :: Int -> Int -> IO()
 jugar 0 y = do
	putStr "GAME OVER \128128 \nFinal Score: "
	putStrLn (show y)
	putStrLn ""
 jugar x y = do
	putStrLn (repite x "\10084")
	putStr "Score: "
	putStrLn (show y)
	--Selecciona la pelicual de la base de datos
	z <- selecc
	putStrLn "¿Cúal es el nombre de la pelicula"
	putStrLn (snd z)
	respuesta <- getLine
	--Compara respuesta
	if (formato(fst z) == formato(respuesta))
		then do
			putStrLn "\10004"
			continuar <- seguir
			if(continuar)
				then do
					putStrLn ""
					jugar x (y+1)
					putStr ""
				else putStrLn "Saliendo"
		else do
			putStrLn "\10060" 
			continuar <- seguir
			if(continuar)
				then 
					do
					putStrLn ""
					jugar (x-1) y
					putStr ""
				else putStrLn "Saliendo"
	putStr ""

--Pregunta al usuario si desea continuar jugando
 seguir :: IO(Bool)
 seguir = do
	putStrLn "¿Quieres volver a jugar? (s/n)"
	continuar <- getLine
	return (continuar == "s" || continuar == "S")

--Genera un String que consiste en la repeticion del string enviado Int veces
 repite :: Int -> String -> String
 repite 0 _ = ""
 repite x y = y ++ " " ++ repite (x-1) y
