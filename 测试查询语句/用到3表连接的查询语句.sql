SELECT *
FROM  读者,图书,借阅
WHERE 图书.图书编号=借阅.图书编号 AND 读者.校园卡号=借阅.校园卡编号