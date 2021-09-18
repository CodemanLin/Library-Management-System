CREATE VIEW 借出次数前100图书(图书编号,书名,借出次数)
 AS
 SELECT TOP(100) 图书编号,书名,借出次数
 FROM  图书
 ORDER BY 借出次数 DESC