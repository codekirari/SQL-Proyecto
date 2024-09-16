DELIMITER //
CREATE PROCEDURE sp_EliminarProductoDeFactura(
    IN idCatalogo INT,
    IN idFactura INT
)
BEGIN
    DELETE FROM detalle_factura
    WHERE id_catalogo = idCatalogo AND id_factura = idFactura;
    
	delete from factura
    where id_factura = idFactura;
END  //
DELIMITER ;

-- Uso
-- CALL sp_EliminarProductoDeFactura(2,2);