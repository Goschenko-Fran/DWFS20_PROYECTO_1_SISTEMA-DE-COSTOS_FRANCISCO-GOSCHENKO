README - SistemaDeCostosZapateriaOnline

📋 Descripción General
Este proyecto simula un sistema de compras en línea para una zapatería. El algoritmo permite calcular automáticamente el costo final de una compra considerando descuentos por cupones, descuentos por cantidad, impuestos y costos de envío.

🔧 Funcionalidades
- Cupón de descuento (sale10%) válido por un 10% de rebaja.
- Descuento adicional por compras desde 2 unidades.
- Cálculo automático de impuestos (IVA).
- Costo de envío personalizado por peso y cantidad.
- Desglose por unidad de zapatillas con precio final (sin envío).
- Mensajes personalizados y amigables al usuario.

🧮 Fórmulas Usadas
- Descuento cupón: PRECIO_ORIGINAL * 10%
- IVA: Subtotal * 12%
- Descuento por cantidad: Subtotal * 5% si se compran 2 o más unidades.
- Costo de envío: COSTO_FIJO + (VALOR_KG * KG_ZAPATO * Cantidad)
- Costo final por unidad: (CostoFinal - Envío) / Cantidad

🧾 Variables y Constantes
Marca_Zapatillas (Cadena): Marca ingresada por el usuario
Modelo_Zapatillas (Cadena): Modelo ingresado por el usuario
Cantidad_Unidades (Entero): Número de zapatillas adquiridas
Codigo_Descuento (Cadena): Código promocional
Precio_Unitario[] (Real): Arreglo con precios finales por unidad (sin envío)
🧾 Constantes
PRECIO_ORIGINAL: Precio base de una zapatilla ($100)
PORCENTAJE_CUPON: 10% de descuento
IVA: 12% de impuesto
PORCENTAJE_CANTIDAD: 5% por cada 2 pares
COSTO_FIJO: Costo base de envío
VALOR_KG, KG_ZAPATO: Parámetros del cálculo por peso para envío

💬 Interacción del Usuario
1. Ingresa marca y modelo.
2. Ingresa número de unidades a comprar.
3. Indica si tiene cupón (sí o no).
4. Si tiene, debe ingresar el código correcto (sale10%).
5. Ingresa la dirección para el envío.
6. Recibe un resumen con detalles de descuento, impuestos, total y envío.

📌 Requisitos
- Tener instalado PSeInt.
- Entender conceptos básicos de algoritmos: condicionales, bucles, variables y arreglos.

✅ Ejemplo de Uso
Si un usuario compra 2 zapatillas, usa el cupón válido (Código Cupon:sale10%), y entrega su dirección, el algoritmo le entrega:

Valor Neto Unit. zapatilla: $100 (inalterable por cliente)
Unidades Adquiridas: 2 Und.
Marca: ADIDAS
Modelo: Barreda Decode
TOTAL A PAGAR: $207.52

🧠 Consideraciones
- Solo se acepta un cupón válido: sale10%
- El sistema insiste hasta que el usuario ingrese correctamente "sí" o "no" al preguntar por el cupón.
- El precio de envío es fijo + variable por cantidad (peso).
- El IVA se aplica sobre el subtotal con o sin descuento, según corresponda.

Autor:
Francisco Emilio Goschenko Torres
franchenko@gmail.com

Desarrollado en PSeInt.
