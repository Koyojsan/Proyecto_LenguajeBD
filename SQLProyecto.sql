-- Base de datos para Witty's

-------------------------- TABLAS DE WITTY'S -----------------------------------

CREATE TABLE Clientes (
    IdCliente INT PRIMARY KEY,
    NombreCliente VARCHAR(255),
    ApellidoCliente VARCHAR(255),
    CorreoCliente VARCHAR(255) UNIQUE,
    TelefonoCliente VARCHAR(15) UNIQUE
);

CREATE TABLE Empleados (
    IdEmpleado INT PRIMARY KEY,
    NombreEmpleado VARCHAR(255),
    ApellidoEmpleado VARCHAR(255),
    CorreoEmpleado VARCHAR(255) UNIQUE,
    Edad INT,
    Puesto VARCHAR(255)
);

CREATE TABLE Productos (
    IdProducto INT PRIMARY KEY,
    NombreProducto VARCHAR(255),
    DescripcionProducto VARCHAR(255),
    Cantidad INT,
    Precio INT
);


CREATE TABLE Proveedores (
    IdProveedor INT PRIMARY KEY,
    IdProducto INT, -- Clave foránea a la tabla Productos
    NombreProveedor VARCHAR(255),
    NombreProducto VARCHAR(255),
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto)
);


CREATE TABLE Ventas (
    IdVenta INT PRIMARY KEY,
    FechaVenta DATE,
    IdCliente INT,  -- Clave foránea a la tabla Clientes
    IdEmpleado INT, -- Clave foránea a la tabla Empleados
    IdProducto INT, -- Clave foránea a la tabla Productos
    Direccion VARCHAR(255),
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente),
    FOREIGN KEY (IdEmpleado) REFERENCES Empleados(IdEmpleado),
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto)
);

CREATE TABLE Mascotas (
    IdMascota INT PRIMARY KEY,
    IdCliente INT, -- Clave foránea a la tabla Clientes
    NombreMascota VARCHAR(255),
    Tratamiento VARCHAR(255),
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente)
);

CREATE TABLE Factura (
    IdFactura INT PRIMARY KEY,
    IdVenta INT,    -- Clave foránea a la tabla Ventas
    IdMascota INT,  -- Clave foránea a la tabla Mascotas
    MetodoPago VARCHAR(50),
    PagoTotal INT,
    FOREIGN KEY (IdVenta) REFERENCES Ventas(IdVenta),
    FOREIGN KEY (IdMascota) REFERENCES Mascotas(IdMascota)
);


-------------------------- INSERTAR EN LAS TABLAS ------------------------------

INSERT INTO Clientes (IdCliente, NombreCliente, ApellidoCliente, CorreoCliente, TelefonoCliente)
VALUES (1, 'Pedro', 'Pascal', 'pedro@gmail.com', '123456789');

INSERT INTO Clientes (IdCliente, NombreCliente, ApellidoCliente, CorreoCliente, TelefonoCliente)
VALUES (2, 'Marlos', 'Gomez', 'marlos@gmail.com', '987654321');



INSERT INTO Empleados (IdEmpleado, NombreEmpleado, ApellidoEmpleado, CorreoEmpleado, Edad, Puesto)
VALUES (1, 'Carlos', 'Rodriguez', 'carl@gmail.com', 30, 'Vendedor');

INSERT INTO Empleados (IdEmpleado, NombreEmpleado, ApellidoEmpleado, CorreoEmpleado, Edad, Puesto)
VALUES (2, 'Laura', 'Bozo', 'lau@gmail.com', 25, 'Recepcionista');



INSERT INTO Productos (IdProducto, NombreProducto, DescripcionProducto, Cantidad, Precio)
VALUES (1, 'Comida de perro', 'Saborizada a pollo', 50, 4000);

INSERT INTO Productos (IdProducto, NombreProducto, DescripcionProducto, Cantidad, Precio)
VALUES (2, 'Peine para pulgas', 'Resistente y efectivo', 30, 7000);

INSERT INTO Productos (IdProducto, NombreProducto, DescripcionProducto, Cantidad, Precio)
VALUES (3, 'Shampoo para gato', 'Sin probabilidad de causar daños o reacciones alergicas', 0, 2000);



INSERT INTO Proveedores (IdProveedor, IdProducto, NombreProveedor, NombreProducto)
VALUES (1, 1, 'Doggos food', 'Comida de perro');

INSERT INTO Proveedores (IdProveedor, IdProducto, NombreProveedor, NombreProducto)
VALUES (2, 2, 'Animal Health', 'Peine para pulgas');



INSERT INTO Ventas (IdVenta, FechaVenta, IdCliente, IdEmpleado, IdProducto, Direccion)
VALUES (1, TO_DATE('2023-11-01', 'YYYY-MM-DD'), 1, 1, 1, 'Calle Principal 123');

INSERT INTO Ventas (IdVenta, FechaVenta, IdCliente, IdEmpleado, IdProducto, Direccion)
VALUES (2, TO_DATE('2023-11-02', 'YYYY-MM-DD'), 2, 2, 2, 'Avenida Central 456');

INSERT INTO Ventas (IdVenta, FechaVenta, IdCliente, IdEmpleado, IdProducto, Direccion)
VALUES (3, TO_DATE('2023-11-01', 'YYYY-MM-DD'), 1, 2, 2, 'Calle Principal 123');

INSERT INTO Ventas (IdVenta, FechaVenta, IdCliente, IdEmpleado, IdProducto, Direccion)
VALUES (4, TO_DATE('2023-11-01', 'YYYY-MM-DD'), 1, 1, 2, 'Calle Vieja 534');

INSERT INTO Ventas (IdVenta, FechaVenta, IdCliente, IdEmpleado, IdProducto, Direccion)
VALUES (5, TO_DATE('2023-11-01', 'YYYY-MM-DD'), 1, 2, 1, 'Callejon Antiguo 156');




INSERT INTO Mascotas (IdMascota, NombreMascota, IdCliente, Tratamiento)
VALUES (1, 'Princesa', 1, 'Vacunación');

INSERT INTO Mascotas (IdMascota, NombreMascota, IdCliente, Tratamiento)
VALUES (2, 'Bobby', 2, 'Desparasitación');



INSERT INTO Factura (IdFactura, IdVenta, IdMascota, MetodoPago, PagoTotal)
VALUES (1, 1, 1, 'Tarjeta', 6000);

INSERT INTO Factura (IdFactura, IdVenta, IdMascota, MetodoPago, PagoTotal)
VALUES (2, 2, 2, 'Efectivo', 9000);



