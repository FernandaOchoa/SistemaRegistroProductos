create database ProyectoFinal
on primary
(Name= 'PF', Filename='C:\Users\monsh\Documents\SQL Server Management Studio\taller\proyecto\db.mdf',
Size= 5Mb, MaxSize= 30MB, FileGrowth=10%), 
(Name='PFNDF', Filename='C:\Users\monsh\Documents\SQL Server Management Studio\taller\proyecto\db1.ndf')
log on
(Name='PFLDF', Filename='C:\Users\monsh\Documents\SQL Server Management Studio\taller\proyecto\db2.ldf',
Size= 5Mb, MaxSize= 30MB, FileGrowth=10%)
go

use ProyectoFinal
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

/** Tabla categoria **/
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/** Tabla clientes ****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] NOT NULL,
	[IdPersona] [int] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*** Tabla DetalleIngreso ***/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleIngreso](
	[IdDetalleIngreso] [int] IDENTITY(1,1) NOT NULL,
	[PrecioCompra] [decimal](5, 2) NULL,
	[PrecioVenta] [decimal](5, 2) NULL,
	[StockInicial] [int] NULL,
	[StockActual] [int] NULL,
	[FechaProduccion] [date] NULL,
	[IdIngreso] [int] NULL,
	[IdProducto] [int] NULL,
	[StockMinimo] [int] NULL,
	[Utilidad] [decimal](5, 2) NULL,
 CONSTRAINT [PK_DetalleIngreso] PRIMARY KEY CLUSTERED 
(
	[IdDetalleIngreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*** Tabla detalle venta **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[IdDetalleVenta] [int] NOT NULL,
	[Cantidad] [int] NULL,
	[PrecioVenta] [decimal](18, 2) NULL,
	[Descuento] [decimal](18, 2) NULL,
	[IdDetalleIngreso] [int] NULL,
	[IdVenta] [int] NULL,
 CONSTRAINT [PK_DetalleVenta] PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/** Tabla ingreso **/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingreso](
	[IdIngreso] [int] NOT NULL,
	[Fecha] [date] NULL,
	[Estado] [bit] NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_Ingreso] PRIMARY KEY CLUSTERED 
(
	[IdIngreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/** Tabla persona **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Persona](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellidos] [varchar](60) NULL,
	[Direccion] [varchar](100) NULL,
	[Celular] [char](11) NULL,
	[Sexo] [char](1) NULL,
	[Edad] [int] NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/** Tabla presentacion **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Presentacion](
	[IdPresentacion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Presentacion] PRIMARY KEY CLUSTERED 
(
	[IdPresentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/** Tabla producto **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [int] NULL,
	[Nombre] [varchar](30) NULL,
	[Descripcion] [varchar](50) NULL,
	[Imagen] [varchar](60) NULL,
	[IdCategoria] [int] NULL,
	[IdPresentacion] [int] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/** tabla usuario **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](30) NULL,
	[Clave] [varchar](30) NULL,
	[Cargo] [varchar](50) NULL,
	[IdPersona] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/** tabla venta **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Venta](
	[IdVenta] [int] NOT NULL,
	[Fecha] [date] NULL,
	[TipoComprobante] [varchar](50) NULL,
	[Serie] [char](10) NULL,
	[Correlativo] [char](10) NULL,
	[Igv] [decimal](18, 2) NULL,
	[IdCliente] [int] NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/** Puros inserts **/
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion]) VALUES (1, N'LACTEOS', N'Productos lacteos')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion]) VALUES (2, N'GASEOSAS', N'Gaseosas')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion]) VALUES (3, N'MENESTRAS', N'Menestras')
SET IDENTITY_INSERT [dbo].[Categoria] OFF

