GO
CREATE TRIGGER trig_insert_baosun
ON 图书报损单明细
FOR INSERT AS
  DECLARE @数量 INT,@图书编号 VARCHAR(20)
  SET @数量 = (SELECT TOP 1 数量 FROM inserted) 
  SET @图书编号 = (SELECT TOP 1 图书编号 FROM inserted)
    UPDATE 图书
    SET 库存总量=库存总量-@数量,现存量=现存量-@数量
    WHERE 图书编号= @图书编号 
GO
