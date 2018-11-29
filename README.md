# Practica_6
Casas Espinosa Axel 316218849
Rivera Garcia Ignacio 316284457
Santiago Carrillo Braulio Aaron  316272560

se ejecuta con:

$ ghc Juego.hs
$ ./Juego


Modelo usado en la practica:


A las películas que se incluyen en el juego las unimos en una lista y con una función 
al darle un entero nos regresa la tupla con el nombre de la cadena y los emojis asociados.

En el cuerpo del proyecto el usuario tiene 3 opciones: jugar, instrucciones y salir:

	Salir termina el programa y da un mensaje de despedida

	Instrucciones imprime las instrucciones :D
	
	Jugar es una función que requiere 2 enteros (vidas) y (score) al empezar jugar se imprimen los emojis y el usuario escribirá el nombre de la película, 
	esta cadena es mandada a una función  que le da un formato (para evaluarla si tiene errores mínimos, espacios, caracteres raros, etc.). 
	La película de la lista recibe el mismo formato y se comparan, si acierta se le suma 1 al score y si falla no se afecta al score que tiene y se le resta una vida, 
	hasta que se le acaben las vidas el juego sigue y al final se imprime el score.

Notas:
-Si los emojis no se ven quite los comentarios del archivo Paliculas.hs
