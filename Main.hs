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

main :: IO()
main = do
	opc <- usuario
	menu (opc)
	putStrLn "ADIOS"

--Imprime en pantalla las instruccion del juego
instruccion :: IO()
instruccion = do
	putStrLn "INSTRUCIIONES DEL JUEGO\nSe proyectaran una seria de emojis y ustedes debe decidir que pelicula es\n\nPresione enter para continuar"
	espera<- getLine
	putStrLn ""

--Dado un int que representa la opcion seleccionada por el usuario, realiza
--la accion correspondiente del menú.
menu :: Int -> IO()
menu 1 = do 
	jugar 5
	z <- usuario
	menu z
	putStrLn ""
menu 2 = do 
	instruccion
	z <- usuario
	menu z
	putStrLn ""
menu 3 = do
	putStr ""
menu x = do
	putStrLn "No es una opción valida del menú"
	z <- usuario
	menu z

--Regresa un numero ingresado por el usuario
usuario :: IO(Int)
usuario = do
	putStrLn "---MENÚ---\n 1)Jugar\n 2)Instrucciones\n 3)Salir"
	coman <- getLine 
	--Nos aseguramos que la cadena ingresada por el usuario sea un numero
	case readMaybe coman :: Maybe Int of
		Just x -> return x
Nothing -> putStrLn "Solo ingrese el numero de la instrucción correspondiente" >> usuario
