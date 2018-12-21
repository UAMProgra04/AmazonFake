use Prog04_Proj02
go
begin transaction
	begin try
		INSERT [dbo].[CATEGORIA] ([codcategoria], [descategoria]) VALUES (N'1 ', N'Audifonos')
		INSERT [dbo].[CATEGORIA] ([codcategoria], [descategoria]) VALUES (N'2 ', N'Camaras')
		INSERT [dbo].[CATEGORIA] ([codcategoria], [descategoria]) VALUES (N'3 ', N'Celulares')
		INSERT [dbo].[CATEGORIA] ([codcategoria], [descategoria]) VALUES (N'4 ', N'Laptops')
		INSERT [dbo].[CATEGORIA] ([codcategoria], [descategoria]) VALUES (N'5 ', N'Tablets')
		
		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'1   ', N'Audifono bluetooth Azul', N'1 ', CAST(10500.00 AS Decimal(18, 2)), 10, N'Audifono01.jpg')
		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'2   ', N'Audifono Negro', N'1 ', CAST(8500.00 AS Decimal(18, 2)), 10, N'Audifono03.jpg')
		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'3   ', N'Audifono bluetooth Negro', N'1 ', CAST(10500.00 AS Decimal(18, 2)), 10, N'Audifono04.jpg')
		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'4   ', N'Audifono Verde', N'1 ', CAST(7000.00 AS Decimal(18, 2)), 10, N'Audifono05.jpg')

		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'5   ', N'Camara Digital 12x', N'2 ', CAST(15500.00 AS Decimal(18, 2)), 10, N'Camara01.jpg')
		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'6   ', N'Camara Digital 15x', N'2 ', CAST(28500.00 AS Decimal(18, 2)), 10, N'Camara02.jpg')
		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'7   ', N'Camara Digital 30x', N'2 ', CAST(50500.00 AS Decimal(18, 2)), 10, N'Camara03.jpg')

		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'8   ', N'Celular samsung Galaxy 01', N'3 ', CAST(250000.00 AS Decimal(18, 2)), 10, N'Celular01.jpg')
		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'9   ', N'Celular samsung Galaxy 02', N'3 ', CAST(350000.00 AS Decimal(18, 2)), 10, N'Celular02.jpg')
		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'10   ', N'Celular Motorola', N'3 ', CAST(250000.00 AS Decimal(18, 2)), 10, N'Celular03.jpg')
		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'11   ', N'Celular samsung Galaxy 03', N'3 ', CAST(450000.00 AS Decimal(18, 2)), 10, N'Celular04.jpg')

		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'12   ', N'Laptop 14', N'4 ', CAST(250000.00 AS Decimal(18, 2)), 10, N'Laptop01.jpg')
		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'13   ', N'Laptop 14', N'4 ', CAST(350000.00 AS Decimal(18, 2)), 10, N'Laptop02.jpg')
		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'14   ', N'Laptop 14', N'4 ', CAST(250000.00 AS Decimal(18, 2)), 10, N'Laptop03.jpg')
		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'15   ', N'Laptop 14', N'4 ', CAST(450000.00 AS Decimal(18, 2)), 10, N'Laptop04.jpg')
		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'16   ', N'Laptop 14', N'4 ', CAST(450000.00 AS Decimal(18, 2)), 10, N'Laptop05.jpg')
		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'17   ', N'Laptop 14', N'4 ', CAST(550000.00 AS Decimal(18, 2)), 10, N'Laptop06.jpg')

		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'18   ', N'Tbablet 10', N'5 ', CAST(150000.00 AS Decimal(18, 2)), 10, N'Tablet01.jpg')
		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'19   ', N'Tbablet 12', N'5 ', CAST(200000.00 AS Decimal(18, 2)), 10, N'Tablet02.jpg')
		INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) 
		VALUES (N'20   ', N'Tbablet 14', N'5 ', CAST(250000.00 AS Decimal(18, 2)), 10, N'Tablet03.jpg')

		INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [VEN_SuTotal], [VEN_IGV], [VEN_Total], [VEN_Cliente]) VALUES (N'0001      ', N'17/07/2014', CAST(3280.00 AS Decimal(10, 2)), CAST(720.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), N'Ingreso Compra test System')
		INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [DV_Cantidad], [DV_Precio], [DV_SubTotal], [codproducto]) VALUES (N'0001      ', 1, CAST(2500.00 AS Decimal(10, 2)), CAST(2500.00 AS Decimal(10, 2)), N'1   ')
		INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [DV_Cantidad], [DV_Precio], [DV_SubTotal], [codproducto]) VALUES (N'0001      ', 1, CAST(1500.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), N'3   ')
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
