GO
  CREATE  PROCEDURE  P1  
  @入库单号   INT
AS
DECLARE @图书编号 INT, @数量 INT ,@是否已入库 INT ,@入库日期 DATETIME
DECLARE C1 CURSOR FOR       
       SELECT 图书编号,数量 FROM 图书入库单明细 WHERE 入库单编号=@入库单号
SELECT @是否已入库=是否入库, @入库日期=入库日期
FROM 图书入库单
WHERE 入库单编号=@入库单号
IF @是否已入库=0
BEGIN

OPEN C1
BEGIN TRANSACTION  /* 处理之前  开始事务（要么全做，要么全不做） */
/* 处理 */
WHILE 1=1
BEGIN
  FETCH NEXT FROM C1 INTO  @图书编号, @数量
  IF @@fetch_status<>0  
         BREAK 
  UPDATE 图书/*修改图书表*/
  SET 库存总量=库存总量+@数量,现存量=现存量+@数量,入库时间=@入库日期
  WHERE 图书编号=@图书编号
END   
CLOSE C1
DEALLOCATE C1
UPDATE 图书入库单/*修改图书入库单表*/
SET 是否入库=1
WHERE 入库单编号=@入库单号
COMMIT    /* 一个订单的订单明细全部处理完成  */
END
GO