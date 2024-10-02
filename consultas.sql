--Versión de nuestro SQl Server
SELECT @@VERSION AS VersionSQLServer
GO
--Escribir mi primer codigo
SELECT 'Hola estoy en SQl Server 2022' AS PrimeroCodigo
GO
SELECT 19+3 ESLASUMA
GO
SELECT 19+3 'ES LA SUMA'
GO
SELECT 19+3 [ES LA SUMA]
GO--PERMITE REALIZAR SALTO DE CODIGO
--poner un nombre a mi columna debo utilizar un alias con la Palabra AS
-- signifca comentar la linea de codigo
--Error a consultar--
/*
Msg 156, Level 15, State 1, Line 18
Incorrect syntax near the keyword 'FROM'.

FROM
WHERE
*/
--Soluionar Error
--Listar todas las base de datos que existe en mi SQL Server
SELECT *--signica que me va mostrar todo las columna de la tabla ú objeto
FROM sys.sysdatabases
WHERE dbid=8
GO
--ELIMINAR UNA BASE DE DATOS(BD)
DROP DATABASE AdventureWorks2022
GO
--USAR MI BD AdventureWorks2022
USE AdventureWorks2019
GO
--LISTAR TABLAS DE MI BD AdventureWorks2022
SELECT * FROM sys.tables--Me muestr atoda las tabla con toda las columnas
GO
SELECT object_id AS CodigoTabla
	  ,name AS NombreTabla
	  ,schema_id  AS CodigoEsquema
FROM sys.tables
GO
--SELECCIONAR TODOS MIS ESQUEMAS
SELECT * FROM sys.schemas
GO
SELECT * FROM Sales.SalesTaxRate
GO
--USAR MI BD Master
USE master
GO
--PUEDO SELECCIONAR DESDE OTRA BD MI CONSULTA
SELECT * FROM AdventureWorks2019.Sales.SalesTaxRate
GO
--UNION DE CAMPOS CON ID IGUALES
SELECT TOP 10 object_id AS CodigoTabla
	  ,name AS NombreTabla
	  ,schema_id  AS CodigoEsquema
FROM sys.tables
GO
SELECT TOP 10 * FROM sys.schemas
GO
--UNIR MIS TABLAS DE MI BD
SELECT sys.tables.name AS NombreTabla
	  ,sys.schemas.name AS NombreEsquema
FROM sys.tables
INNER JOIN sys.schemas ON sys.tables.schema_id= sys.schemas.schema_id
GO
--UNIR MIS TABLAS DE MI BD
SELECT T.name AS NombreTabla
	  ,S.name AS NombreEsquema
FROM sys.tables AS T
INNER JOIN sys.schemas AS S ON T.schema_id= S.schema_id
GO
--CUMPLIR CONDICIÓN DE EJECUCIÓN SELECT * FROM Sales.SalesTaxRate
SELECT S.name AS NombreEsquema
	  ,T.name AS NombreTabla
