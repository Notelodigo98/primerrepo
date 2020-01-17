Funcion numero1<-muestra_numero(n)
	Definir numero1 como texto;
	Segun n hacer
		1: numero1<-"Uno";
		2: numero1<-"Dos";
		3: numero1<-"Tres";
		4: numero1<-"Cuatro";
		5: numero1<-"Cinco";
		6: numero1<-"Seis";
		7: numero1<-"Siete";
		8: numero1<-"Ocho";
		9: numero1<-"Nueve";
		10: numero1<-"Sota";
		11: numero1<-"Caballo";
		12: numero1<-"Rey";
	FinSegun
FinFuncion
Funcion palo<-muestra_palo(n)
	Definir palo como texto;
	Segun n hacer
		1:palo<-"Espada";
		2:palo<-"Oro";
		3:palo<-"Basto";
		4:palo<-"Copa";	
	FinSegun
FinFuncion
Funcion apuesta_valida <-apostar_dinero(limite)
	Definir apuesta_valida, ap como entero;
	repetir 
		Escribir "Introduce tu apuesta... mínimo 50 y máximo " limite;
		leer ap;
		si ap>limite Entonces
			Escribir "Apuesta no válida, es mayor que tu dinero (" limite ")";
		FinSi
		si ap<50 Entonces
			Escribir "Apuesta no válida, tiene que ser mayor o igual a 50";
		FinSi
		si ap>=50 y ap<=limite Entonces
			apuesta_valida<-ap;
		FinSi
Hasta Que apuesta_valida=ap
FinFuncion
Funcion  ap<-apostar_mayormenor()
	Definir ap como entero;
	Escribir "Introduce tu apuesta... la siguiente carta es: ";
	Escribir "1- Mayor";
	Escribir "2-Menor";
	leer ap;
FinFuncion
Funcion ganador<-comprueba_gana(ncarta1, ncarta2, apuesta_mayormenor)
	Definir  ganador Como Logico;
	si ncarta1<ncarta2 entonces 
		Escribir "La primera carta es menor que la segunda";
		si apuesta_mayormenor=1 Entonces
			ganador<- verdadero;
		SiNo
			ganador<-falso;
		FinSi
	FinSi
	si ncarta1>ncarta2 Entonces
		
		Escribir "La segunda carta es menor que la primera";
		si apuesta_mayormenor=1 Entonces
			ganador<- falso;
		SiNo
			ganador<-verdadero;
		FinSi
	FinSi
FinFuncion

Algoritmo cartas
	Definir ncarta1, ncarta2, npalo1, npalo2, dinero, apuesta_dinero, apuesta_mayormenor Como entero;
	definir jugar como texto;
	dinero<-500;
	Definir ganar, salir como logico;
	salir<-falso;
	ncarta1<-azar(12)+1;
	npalo1<-azar(4)+1;
	Escribir "Bienvenido al juego de las cartas";
	Escribir "-----------------------------------";
	Escribir "Tu dinero disponible es " dinero;
	Repetir
		
	 
	apuesta_dinero<-apostar_dinero(dinero);
	Escribir "Sacando carta...";
	Esperar 1 segundos;
	Escribir "La primera carta  es el " muestra_numero(ncarta1) " de " muestra_palo(npalo1) ;
	apuesta_mm<-apostar_mayormenor();
	ncarta2<-azar(12)+1;
	npalo2<-azar(4)+1;
	Escribir "Sacando carta...";
	Esperar 2 segundos;
	Escribir "La segunda carta  es el " muestra_numero(ncarta2) " de " muestra_palo(npalo2) ;
	
	gana<-comprueba_gana(ncarta1, ncarta2, apuesta_mm);
	si (gana) entonces 
		Escribir "... has ganado!!!";
		dinero<-dinero+apuesta_dinero;
	SiNo
		Escribir "...oohh...lo sentimos, has perdido...";
		dinero<-dinero-apuesta_dinero;
	FinSi 
	escribir "tu dinero ahora es de: " dinero;
	si dinero<50 
		salir<-verdadero;
		escribir "... lo sentimos, no te queda dinero... hasta otra, perdedor.";
	sino 
		Escribir "¿Quieres jugar otra vez? (s/n)";
		leer jugar;
		si jugar="n" o jugar="N" entonces
			salir<-Verdadero;
		FinSi
		
	FinSi
Hasta Que salir 
Escribir "Gracias por jugar... ¡hasta otra!";
	
FinAlgoritmo
