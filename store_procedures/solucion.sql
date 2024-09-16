DELIMITER //
CREATE PROCEDURE sp_EliminarProductoDeFactura(
    IN idCatalogo INT,
    IN idFactura INT
)
BEGIN
    DELETE FROM detalleFactura
    WHERE idCatalogo = idCatalogo AND idFactura = idFactura;
END  //
DELIMITER ;