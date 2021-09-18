GO
CREATE TRIGGER trig_delete_tsrkdmx
ON 图书入库单明细
FOR DELETE AS
  DECLARE @是否入库 INT,@入库单编号 INT
  SET @入库单编号 = (SELECT TOP 1 入库单编号 FROM deleted)
  SET @是否入库 = (SELECT 是否入库 FROM 图书入库单 WHERE 入库单编号=@入库单编号)
  IF @是否入库=1
  BEGIN
     RAISERROR('已入库不能删除!',16,1)
     ROLLBACK TRANSACTION
     END
GO