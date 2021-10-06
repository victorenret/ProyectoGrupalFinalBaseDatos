/*INSERTAR DATOS A TABLA CLIENETES*/

INSERT INTO clientes(rut, nombre, apellido, direccion) 
VALUES ('18652159-2', 'pablo', 'escobar', 'su casa 1'),
('17625364-8', 'luis', 'perez', 'su casa 2'),
('17264962-2', 'pedro', 'gonzalez', 'su casa 3'),
('16354248-3', 'juan', 'cepeda', 'su casa 4'),
('8745236-8', 'daniel', 'moron', 'su casa 5');

/*INSERTAR DATOS A TABLA PROVEEDOR*/
INSERT INTO proveedor(rut_proveedor, nom_repr_legal, nom_corporativo, telefono_1, telefono_2, correo_proveedor, 
categoria_prod, rut_operador) 
VALUES ('15548365-1', 'Maria', 'empresa1', '8563254782','563545879','correo1@gmail.com','computadores','17625948-3'),
('15632458-3', 'Constanza', 'empresa2', '8542145896','584785632','correo2@gmail.com','televisores','18325698-2'),
('15262485-7', 'Fabiola', 'empresa3', '9652451523','456352987','correo3@gmail.com','neveras','15262485-7'),
('15354248-3', 'Karen', 'empresa4', '8545236541','589654785','correo4@gmail.com','celulares','18254987-2'),
('15745262-8', 'Luisa', 'empresa5', '9654715263','636587849','correo5@gmail.com','tabletas','17548368-0');

/*INSERTAR DATOS A TABLA OPERADOR_TELEFONICO*/
INSERT INTO operador_telefonico(rut, nombre, apellido, direccion) 
VALUES ('17625948-3', 'Juanito', 'apellido1', 'Pen House 1'),
('18325698-2', 'Pepito', 'apellido2', 'Pen House 2'),
('15262485-7', 'Luisito', 'apellido3', 'Pen House 3'),
('18254987-2', 'Fernandito', 'apellido4', 'Pen House 4'),
('17548368-0', 'Neifersito', 'empresa5', 'Pen House 5');


/*INSERTAR DATOS A TABLA PRODUCTO*/
INSERT INTO producto (categoria, precio, proveedor, color, rut_cliente,stock) VALUES 
('computadores', 800000,'15548365-1','blue','18652159-2',100),
('televisores', 500000,'15632458-3','grey','17625364-8',150),
('neveras', 600000,'15262485-7','whith','17264962-2',200),
('celulares', 700000,'15354248-3','green','16354248-3',250),
('tabletas', 650000,'15745262-8','pink','8745236-8',300),
('celulares', 630000,'15354248-3','black','16354248-3',250),
('celulares', 550000,'15354248-3','yellow','16354248-3',250),
('computadores', 900000,'15548365-1','pink','17625364-8',100),
('computadores', 1000000,'15548365-1','pink','8745236-8',100),
('computadores', 1100000,'15548365-1','pink','8745236-8',100);

/*Cuál es la categoría de productos que más se repite.*/
SELECT categoria, count(categoria) as cont_categoria FROM producto GROUP BY categoria ORDER BY count(categoria) DESC;
/*La categoria que mas se repite es COMPUTADORES con 4 pedidos*/
/*---------------------------------------------------------------------------------------------------------------------------------------*/

/*Cuáles son los productos con mayor stock*/
SELECT * FROM producto ORDER BY stock DESC LIMIT 2;
/*los productos con mayor stock son: tabletas y celulares */
/*-----------------------------------------------------------------------------------------------------------------------------------*/

/*Qué color de producto es más común en nuestra tienda.*/
SELECT color, count(color) FROM producto GROUP BY color ORDER BY count(color) DESC;
/*el color mas comun es PINK*/
/*-----------------------------------------------------------------------------------------------------------------------------------*/

/*Cual o cuales son los proveedores con menor stock de productos.*/
SELECT stock, id_producto,rut_proveedor FROM producto INNER JOIN 
(proveedor INNER JOIN producto_has_proveedor ON producto_has_proveedor.PROVEEDOR_rut_proveedor=proveedor.rut_proveedor)
ON producto_has_proveedor.PRODUCTO_id_producto=producto.id_producto
GROUP BY id_producto,rut_proveedor
ORDER BY stock ASC;
/*los proveedores con menor stock son: id_producto 1, 2 y 3*/
/*------------------------------------------------------------------------------------------------------------------------------*/
/*Cambien la categoría de productos más popular por ‘Electrónica y computación’.*/
UPDATE producto SET categoria = 'Electrónica y computación' WHERE id_producto = 1 or id_producto = 8 
or id_producto = 9 or id_producto = 10;















