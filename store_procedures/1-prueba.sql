select * from detalle_factura;
select * from factura;

CALL sp_EliminarProductoDeFactura(3,3);

select * from detalle_factura;