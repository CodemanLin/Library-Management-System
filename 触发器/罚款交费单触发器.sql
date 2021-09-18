GO
CREATE TRIGGER trig_insert_fakuan
ON 罚款交费单
FOR INSERT AS
  DECLARE @校园卡编号 INT,@金额 NUMERIC(8,2) 
  SET @校园卡编号 = (SELECT TOP 1 校园卡号 FROM inserted) 
  SET @金额 = (SELECT TOP 1 金额 FROM inserted)
  IF @金额 IS NOT NULL
  BEGIN
    UPDATE 读者
    SET 未交罚款金额=未交罚款金额-@金额
    WHERE 校园卡号= @校园卡编号
  END
GO