-------------------------- VISTAS DE LAS TABLAS --------------------------------

CREATE VIEW Vista_Clientes AS
SELECT c.IdCliente as "Id Cliente",
       (c.NombreCliente||' '|| c.ApellidoCliente) as "Nombre Cliente",
       c.CorreoCliente as "Correo Cliente",
       c.TelefonoCliente as "Telefono Cliente"
FROM Clientes c;

SELECT * FROM Vista_Clientes;
-- Id Cliente Nombre Cliente  Correo Cliente      Telefono Cliente
-- ---------- --------------- ------------------- -----------------
--          1 Pedro Pascal    pedro@gmail.com     123456789      
--          2 Marlos Gomez    marlos@gmail.com    987654321    



CREATE VIEW Vista_Empleado AS
SELECT e.IdEmpleado as "Id Empleado",
       (e.NombreEmpleado||' '|| e.ApellidoEmpleado) as "Nombre Empleado",
       e.CorreoEmpleado as "Correo Empleado",
       e.Edad as "Edad",
       e.Puesto as "Puesto"
FROM Empleados e;

SELECT * FROM Vista_Empleado;
-- Id Empleado Nombre Empleado    Correo Empleado   Edad   Puesto                                                                                                                                                                                                                                                         
-- ----------- ------------------ ----------------- ------ ---------------
--           1 Carlos Rodriguez   carl@gmail.com    30     Vendedor                                                                                                                                                                                                                                                       
--           2 Laura Bozo         lau@gmail.com     25     Recepcionista                                                                                                                                                                                                                                                  



CREATE VIEW Vista_Producto AS
SELECT p.IdProducto as "Id Producto",
       p.NombreProducto as "Nombre Producto",
       p.DescripcionProducto as "Descripcion Producto",
       p.Cantidad as "Cantidad",
       p.Precio as "Precio"
FROM Productos p;

SELECT * FROM Vista_Producto;
-- Id Producto Nombre Producto    Descripcion Producto                                       Cantidad     Precio
-- ----------- ------------------ ---------------------------------------------------------- ------------ ---------
--           1 Comida de perro    Saborizada a pollo                                         50           4000
--           2 Peine para pulgas  Resistente y efectivo                                      30           7000
--           3 Shampoo para gato  Sin probabilidad de causar daños o reacciones alergicas    0            2000



CREATE VIEW Vista_Proveedor AS
SELECT pr.IdProveedor as "Id Proveedor",
       pr.NombreProveedor as "Nombre Proveedor",
       pr.NombreProducto as "Nombre Producto"
FROM Proveedores pr;

SELECT * FROM Vista_Proveedor;
-- Id Proveedor Nombre Proveedor     Nombre Producto                                                                                                                                                                                                                                                
-- ------------ -------------------- -------------------------------------------
--            1 Doggos food          Comida de perro                     
--            2 Animal Health        Peine para pulgas                             



CREATE VIEW Vista_Ventas AS
SELECT v.IdVenta as "Id Venta",
       v.FechaVenta as "Fecha Venta",
       (c.IdCliente || ' - ' || c.NombreCliente || ' ' || c.ApellidoCliente) as "Cliente",
       (e.IdEmpleado || ' - ' || e.NombreEmpleado || ' ' || e.ApellidoEmpleado) as "Empleado",
       (p.IdProducto || ' - ' || p.NombreProducto) as "Producto",
       v.Direccion as "Direccion"
FROM Ventas v
JOIN Clientes c ON v.IdCliente = c.IdCliente
JOIN Empleados e ON v.IdEmpleado = e.IdEmpleado
JOIN Productos p ON v.IdProducto = p.IdProducto;

SELECT * FROM Vista_Ventas;
--   Id Venta Fecha Ve Cliente            Empleado                 Producto                 Direccion
-- ---------- -------- ------------------ ------------------------ ------------------------ --------------------
--          1 01/11/23 1 - Pedro Pascal   1 - Carlos Rodriguez     1 - Comida de perro      Calle Principal 123               
--          2 02/11/23 2 - Marlos Gomez   2 - Laura Bozo           2 - Peine para pulgas    Avenida Central 456 



CREATE VIEW Vista_Mascotas AS
SELECT m.IdMascota as "Id Mascota",
       m.NombreMascota as "Nombre Mascota",
       (c.IdCliente || ' - ' || c.NombreCliente || ' ' || c.ApellidoCliente) as "Cliente",
       m.Tratamiento as "Tratamiento"
FROM Mascotas m
JOIN Clientes c ON m.IdCliente = c.IdCliente;

SELECT * FROM Vista_Mascotas;
-- Id Mascota Nombre Mascota         Cliente              Tratamiento                      
-- ---------- ---------------------- -------------------- ----------------------
--          1 Princesa               1 - Pedro Pascal     Vacunación            
--          2 Bobby                  2 - Marlos Gomez     Desparasitación       



CREATE VIEW Vista_Factura AS
SELECT f.IdFactura as "Id Factura",
       v.IdVenta as "Id Venta",
       (c.IdCliente || ' - ' || c.NombreCliente || ' ' || c.ApellidoCliente) as "Cliente",
       (e.IdEmpleado || ' - ' || e.NombreEmpleado || ' ' || e.ApellidoEmpleado) as "Empleado",
       (p.IdProducto || ' - ' || p.NombreProducto) as "Producto",
       (m.IdMascota || ' - ' || m.NombreMascota) as "Mascota",
       f.MetodoPago as "Metodo Pago",
       f.PagoTotal as "Pago Total"
FROM Factura f
JOIN Ventas v ON f.IdVenta = v.IdVenta
JOIN Clientes c ON v.IdCliente = c.IdCliente
JOIN Empleados e ON v.IdEmpleado = e.IdEmpleado
JOIN Productos p ON v.IdProducto = p.IdProducto
JOIN Mascotas m ON m.IdMascota = m.IdMascota;

SELECT * FROM Vista_Factura;
-- Id Factura   Id Venta Cliente                 Empleado                   Producto                    Mascota             Metodo Pago             Pago Total         
-- ---------- ---------- ----------------------- -------------------------- --------------------------- ------------------- ----------------------- ------------------
--          1          1 1 - Pedro Pascal        1 - Carlos Rodriguez       1 - Comida de perro         1 - Princesa        Tarjeta                 6000           
--          2          2 2 - Marlos Gomez        2 - Laura Bozo             2 - Peine para pulgas       2 - Bobby           Efectivo                9000 



CREATE VIEW Vista_Productos_Agotados AS
SELECT pa.IdProducto as "Id Producto", 
       pa.NombreProducto as "Producto",
       pa.Cantidad as "Producto Agotado"