FROM sys.tables AS T
INNER JOIN sys.schemas AS S ON T.schema_id= S.schema_id
GO
--UNIR CAMPOS, HAY DO OPCIONES EL PRIMERO +, COMAS
SELECT 'SELECT * FROM ' + (S.name+'.'+T.name)
FROM sys.tables AS T
INNER JOIN sys.schemas AS S ON T.schema_id= S.schema_id
GO
--SELECCIONAR TODAS LAS TABLAS DE MI BASE DE DATOS
SELECT * FROM Sales.SalesTaxRate
SELECT * FROM Sales.PersonCreditCard
SELECT * FROM Person.PersonPhone
SELECT * FROM Sales.SalesTerritory
SELECT * FROM Person.PhoneNumberType
SELECT * FROM Production.Product
SELECT * FROM Sales.SalesTerritoryHistory
SELECT * FROM Production.ScrapReason
SELECT * FROM HumanResources.Shift
SELECT * FROM Production.ProductCategory
SELECT * FROM Purchasing.ShipMethod
SELECT * FROM Production.ProductCostHistory
SELECT * FROM Production.ProductDescription
SELECT * FROM Sales.ShoppingCartItem
SELECT * FROM Production.ProductDocument
SELECT * FROM dbo.DatabaseLog
SELECT * FROM Production.ProductInventory
SELECT * FROM Sales.SpecialOffer
SELECT * FROM dbo.ErrorLog
SELECT * FROM Production.ProductListPriceHistory
SELECT * FROM Person.Address
SELECT * FROM Sales.SpecialOfferProduct
SELECT * FROM Production.ProductModel
SELECT * FROM Person.AddressType
SELECT * FROM Person.StateProvince
SELECT * FROM Production.ProductModelIllustration
SELECT * FROM dbo.AWBuildVersion
SELECT * FROM Production.ProductModelProductDescriptionCulture
SELECT * FROM Production.BillOfMaterials
SELECT * FROM Sales.Store
SELECT * FROM Production.ProductPhoto
SELECT * FROM Production.ProductProductPhoto
SELECT * FROM Production.TransactionHistory
SELECT * FROM Production.ProductReview
SELECT * FROM Person.BusinessEntity
SELECT * FROM Production.TransactionHistoryArchive
SELECT * FROM Production.ProductSubcategory
SELECT * FROM Person.BusinessEntityAddress
SELECT * FROM Purchasing.ProductVendor
SELECT * FROM Person.BusinessEntityContact
SELECT * FROM Production.UnitMeasure
SELECT * FROM Purchasing.Vendor
SELECT * FROM Person.ContactType
SELECT * FROM Sales.CountryRegionCurrency
SELECT * FROM Person.CountryRegion
SELECT * FROM Production.WorkOrder
SELECT * FROM Purchasing.PurchaseOrderDetail
SELECT * FROM Sales.CreditCard
SELECT * FROM Production.Culture
SELECT * FROM Production.WorkOrderRouting
SELECT * FROM Sales.Currency
SELECT * FROM Purchasing.PurchaseOrderHeader
SELECT * FROM Sales.CurrencyRate
SELECT * FROM Sales.Customer
SELECT * FROM HumanResources.Department
SELECT * FROM Production.Document
SELECT * FROM Sales.SalesOrderDetail
SELECT * FROM Person.EmailAddress
SELECT * FROM HumanResources.Employee
SELECT * FROM Sales.SalesOrderHeader
SELECT * FROM HumanResources.EmployeeDepartmentHistory
SELECT * FROM HumanResources.EmployeePayHistory
SELECT * FROM Sales.SalesOrderHeaderSalesReason
SELECT * FROM Sales.SalesPerson
SELECT * FROM Production.Illustration
SELECT * FROM HumanResources.JobCandidate
SELECT * FROM Production.Location
SELECT * FROM Person.Password
SELECT * FROM Sales.SalesPersonQuotaHistory
SELECT * FROM Person.Person
SELECT * FROM Sales.SalesReason
GO
--UNIÓN DE CAMPOS
SELECT * FROM AdventureWorks2022.Person.Person
GO
--UNIR CAMPOS INCORRECTO
SELECT TOP(15) FirstName AS PNombre
	  ,MiddleName AS SNombre
	  ,LastName AS Apellidos
	  ,FirstName +' '+ MiddleName +' '+ LastName AS NombreyApellidoPersonaCompleto
FROM AdventureWorks2019.Person.Person --19972
GO
--UNIOR CAMPOS CORRECTO CONCAT
SELECT TOP(15) FirstName AS PNombre
	  ,MiddleName AS SNombre
	  ,LastName AS Apellidos
	  ,CONCAT(FirstName ,' ', MiddleName ,' ', LastName) AS NombreyApellidoPersonaCompleto
FROM AdventureWorks2019.Person.Person --19972
GO
--USAR +
SELECT 120+9
GO
--CONCAT
SELECT CONCAT (120,9)
GO
--selecciona  todo los cmpos   lllamr objeto(tabla, vista,esquema,ps...)  esquema.tabla
  SELECT      *                FROM                                       Person.Person--persona
GO
--VER IDIOMA
SELECT TOP(15) FirstName AS PNombre
	  ,MiddleName AS SNombre
	  ,LastName AS Apellidos
	  ,ModifiedDate AS Fecha
	  ,DATENAME(MONTH,ModifiedDate) AS MES
FROM Person.Person
GO
--VER EN ESPAÑOL
--LISTAR TODO LOS LENGUAJE QUE EXISTE EN MI SQL SERVER
SELECT * FROM sys.syslanguages
GO
--ES CAMBIAR EL LENGUA DE INGLE A ESPAOL
SET LANGUAGE 'Español'
GO
SELECT @@VERSION--VERSIÓN
SELECT @@SERVERNAME--NOMBRE PROGRAMA
GO
--RESTARUAR UNA BASE DE DATOS EN VSC
RESTORE DATABASE AdventureWorks2022
FROM DISK='C:\Curso_SQLServer\Enseñanza\SQL Server Cursos\SQL Server Fundamentals\Backup\AdventureWorks\AdventureWorks2022.bak'
WITH RECOVERY,
MOVE 'AdventureWorks2022' TO 'C:\Curso_SQLServer\Enseñanza\SQL Server Cursos\SQL Server Fundamentals\Script\2024_07\AdventureWorks2022.mdf',
MOVE 'AdventureWorks2022_log' TO 'C:\Curso_SQLServer\Enseñanza\SQL Server Cursos\SQL Server Fundamentals\Script\2024_07\AdventureWorks2022_log.ldf'
GO
--VER ERROR
/*
Msg 3234, Level 16, State 2, Line 203
El archivo lógico 'Datoslogicos' no es parte de la base de datos 'AdventureWorks2022'. Use RESTORE FILELISTONLY para enumerar los nombres de los archivos lógicos.
Msg 3013, Level 16, State 1, Line 203
Fin anómalo de RESTORE DATABASE.
*/
RESTORE FILELISTONLY 
FROM DISK='C:\Curso_SQLServer\Enseñanza\SQL Server Cursos\SQL Server Fundamentals\Backup\AdventureWorks\AdventureWorks2022.bak'