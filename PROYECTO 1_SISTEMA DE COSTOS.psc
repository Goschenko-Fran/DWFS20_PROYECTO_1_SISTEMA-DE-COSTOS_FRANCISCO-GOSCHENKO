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
	Dimension Precio_Unitario[101]
	
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
	Escribir "Inserta nombres de MARCA y luego MODELO de zapatilla seleccionado:"
	Leer Marca_Zapatillas, Modelo_Zapatillas
	Escribir  "Ingresa numero de zapatillas (" Marca_Zapatillas, " " Modelo_Zapatillas ") que quieres adquirir:"
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
			Repetir
			Leer Codigo_Descuento
			Si Codigo_Descuento = "sale10%" Entonces
				Escribir "** FABULOSO, CUPON DE " PORCENTAJE_CUPON *100 "% ACTIVADO **"
			SiNo // Que pasa cuando NO tiene
				Escribir "CODIGO INCORRECTO, lee tu codigo y escribelo en letras minusculas nuevamente."	
			FinSi
			Hasta Que Codigo_Descuento = "sale10%"
		FinSi
		// Validar respuesta de cupon.
		Si Respuesta_Cupon <> "si" y Respuesta_Cupon <> "no" Entonces
			Escribir "Debes contestar: -si- o no-"
			Escribir "En minusculas como se muestra en pantalla" 
			Leer Respuesta_Cupon
		FinSi
	Hasta Que Respuesta_Cupon = "si" o Respuesta_Cupon = "no"
	Escribir "        -ENTER- para continuar"
	Leer ENTER
	Escribir "------ ***** VERIFICADO STOCK ***** ------"
    Escribir "               -Confirmado-"
	
	// Aplicar el descuento de cupon.
	Si Respuesta_Cupon = "si" Entonces
		Descuento_Cupon <- PRECIO_ORIGINAL * PORCENTAJE_CUPON
		Subtotal_Cupon <- PRECIO_ORIGINAL - Descuento_Cupon
	SiNo
		Subtotal_Cupon = 0
	FinSi
	
	// Aplicar Impuestos.
	Si Respuesta_Cupon = "si" Entonces
		Impuestos <- Subtotal_Cupon * IVA
		Subtotal_Impuestos <- Subtotal_Cupon + Impuestos
	SiNo
		Impuestos <- PRECIO_ORIGINAL * IVA
		Subtotal_Impuestos <- PRECIO_ORIGINAL + Impuestos
	FinSi
	
	// Aplicar el descuento por cantidad 5%
	Si Cantidad_Unidades >= 2 Entonces
		Descuento_Cantidad <- Subtotal_Impuestos * PORCENTAJE_CANTIDAD
	SiNo
		Si Cantidad_Unidades < 2 Entonces
			Descuento_Cantidad = 0
		FinSi
	FinSi
	Subtotal_Cantidad <- (Subtotal_Impuestos - Descuento_Cantidad)
	
	//Calcular costo de Envio.
	Escribir ""
	Escribir "INFORMACION DE ENVIO: "
	Escribir "Ingresa tu direccion para envio: Ciudad / Calle / Edificio / Depto. "
	Leer Destino_Envio
	Escribir ""
	Escribir "------ ***** VERIFICANDO ENVIO ***** ------"
	Escribir "               -Confirmado-"
	Escribir ""
	Escribir "------ ***** PROCESANDO INFORMACION DE COMPRA ***** ------"
	Escribir "                 -ENTER- para continuar"
	Leer ENTER
	Envio <- COSTO_FIJO + (VALOR_KG * KG_ZAPATO * Cantidad_Unidades)
	Subtotal_Envio <- (Subtotal_Cantidad * Cantidad_Unidades) + Envio
	
	// Calcular Costo Final.
	Costo_Final <- ((PRECIO_ORIGINAL - Descuento_Cupon + Impuestos) - Descuento_Cantidad) * Cantidad_Unidades + Envio
	
	// ARREGLO CON PRECIO UNITARIO FINAL
	Para i <- 1 Hasta Cantidad_Unidades
		Precio_Unitario[i] <- (Costo_Final / Cantidad_Unidades) - (Envio / Cantidad_Unidades)
	FinPara
	
	// RESUMEEN DE COMPRA.
	Escribir ""
	Escribir "*** RESUMEN DE COMPRA ***"
	Escribir ""
	Escribir "Valor Neto Unit. zapatilla: $" PRECIO_ORIGINAL
	Escribir "Unidades Adquiridas: " Cantidad_Unidades " Und."
    Escribir  "Marca y Modelos: " Marca_Zapatillas " - " Modelo_Zapatillas
	Escribir "Valor Neto Zapatillas: $" PRECIO_ORIGINAL * Cantidad_Unidades
	
	Escribir "------------------------------------------"
	Escribir "Cupon de descuento ingresado: *"  Respuesta_Cupon "*"
	Escribir "Cupon: " PORCENTAJE_CUPON * 100 "% / MONTO DE AHORRO: $" Descuento_Cupon * Cantidad_Unidades
	Escribir "Valor Neto con Descuento: $" Subtotal_Cupon * Cantidad_Unidades
	Escribir "IVA 12%: $" Impuestos * Cantidad_Unidades
	Escribir "TOTAL: $" Subtotal_Impuestos * Cantidad_Unidades
	
	Escribir "------------------------------------------"
	Escribir "DESCUENTO *COMPRAS AL MAYOR " PORCENTAJE_CANTIDAD * 100 "%* / AHORRO: $" Descuento_Cantidad * Cantidad_Unidades
	
	// EJECUCION DERREGLO PARA VALORES POR UNIDAD SIN ENVIO
	Escribir ""
	Escribir "*** Detalle Unidades ***"
	Escribir ""
	Para i <- 1 Hasta Cantidad_Unidades
		Escribir Marca_Zapatillas, " " Modelo_Zapatillas " Item ", i, ": $" Precio_Unitario[i]
	FinPara
	Escribir ""
	
	Escribir "TOTAL: $" Subtotal_Cantidad * Cantidad_Unidades
	Escribir "------------------------------------------"
	
	Escribir "VALOR ENVIO: $" Envio " *Libre de impuestos*"
	Escribir "Direccion de Entrega: " 
	Escribir Destino_Envio
	Escribir "*** Entrega en 05 dias Habiles ***"
	Escribir "      ** Compañia : UPS **"
	Escribir "      ** GUIA:#134679852 **"
	
	Escribir "------------------------------------------"
	Escribir "TOTAL A PAGAR: $" Costo_Final // Si tiene cupon y compra 2 el valor 207.52 - No tiene cupon y compra 2 el valor 228.80
	Escribir "------------------------------------------"
	Escribir " *** Gracias por tu Compra ***"
	Escribir "   ** Garantia de 90 dias ** "
	Escribir ""
	
FinAlgoritmo