FROM Productos pa
WHERE Cantidad = 0;

SELECT * FROM Vista_Productos_Agotados;
-- Id Producto Producto                Producto Agotado
-- ----------- ----------------------- ----------------
--           3 Shampoo para gato                      0



CREATE VIEW Vista_Empleados_Vendedores AS
SELECT e.IdEmpleado as "Id", 
       (e.NombreEmpleado || ' ' || e.ApellidoEmpleado) as "Empleado",
       e.Edad as "Edad",
       e.Puesto as "Puesto"
FROM Empleados e
WHERE Puesto = 'Vendedor';

SELECT * FROM Vista_Empleados_Vendedores;
--         Id Empleado                 Edad Puesto                              
-- ---------- --------------------- ------- ------------------------------------
--          1 Carlos Rodriguez           30 Vendedor                            



CREATE VIEW Vista_Productos_PrecioAlto AS
SELECT pra.IdProducto as "Id Producto", 
       pra.NombreProducto as "Producto",
       pra.DescripcionProducto as "Descripcion Producto",
       pra.Cantidad as "Cantidad",
       pra.Precio as "Precio"
FROM Productos pra
WHERE Precio > 5000;

SELECT * FROM Vista_Productos_PrecioAlto;
-- Id Producto Producto                    Descripcion Producto              Cantidad       Precio       
-- ----------- --------------------------- --------------------------------- -------- ------------
--           2 Peine para pulgas           Resistente y efectivo                   30         7000   



-------------------------- FUNCIONES DE LAS TABLAS -----------------------------

CREATE OR REPLACE FUNCTION Contar_Ventas
RETURN INT
AS
    NumVentas INT;
BEGIN
    SELECT COUNT(*) INTO NumVentas
    FROM Ventas;
    RETURN NumVentas;
END;
/

SELECT Contar_Ventas() AS "Total de Ventas" FROM DUAL;
-- Total de Ventas
-- ---------------
--               3



CREATE OR REPLACE FUNCTION Contar_Ventas_Empleado(p_IdEmpleado INT)
RETURN INT
AS
    NumVentas INT;
BEGIN
    SELECT COUNT(*) INTO NumVentas
    FROM Ventas
    WHERE IdEmpleado = p_IdEmpleado;

    RETURN NumVentas;
END;
/

set serveroutput on;
DECLARE
    resultado INT;
BEGIN
    resultado := Contar_Ventas_Empleado(1); -- Empleado 1
    DBMS_OUTPUT.PUT_LINE('Número de ventas para el empleado: ' || resultado);
    resultado := Contar_Ventas_Empleado(2); -- Empleado 2
    DBMS_OUTPUT.PUT_LINE('Número de ventas para el empleado: ' || resultado);
    resultado := Contar_Ventas_Empleado(3); -- Empleado 3
    DBMS_OUTPUT.PUT_LINE('Número de ventas para el empleado: ' || resultado);
END;
/
-- Número de ventas para el empleado: 1
-- Número de ventas para el empleado: 2
-- Número de ventas para el empleado: 0
-- Procedimiento PL/SQL terminado correctamente.



CREATE OR REPLACE FUNCTION Contar_Ventas_Cliente(p_IdCliente INT)
RETURN INT
AS
    NumVentas INT;
BEGIN
    SELECT COUNT(*) INTO NumVentas
    FROM Ventas
    WHERE IdCliente = p_IdCliente;

    RETURN NumVentas;
END;
/

set serveroutput on;
DECLARE
    NumVentas INT;
BEGIN
    NumVentas := Contar_Ventas_Cliente(1); -- Cliente 1
    DBMS_OUTPUT.PUT_LINE('Número de ventas para el cliente: ' || NumVentas);
    NumVentas := Contar_Ventas_Cliente(2); -- Cliente 2
    DBMS_OUTPUT.PUT_LINE('Número de ventas para el cliente: ' || NumVentas);
    NumVentas := Contar_Ventas_Cliente(3); -- Cliente 3
    DBMS_OUTPUT.PUT_LINE('Número de ventas para el cliente: ' || NumVentas);
END;
/
-- Número de ventas para el cliente: 2
-- Número de ventas para el cliente: 1
-- Número de ventas para el cliente: 0
-- Procedimiento PL/SQL terminado correctamente.



CREATE OR REPLACE FUNCTION Contar_Ventas_Producto(p_IdProducto INT)
RETURN INT
AS
    NumVentas INT;
BEGIN
    SELECT COUNT(*) INTO NumVentas
    FROM Ventas
    WHERE IdProducto = p_IdProducto;

    RETURN NumVentas;
END;
/

set serveroutput on;
DECLARE
    NumVentas INT;
BEGIN
    NumVentas := Contar_Ventas_Producto(1); -- Producto 1
    DBMS_OUTPUT.PUT_LINE('Número de ventas para el producto: ' || NumVentas);
    NumVentas := Contar_Ventas_Producto(2); -- Producto 2
    DBMS_OUTPUT.PUT_LINE('Número de ventas para el producto: ' || NumVentas);
    NumVentas := Contar_Ventas_Producto(3); -- Producto 3
    DBMS_OUTPUT.PUT_LINE('Número de ventas para el producto: ' || NumVentas);
END;
/
-- Número de ventas para el producto: 2
-- Número de ventas para el producto: 3
-- Número de ventas para el producto: 0
-- Procedimiento PL/SQL terminado correctamente.











-------------------------- PAQUETES DE LAS TABLAS ------------------------------

CREATE OR REPLACE PACKAGE Producto_Package AS
    -- AGREGAR PRODUCTO
    PROCEDURE AgregarProducto(
        p_IdProducto INT,
        p_NombreProducto VARCHAR2,
        p_DescripcionProducto VARCHAR2,
        p_Cantidad INT,
        p_Precio INT
    );

    -- ACTUALIZAR PRODUCTO
    PROCEDURE ActualizarCantidadProducto(
        p_IdProducto INT,
        p_NuevaCantidad INT
    );

    -- OBTENER INFO PRODUCTO
    FUNCTION ObtenerInfoProducto(p_IdProducto INT) RETURN VARCHAR2;

    -- DESCUENTO A PRODUCTO
    FUNCTION AplicarDescuentoProducto(p_IdProducto INT) RETURN INT;
END Producto_Package;
/

