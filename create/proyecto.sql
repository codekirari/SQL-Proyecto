drop TABLE IF EXISTS Cliente;
CREATE TABLE Cliente (
    id_cliente INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Celular VARCHAR(50),
    Direccion VARCHAR(255),
    Programa VARCHAR(100),
    Detalles_Adicionales TEXT
);
drop TABLE IF EXISTS empresa;
Create table empresa
(
id_empresa INT NOT NULL PRIMARY KEY,
nombre_empresa varchar(50),
administrador_empresa varchar(35),
correo varchar(40),
telefono_contacto varchar(20)
);
drop TABLE IF EXISTS catalogo;

CREATE TABLE catalogo (
id_catalogo INT NOT NULL PRIMARY KEY,
quien_lo_vende VARCHAR(50),
id_empresa INT NOT NULL,
sede_que_lo_usa VARCHAR(100),
que_Viene VARCHAR(50),
material VARCHAR(50),
tallas_disponibles VARCHAR(20),
precio DECIMAL(8,2),
FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa)
);

drop TABLE IF EXISTS Uniforme_Personalizado;
CREATE TABLE Uniforme_Personalizado (
id_uniforme_personalizado INT NOT NULL PRIMARY KEY,
id_cliente INT NOT NULL,
material VARCHAR(50),
Forro VARCHAR(50),
Cremallera VARCHAR(50),
Cuello VARCHAR(50),
Punio VARCHAR(50),
Bolsillo_Interior VARCHAR(50),
Bolsillo_Exterior VARCHAR(50),
Capota VARCHAR(50),
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

drop TABLE IF EXISTS pedido;
CREATE TABLE pedido (
id_cliente INT NOT NULL,
fecha DATETIME,
estado VARCHAR(20),
talla VARCHAR(20),

FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);
drop TABLE IF EXISTS metodoDePago;
CREATE TABLE metodoDePago (
id_cliente INT NOT NULL,
metodo VARCHAR(50),
confirmacion_De_Pago VARCHAR(200),
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);


DROP TABLE IF EXISTS factura;
CREATE TABLE factura (
    id_factura INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_catalogo INT NOT NULL,
    id_cliente INT NOT NULL,
    id_uniforme_personalizadodetalle_facturauniforme_personalizado INT,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_catalogo) REFERENCES catalogo(id_catalogo)
);
 
DROP TABLE IF EXISTS detalle_factura;
CREATE TABLE detalle_factura (
    id_detalle_factura INT NOT NULL PRIMARY KEY,
    id_factura INT NOT NULL,
    id_catalogo INT,
    id_uniforme_personalizado INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_factura) REFERENCES factura(id_factura),
    FOREIGN KEY (id_catalogo) REFERENCES catalogo(id_catalogo),
    FOREIGN KEY (id_uniforme_personalizado) REFERENCES Uniforme_Personalizado(id_uniforme_personalizado)
);
 
 
INSERT INTO Cliente (id_cliente, Nombre, Email, Celular, Direccion, Programa, Detalles_Adicionales)
VALUES
    (456789, 'Joanna', 'GKJFHJDGF666@JHK.GH', '1414414', '98J7R', 'Program 1', 'Additional details here'),
    (123456, 'Carlos', 'carlos@example.com', '123456789', 'Calle 123', 'Program 2', 'Detalles adicionales A'),
    (234567, 'Maria', 'maria@example.com', '987654321', 'Avenida 456', 'Program 3', 'Detalles adicionales B'),
    (452890, 'Felipe', 'f@example.com', '5465763498', 'Uhfudis7', 'CGML 4', 'Detalles'),
    (534934, 'Samary', 'sa@example.com', '452876', 'Gfykjdnm', 'Servicios 5', 'Detalles'),
    (804545, 'Antonio', 'an@example.com', '43456567', 'EDTRYFTGUY', 'Mercadeo 6', 'Detalles'),
    (808545, 'Miguel', 'mi@example.com', '428395', 'Fiadsufh', 'Logistica 7', 'Detalles'),
    (804645, 'Julio', 'ju@example.com', '58498543', 'Ffjeifdj3', 'Ventas 8', 'Detalles'),
    (804945, 'Valeri', 'va@example.com', '49035894', 'Fhjkdas876', 'Medicina 9', 'Detalles'),
    (345678, 'Luis', 'luis@example.com', '456123789', 'Boulevard 789', 'Program 10', 'Detalles adicionales C');
