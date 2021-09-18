 CREATE TABLE 图书
 (
 图书编号 VARCHAR(20) PRIMARY KEY,
 校区 VARCHAR(3) ,
 书名 VARCHAR(50) NOT NULL,
 作者 VARCHAR(20) NOT NULL,
 价格 NUMERIC(8,2) NOT NULL,
 页码 INT NOT NULL,
 库存总量 INT NOT NULL,
 现存量 INT NOT NULL,
 入库时间 DATETIME ,
 借出次数 INT NOT NULL,
 
 );
  CREATE TABLE 图书类型
 (
 图书类型编号 CHAR(1) PRIMARY KEY,
 图书类型名 VARCHAR(50) NOT NULL
 );
 CREATE TABLE 电子书
(
书名 VARCHAR(50) NOT NULL,
 作者 VARCHAR(20) NOT NULL,
)
 CREATE TABLE 读者类型
 (
 读者类型编号 CHAR(10) PRIMARY KEY,
 读者类型名 VARCHAR(20) NOT NULL,
 可借阅册数 INT CHECK(可借阅册数>=20 AND 可借阅册数<=60),
 借期天数 INT  CHECK(借期天数>=90 AND 借期天数<=120),
 可续借天数 INT  CHECK(可续借天数>=10 AND 可续借天数<=60)
 )

 CREATE TABLE 读者
 (
 校园卡号 INT PRIMARY KEY ,
 校区 VARCHAR(3) ,
 读者类型编号 CHAR(10),
 姓名 VARCHAR(50) NOT NULL,
 性别 CHAR(10) CHECK (性别 IN ('男','女')),
 图书借阅次数 INT,
 是否挂失 INT,
 已借册数 INT,
 未交罚款金额 NUMERIC(8,2),
 FOREIGN KEY(读者类型编号) REFERENCES 读者类型 (读者类型编号)
 )

 CREATE TABLE 管理员
 (
 管理员编号 INT  PRIMARY KEY,
 管理员姓名 VARCHAR(50) NOT NULL,
 性别 CHAR(10) CHECK (性别  IN ('男','女')),
 )

 CREATE TABLE 罚款交费单
 (
 交费单号 INT PRIMARY KEY,
 校园卡编号 INT ,
 日期 DATETIME NOT NULL,
 金额 NUMERIC(8,2) NOT NULL,
 FOREIGN KEY(校园卡编号) REFERENCES 读者(校园卡号)
  )

  CREATE TABLE 图书入库单
  (
  入库单编号 INT PRIMARY KEY,
  入库日期 DATETIME NOT NULL,
  经手人编号 INT,
  是否入库 INT,
  FOREIGN KEY(经手人编号) REFERENCES 管理员(管理员编号)
  )

  CREATE TABLE 图书入库单明细
  (
  入库单编号 INT,
  图书编号 VARCHAR(20),
  数量 INT NOT NULL,
  PRIMARY KEY(入库单编号,图书编号),
  FOREIGN KEY(入库单编号) REFERENCES 图书入库单(入库单编号),
  FOREIGN KEY(图书编号) REFERENCES 图书(图书编号)
  )

  CREATE TABLE 图书报损单
  (
  报损单编号 INT PRIMARY KEY,
  报损日期 DATETIME NOT NULL,
  经手人编号 INT,
  FOREIGN KEY(经手人编号) REFERENCES 管理员(管理员编号)
  )

  CREATE TABLE 图书报损单明细
  (
  报损单编号 INT,
  图书编号 VARCHAR(20),
  数量 INT NOT NULL,
  报损原因 VARCHAR(100) NOT NULL,
  PRIMARY KEY(报损单编号,图书编号),
  FOREIGN KEY(报损单编号) REFERENCES 图书报损单(报损单编号),
  FOREIGN KEY(图书编号) REFERENCES 图书(图书编号)
  )

  CREATE TABLE 借阅
  (
  校园卡编号 INT ,
  校区 VARCHAR(3),
  图书编号 VARCHAR(20),
  借书日期 DATETIME NOT NULL,
  还书日期 DATETIME,
  罚款金额 NUMERIC(8,2),
  是否续借 INT,
  CHECK (借书日期>=还书日期),
  PRIMARY KEY(校园卡编号,图书编号),
  FOREIGN KEY(校园卡编号) REFERENCES 读者(校园卡号),
  FOREIGN KEY(图书编号) REFERENCES 图书(图书编号)
  )
 CREATE TABLE 快递表
(
  订单号 INT,
  图书编号 VARCHAR(20),
  校园卡号 INT,
  校区 VARCHAR(3)
 )