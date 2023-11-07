-- Base de datos para Witty's

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
    IdCliente INT, -- Clave foránea a la tabla Clientes
    IdEmpleado INT, -- Clave foránea a la tabla Empleados
    Direccion VARCHAR(255),
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente),
    FOREIGN KEY (IdEmpleado) REFERENCES Empleados(IdEmpleado)
);

CREATE TABLE Factura (
    IdFactura INT PRIMARY KEY,
    IdVenta INT, -- Clave foránea a la tabla Ventas
    IdProducto INT, -- Clave foránea a la tabla Productos
    MetodoPago VARCHAR(50),
    PagoTotal DECIMAL(10, 2),
    FOREIGN KEY (IdVenta) REFERENCES Ventas(IdVenta),
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto)
);

CREATE TABLE Mascotas (
    IdMascota INT PRIMARY KEY,
    IdCliente INT, -- Clave foránea a la tabla Clientes
    NombreMascota VARCHAR(255),
    Tratamiento VARCHAR(255),
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente)
);

