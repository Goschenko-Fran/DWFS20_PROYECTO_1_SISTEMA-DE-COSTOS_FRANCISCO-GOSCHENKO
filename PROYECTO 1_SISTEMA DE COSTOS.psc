Algoritmo SistemaDeCostosZapateriaOnline
	
	// 	DEFINICION DE TEXTOS
	Definir Marca_Zapatillas, Modelo_Zapatillas, Codigo_Descuento, Destino_Envio, Respuesta_Cupon Como Cadena
	// DEFINICION DE VALORES
	Definir Cantidad_Unidades, i Como Entero
    Definir Descuento_Cupon, Descuento_Cantidad ,Impuestos, Envio Como Real
	// DEFINICION DE SUB-TOTALES
	Definir Subtotal_Cupon, Subtotal_Impuestos, Subtotal_Cantidad, Subtotal_Envio Como Real
	// 	DEFINICION DE TOTAL
	Definir Costo_Final Como Real
	
	// CONSTANTES
	PRECIO_ORIGINAL = 100 // valor de 1 par de zapatos
	PORCENTAJE_CUPON = 0.1 // es 10% cupon
	IVA = 0.12 // es 12% de iva.
	PORCENTAJE_CANTIDAD = 0.05 // es 5% por compra de 2 pares.
    COSTO_FIJO = 10 // valor para toda ciudad.
	KG_ZAPATO = 1.5 // kilos por cada Par.
	VALOR_KG = 2 // valor fijo
	
	// solicitud de info. a cliente.
	Escribir "------------------------------------------"
	Escribir "**** BIENVENIDO A ZAPATILLAS ONLINE ****"
	Escribir "------------------------------------------"
	Escribir "Inserta tu MARCA, luego MODELO de zapatilla seleccionado:"
	Leer Marca_Zapatillas, Modelo_Zapatillas
	Escribir  "Ingresa el numero que quieres adquirir:"
	Leer Cantidad_Unidades 
	
	// Solicitud de cupon de descuento.
	Escribir "¿Tienes un cupon de Descuento?, contesta usando minusculas -si- o -no-"
	Leer Respuesta_Cupon
	// NO TIENE CUPON.
	Si Respuesta_Cupon = "no" Entonces
		Escribir "** TRANQUILO, te enviaremos uno para tu proxima compra **"
	FinSi
	// SI TIENE CUPON.
	Si Respuesta_Cupon = "si" Entonces
		Escribir "** GENIAL **"
		Escribir "Ingresa tu CODIGO, recuerda usar solo minusculas" // Codigo es sale10%
		Leer Codigo_Descuento
		Si Codigo_Descuento = "sale10%" Entonces
			Escribir "** FABULOSO, YA TIENES TU CUPON ACTIVADO " PORCENTAJE_CUPON *100 "% **"
		SiNo // Que pasa cuando NO tiene
			Escribir "CODIGO INCORRECTO, lee tu codigo y escribelo en letras minusculas nuevamente."	
		FinSi
	FinSi
	// Validar respuesta de cupon.
	Si Respuesta_Cupon <> "si" y Respuesta_Cupon <> "no" Entonces
		Escribir "Debes contestar: -si- o no-"
		Escribir "En minusculas como se muestra en pantalla" 
		Leer Respuesta_Cupon
	FinSi
	
FinAlgoritmo