SET IDENTITY_INSERT [dbo].[DetalleIngreso] ON 
INSERT [dbo].[DetalleIngreso] ([IdDetalleIngreso], [PrecioCompra], [PrecioVenta], [StockInicial], [StockActual], [FechaProduccion], [IdIngreso], [IdProducto], [StockMinimo], [Utilidad]) VALUES (1, CAST(5.50 AS Decimal(5, 2)), CAST(7.50 AS Decimal(5, 2)), 20, NULL, CAST(N'2018-03-05' AS Date), NULL, 3, 50, CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[DetalleIngreso] ([IdDetalleIngreso], [PrecioCompra], [PrecioVenta], [StockInicial], [StockActual], [FechaProduccion], [IdIngreso], [IdProducto], [StockMinimo], [Utilidad]) VALUES (2, CAST(0.50 AS Decimal(5, 2)), CAST(0.80 AS Decimal(5, 2)), 100, NULL, CAST(N'2018-03-05' AS Date), NULL, 4, 20, CAST(0.30 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[DetalleIngreso] OFF

SET IDENTITY_INSERT [dbo].[Persona] ON 
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [Apellidos], [Direccion], [Celular], [Sexo], [Edad], [Estado]) VALUES (1, N'Francisco', N'Guzman', N'Los Naranjos', N'1161A  ', N'M', 26, 1)
SET IDENTITY_INSERT [dbo].[Persona] OFF

SET IDENTITY_INSERT [dbo].[Presentacion] ON 
INSERT [dbo].[Presentacion] ([IdPresentacion], [Nombre], [Descripcion]) VALUES (1, N'UNIDAD', N'Unidad de producto')
INSERT [dbo].[Presentacion] ([IdPresentacion], [Nombre], [Descripcion]) VALUES (2, N'12 UNIDADES', N'12 unidades')
INSERT [dbo].[Presentacion] ([IdPresentacion], [Nombre], [Descripcion]) VALUES (3, N'CAJA', N'Caja llena de productos')
SET IDENTITY_INSERT [dbo].[Presentacion] OFF

SET IDENTITY_INSERT [dbo].[Producto] ON 
INSERT [dbo].[Producto] ([IdProducto], [Codigo], [Nombre], [Descripcion], [Imagen], [IdCategoria], [IdPresentacion]) VALUES (1, 123654, N'Leche', N'leche	', NULL, 1, 3)
INSERT [dbo].[Producto] ([IdProducto], [Codigo], [Nombre], [Descripcion], [Imagen], [IdCategoria], [IdPresentacion]) VALUES (2, 123654, N'Leche', N'leche	', NULL, 1, 3)
INSERT [dbo].[Producto] ([IdProducto], [Codigo], [Nombre], [Descripcion], [Imagen], [IdCategoria], [IdPresentacion]) VALUES (3, 123654, N'Leche', N'leche	', NULL, 1, 3)
INSERT [dbo].[Producto] ([IdProducto], [Codigo], [Nombre], [Descripcion], [Imagen], [IdCategoria], [IdPresentacion]) VALUES (4, 147852369, N'Galletas', N'galleta oreo.		', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Producto] OFF

SET IDENTITY_INSERT [dbo].[Usuario] ON 
INSERT [dbo].[Usuario] ([IdUsuario], [Usuario], [Clave], [Cargo], [IdPersona]) VALUES (1, N'fer8a', N'fer8a', N'Administrador', 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF

/** Puros Alter **/
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Persona]
GO
ALTER TABLE [dbo].[DetalleIngreso]  WITH CHECK ADD  CONSTRAINT [FK_DetalleIngreso_Ingreso] FOREIGN KEY([IdIngreso])
REFERENCES [dbo].[Ingreso] ([IdIngreso])
GO
ALTER TABLE [dbo].[DetalleIngreso] CHECK CONSTRAINT [FK_DetalleIngreso_Ingreso]
GO
ALTER TABLE [dbo].[DetalleIngreso]  WITH CHECK ADD  CONSTRAINT [FK_DetalleIngreso_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleIngreso] CHECK CONSTRAINT [FK_DetalleIngreso_Producto]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_DetalleIngreso] FOREIGN KEY([IdDetalleIngreso])
REFERENCES [dbo].[DetalleIngreso] ([IdDetalleIngreso])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_DetalleIngreso]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Venta] FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Venta] ([IdVenta])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Venta]
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_Usuario]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Presentacion] FOREIGN KEY([IdPresentacion])
REFERENCES [dbo].[Presentacion] ([IdPresentacion])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Presentacion]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Persona]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Usuario]
GO