SELECT * FROM Cliente;

INSERT INTO empresa (id_empresa, nombre_empresa, administrador_empresa, correo, telefono_contacto)
VALUES
    (10001, 'Tecnología Global S.A.', 'Carlos López', 'carlos.lopez@tecnologiaglobal.com', '3012345678'),
    (10002, 'Servicios Integrados LTDA.', 'Ana Martínez', 'ana.martinez@serviciosintegrados.com', '3023456789'),
    (10003, 'Innovación y Desarrollo S.A.S.', 'Pedro Gómez', 'pedro.gomez@innovaciondesarrollo.com', '3034567890'),
    (10004, 'Distribuciones del Norte S.A.', 'Laura Herrera', 'laura.herrera@distribucionesnorte.com', '3045678901'),
    (10005, 'Consultoría Empresarial', 'Sofía Ramírez', 'sofia.ramirez@consultoriaempresarial.com', '3056789012'),
    (10006, 'Soluciones en TI S.A.S.', 'Miguel Rodríguez', 'miguel.rodriguez@solucionesenti.com', '3067890123'),
    (10007, 'Transporte Rápido LTDA.', 'María Torres', 'maria.torres@transporterapido.com', '3078901234'),
    (10008, 'Importaciones del Sur S.A.', 'Andrés Castro', 'andres.castro@importacionesdelsur.com', '3089012345'),
    (10009, 'Mantenimiento Integral S.A.S.', 'Lucía Méndez', 'lucia.mendez@mantenimientointegral.com', '3090123456'),
    (10010, 'Ventas y Mercadeo S.A.', 'José Fernández', 'jose.fernandez@ventasymercadeo.com', '3101234567');
SELECT * FROM empresa;

INSERT INTO catalogo (id_catalogo, quien_lo_vende, id_empresa, sede_que_lo_usa, que_Viene, material, tallas_disponibles, precio)
VALUES
    (1, 'Carlos López', 10001, 'cglmti', 'chaqueta camisa, pantalon', 'algodon', 'xs,s,m,l,xl,xll', 120000),
    (2, 'Ana Martínez', 10002, 'turismo', 'delantal, pantalon', 'polietano', 'xs,s,m,l,xl,xll', 300000),
    (3, 'Pedro Gómez', 10003, 'cglmti', 'traje', 'tela', 'xs,s,m,l,xl,xll', 250000),
    (4, 'Laura Herrera', 10004, 'cglmti', 'camisa, pantalon', 'polietano', 'xs,s,m,l,xl,xll', 180000),
    (5, 'Sofía Ramírez', 10005, 'turismo', 'delantal, pantalon', 'polietano', 'xs,s,m,l,xl,xll', 125000),
    (6, 'Miguel Rodríguez', 10006, 'cglmti', 'chaqueta, pantalon', 'polietano', 'xs,s,m,l,xl,xll', 70000),
    (7, 'María Torres', 10007, 'turismo', 'delantal, pantalon', 'polietano', 'xs,s,m,l,xl,xll', 80000),
    (8, 'Andrés Castro', 10008, 'cglmti', 'camisa, pantalon', 'polietano', 'xs,s,m,l,xl,xll', 150000),
    (9, 'Lucía Méndez', 10009, 'turismo', 'delantal, pantalon', 'polietano', 'xs,s,m,l,xl,xll', 135000),
    (10, 'José Fernández', 10010, 'turismo', 'delantal, pantalon', 'polietano', 'xs,s,m,l,xl,xll', 90000);