CREATE OR REPLACE PACKAGE BODY Producto_Package AS
    PROCEDURE AgregarProducto(
        p_IdProducto INT,
        p_NombreProducto VARCHAR2,
        p_DescripcionProducto VARCHAR2,
        p_Cantidad INT,
        p_Precio INT
    ) AS
    BEGIN
        INSERT INTO Productos (IdProducto, NombreProducto, DescripcionProducto, Cantidad, Precio)
        VALUES (p_IdProducto, p_NombreProducto, p_DescripcionProducto, p_Cantidad, p_Precio);
    END AgregarProducto;

    PROCEDURE ActualizarCantidadProducto(
        p_IdProducto INT,
        p_NuevaCantidad INT
    ) AS
    BEGIN
        UPDATE Productos
        SET Cantidad = p_NuevaCantidad
        WHERE IdProducto = p_IdProducto;
    END ActualizarCantidadProducto;

    FUNCTION ObtenerInfoProducto(p_IdProducto INT) RETURN VARCHAR2 AS
        InfoProducto VARCHAR2(255);
    BEGIN
        SELECT NombreProducto || ' - ' || DescripcionProducto || ' - Cantidad: ' || Cantidad || ' - Precio: ' || Precio
        INTO InfoProducto
        FROM Productos
        WHERE IdProducto = p_IdProducto;

        RETURN InfoProducto;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Producto no encontrado';
    END ObtenerInfoProducto;

    FUNCTION AplicarDescuentoProducto(p_IdProducto INT) RETURN INT AS
        PrecioOriginal INT;
        PrecioConDescuento INT;
    BEGIN
        SELECT Precio INTO PrecioOriginal
        FROM Productos
        WHERE IdProducto = p_IdProducto;

        IF PrecioOriginal IS NOT NULL THEN
            PrecioConDescuento := PrecioOriginal - (PrecioOriginal * 0.25);
            RETURN PrecioConDescuento;
        ELSE
            RETURN NULL;
        END IF;
    END AplicarDescuentoProducto;
END Producto_Package;
/

set serveroutput on;
BEGIN
    Producto_Package.AgregarProducto(
        p_IdProducto => 4,
        p_NombreProducto => 'Producto Paquete',
        p_DescripcionProducto => 'Prueba del Producto_Package',
        p_Cantidad => 40,
        p_Precio => 5300
    );
    
    DBMS_OUTPUT.PUT_LINE('Producto agregado.');
END;
/

set serveroutput on;
BEGIN
    Producto_Package.ActualizarCantidadProducto(
        p_IdProducto => 4,
        p_NuevaCantidad => 60
    );

    DBMS_OUTPUT.PUT_LINE('Cantidad actualizada.');
END;
/

set serveroutput on;
DECLARE
    InfoProducto VARCHAR2(255);
BEGIN
    InfoProducto := Producto_Package.ObtenerInfoProducto(4); -- Aqui se ingresa el ID del producto

    -- Mostrar la información del producto
    DBMS_OUTPUT.PUT_LINE('Información del producto:');
    DBMS_OUTPUT.PUT_LINE(InfoProducto);
END;
/

set serveroutput on;
DECLARE
    PrecioConDescuento INT;
BEGIN
    PrecioConDescuento := Producto_Package.AplicarDescuentoProducto(4); -- Aqui se ingresa el ID del producto

    IF PrecioConDescuento IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Precio con descuento: ' || PrecioConDescuento);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Producto no encontrado.');
    END IF;
END;
/

select * from productos;






CREATE OR REPLACE PACKAGE Cliente_Package AS
    -- AGREGAR CLIENTE
    PROCEDURE AgregarCliente(
        p_IdCliente INT,
        p_NombreCliente VARCHAR2,
        p_ApellidoCliente VARCHAR2,
        p_CorreoCliente VARCHAR2,
        p_TelefonoCliente VARCHAR2
    );

    -- ACTUALIZAR CLIENTE
    PROCEDURE ActualizarCliente(
        p_IdCliente INT,
        p_NuevoNombreCliente VARCHAR2,
        p_NuevoApellidoCliente VARCHAR2,
        p_NuevoCorreoCliente VARCHAR2,
        p_NuevoTelefonoCliente VARCHAR2
    );

    -- OBTENER CLIENTE
    FUNCTION ObtenerInfoCliente(p_IdCliente INT) RETURN VARCHAR2;

    -- ELIMINAR CLIENTE
    PROCEDURE EliminarCliente(p_IdCliente INT);
END Cliente_Package;
/

CREATE OR REPLACE PACKAGE BODY Cliente_Package AS
    PROCEDURE AgregarCliente(
        p_IdCliente INT,
        p_NombreCliente VARCHAR2,
        p_ApellidoCliente VARCHAR2,
        p_CorreoCliente VARCHAR2,
        p_TelefonoCliente VARCHAR2
    ) AS
    BEGIN
        INSERT INTO Clientes (IdCliente, NombreCliente, ApellidoCliente, CorreoCliente, TelefonoCliente)
        VALUES (p_IdCliente, p_NombreCliente, p_ApellidoCliente, p_CorreoCliente, p_TelefonoCliente);
    END AgregarCliente;

    PROCEDURE ActualizarCliente(
        p_IdCliente INT,
        p_NuevoNombreCliente VARCHAR2,
        p_NuevoApellidoCliente VARCHAR2,
        p_NuevoCorreoCliente VARCHAR2,
        p_NuevoTelefonoCliente VARCHAR2
    ) AS
    BEGIN
        UPDATE Clientes
        SET
            NombreCliente = p_NuevoNombreCliente,
            ApellidoCliente = p_NuevoApellidoCliente,
            CorreoCliente = p_NuevoCorreoCliente,
            TelefonoCliente = p_NuevoTelefonoCliente
        WHERE IdCliente = p_IdCliente;
    END ActualizarCliente;

    FUNCTION ObtenerInfoCliente(p_IdCliente INT) RETURN VARCHAR2 AS
        InfoCliente VARCHAR2(255);
    BEGIN
        SELECT
            IdCliente || ' - ' ||
            NombreCliente || ' ' ||
            ApellidoCliente || ' - ' ||
            CorreoCliente || ' - ' ||
            TelefonoCliente
        INTO InfoCliente
        FROM Clientes
        WHERE IdCliente = p_IdCliente;

        RETURN InfoCliente;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Cliente no encontrado';
    END ObtenerInfoCliente;

    PROCEDURE EliminarCliente(p_IdCliente INT) AS
    BEGIN
        DELETE FROM Clientes WHERE IdCliente = p_IdCliente;
    END EliminarCliente;
END Cliente_Package;
/

