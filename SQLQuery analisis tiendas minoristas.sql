use minoristas;
--explorar datos
SELECT TOP 10 * FROM Stores;
SELECT TOP 10 * FROM Features;
SELECT TOP 10 * FROM Sales;
--ventas totales por tienda
--Cambia el tipo de dato de la columna Weekly_Sales
ALTER TABLE Sales
ALTER COLUMN Weekly_Sales FLOAT;
--ventas totales por tienda ordenadas de mayor a menor
SELECT Store, SUM(Weekly_Sales) AS Total_Sales
FROM sales
GROUP BY Store
ORDER BY Total_Sales DESC;
--relacion entre temperatura y ventas
SELECT f.Temperature, SUM(s.Weekly_Sales) AS Total_Sales
FROM Features f
JOIN Sales s ON f.Store = s.Store AND f.Date = s.Date
GROUP BY f.Temperature
ORDER BY f.Temperature;
--vista combiando totdas las tablas
CREATE VIEW SalesAnalysisView AS
SELECT 
    s.Store, 
    s.Dept, 
    s.Date, 
    s.Weekly_Sales, 
    f.Temperature, 
    f.Fuel_Price, 
    f.CPI, 
    f.Unemployment, 
    f.IsHoliday
FROM Sales s
JOIN Features f ON s.Store = f.Store AND s.Date = f.Date;
--vista de los diferentes datos en la tienda 1
SELECT * FROM SalesAnalysisView WHERE Store = 1;




