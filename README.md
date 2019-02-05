# sistema-ventas
Sistema CRUD de ventas y produccion (En Construcción) para comida rápida (copetin, hamburguesería)
Prueba en 

usuario desarrollador: user admin, password admin
usuario cajero: usuario cajero, password 1234
usuario vendedor: usuario vendedor, password 321

Modo de uso:
Cajero abre caja para iniciar los movimientos del día
Vendedor puede realizar pedidos que van al area de produccion (en construccion).
Una vez el cliente ha consumido su pedido se procede a la facturacion en la misma pantalla de pedidos
El vendedor pide los datos del cliente en caso de no haberse registrado o crea una factura sin nombre
Emite la factura y remite al cliente a la caja.
En caja el cliente presenta su factura.
El cajero busca el numero de factura en su pantalla para proceder al cobro.
Rellena los datos del cobro (Solo disponible efectivo, tarjeta en construccion) 
Registra el pago.
Al final del dia el cajero cierra la caja, el sistgma emite un resumen de monto apertura y de cierre.

Rest Api:
