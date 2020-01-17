Funcion lanzamiento<-lanzamiento_moneda()
	Definir lanzamiento como texto;
	Segun azar(2) Hacer
		0:
			lanzamiento<-"Cara";
		1:
			lanzamiento<-"Cruz";
	Fin Segun
FinFuncion

Funcion ac<-apuesta()
	definir ac como texto;
	definir n como entero;
	Escribir "Apuesta: Cara o Cruz";
	Escribir "1. Cara";
	Escribir "2. Cruz";
	Leer n;
	Segun n Hacer
		1: ac<-"Cara";
		2:ac<-"Cruz";
		Fin Segun
FinFuncion
Funcion apuesta_valida <-apostar_dinero(dinero)
	Definir apuesta_valida, ap como entero;
	repetir 
		Escribir "Introduce tu apuesta... mínimo 20 y máximo " dinero;
		leer ap;
		si ap>dinero Entonces
			Escribir "Apuesta no válida, es mayor que tu dinero (" dinero ")";
		FinSi
		si ap<20 Entonces
			Escribir "Apuesta no válida, tiene que ser mayor o igual a 20";
		FinSi
		si ap>=20 y ap<=dinero Entonces
			apuesta_valida<-ap;
		FinSi
	Hasta Que apuesta_valida=ap
FinFuncion
Funcion A <- salida ( A,B )
	Definir x como caracter;
	si (B>0) Entonces
		Escribir "Quieres seguir s/n tienes " B;
		leer x;
		si (x=="s") Entonces
			A=Verdadero;
			Limpiar Pantalla;
		SiNo
			A=Falso;
			Escribir "Gracias por jugar";
		FinSi
	SiNo
		A=Falso;
		Escribir "No tienes dinero ADIOS";
	FinSi
FinFuncion



Proceso Apuestamoneda
	Definir cantidad, apuesta_valida, dinero como entero;
	Definir lanzamiento, ac como texto;
	definir A como logico;
	dinero<-100;
	Escribir "Hola, bienvenidx a CaraOCruz, para inciar el juego debes hacer una apuesta, ¿Cuanto desea apostar?";
	apuesta_valida <-apostar_dinero(dinero);
	lanzamiento<-lanzamiento_moneda();
	ac<-apuesta();
	Si lanzamiento==ac Entonces
		Escribir "Enhorabuena, escogiste " ac " y ha salido " lanzamiento;
		dinero<-dinero+apuesta_valida;
	Sino
		Escribir "Lo siento, escogiste " ac " y ha salido " lanzamiento;
		dinero<-dinero-apuesta_valida;
	Fin Si
	Escribir "Tu saldo es " dinero ;
	A<-salida(A,dinero);
FinProceso
