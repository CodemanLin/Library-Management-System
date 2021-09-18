GO
CREATE TRIGGER trig_update_jieyue
ON 借阅
FOR UPDATE AS
  DECLARE @原还书日期 DATETIME,@新还书日期 DATETIME,@原罚款金额 NUMERIC(8,2),@新罚款金额 NUMERIC(8,2),@校园卡编号 INT,@已借册数 INT,@图书编号 VARCHAR(20)
  SET @原还书日期 = (SELECT TOP 1 还书日期 FROM deleted) 
  SET @新还书日期 = (SELECT TOP 1 还书日期 FROM inserted) 
  SET @原罚款金额 = (SELECT TOP 1 罚款金额 FROM deleted) 
  SET @新罚款金额 = (SELECT TOP 1 罚款金额 FROM inserted)
  SET @校园卡编号 = (SELECT TOP 1 校园卡编号 FROM deleted) 
  SET @图书编号 = (SELECT TOP 1 图书编号 FROM deleted)
  SET @已借册数 = (SELECT 已借册数 FROM 读者 WHERE 校园卡号=@校园卡编号)
  IF @原还书日期 IS NULL AND @新还书日期 IS NOT NULL--还书操作
  BEGIN
    UPDATE 读者
    SET 图书借阅次数=图书借阅次数-1
    WHERE 校园卡号= @校园卡编号
    UPDATE 图书
    SET 现存量=现存量+1
    WHERE 图书编号= @图书编号
  END
  IF @原罚款金额 IS NULL AND @新罚款金额 IS NOT NULL--未交罚款增加
  BEGIN
    UPDATE 读者
    SET 未交罚款金额=@新罚款金额
    WHERE 校园卡号= @校园卡编号
  END
  IF @原罚款金额 IS NOT NULL AND @新罚款金额 IS NOT NULL--未交罚款修改
  BEGIN
  UPDATE 读者
    SET 未交罚款金额=未交罚款金额+@新罚款金额
    WHERE 校园卡号= @校园卡编号
  END
GO