SELECT * FROM catalogo;

INSERT INTO Uniforme_Personalizado (id_uniforme_personalizado, id_cliente, material, Forro, Cremallera, Cuello, Punio, Bolsillo_Interior, Bolsillo_Exterior, Capota)
VALUES
    (1, 456789, 'Algodón', 'Poliéster', 'Metálica', 'Cuero', 'Elástico', 'Bolsillo con cremallera', 'Bolsillo grande', 'Sí'),
    (2, 123456, 'Lana', 'Seda', 'Plástico', 'Sintético', 'Ajustado', 'Sin bolsillo', 'Bolsillo con velcro', 'No'),
    (3, 234567, 'Mezcla de poliéster', 'Algodón', 'Nylon', 'Cuero sintético', 'Ajustable', 'Bolsillo interno', 'Bolsillo externo', 'Sí'),
    (4, 452890, 'Denim', 'Forro térmico', 'Metálica', 'Cuero', 'Elástico', 'Bolsillo oculto', 'Bolsillo grande', 'Sí'),
    (5, 534934, 'Nylon', 'Poliéster', 'Plástico', 'Cuero sintético', 'Ajustable', 'Bolsillo con cremallera', 'Bolsillo con solapa', 'No'),
    (6, 804545, 'Poliéster', 'Algodón', 'Metálica', 'Cuero', 'Ajustado', 'Bolsillo pequeño', 'Bolsillo grande', 'Sí'),
    (7, 808545, 'Algodón', 'Poliéster', 'Plástico', 'Sintético', 'Elástico', 'Bolsillo interior', 'Bolsillo exterior', 'No'),
    (8, 804645, 'Lana', 'Seda', 'Nylon', 'Piel sintética', 'Ajustado', 'Bolsillo con velcro', 'Bolsillo grande', 'Sí'),
    (9, 804945, 'Mezcla de poliéster', 'Forro térmico', 'Metálica', 'Cuero', 'Elástico', 'Bolsillo oculto', 'Bolsillo grande', 'Sí'),
    (10, 345678, 'Denim', 'Poliéster', 'Plástico', 'Cuero sintético', 'Ajustable', 'Bolsillo pequeño', 'Bolsillo grande', 'No');
SELECT * FROM Uniforme_Personalizado;


INSERT INTO pedido (id_cliente, fecha, estado, talla)
VALUES
    (456789, '2024-09-01', 'En proceso', 'M'),
    (123456, '2024-08-25', 'Completado', 'L'),
    (234567, '2024-08-28', 'En proceso', 'S'),
    (452890, '2024-09-02', 'Pendiente', 'XL'),
    (534934, '2024-08-30', 'Completado', 'M'),
    (804545, '2024-09-03', 'En proceso', 'L'),
    (808545, '2024-09-05', 'Pendiente', 'S'),
    (804645, '2024-08-29', 'Completado', 'M'),
    (804945, '2024-09-04', 'En proceso', 'XL'),
    (345678, '2024-09-06', 'Pendiente', 'L');
SELECT * FROM pedido;
 

INSERT INTO metodoDePago (id_cliente,metodo,confirmacion_De_Pago)
VALUES
    (456789, 'Tarjeta de crédito', 'Confirmado'),
    (123456, 'Transferencia bancaria', 'En espera'),
    (234567, 'pse', 'Cancelada'),
    (452890, 'Efectivo', 'En espera'),
    (534934, 'Tarjeta de débito', 'En espera'),
    (804545, 'Transferencia bancaria', 'En espera'),
    (808545, 'Tarjeta de crédito', 'Cancelada'),
    (804645, 'pse', 'Confirmado'),
    (804945, 'Efectivo', 'En espera'),
    (345678, 'Tarjeta de débito', 'Cancelada');
SELECT * FROM metodoDePago;