/** Procedimientos Almacenados **/
/** Insertar producto **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertarProducto]
@prmstrCodigoBarras varchar(30),
@prmstrNombre varchar(30),
@prmstrDescripcion varchar(50),
@prmintCategoria int,
@prmintPresentacion int,
@prmCosto decimal(5,2),
@prmVenta decimal(5,2),
@prmStockMinimo int,
@prmStockInicial int,
@prmUtilidad decimal(5,2)
AS
BEGIN
	
	INSERT INTO Producto(Codigo,Nombre,Descripcion,IdCategoria,IdPresentacion)
	VALUES(@prmstrCodigoBarras,@prmstrNombre,@prmstrDescripcion,@prmintCategoria,@prmintPresentacion)

	INSERT INTO DetalleIngreso(PrecioCompra,PrecioVenta,StockInicial,FechaProduccion,IdProducto,StockMinimo,Utilidad)
	VALUES(@prmCosto,@prmVenta,@prmStockInicial,getdate(),@@IDENTITY,@prmStockMinimo,@prmUtilidad)

END

GO

/** Para listar categorias **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarCategorias]
AS
BEGIN
	SELECT
		c.Nombre as NombreCategoria
			
	FROM Categoria c WITH(NOLOCK)

END

GO

/** Para listar presentacion **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarPresentacion]
AS
BEGIN
	SELECT p.Nombre as NombrePresentacion
	FROM Presentacion p WITH(NOLOCK)
END

GO
/** Verificar Acceso**/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVerificarAcceso]
@usuario varchar(25),
@clave varchar(25),
@cargo varchar(25)
AS
BEGIN
	SELECT
		u.Usuario,
		u.Cargo,
		p.Apellidos as Apellidos
	FROM Usuario u
	INNER JOIN Persona p ON
	u.IdPersona=p.IdPersona
	WHERE u.Usuario=@usuario AND u.Clave=@clave AND u.Cargo=@cargo

END
GO

/** Joins **/
Select Usuario, Clave from Usuario
order by IdUsuario

Select Nombre Edad, Apellidos from Persona
order by Estado

Select Nombre, Descripcion from Producto
order by Codigo

Select Nombre Edad, Apellidos from Persona
inner join Usuario
on Persona.IdPersona = Usuario.IdPersona

Select Producto.Nombre, Producto.Descripcion from Producto
left join Categoria cat
on Producto.IdCategoria = cat.IdCategoria

Select Ingreso.Fecha, Ingreso.Estado from Ingreso
right join Usuario u
on Ingreso.IdUsuario = u.IdUsuario

Select Producto.IdProducto,
Producto.Nombre,
Producto.Descripcion
INTO #ProductAll
FROM Categoria
Inner join Producto on
Producto.IdProducto = Categoria.IdCategoria

Select Persona.Nombre, Persona.Edad
INTO #AllUsers
FROM Usuario
Left join Persona on
Usuario.IdUsuario = Persona.IdPersona


/** Triggers **/
create trigger insertarUsuarios
  on Usuario
  for insert
as
  SET IDENTITY_INSERT [dbo].[Usuario] ON 
  INSERT [dbo].[Usuario] ([IdUsuario], [Usuario], [Clave], [Cargo], [IdPersona]) VALUES (3, N'Francisco', N'1234', N'Administrador', 3)
  SET IDENTITY_INSERT [dbo].[Usuario] OFF

create trigger insertarProducto
  on Producto
  for insert
as
 SET IDENTITY_INSERT [dbo].[Producto] ON 
INSERT [dbo].[Producto] ([IdProducto], [Codigo], [Nombre], [Descripcion], [Imagen], [IdCategoria], [IdPresentacion]) VALUES (5, 78956, N'Harina', N'Harina	', NULL, 1, 3)
INSERT [dbo].[Producto] ([IdProducto], [Codigo], [Nombre], [Descripcion], [Imagen], [IdCategoria], [IdPresentacion]) VALUES (6, 45632, N'Huevo', N'Huevo	', NULL, 1, 3)
INSERT [dbo].[Producto] ([IdProducto], [Codigo], [Nombre], [Descripcion], [Imagen], [IdCategoria], [IdPresentacion]) VALUES (7, 12389, N'Aceite', N'Aceite	', NULL, 1, 3)
INSERT [dbo].[Producto] ([IdProducto], [Codigo], [Nombre], [Descripcion], [Imagen], [IdCategoria], [IdPresentacion]) VALUES (8, 45623, N'Paletas', N'Magnum.		', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Producto] OFF

select Nombre,count(*) as cant
from Producto
group by Nombre

/** Vista  Stock**/

create view stock
as
  select Nombre,count(*) as cant
  from Producto
  group by Nombre

create view stock
as
  select Nombre,count(*) as cant
  from Producto
  group by Nombre