set serveroutput on;
BEGIN
    Cliente_Package.AgregarCliente(
        p_IdCliente => 3,
        p_NombreCliente => 'Cliente',
        p_ApellidoCliente => 'Paquete',
        p_CorreoCliente => 'prueba@gmail.com',
        p_TelefonoCliente => '88888888'
    );
    
    DBMS_OUTPUT.PUT_LINE('Cliente agregado.');
END;
/

set serveroutput on;
BEGIN
    Cliente_Package.ActualizarCliente(
        p_IdCliente => 3, -- ID DEL CLIENTE PARA CAMBIAR
        p_NuevoNombreCliente => 'Cliente Prueba',
        p_NuevoApellidoCliente => 'Actualizar Cliente',
        p_NuevoCorreoCliente => 'prueba@actualizada.com',
        p_NuevoTelefonoCliente => '88889999'
    );

    DBMS_OUTPUT.PUT_LINE('Cliente actualizado.');
END;
/

set serveroutput on;
DECLARE
    InfoCliente VARCHAR2(255);
BEGIN
    InfoCliente := Cliente_Package.ObtenerInfoCliente(3);  -- ID DEL CLIENTE PARA OBTENER

    DBMS_OUTPUT.PUT_LINE('Información del cliente:');
    DBMS_OUTPUT.PUT_LINE(InfoCliente);
END;
/

set serveroutput on;
BEGIN
    Cliente_Package.EliminarCliente(3); -- ID DEL CLIENTE PARA BORRAR

    DBMS_OUTPUT.PUT_LINE('Cliente eliminado.');
END;
/

SELECT * FROM CLIENTES;





CREATE OR REPLACE PACKAGE Empleado_Package AS
    -- AGREGAR EMPLEADO
    PROCEDURE AgregarEmpleado(
        p_IdEmpleado INT,
        p_NombreEmpleado VARCHAR2,
        p_ApellidoEmpleado VARCHAR2,
        p_CorreoEmpleado VARCHAR2,
        p_Edad INT,
        p_Puesto VARCHAR2
    );

    -- ACTUALIZAR EMPLEADO
    PROCEDURE ActualizarEmpleado(
        p_IdEmpleado INT,
        p_NuevoNombreEmpleado VARCHAR2,
        p_NuevoApellidoEmpleado VARCHAR2,
        p_NuevoCorreoEmpleado VARCHAR2,
        p_NuevaEdad INT,
        p_NuevoPuesto VARCHAR2
    );

    -- OBTENER EMPLEADO
    FUNCTION ObtenerInfoEmpleado(p_IdEmpleado INT) RETURN VARCHAR2;

    -- ELIMINAR EMPLEADO
    PROCEDURE EliminarEmpleado(p_IdEmpleado INT);
END Empleado_Package;
/

CREATE OR REPLACE PACKAGE BODY Empleado_Package AS
    PROCEDURE AgregarEmpleado(
        p_IdEmpleado INT,
        p_NombreEmpleado VARCHAR2,
        p_ApellidoEmpleado VARCHAR2,
        p_CorreoEmpleado VARCHAR2,
        p_Edad INT,
        p_Puesto VARCHAR2
    ) AS
    BEGIN
        INSERT INTO Empleados (IdEmpleado, NombreEmpleado, ApellidoEmpleado, CorreoEmpleado, Edad, Puesto)
        VALUES (p_IdEmpleado, p_NombreEmpleado, p_ApellidoEmpleado, p_CorreoEmpleado, p_Edad, p_Puesto);
    END AgregarEmpleado;

    PROCEDURE ActualizarEmpleado(
        p_IdEmpleado INT,
        p_NuevoNombreEmpleado VARCHAR2,
        p_NuevoApellidoEmpleado VARCHAR2,
        p_NuevoCorreoEmpleado VARCHAR2,
        p_NuevaEdad INT,
        p_NuevoPuesto VARCHAR2
    ) AS
    BEGIN
        UPDATE Empleados
        SET
            NombreEmpleado = p_NuevoNombreEmpleado,
            ApellidoEmpleado = p_NuevoApellidoEmpleado,
            CorreoEmpleado = p_NuevoCorreoEmpleado,
            Edad = p_NuevaEdad,
            Puesto = p_NuevoPuesto
        WHERE IdEmpleado = p_IdEmpleado;
    END ActualizarEmpleado;

    FUNCTION ObtenerInfoEmpleado(p_IdEmpleado INT) RETURN VARCHAR2 AS
        InfoEmpleado VARCHAR2(255);
    BEGIN
        SELECT
            IdEmpleado || ' - ' ||
            NombreEmpleado || ' ' ||
            ApellidoEmpleado || ' - ' ||
            CorreoEmpleado || ' - ' ||
            TO_CHAR(Edad) || ' años - ' ||
            Puesto
        INTO InfoEmpleado
        FROM Empleados
        WHERE IdEmpleado = p_IdEmpleado;

        RETURN InfoEmpleado;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Empleado no encontrado';
    END ObtenerInfoEmpleado;

    PROCEDURE EliminarEmpleado(p_IdEmpleado INT) AS
    BEGIN
        DELETE FROM Empleados WHERE IdEmpleado = p_IdEmpleado;
    END EliminarEmpleado;
END Empleado_Package;
/

set serveroutput on;
BEGIN
    Empleado_Package.AgregarEmpleado(
        p_IdEmpleado => 3,
        p_NombreEmpleado => 'Marco',
        p_ApellidoEmpleado => 'Mendez',
        p_CorreoEmpleado => 'marcmen@example.com',
        p_Edad => 24,
        p_Puesto => 'Veterinario'
    );

    DBMS_OUTPUT.PUT_LINE('Empleado agregado.');
END;
/

set serveroutput on;
BEGIN
    Empleado_Package.ActualizarEmpleado(
        p_IdEmpleado => 3,
        p_NuevoNombreEmpleado => 'Marko',
        p_NuevoApellidoEmpleado => 'Mergemel',
        p_NuevoCorreoEmpleado => 'newmark@example.com',
        p_NuevaEdad => 26,
        p_NuevoPuesto => 'Criador'
    );

    DBMS_OUTPUT.PUT_LINE('Empleado actualizado.');
END;
/

set serveroutput on;
DECLARE
    infoEmpleado VARCHAR2(255);
BEGIN
    infoEmpleado := Empleado_Package.ObtenerInfoEmpleado(3); -- ID DEL EMPLEADO PARA OBTENER

    DBMS_OUTPUT.PUT_LINE('Información del Empleado:');
    DBMS_OUTPUT.PUT_LINE(infoEmpleado);
END;
/

set serveroutput on;
BEGIN
    Empleado_Package.EliminarEmpleado(3); -- ID DEL EMPLEADO PARA BORRAR

    DBMS_OUTPUT.PUT_LINE('Empleado eliminado.');
