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
	// ARREGLO DE PRECIO UNITARIO
	Definir Precio_Unitario Como Real
	Dimension Precio_Unitario[100]
	
	// CONSTANTES
	PRECIO_ORIGINAL = 100
	PORCENTAJE_CUPON = 0.1 // es 10% 
	IVA = 0.12 // es 12%
	PORCENTAJE_CANTIDAD = 0.05 // es 5% por 2 pares.
    COSTO_FIJO = 10 // para toda ciudad.
	KG_ZAPATO = 1.5 // por cada Par.
	VALOR_KG = 2 
	
	// solicitud de info. a cliente.
	Escribir "------------------------------------------"
	Escribir "**** BIENVENIDO A ZAPATILLAS ONLINE ****"
	Escribir "------------------------------------------"
	Escribir "Inserta tu MARCA, luego MODELO de zapatilla seleccionado:"
	Leer Marca_Zapatillas, Modelo_Zapatillas
	Escribir  "Ingresa el numero que quieres adquirir:"
	Leer Cantidad_Unidades 
	
	Repetir
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
	Hasta Que Respuesta_Cupon = "si" o Respuesta_Cupon = "no"
	
	Escribir ""
	Escribir  "** LISTO STOCK VERIFICADO **"
	Escribir ""
	
	// Aplicar el descuento de cupon.
	Si Respuesta_Cupon = "si" Entonces
		Descuento_Cupon <- PRECIO_ORIGINAL * PORCENTAJE_CUPON
		Escribir  Descuento_Cupon 
		Subtotal_Cupon <- PRECIO_ORIGINAL - Descuento_Cupon
		Escribir Subtotal_Cupon 
	SiNo
		Subtotal_Cupon = 0
		Escribir Subtotal_Cupon 
	FinSi
	
	// Aplicar Impuestos.
	Si Respuesta_Cupon = "si" Entonces
		Impuestos <- Subtotal_Cupon * IVA
		Escribir Impuestos 
		Subtotal_Impuestos <- Subtotal_Cupon + Impuestos
		Escribir Subtotal_Impuestos 
	SiNo
		Impuestos <- PRECIO_ORIGINAL * IVA
		Escribir Impuestos 
		Subtotal_Impuestos <- PRECIO_ORIGINAL + Impuestos
		Escribir Subtotal_Impuestos 
	FinSi
	
	// Aplicar el descuento por cantidad 5%
	Si Cantidad_Unidades >= 2 Entonces
		Descuento_Cantidad <- Subtotal_Impuestos * PORCENTAJE_CANTIDAD
		Escribir Descuento_Cantidad 
	SiNo
		Si Cantidad_Unidades < 2 Entonces
			Descuento_Cantidad = 0
			Escribir Descuento_Cantidad 
		FinSi
	FinSi
	Subtotal_Cantidad <- (Subtotal_Impuestos - Descuento_Cantidad)
	Escribir  Subtotal_Cantidad 
	
	Escribir "------------------------------------------"
	Escribir "INFORMACION DE ENVIO: "
	
	//Calcular costo de Envio.
	Escribir "Ingresa tu direccion para envio: Ciudad / Calle / Edificio / Depto. "
	Leer Destino_Envio
	Escribir ""
	Escribir "*** CALCULANDO ENVIO ***"
	Escribir "Envio Confirmado, tu compra llegara en 5 dias Habiles"
	Escribir ""
	Escribir "------ ***** PROCESANDO INFORMACION DE COMPRA ***** ------"
	Envio <- COSTO_FIJO + (VALOR_KG * KG_ZAPATO * Cantidad_Unidades)
	Escribir Envio 
	Subtotal_Envio <- (Subtotal_Cantidad * Cantidad_Unidades) + Envio
	Escribir Subtotal_Envio
	
	// Calcular Costo Final.
	Costo_Final <- ((PRECIO_ORIGINAL - Descuento_Cupon + Impuestos) - Descuento_Cantidad) * Cantidad_Unidades + Envio
	Escribir Costo_Fin
	// ARREGLO CON PRECIO UNITARIO FINAL
	Para i <- 1 Hasta Cantidad_Unidades
		Precio_Unitario[i] <- (Costo_Final / Cantidad_Unidades) - (Envio / Cantidad_Unidades)
	FinPara
	
	// RESUMEEN DE COMPRA.
	Escribir ""
	Escribir "*** RESUMEN DE COMPRA ***"
	Escribir ""
	Escribir "Valor Unit. zapatillas: $" PRECIO_ORIGINAL
	Escribir "Unidades Adquiridas: 0" Cantidad_Unidades " Und. / Marca & Modelo: " Modelo_Zapatillas
	Escribir "Valor Neto: $" PRECIO_ORIGINAL * Cantidad_Unidades
	
	Escribir "------------------------------------------"
	Escribir "Cupon de descuento ingresado: *"  Respuesta_Cupon "*"
	Escribir "Cupon: " PORCENTAJE_CUPON * 100 "% / MONTO DE AHORRO: $" Descuento_Cupon * Cantidad_Unidades
	Escribir "Valor Neto con Descuento: $" Subtotal_Cupon * Cantidad_Unidades
	Escribir "Total / IVA 12%: $" Impuestos * Cantidad_Unidades
	Escribir "SUB-TOTAL: $" Subtotal_Impuestos * Cantidad_Unidades
	
	Escribir "------------------------------------------"
	Escribir "DESCUENTO COMPRAS AL MAYOR " PORCENTAJE_CANTIDAD * 100 "% / AHORRO: $" Descuento_Cantidad * Cantidad_Unidades
	Escribir "SUB-TOTAL: $" Subtotal_Cantidad * Cantidad_Unidades
	Escribir "------------------------------------------"
	
	// EJECUCION DERREGLO.
	Escribir "*** Detalle Unitario ***"
	Para i <- 1 Hasta Cantidad_Unidades
		Escribir Modelo_Zapatillas " Item ", i, ": $" Precio_Unitario[i]
	FinPara
	
	Escribir "------------------------------------------"
	Escribir "Direccion de Entrega: " 
	Escribir Destino_Envio
	Escribir "Valor Envio: $" Envio " *Libre de impuestos*"
	
	Escribir "------------------------------------------"
	Escribir "TOTAL A PAGAR: $" Costo_Final // Si tiene cupon y compra 2 el valor 207.52 - No tiene cupon y compra 2 el valor 228.80
	Escribir ""
	Escribir "*** Gracias por tu Compra ***"
	
FinAlgoritmo

