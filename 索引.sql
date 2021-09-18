 CREATE INDEX 书名索引 ON 图书(书名);

  CREATE INDEX 图书类型编号索引 ON 图书(图书类型编号);
  CREATE INDEX 作者索引 ON 图书(作者);

  CREATE INDEX 姓名索引 ON 读者(姓名);
  CREATE INDEX 图书借阅次数索引 ON 读者(图书借阅次数);
  CREATE INDEX 已借册数索引 ON 读者(已借册数);
  CREATE INDEX 未交罚款金额索引 ON 读者(未交罚款金额);
  CREATE INDEX 职工姓名索引 ON 管理员(管理员姓名);
  CREATE INDEX 校园卡编号索引 ON 罚款交费单(校园卡号);
  CREATE INDEX 经手职工编号索引 ON 图书入库单(经手人编号);
  CREATE INDEX 图书入库单编号索引 ON 图书入库单明细(入库单编号);
  CREATE INDEX 图书编号索引 ON 图书入库单明细(图书编号);
  CREATE INDEX 经手职工编号索引 ON 图书报损单(经手人编号);
  CREATE INDEX 图书报损单编号索引 ON 图书报损单明细(报损单编号);
  CREATE INDEX 图书编号索引 ON 图书报损单明细(图书编号);
  CREATE INDEX 借书证编号索引 ON 借阅(校园卡编号);
  CREATE INDEX 图书编号索引 ON 借阅(图书编号);