END;
/

CREATE OR REPLACE PACKAGE VentasPackage AS
    -- Procedimiento para agregar una venta
    PROCEDURE AgregarVenta(
        p_IdVenta INT,
        p_FechaVenta DATE,
        p_IdCliente INT,
        p_IdEmpleado INT,
        p_IdProducto INT,
        p_Direccion VARCHAR2
    );

    -- Procedimiento para actualizar una venta
    PROCEDURE ActualizarVenta(
        p_IdVenta INT,
        p_NuevaFechaVenta DATE,
        p_NuevoIdCliente INT,
        p_NuevoIdEmpleado INT,
        p_NuevoIdProducto INT,
        p_NuevaDireccion VARCHAR2
    );

    -- Función para obtener información de una venta
    FUNCTION ObtenerInfoVenta(p_IdVenta INT) RETURN VARCHAR2;
    
    -- Procedimiento para eliminar una venta
    PROCEDURE EliminarVenta(p_IdVenta INT);
    
END VentasPackage;
/





CREATE OR REPLACE PACKAGE Ventas_Package AS
    -- AGREGAR VENTA
    PROCEDURE AgregarVenta(
        p_IdVenta INT,
        p_FechaVenta DATE,
        p_IdCliente INT,
        p_IdEmpleado INT,
        p_IdProducto INT,
        p_Direccion VARCHAR2
    );

    -- ACTUALIZAR VENTA
    PROCEDURE ActualizarVenta(
        p_IdVenta INT,
        p_NuevaFechaVenta DATE,
        p_NuevoIdCliente INT,
        p_NuevoIdEmpleado INT,
        p_NuevoIdProducto INT,
        p_NuevaDireccion VARCHAR2
    );

    -- OBTENER VENTA
    FUNCTION ObtenerInfoVenta(p_IdVenta INT) RETURN VARCHAR2;
    
    -- ELIMINAR VENTA
    PROCEDURE EliminarVenta(p_IdVenta INT);
    
END Ventas_Package;
/

CREATE OR REPLACE PACKAGE BODY Ventas_Package AS

    PROCEDURE AgregarVenta(
        p_IdVenta INT,
        p_FechaVenta DATE,
        p_IdCliente INT,
        p_IdEmpleado INT,
        p_IdProducto INT,
        p_Direccion VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Ventas (IdVenta, FechaVenta, IdCliente, IdEmpleado, IdProducto, Direccion)
        VALUES (p_IdVenta, p_FechaVenta, p_IdCliente, p_IdEmpleado, p_IdProducto, p_Direccion);
    END AgregarVenta;

    PROCEDURE ActualizarVenta(
        p_IdVenta INT,
        p_NuevaFechaVenta DATE,
        p_NuevoIdCliente INT,
        p_NuevoIdEmpleado INT,
        p_NuevoIdProducto INT,
        p_NuevaDireccion VARCHAR2
    ) IS
    BEGIN
        UPDATE Ventas
        SET FechaVenta = p_NuevaFechaVenta,
            IdCliente = p_NuevoIdCliente,
            IdEmpleado = p_NuevoIdEmpleado,
            IdProducto = p_NuevoIdProducto,
            Direccion = p_NuevaDireccion
        WHERE IdVenta = p_IdVenta;
    END ActualizarVenta;

    FUNCTION ObtenerInfoVenta(p_IdVenta INT) RETURN VARCHAR2 IS
        infoVenta VARCHAR2(4000);
    BEGIN
        SELECT 'Venta ' || IdVenta || ': ' || FechaVenta || ', Cliente ' || IdCliente || ', Empleado ' || IdEmpleado || ', Producto ' || IdProducto || ', Dirección ' || Direccion
        INTO infoVenta
        FROM Ventas
        WHERE IdVenta = p_IdVenta;

        RETURN infoVenta;
    END ObtenerInfoVenta;
    
    PROCEDURE EliminarVenta(p_IdVenta INT) IS
    BEGIN
        DELETE FROM Ventas WHERE IdVenta = p_IdVenta;
    END EliminarVenta;
    
END Ventas_Package;
/

set serveroutput on;
BEGIN
    Ventas_Package.AgregarVenta(
        p_IdVenta => 6,
        p_FechaVenta => TO_DATE('2023-11-15', 'YYYY-MM-DD'),
        p_IdCliente => 2,
        p_IdEmpleado => 1,
        p_IdProducto => 4,
        p_Direccion => 'Calle prueba venta'
    );

    DBMS_OUTPUT.PUT_LINE('Venta agregada.');
END;
/

set serveroutput on;
BEGIN
    Ventas_Package.ActualizarVenta(
        p_IdVenta => 6,
        p_NuevaFechaVenta => TO_DATE('2023-11-20', 'YYYY-MM-DD'),
        p_NuevoIdCliente => 1,
        p_NuevoIdEmpleado => 2,
        p_NuevoIdProducto => 2,
        p_NuevaDireccion => 'Calle Venta Actualizada'
    );

    DBMS_OUTPUT.PUT_LINE('Venta actualizada.');
END;
/

set serveroutput on;
DECLARE
    infoVenta VARCHAR2(255);
BEGIN
    infoVenta := Ventas_Package.ObtenerInfoVenta(6); -- ID PARA OBTENER VENTA

    DBMS_OUTPUT.PUT_LINE(infoVenta);
END;
/

set serveroutput on;
BEGIN
    Ventas_Package.EliminarVenta(6);

    DBMS_OUTPUT.PUT_LINE('Venta eliminada.');
END;
/

SELECT * FROM VENTAS;





CREATE OR REPLACE PACKAGE Proveedores_Package AS
    -- AGREGAR PROVEEDOR
    PROCEDURE AgregarProveedor(
        p_IdProveedor IN INT,
        p_IdProducto IN INT,
        p_NombreProveedor IN VARCHAR2
    );

    -- ACTUALIZAR PROVEEDOR
    PROCEDURE ActualizarProveedor(
        p_IdProveedor IN INT,
        p_NuevoIdProducto IN INT,
        p_NuevoNombreProveedor IN VARCHAR2
    );
    -- OBTENER PROVEEDOR
    FUNCTION ObtenerInfoProveedor(p_IdProveedor INT) RETURN VARCHAR2;
    
    -- ELIMINAR PROVEEDOR
    PROCEDURE EliminarProveedor(p_IdProveedor IN INT);
END Proveedores_Package;
/

CREATE OR REPLACE PACKAGE BODY Proveedores_Package AS

    PROCEDURE AgregarProveedor(
        p_IdProveedor IN INT,
        p_IdProducto IN INT,
        p_NombreProveedor IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Proveedores (IdProveedor, IdProducto, NombreProveedor)
        VALUES (p_IdProveedor, p_IdProducto, p_NombreProveedor);
    END AgregarProveedor;

    PROCEDURE ActualizarProveedor(
        p_IdProveedor IN INT,
        p_NuevoIdProducto IN INT,
        p_NuevoNombreProveedor IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Proveedores
        SET IdProducto = p_NuevoIdProducto,
            NombreProveedor = p_NuevoNombreProveedor
        WHERE IdProveedor = p_IdProveedor;
    END ActualizarProveedor;

    FUNCTION ObtenerInfoProveedor(p_IdProveedor INT) RETURN VARCHAR2 AS
            InfoProveedor VARCHAR2(255);
        BEGIN
            SELECT
                IdProveedor || ' - ' ||
                IdProducto || ' - ' ||
                NombreProveedor 
            INTO InfoProveedor
            FROM Proveedores
            WHERE IdProveedor = p_IdProveedor;
    
            RETURN InfoProveedor;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RETURN 'Proveedor no encontrado';
        END ObtenerInfoProveedor;

    PROCEDURE EliminarProveedor(p_IdProveedor IN INT) IS
    BEGIN
        DELETE FROM Proveedores WHERE IdProveedor = p_IdProveedor;
    END EliminarProveedor;
END Proveedores_Package;
/

set serveroutput on;
BEGIN
    Proveedores_Package.AgregarProveedor(
        p_IdProveedor => 3,
        p_IdProducto => 4,
        p_NombreProveedor => 'Prueba Proveedor'
    );

    DBMS_OUTPUT.PUT_LINE('Proveedor agregado.');
END;
/

set serveroutput on;
BEGIN
    Proveedores_Package.ActualizarProveedor(
        p_IdProveedor => 3,
        p_NuevoIdProducto => 4,
        p_NuevoNombreProveedor => 'Actualizar Prueba Proveedor'
    );

    DBMS_OUTPUT.PUT_LINE('Proveedor actualizado.');
END;
/

set serveroutput on;
DECLARE
    InfoProveedor VARCHAR2(255);
BEGIN
    InfoProveedor := Proveedores_Package.ObtenerInfoProveedor(3); -- ID PARA OBTENER VENTA

    DBMS_OUTPUT.PUT_LINE(InfoProveedor);
END;
/

set serveroutput on;
BEGIN
    Proveedores_Package.EliminarProveedor(3); -- ID PARA ELIMINAR PROVEEDOR

    DBMS_OUTPUT.PUT_LINE('Proveedor eliminado.');
END;
/

SELECT * FROM PROVEEDORES;





CREATE OR REPLACE PACKAGE Mascotas_Package AS
    -- AGREGAR MASCOTA
    PROCEDURE AgregarMascota(
        p_IdMascota IN INT,
        p_IdCliente IN INT,
        p_NombreMascota IN VARCHAR2,
        p_Tratamiento IN VARCHAR2
    );

    -- ACTUALIZAR MASCOTA
    PROCEDURE ActualizarMascota(
        p_IdMascota IN INT,
        p_NuevoIdCliente IN INT,
        p_NuevoNombreMascota IN VARCHAR2,
        p_NuevoTratamiento IN VARCHAR2
    );
    
    -- OBTENER MASCOTA
        FUNCTION ObtenerInfoMascota(p_IdMascota INT) RETURN VARCHAR2;

    -- ELIMINAR MASCOTA
    PROCEDURE EliminarMascota(p_IdMascota IN INT);
END Mascotas_Package;
/

CREATE OR REPLACE PACKAGE BODY Mascotas_Package AS

    PROCEDURE AgregarMascota(
        p_IdMascota IN INT,
        p_IdCliente IN INT,
        p_NombreMascota IN VARCHAR2,
        p_Tratamiento IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Mascotas (IdMascota, IdCliente, NombreMascota, Tratamiento)
        VALUES (p_IdMascota, p_IdCliente, p_NombreMascota, p_Tratamiento);
    END AgregarMascota;

    PROCEDURE ActualizarMascota(
        p_IdMascota IN INT,
        p_NuevoIdCliente IN INT,
        p_NuevoNombreMascota IN VARCHAR2,
        p_NuevoTratamiento IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Mascotas
        SET IdCliente = p_NuevoIdCliente,
            NombreMascota = p_NuevoNombreMascota,
            Tratamiento = p_NuevoTratamiento
        WHERE IdMascota = p_IdMascota;
    END ActualizarMascota;

    FUNCTION ObtenerInfoMascota(p_IdMascota INT) RETURN VARCHAR2 AS
                InfoMascota VARCHAR2(255);
            BEGIN
                SELECT
                    IdMascota || ' - ' ||
                    IdCliente || ' - ' ||
                    NombreMascota || ' - ' ||
                    Tratamiento
                INTO InfoMascota
                FROM Mascotas
                WHERE IdMascota = p_IdMascota;
        
                RETURN InfoMascota;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    RETURN 'Mascota no encontrada';
            END ObtenerInfoMascota;

    PROCEDURE EliminarMascota(p_IdMascota IN INT) IS
    BEGIN
        DELETE FROM Mascotas WHERE IdMascota = p_IdMascota;
    END EliminarMascota;
END Mascotas_Package;
/

set serveroutput on;
BEGIN
    Mascotas_Package.AgregarMascota(
        p_IdMascota => 3,
        p_IdCliente => 2,
        p_NombreMascota => 'Haru',
        p_Tratamiento => 'Vacunas y cuidados generales'
    );

    DBMS_OUTPUT.PUT_LINE('Mascota agregada.');
END;
/

set serveroutput on;
BEGIN
    Mascotas_Package.ActualizarMascota(
        p_IdMascota => 3,
        p_NuevoIdCliente => 2,
        p_NuevoNombreMascota => 'Haru Modificada',
        p_NuevoTratamiento => 'Cuidados especiales y alimentación balanceada'
    );

    DBMS_OUTPUT.PUT_LINE('Mascota actualizada.');
END;
/

set serveroutput on;
DECLARE
    InfoMascota VARCHAR2(255);
BEGIN
    InfoMascota := Mascotas_Package.ObtenerInfoMascota(3); -- ID PARA OBTENER MASCOTA

    DBMS_OUTPUT.PUT_LINE(InfoMascota);
END;
/

set serveroutput on;
BEGIN
    Mascotas_Package.EliminarMascota(3); -- ID PARA ELIMINAR PROVEEDOR

    DBMS_OUTPUT.PUT_LINE('Proveedor eliminado.');
END;
/





CREATE OR REPLACE PACKAGE Factura_Package AS
    -- AGREGAR FACTURA
    PROCEDURE AgregarFactura(
        p_IdFactura INT,
        p_IdVenta INT,
        p_IdMascota INT,
        p_MetodoPago VARCHAR2,
        p_PagoTotal DECIMAL
    );

    -- ACTUALIZAR FACTURA
    PROCEDURE ActualizarFactura(
        p_IdFactura INT,
        p_NuevoIdVenta INT,
        p_NuevoIdMascota INT,
        p_NuevoMetodoPago VARCHAR2,
        p_NuevoPagoTotal DECIMAL
    );

    -- OBTENER FACTURA
    FUNCTION ObtenerInfoFactura(p_IdFactura INT) RETURN SYS_REFCURSOR;

    -- ELIMINAR FACTURA
    PROCEDURE EliminarFactura(p_IdFactura INT);

END Factura_Package;
/

CREATE OR REPLACE PACKAGE BODY Factura_Package AS

    PROCEDURE AgregarFactura(
        p_IdFactura INT,
        p_IdVenta INT,
        p_IdMascota INT,
        p_MetodoPago VARCHAR2,
        p_PagoTotal DECIMAL
    )
    AS
    BEGIN
        INSERT INTO Factura (IdFactura, IdVenta, IdMascota, MetodoPago, PagoTotal)
        VALUES (p_IdFactura, p_IdVenta, p_IdMascota, p_MetodoPago, p_PagoTotal);
    END AgregarFactura;

    PROCEDURE ActualizarFactura(
        p_IdFactura INT,
        p_NuevoIdVenta INT,
        p_NuevoIdMascota INT,
        p_NuevoMetodoPago VARCHAR2,
        p_NuevoPagoTotal DECIMAL
    )
    AS
    BEGIN
        UPDATE Factura
        SET IdVenta = p_NuevoIdVenta,
            IdMascota = p_NuevoIdMascota,
            MetodoPago = p_NuevoMetodoPago,
            PagoTotal = p_NuevoPagoTotal
        WHERE IdFactura = p_IdFactura;
    END ActualizarFactura;

    FUNCTION ObtenerInfoFactura(p_IdFactura INT) RETURN VARCHAR2 AS
            InfoFactura VARCHAR2(255);
        BEGIN
            SELECT 
                IdVenta || ' - ' ||
                IdMascota || ' - ' ||
                MetodoPago || ' - ' ||
                PagoTotal
            INTO InfoFactura
            FROM Factura
            WHERE IdFactura = p_IdFactura;
            RETURN InfoFactura;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    RETURN 'Factura no encontrada';
        END ObtenerInfoFactura;


    PROCEDURE EliminarFactura(p_IdFactura INT)
    AS
    BEGIN
        DELETE FROM Factura WHERE IdFactura = p_IdFactura;
    END EliminarFactura;

END Factura_Package;
/

set serveroutput on;
BEGIN
    Factura_Package.AgregarFactura(
        p_IdFactura => 3,
        p_IdVenta => 101,
        p_IdMascota => 201,
        p_MetodoPago => 'Tarjeta',
        p_PagoTotal => 150.50
    );

    DBMS_OUTPUT.PUT_LINE('Factura agregada.');
END;
/

set serveroutput on;
BEGIN
    Factura_Package.ActualizarFactura(
        p_IdFactura => 3,
        p_NuevoIdVenta => 102,
        p_NuevoIdMascota => 202,
        p_NuevoMetodoPago => 'Efectivo',
        p_NuevoPagoTotal => 200.75
    );

    -- Mostrar mensaje de confirmación
    DBMS_OUTPUT.PUT_LINE('Factura actualizada.');
END;
/

set serveroutput on;
DECLARE
    InfoFactura VARCHAR2(255);
BEGIN
    InfoFactura := Factura_Package.ObtenerInfoFactura(3); -- ID PARA OBTENER MASCOTA

    DBMS_OUTPUT.PUT_LINE(InfoMascota);
END;
/
set serveroutput on;
BEGIN
    Factura_Package.EliminarFactura(p_IdFactura => 3);

    DBMS_OUTPUT.PUT_LINE('Factura eliminada.');
END;
/

SELECT * FROM FACTURA;

DROP PACKAGE Factura_Package;
-------------------------- TRIGGERS DE LAS TABLAS ------------------------------

CREATE TABLE ControlProductos (
    UsuarioConProd VARCHAR(80),
    FechaControlProd DATE
);
CREATE TABLE ControlEmpleados (
    UsuarioConEmp VARCHAR(80),
    FechaControlEmp DATE
);
CREATE TABLE ControlClientes (
    UsuarioConClien VARCHAR(80),
    FechaControlClien DATE
);
CREATE TABLE ControlProveedores (
    UsuarioConProv VARCHAR(80),
    FechaControlProv DATE
);
CREATE TABLE ControlMascotas (
    UsuarioConMasc VARCHAR(80),
    FechaControlMasc DATE
);

CREATE OR REPLACE TRIGGER Control_Ingreso_Producto
BEFORE INSERT 
ON Productos
BEGIN
    INSERT INTO ControlProductos VALUES(USER, SYSDATE);
END Control_Ingreso_Producto;
/

CREATE OR REPLACE TRIGGER Control_Ingreso_Empleado
BEFORE INSERT 
ON Empleados
BEGIN
    INSERT INTO ControlEmpleados VALUES(USER, SYSDATE);
END Control_Ingreso_Empleado;
/

CREATE OR REPLACE TRIGGER Control_Ingreso_Cliente
BEFORE INSERT 
ON Productos
BEGIN
    INSERT INTO ControlClientes VALUES(USER, SYSDATE);
END Control_Ingreso_Cliente;
/

CREATE OR REPLACE TRIGGER Control_Ingreso_Proveedor
BEFORE INSERT 
ON Productos
BEGIN
    INSERT INTO ControlProveedores VALUES(USER, SYSDATE);
END Control_Ingreso_Proveedor;
/

CREATE OR REPLACE TRIGGER Control_Ingreso_Mascota
BEFORE INSERT 
ON Productos
BEGIN
    INSERT INTO ControlMascotas VALUES(USER, SYSDATE);
END Control_Ingreso_Mascota;
/

-- LOS TRIGGERS LO QUE HACEN ES QUE VAN A REGISTRAR EL USUARIO QUE AÑADIÓ LOS VALORES DENTRO DE LAS TABLAS


-------------------------- CURSORES DE LAS TABLAS ------------------------------


