BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "category" (
	"category_id"	INTEGER NOT NULL,
	"category_name"	TEXT NOT NULL DEFAULT '選択式',
	PRIMARY KEY("category_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "selection" (
	"selection_id"	INTEGER NOT NULL,
	"question_id"	INTEGER NOT NULL,
	"number1"	TEXT,
	"number2"	TEXT,
	"number3"	TEXT,
	"number4"	TEXT,
	PRIMARY KEY("selection_id" AUTOINCREMENT),
	FOREIGN KEY("question_id") REFERENCES "question"("question_id")
);
CREATE TABLE IF NOT EXISTS "field" (
	"field_id"	INTEGER NOT NULL,
	"field_name"	INTEGER,
	PRIMARY KEY("field_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "answer_type" (
	"answer_type_id"	INTEGER NOT NULL,
	"question_id"	INTEGER,
	"type_no"	INTEGER DEFAULT 0,
	"answer"	TEXT,
	"select_rate"	NUMERIC,
	"correct"	INTEGER,
	"url"	TEXT,
	"selection_pro"	INTEGER,
	"selection_no"	TEXT,
	"selection_sen"	TEXT,
	PRIMARY KEY("answer_type_id" AUTOINCREMENT),
	FOREIGN KEY("question_id") REFERENCES "question"("question_id")
);
CREATE TABLE IF NOT EXISTS "image" (
	"image_id"	INTEGER NOT NULL,
	"question_id"	INTEGER,
	"image_no"	INTEGER DEFAULT 1,
	"image"	TEXT,
	PRIMARY KEY("image_id" AUTOINCREMENT),
	FOREIGN KEY("question_id") REFERENCES "question"("question_id")
);
CREATE TABLE IF NOT EXISTS "question" (
	"question_id"	INTEGER NOT NULL,
	"year"	INTEGER NOT NULL DEFAULT 2007,
	"subjects"	TEXT,
	"part_no"	INTEGER NOT NULL DEFAULT 1,
	"question_no"	INTEGER NOT NULL DEFAULT 1,
	"sentence"	TEXT,
	"category_id"	INTEGER,
	"correct_rate"	REAL,
	"url"	INTEGER,
	"grade"	INTEGER,
	"field"	INTEGER,
	PRIMARY KEY("question_id" AUTOINCREMENT),
	FOREIGN KEY("category_id") REFERENCES "category"("category_id"),
	FOREIGN KEY("field") REFERENCES "field"("field_id")
);
INSERT INTO "category" VALUES (1,'選択式');
INSERT INTO "category" VALUES (2,'短答式');
INSERT INTO "category" VALUES (3,'記述式');
INSERT INTO "category" VALUES (4,'問題文');
INSERT INTO "field" VALUES (1,'A 数と計算');
INSERT INTO "field" VALUES (2,'B 図形');
INSERT INTO "field" VALUES (3,'旧B 量と測定');
INSERT INTO "field" VALUES (4,'旧C 図形');
INSERT INTO "field" VALUES (5,'C 測定');
INSERT INTO "field" VALUES (6,'C 変化と関係');
INSERT INTO "field" VALUES (7,'D データの活用');
INSERT INTO "field" VALUES (8,'旧D 数量関係');
INSERT INTO "answer_type" VALUES (1,373,1,'求め方：Ａ①，Ａ②，Ａ③の全てを書いている 　答え：200 と解答しているもの',62,1,'https://www.nier.go.jp/21chousakekkahoukoku/report/data/21pmath_04.pdf#page=5',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2,373,2,'求め方：Ａ①，Ａ②，Ａ③の全てを書いている 　答え：200 以外を解答しているもの　無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3,373,3,'求め方：Ａ①，Ａ②を書いている　Ａ①，Ａ③を書いている 　Ａ②，Ａ③を書いている　Ａ①を書いている　Ａ②を書いている　Ａ③を書いている　答え：200 と解答しているもの',12,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (4,373,4,'求め方：Ａ①，Ａ②を書いている　Ａ①，Ａ③を書いている 　Ａ②，Ａ③を書いている　Ａ①を書いている　Ａ②を書いている　Ａ③を書いている　答え：200 以外を解答しているもの　無解答',13,NULL,NULL,NULL,NULL,'');
INSERT INTO "answer_type" VALUES (5,373,5,'求め方：Ｂ①，Ｂ②，Ｂ③の全てを書いている　答え：200 と解答しているもの',0.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (6,373,6,'求め方：Ｂ①，Ｂ②，Ｂ③の全てを書いている　答え：200 以外を解答しているもの　無解答',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (7,373,7,'求め方：Ｂ①，Ｂ②を書いている　Ｂ①，Ｂ③を書いている　Ｂ②，Ｂ③を書いている　Ｂ①を書いている　 Ｂ②を書いている　Ｂ③を書いている　答え：200 と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (8,373,8,'求め方：Ｂ①，Ｂ②を書いている　Ｂ①，Ｂ③を書いている　Ｂ②，Ｂ③を書いている　Ｂ①を書いている　 Ｂ②を書いている　Ｂ③を書いている　答え：200 以外を解答しているもの　無解答',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (9,373,9,'求め方：Ｃ①α，Ｃ②α，Ｃ③の全てを書いている　Ｃ①β，Ｃ②β，Ｃ③の全てを書いている　答え： 200 と解答しているもの',0.5,1,'',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (10,373,10,'求め方：Ｃ①α，Ｃ②α，Ｃ③の全てを書いている　Ｃ①β，Ｃ②β，Ｃ③の全てを書いている　答え： 200 以外を解答しているもの　無解答',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (11,373,11,'求め方：Ｃ①α，Ｃ②αを書いている　Ｃ①β，Ｃ②βを書いている　Ｃ①α，Ｃ③を書いている　Ｃ①β，Ｃ③を書いている　Ｃ②α，Ｃ③を書いている　Ｃ②β，Ｃ③を書いている　Ｃ①αを書いている　Ｃ①βを書いている　Ｃ②αを書いている　Ｃ②βを書いている　Ｃ③を書いている　答え： 200 と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (12,373,12,'求め方：Ｃ①α，Ｃ②αを書いている　Ｃ①β，Ｃ②βを書いている　Ｃ①α，Ｃ③を書いている　Ｃ①β，Ｃ③を書いている　Ｃ②α，Ｃ③を書いている　Ｃ②β，Ｃ③を書いている　Ｃ①αを書いている　Ｃ①βを書いている　Ｃ②αを書いている　Ｃ②βを書いている　Ｃ③を書いている　答え： 200 以外を解答しているもの　無解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (13,373,13,'求め方：類型１から類型12以外の解答　無解答　答え： 200 と解答しているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (14,373,99,'上記以外の解答',7.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (15,373,0,' 無解答',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (16,374,1,'14 と解答しているもの',86.8,1,'https://www.nier.go.jp/21chousakekkahoukoku/report/data/21pmath_04.pdf#page=10',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (17,374,2,'21 と解答しているもの',4.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (18,374,3,'２ と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (19,374,4,'3.5 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (20,374,5,' ９ と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (21,374,6,'10 と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (22,374,7,' 0.014 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (23,374,8,' 500÷７の商を書いているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (24,374,9,'500÷７×1000の計算結果を書いているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (25,374,10,'1000 と解答しているもの　　500 と解答しているもの　　７ と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (26,374,99,'上記以外の解答',5.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (27,374,0,'無解答',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (28,375,1,' 1 と解答しているもの',56,1,'https://www.nier.go.jp/21chousakekkahoukoku/report/data/21pmath_04.pdf#page=11',1,'1','1 分間あたりに進む道のりは 80 m と約 71 m なので，㋐のほうが 
速い。');
INSERT INTO "answer_type" VALUES (29,375,2,' 2 と解答しているもの',22.8,NULL,NULL,1,'2','1 分間あたりに進む道のりは 80 m と約 71 m なので，㋑のほうが 
速い。');
INSERT INTO "answer_type" VALUES (30,375,3,' 3 と解答しているもの',6.8,NULL,NULL,1,'3','1 m あたりにかかる時間は 80 分と約 71 分なので，㋐のほうが 
速い。');
INSERT INTO "answer_type" VALUES (31,375,4,' 4 と解答しているもの',9.4,NULL,NULL,1,'4','1 m あたりにかかる時間は 80 分と約 71 分なので，㋑のほうが 
速い。');
INSERT INTO "answer_type" VALUES (32,375,99,'上記以外の解答',3.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (33,375,0,'無解答',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (34,376,1,'（午後）２（時）25（分） と解答しているもの',89.3,1,'https://www.nier.go.jp/21chousakekkahoukoku/report/data/21pmath_04.pdf#page=15',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (35,376,2,'（午後）１（時）25（分） と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (36,376,3,'（午後）０（時）45（分） と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (37,376,4,'（午後）３（時）25（分） と解答しているもの ',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (38,376,5,'（午後）１（時）85（分） と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (39,376,6,'（午後）14（時）25（分） と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (40,376,7,'（午後）１（時）50（分） と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (41,376,8,'（午後）１（時）35（分） と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (42,376,99,'上記以外の解答',8.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (43,376,0,'無解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (44,377,1,' 2700÷540 と解答しているもの',85.2,1,'https://www.nier.go.jp/21chousakekkahoukoku/report/data/21pmath_04.pdf#page=18',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (45,377,2,'540÷2700 と解答しているもの',2.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (46,377,3,'2700×540 と解答しているもの',4.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (47,377,4,'2700＋540 と解答しているもの　　2700－540 と解答しているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (48,377,99,'上記以外の解答',4.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (49,377,0,'無解答',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (50,379,1,'式：３×４÷２ と解答　　答え：６ と解答しているもの',55.4,1,'https://www.nier.go.jp/21chousakekkahoukoku/report/data/21pmath_04.pdf#page=22',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (51,379,2,'式：３×４÷２ と解答　　答え：12 と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (52,379,3,'式：３×４÷２ と解答　　答え：類型１，類型２以外の解答　無解答',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (53,379,4,'式：３×４ と解答　　答え：６ と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (54,379,5,'式：３×４ と解答　　答え：12 と解答しているもの',8.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (55,379,6,'式：３×４ と解答　　答え：類型４，類型５以外の解答　無解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (56,379,7,'式：５×３÷２ と解答　５×４÷２ と解答　　答え：６ と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (57,379,8,'式：５×３÷２ と解答　５×４÷２ と解答　　答え：６ 以外を解答しているもの　無解答',5.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (58,379,9,'式：５×３ と解答　５×４ と解答　　答え：６ と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (59,379,10,'式：５×３ と解答　５×４ と解答　　答え：６ 以外を解答しているもの　無解答',3.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (60,379,11,'式：３×４×５÷２ と解答　３×４×５ と解答　　答え：６ と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (61,379,12,'式：３×４×５÷２ と解答　３×４×５ と解答　　答え：６ 以外を解答しているもの　無解答',20,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (62,379,13,'式：類型１から類型12以外の解答　無解答　　答え：６ と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (63,379,99,'上記以外の解答',5.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (64,379,0,'無解答',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (65,380,1,'１ と解答しているもの',6.2,NULL,'https://www.nier.go.jp/21chousakekkahoukoku/report/data/21pmath_04.pdf#page=25',1,'1','①の面積のほうが大きい。');
INSERT INTO "answer_type" VALUES (66,380,2,'２ と解答しているもの',6.4,NULL,NULL,1,'2','②の面積のほうが大きい。');
INSERT INTO "answer_type" VALUES (67,380,3,'３ と解答しているもの',72.7,1,NULL,1,'3','①と②の面積は等しい。');
INSERT INTO "answer_type" VALUES (68,380,4,'４ と解答しているもの',13.6,NULL,NULL,1,'4','①と②の面積は，このままでは比べることができない。');
INSERT INTO "answer_type" VALUES (69,380,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (70,380,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (71,381,1,'求め方：①，②の全てを書いている　　平行四辺形ABCDの面積：60 と解答しているもの',46.2,1,'https://www.nier.go.jp/21chousakekkahoukoku/report/data/21pmath_04.pdf#page=29',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (72,381,2,'求め方：①，②の全てを書いている　　平行四辺形ABCDの面積：60 以外を解答しているもの　無解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (73,381,3,'求め方：①を書いている　　平行四辺形ABCDの面積：60 と解答しているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (74,381,4,'求め方：①を書いている　　平行四辺形ABCDの面積：60 以外を解答しているもの　無解答',4.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (75,381,5,'求め方：②を書いている　　平行四辺形ABCDの面積：60 と解答しているもの',7.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (77,381,6,'求め方：②を書いている　　平行四辺形ABCDの面積：60 以外を解答しているもの　無解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (78,381,7,'求め方：高さを６cmと捉えているもの　　平行四辺形ABCDの面積：60 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (79,381,8,'求め方：高さを６cmと捉えているもの　　平行四辺形ABCDの面積：30 と解答しているもの',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (80,381,9,'求め方：高さを６cmと捉えているもの　　平行四辺形ABCDの面積：類型７，類型８以外の解答　無解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (81,381,10,'求め方：高さを6.5cmの二つ分と捉えているもの　　平行四辺形ABCDの面積：60 と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (82,381,11,'求め方：高さを6.5cmの二つ分と捉えているもの　　平行四辺形ABCDの面積：65 と解答しているもの',9.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (83,381,12,'求め方：高さを6.5cmの二つ分と捉えているもの　　平行四辺形ABCDの面積：類型10，類型11以外の解答　無解答',3.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (84,381,13,'求め方：高さを6.5cmと捉えているもの　　平行四辺形ABCDの面積：60 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (85,381,14,'求め方：高さを6.5cmと捉えているもの　　平行四辺形ABCDの面積：32.5 と解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (86,381,15,'求め方：高さを6.5cmと捉えているもの　　平行四辺形ABCDの面積：類型13，類型14以外の解答　無解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (87,381,16,'求め方：平行四辺形ＡＢＣＤの面積を，二等辺三角形の面積の四つ分として求めているもの　　平行四辺形ABCDの面積：60 と解答しているもの',2.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (88,381,17,'求め方：平行四辺形ＡＢＣＤの面積を，二等辺三角形の面積の四つ分として求めているもの　　平行四辺形ABCDの面積：120 と解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (89,381,18,'求め方：平行四辺形ＡＢＣＤの面積を，二等辺三角形の面積の四つ分として求めているもの　　平行四辺形ABCDの面積：類型16，類型17以外の解答　無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (90,381,19,'求め方：類型１から類型18以外の解答　無解答　　平行四辺形ABCDの面積：60 と解答しているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (91,381,99,'上記以外の解答',13.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (92,381,0,'無解答',4.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (93,383,1,'ア と解答しているもの ',1.5,NULL,'https://www.nier.go.jp/21chousakekkahoukoku/report/data/21pmath_04.pdf#page=37',1,'ア','401 冊');
INSERT INTO "answer_type" VALUES (94,383,2,'イ と解答しているもの',1.6,NULL,NULL,1,'イ','405 冊');
INSERT INTO "answer_type" VALUES (95,383,3,'ウ と解答しているもの',0.6,NULL,NULL,1,'ウ','410 冊');
INSERT INTO "answer_type" VALUES (96,383,4,'エ と解答しているもの',95.8,1,NULL,1,'エ','450 冊');
INSERT INTO "answer_type" VALUES (97,383,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (98,383,0,'無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (99,384,1,'ア と解答しているもの',0.4,NULL,'https://www.nier.go.jp/21chousakekkahoukoku/report/data/21pmath_04.pdf#page=38',1,'ア','貸し出し冊数がいちばん多い学年は， 2 年生である。');
INSERT INTO "answer_type" VALUES (100,384,2,'イ と解答しているもの',4.1,NULL,NULL,1,'イ','2 年生の貸し出し冊数は， 3 年生の貸し出し冊数の約 2 倍である。');
INSERT INTO "answer_type" VALUES (101,384,3,'ウ と解答しているもの',90.8,1,NULL,1,'ウ','5 年生の貸し出し冊数は， 4 年生の貸し出し冊数の半分くらいである。');
INSERT INTO "answer_type" VALUES (102,384,4,'エ と解答しているもの',4.2,NULL,NULL,1,'エ','1 年生と 3 年生の貸し出し冊数の差は，約 200 冊である。');
INSERT INTO "answer_type" VALUES (103,384,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (104,384,0,'無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (105,385,1,'① と解答しているもの',1.3,NULL,'https://www.nier.go.jp/21chousakekkahoukoku/report/data/21pmath_04.pdf#page=41',1,'1','①');
INSERT INTO "answer_type" VALUES (106,385,2,'② と解答しているもの',67.7,1,NULL,1,'2','②');
INSERT INTO "answer_type" VALUES (107,385,3,'③ と解答しているもの',7.9,NULL,NULL,1,'3','③');
INSERT INTO "answer_type" VALUES (108,385,4,'④ と解答しているもの',2.2,NULL,NULL,1,'4','④');
INSERT INTO "answer_type" VALUES (109,385,5,'⑤ と解答しているもの',5.2,NULL,NULL,1,'5','⑤');
INSERT INTO "answer_type" VALUES (110,385,6,'⑥ と解答しているもの',4.2,NULL,NULL,1,'6','⑥');
INSERT INTO "answer_type" VALUES (111,385,7,'⑦ と解答しているもの',2.4,NULL,NULL,1,'7','⑦');
INSERT INTO "answer_type" VALUES (112,385,8,'⑧ と解答しているもの',6.5,NULL,NULL,1,'8','⑧');
INSERT INTO "answer_type" VALUES (113,385,99,'上記以外の解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (114,385,0,'無解答',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (115,386,1,'①，②，③の全てを書いているもの',52.2,1,'https://www.nier.go.jp/21chousakekkahoukoku/report/data/21pmath_04.pdf#page=44',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (116,386,2,'①，②を書いているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (117,386,3,'①，③を書いているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (118,386,4,'①を書いているが，②について85％と書き，③について20％と書いているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (119,386,5,'①を書いているもの',8.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (120,386,6,'「㋐図書室には読みたい本が少ない」を表す言葉や記号を書いているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (121,386,7,'「㋒ページ数が多く，読み終わるのに時間がかかる」を表す言葉や記号を書いているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (122,386,8,'「㋓ 地域の図書館で本を借りている」を表す言葉や記号を書いているもの',14.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (123,386,9,'②，③を書いているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (124,386,10,'②を書いているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (125,386,11,'③を書いているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (126,386,99,'上記以外の解答',10.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (127,386,0,'無解答',10.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (128,387,1,'２，５ を解答しているもの',74.1,1,'https://www.nier.go.jp/21chousakekkahoukoku/report/data/21pmath_04.pdf#page=48',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (129,387,2,'１，２ を解答しているもの',3.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (130,387,3,'２，３ を解答しているもの ',3.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (131,387,4,'２，４ を解答しているもの',5.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (132,387,5,'１，５ を解答しているもの',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (133,387,6,'３，５ を解答しているもの',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (134,387,7,'４，５ を解答しているもの',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (135,387,8,'１，３ を解答しているもの',3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (136,387,9,'１，４ を解答しているもの',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (137,387,10,'３，４ を解答しているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (138,387,11,'２のみを解答しているもの',0.2,NULL,NULL,1,'2','学校の図書室に置いてほしい本の題名');
INSERT INTO "answer_type" VALUES (139,387,12,'５のみを解答しているもの',0.1,NULL,NULL,1,'5','地域の図書館で最近借りた本の題名');
INSERT INTO "answer_type" VALUES (140,387,13,'１のみを解答しているもの',0,NULL,NULL,1,'1','学校の図書室をよく利用している曜日');
INSERT INTO "answer_type" VALUES (141,387,14,'３のみを解答しているもの',0,NULL,NULL,1,'3','学校の図書室をよく利用している時間帯');
INSERT INTO "answer_type" VALUES (142,387,15,'４のみを解答しているもの',0,NULL,NULL,1,'4','地域の図書館をよく利用している曜日');
INSERT INTO "answer_type" VALUES (143,387,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (144,387,0,'無解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (145,389,1,'４ と解答しているもの',83.1,1,'https://www.nier.go.jp/21chousakekkahoukoku/report/data/21pmath_04.pdf#page=52',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (146,389,2,'３ と解答しているもの',6.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (147,389,3,'３あまり５ と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (148,389,4,'５ と解答しているもの',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (149,389,5,'６ と解答しているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (150,389,6,'８ と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (151,389,7,'23÷６の商を小数又は分数で表しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (152,389,99,'上記以外の解答',4.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (153,389,0,'無解答',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (154,390,1,'式：４÷８ と解答　　答え：0.5 と解答しているもの',55.4,1,'https://www.nier.go.jp/21chousakekkahoukoku/report/data/21pmath_04.pdf#page=54',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (155,390,2,'式：４÷８ と解答　　答え：1/2 と解答しているもの',0.3,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (156,390,3,'式：４÷８ と解答　　答え：5 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (157,390,4,'式：４÷８ と解答　　答え：0.05 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (158,390,5,'式：４÷８ と解答　　答え：2 と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (159,390,6,'式：４÷８ と解答　　答え：1/8 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (160,390,7,'式：４÷８ と解答　　答え：類型１から類型６以外の解答　無解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (161,390,8,'式：８÷４ と解答　　答え：0.5 と解答しているもの　1/2 と解答しているもの',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (162,390,9,'式：８÷４ と解答　　答え：２ と解答しているもの',36,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (163,390,10,'式：８÷４ と解答　　答え：類型８，類型９以外の解答　無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (164,390,11,'式：８×４ と解答　４×８ と解答　　答え：0.5 と解答しているもの　1/2 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (165,390,12,'式：８×４ と解答　４×８ と解答　　答え：類型11以外の解答　無解答',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (166,390,13,'式：類型１から類型12以外の解答　無解答　　答え：0.5 と解答しているもの　1/2 と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (167,390,99,'上記以外の解答',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (168,390,0,'無解答',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (169,391,1,'①，②の全てを書いているもの',51.6,1,'https://www.nier.go.jp/21chousakekkahoukoku/report/data/21pmath_04.pdf#page=56',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (170,391,2,'①を書いているもの ',10.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (171,391,3,'②を書いているもの',3.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (172,391,4,'0.1に当たる長さが0.3ｍであることを表す言葉や数を書いているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (173,391,5,'0.1に当たる長さが２ｍであることを表す言葉や数を書いているもの',3.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (174,391,6,' 0.1に当たる長さが0.1ｍであることを表す言葉や数を書いているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (175,391,7,'12÷30＝0.4で，0.4倍であることを書いているもの',3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (176,391,8,'類型１，類型２，類型４から類型７以外で，30ｍを基にしているもの',8.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (177,391,9,'12ｍを基にしているもの',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (178,391,99,'上記以外の解答',6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (179,391,0,' 無解答',10.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (180,516,1,'式：　150X1.3　 と解答　答え：　195  と解答しているもの',NULL,1,'https://www.nier.go.jp/20chousa/pdf/20kaisetsu_shou_sansuu.pdf#page=18',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (181,516,2,'式：　150X1.3　 と解答　答え：　19.5   と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (182,516,3,'式：　150X1.3　 と解答　答え：　1950   と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (183,516,4,'式：　150X1.3　 と解答　答え：　185  と解答しているもの　18.5  と解答しているもの　1850  と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (184,516,5,'式：　150X1.3　 と解答　答え：　45  と解答しているもの　4.5  と解答しているもの　450  と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (185,516,6,'式：　150X1.3　 と解答　答え：　60  と解答しているもの　6  と解答しているもの　600  と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (186,516,7,'式：　150X1.3　 と解答　答え：　類型1から類型6以外の解答　無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (187,516,8,'式：　150÷1.3　 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (188,516,9,'式：　150+1.3　 と解答しているもの　150-1.3　 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (189,516,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (190,516,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (191,517,1,'10   (km)　　と解答しているもの',NULL,1,'https://www.nier.go.jp/20chousa/pdf/20kaisetsu_shou_sansuu.pdf#page=21',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (192,517,2,'1 (km)　　と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (193,517,3,'100   (km)　　と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (194,517,4,'1000 (km)　　と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (195,517,5,'10000 (km)　　と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (196,517,6,'10000000 (km)　　と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (197,517,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (198,517,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (199,518,1,'アと解答しているもの',NULL,NULL,'https://www.nier.go.jp/20chousa/pdf/20kaisetsu_shou_sansuu.pdf#page=22',1,'ア','1cm');
INSERT INTO "answer_type" VALUES (200,518,2,'イと解答しているもの',NULL,NULL,NULL,1,'イ','1m');
INSERT INTO "answer_type" VALUES (201,518,3,'ウと解答しているもの',NULL,NULL,NULL,1,'ウ','1cm2');
INSERT INTO "answer_type" VALUES (202,518,4,'エと解答しているもの',NULL,1,NULL,1,'エ','1m2');
INSERT INTO "answer_type" VALUES (203,518,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (204,518,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (205,519,1,'80X50    と解答しているもの',NULL,1,'https://www.nier.go.jp/20chousa/pdf/20kaisetsu_shou_sansuu.pdf#page=23',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (206,519,2,'80 X 50の80又は50に位取りの誤りがあるもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (207,519,3,'80 + 50     と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (208,519,4,'80X 2 +50X 2     と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (209,519,5,'類型1,類型2以外で,計算結果が4000になる式を解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (210,519,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (211,519,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (212,520,1,'求め方： ①,②の全てを書いている  答え：縦3個, 横6個  と解答しているもの',NULL,1,'https://www.nier.go.jp/20chousa/pdf/20kaisetsu_shou_sansuu.pdf#page=25',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (213,520,2,'求め方： ①,②の全てを書いている  答え：縦3個, 横6個 以外を解答しているもの  無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (214,520,3,'求め方： ①を書いている  答え：縦3個, 横6個  と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (215,520,4,'求め方： ①を書いている  答え：縦3個, 横6個 以外を解答しているもの  無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (216,520,5,'求め方： ②を書いている  答え：縦3個, 横6個  と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (217,520,6,'求め方： ②を書いている  答え：縦3個, 横6個 以外を解答しているもの  無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (218,520,7,'求め方： 類型1から類型6以外の解答  無解答   答え：縦3個, 横6個  と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (219,520,8,'求め方： 類型1から類型6以外の解答  無解答   答え：縦3個,横6個  以外で,縦に並べる個数と横に並べる個数の積が18になる個数を解答 しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (220,520,9,'求め方： 類型1から類型6以外の解答  無解答   答え：縦に並べる個数と横に並べる個数の和が18になる個数を解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (221,520,10,'縦240mや横300mを18等分した長さを求めているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (222,520,11,'縦80m,横50mの長方形を,縦に18個並べたときの縦の長さや横に18個並べたときの横の長さを求めているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (223,520,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (224,520,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (225,522,1,'正三角形の紙：2  と解答　　長方形の紙：3 と解答しているもの',NULL,1,'https://www.nier.go.jp/20chousa/pdf/20kaisetsu_shou_sansuu.pdf#page=31',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (226,522,2,'正三角形の紙：2  と解答　　長方形の紙：4 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (227,522,3,'正三角形の紙：2  と解答　　長方形の紙：類型1,類型2以外の解答　解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (228,522,4,'正三角形の紙：1  と解答　　長方形の紙：3 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (229,522,5,'正三角形の紙：6  と解答　　長方形の紙：3 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (230,522,6,'正三角形の紙：類型1から類型5以外の解答  無解答　　長方形の紙：3 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (231,522,7,'正三角形の紙：3 と解答　　長方形の紙：4 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (232,522,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (233,522,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (234,523,1,'①,②の全てを書き,被乗数と乗数の関係を正しく書いているもの',NULL,1,'https://www.nier.go.jp/20chousa/pdf/20kaisetsu_shou_sansuu.pdf#page=33',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (235,523,2,'①,②の全てを書いているが,被乗数と乗数の関係が明確ではないもの,又 は被乗数と乗数の関係を誤って書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (236,523,3,'②を書き,①について,図形の構成要素を基に書いているが,不足があるも の,又は誤って書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (237,523,4,'①を書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (238,523,5,'②を書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (239,523,6,'①について,図形の構成要素を基に書いているが,不足があるもの,又は誤って書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (240,523,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (241,523,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (242,524,1,'アと解答しているもの',NULL,NULL,'https://www.nier.go.jp/20chousa/pdf/20kaisetsu_shou_sansuu.pdf#page=35',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (243,524,2,'イと解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (244,524,3,'ウと解答しているもの',NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (245,524,4,'ェと解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (246,524,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (247,524,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (248,525,1,'1と解答しているもの',NULL,1,'https://www.nier.go.jp/20chousa/pdf/20kaisetsu_shou_sansuu.pdf#page=36',1,'1','ストローに巻いてあるエナメル線の巻き数');
INSERT INTO "answer_type" VALUES (249,525,2,'2 と解答しているもの',NULL,NULL,NULL,1,'2','ストローに巻いてあるエナメル線の1巻きの重さ');
INSERT INTO "answer_type" VALUES (250,525,3,'3 と解答しているもの',NULL,NULL,NULL,1,'3','ストローの長さ');
INSERT INTO "answer_type" VALUES (251,525,4,'4 と解答しているもの',NULL,NULL,NULL,1,'4','コイル全体の重さ');
INSERT INTO "answer_type" VALUES (252,525,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (253,525,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (254,527,1,'11/15と解答しているもの(大きさの等しい分数を含む)',NULL,1,'https://www.nier.go.jp/20chousa/pdf/20kaisetsu_shou_sansuu.pdf#page=40',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (255,527,2,'1/5または3/15と解答しているもの(大きさの等しい分数を含む)',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (256,527,3,'13/15と解答しているもの(大きさの等しい分数を含む)',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (257,527,4,'類型1から類型3以外で,分母が15である分数を解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (258,527,5,'3/8解答しているもの(大きさの等しい分数を含む)',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (259,527,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (260,527,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (261,528,1,'㋐：1と解答　　㋑：2 と解答しているもの',NULL,1,'https://www.nier.go.jp/20chousa/pdf/20kaisetsu_shou_sansuu.pdf#page=42',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (262,528,2,'㋐：1と解答　　㋑：4 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (263,528,3,'㋐：1と解答　　㋑：1 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (264,528,4,'㋐：1と解答　　㋑：類型1から類型3以外の解答  無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (265,528,5,'㋐：類型1から類型4以外の解答　無解答　　㋑：2 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (266,528,6,'㋐：1/4と解答　　㋑：1/4 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (267,528,7,'㋐：2と解答　　㋑：4 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (268,528,8,'㋐：4と解答　　㋑：4 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (269,528,9,'㋐：類型1から類型4,類型7,類型8以外の解答　無解答　　㋑：4 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (270,528,10,'㋐：1/2と解答　　㋑：1 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (271,528,11,'㋐：類型1から類型4,類型10以外の解答  無解答　　㋑：1 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (272,528,12,'㋐：4と解答　　㋑：8 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (273,528,13,'類型1,類型7,類型10,類型12以外で,㋐に解答した数の2倍の数を㋑に解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (274,528,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (275,528,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (276,529,1,'1/4 と解答しているもの',NULL,1,'https://www.nier.go.jp/20chousa/pdf/20kaisetsu_shou_sansuu.pdf#page=44',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (277,529,2,'1/4 と大きさの等しい分数や小数を解答しているもの',NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (278,529,3,'3/4 と解答しているもの(大きさの等しい分数を含む)',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (279,529,4,'1/2 と解答しているもの(大きさの等しい分数を含む)',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (280,529,5,'1 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (281,529,6,'4 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (282,529,7,'1/3 と解答しているもの(大きさの等しい分数を含む)  3 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (283,529,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (284,529,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (285,530,1,'①,②,③の全てを書き,ある数の幾つ分かを考えたときの,整数の加法を書いているもの',NULL,1,'https://www.nier.go.jp/20chousa/pdf/20kaisetsu_shou_sansuu.pdf#page=47',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (286,530,2,'①,②を書き,ある数の幾つ分かを考えたときの,整数の加法を書いているもの',NULL,1,'',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (287,530,3,'②,③を書いているもの  ②を書いているもの',NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (288,530,4,'①,②を書き,ある数の幾つ分かを考えたときの,整数の加法を書いているが,③について1.65の位取り等を誤って書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (289,530,5,'②を書いているが,③について1.65の位取り等を誤って書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (290,530,6,'①,③を書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (291,530,7,'①を書き,75+ 9を書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (292,530,8,'①を書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (293,530,9,'③を書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (294,530,10,'75+ 9を書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (295,530,11,'0.1の幾つ分として捉えているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (296,530,12,'答えが0. 84であることを書いているもの  答えが8. 4であることを書いているもの  答えが84であることを書いているもの  答えが0. 084であることを書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (297,530,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (298,530,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (299,532,1,'記号：ウ   と解答　　答え：80 と解答しているもの',NULL,1,'https://www.nier.go.jp/20chousa/pdf/20kaisetsu_shou_sansuu.pdf#page=53',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (300,532,2,'記号：ウ   と解答　　答え：0.8 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (301,532,3,'記号：ウ   と解答　　答え：1.25 と解答しているもの  125 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (302,532,4,'記号：ウ   と解答　　答え：40 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (303,532,5,'記号：ウ   と解答　　答え：90 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (304,532,6,'記号：ウ   と解答　　答え：10 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (305,532,7,'記号：ウ   と解答　　答え：類型1から類型6以外の解答  無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (306,532,8,'記号：ア   と解答　　答え：80 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (307,532,9,'記号：ア   と解答　　答え：80 以外を解答しているもの  無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (308,532,10,'記号：イ   と解答　　答え：80 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (309,532,11,'記号：イ   と解答　　答え：80 以外を解答しているもの  無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (310,532,12,'記号：エ   と解答　　答え：80 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (311,532,13,'記号：エ   と解答　　答え：80 以外を解答しているもの  無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (312,532,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (313,532,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (314,533,1,'番号：1 と回答　　わけ：①,②,③,④の全てを書いているもの',NULL,1,'https://www.nier.go.jp/20chousa/pdf/20kaisetsu_shou_sansuu.pdf#page=56',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (315,533,2,'番号：1 と回答　　わけ：①,②を書いているもの',NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (316,533,3,'番号：1 と回答　　わけ：③,④を書いているもの',NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (317,533,4,'番号：1 と回答　　わけ：①,④を書いているもの  ②,③を書いているもの',NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (318,533,5,'番号：1 と回答　　わけ：①,③を書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (319,533,6,'番号：1 と回答　　わけ：②,④を書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (320,533,7,'番号：1 と回答　　わけ：①を書いているもの  ③を書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (321,533,8,'番号：1 と回答　　わけ：②を書いているもの  ④を書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (322,533,9,'番号：1 と回答　　わけ：類型1から類型8以外の解答  無解答 ',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (323,533,10,'番号：2 と回答　　わけ：①,②,③,④の全てを書いているもの  ①,②を書いているもの  ③,④を書いているもの  ①,④を書いているもの  ②,③を書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (324,533,11,'番号：2 と回答　　わけ：②,④を書いているもの  ②を書いているもの  ④を書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (325,533,12,'番号：2 と回答　　わけ：1か月間にのびたくきの長さについて,6月1日から 7月1日まで,7月1日から8月1日まで,8月1日か ら9月1日まで,の順に大きくなっていることを書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (326,533,13,'番号：2 と回答　　わけ：類型10から類型12以外の解答  無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (327,533,14,'番号：3 と回答　　わけ：①,②,③,④の全てを書いているもの  ①,②を書いているもの  ③,④を書いているもの  ①,④を書いているもの  ②,③を書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (328,533,15,'番号：3 と回答　　わけ：①,③を書いているもの  ①を書いているもの  ③を書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (329,533,16,'番号：3 と回答　　わけ：類型14,類型15以外の解答  無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (330,533,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (331,533,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (332,534,1,'アと解答しているもの',NULL,NULL,'https://www.nier.go.jp/20chousa/pdf/20kaisetsu_shou_sansuu.pdf#page=61',1,'ア','午前10時から午前12時まで、どちらの教室も、気温が下がっている。');
INSERT INTO "answer_type" VALUES (333,534,2,'イと解答しているもの',NULL,1,NULL,1,'イ','午前12時から2時まで、たくまさんの教室のほうが、となりの教室よりも、気温の上がり方が小さい。');
INSERT INTO "answer_type" VALUES (334,534,3,'ウと解答しているもの',NULL,NULL,NULL,1,'ウ','午後4時が、どちらの教室も、気温がいちばん高い。');
INSERT INTO "answer_type" VALUES (335,534,4,'エと解答しているもの',NULL,NULL,NULL,1,'エ','どの時刻も、となりの教室のほうが、たくまさんの教室よりも、気温が低い。');
INSERT INTO "answer_type" VALUES (336,534,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (337,534,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (338,498,1,'２，４ と解答しているもの',93.2,1,'https://www.nier.go.jp/19chousakekkahoukoku/report/data/19pmath_04.pdf#page=4',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (339,498,2,'１，２ と解答しているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (340,498,3,'１，４ と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (341,498,4,'２，３ と解答しているもの',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (342,498,5,'３，４ と解答しているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (343,498,6,'１，３ と解答しているもの',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (344,498,7,'２のみを解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (345,498,8,'４のみを解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (346,498,9,'１のみを解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (347,498,10,'３のみを解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (348,498,99,'上記以外の解答',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (349,498,0,'無解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (350,499,1,'１，３，４ と解答しているもの',60.5,1,'https://www.nier.go.jp/19chousakekkahoukoku/report/data/19pmath_04.pdf#page=6',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (351,499,2,'１，３ と解答しているもの',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (352,499,3,'１，４ と解答しているもの',11.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (353,499,4,'３，４ と解答しているもの',2.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (354,499,5,'１ と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (355,499,6,'３ と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (356,499,7,'４ と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (357,499,8,'１，２，３，４ と解答しているもの',8.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (358,499,9,'１，２，３ と解答しているもの',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (359,499,10,'１，２，４ と解答しているもの',4.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (360,499,11,'２，３，４ と解答しているもの',3.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (361,499,12,'１，２ と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (362,499,13,'２，３ と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (363,499,14,'２，４ と解答しているもの',2.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (364,499,15,'２ と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (365,499,99,'上記以外の解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (366,499,0,'無解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (367,500,1,' ①，②，③の全てを書いているもの',44.1,1,'https://www.nier.go.jp/19chousakekkahoukoku/report/data/19pmath_04.pdf#page=8',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (368,500,2,'③を書き，長方形の面積であることと，三角形の面積であることは書いているが，説明する対象が明確ではないもの，または対象を誤って書いているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (369,500,3,'①，②を書いているもの',16.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (370,500,4,'長方形の面積であることと，三角形の面積であることは書いているが，説明する対象が明確ではないもの，または対象を誤って書いているもの',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (371,500,5,'①，③を書いているもの  ②，③を書いているもの',6.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (372,500,6,'①を書いているもの  ②を書いているもの',7.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (373,500,7,' ③を書いているもの',3.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (374,500,8,'【ちひろさんの求め方】以外の，図１の形の面積の求め方の説明を書いているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (375,500,99,'上記以外の解答',12.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (376,500,0,'無解答',6.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (377,502,1,'１ と解答しているもの',0.5,NULL,'https://www.nier.go.jp/19chousakekkahoukoku/report/data/19pmath_04.pdf#page=14',1,'1','市全体の水の使用量は，減っている。');
INSERT INTO "answer_type" VALUES (378,502,2,'２ と解答しているもの',0.7,NULL,NULL,1,'2','市全体の水の使用量は，変わらない。');
INSERT INTO "answer_type" VALUES (379,502,3,' ３ と解答しているもの',95.2,1,NULL,1,'3','市全体の水の使用量は，増えている。');
INSERT INTO "answer_type" VALUES (380,502,4,'４ と解答しているもの',3.3,NULL,NULL,1,'4','市全体の水の使用量は，増えたり減ったりしている。');
INSERT INTO "answer_type" VALUES (381,502,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (382,502,0,'無解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (383,503,1,'２ と解答しているもの',78.8,1,'https://www.nier.go.jp/19chousakekkahoukoku/report/data/19pmath_04.pdf#page=15',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (384,503,2,'1/2 または 0.5 と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (385,503,3,'700 と解答しているもの',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (386,503,4,'７ と解答しているもの',5.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (387,503,5,' 1400 と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (388,503,6,' 14 と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (389,503,99,'上記以外の解答',11.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (390,503,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (391,504,1,'番号：１ と解答　　わけ：Ａ①，Ａ②，Ａ③の全てを書いているもの',0.7,1,'https://www.nier.go.jp/19chousakekkahoukoku/report/data/19pmath_04.pdf#page=18',1,'1','1 人あたりの水の使用量は，減っている。');
INSERT INTO "answer_type" VALUES (392,504,2,'番号：１ と解答　　わけ：Ａ②，Ａ③を書いているもの',49.3,1,NULL,1,'2','1 人あたりの水の使用量は，変わらない。');
INSERT INTO "answer_type" VALUES (393,504,3,'番号：１ と解答　　わけ：Ａ①，Ａ②を書いているもの',0,NULL,NULL,1,'3','1 人あたりの水の使用量は，増えている。');
INSERT INTO "answer_type" VALUES (394,504,4,'番号：１ と解答　　わけ：Ａ②を書いているもの',0.8,NULL,NULL,1,'4','1 人あたりの水の使用量は，増えたり減ったりしている。');
INSERT INTO "answer_type" VALUES (395,504,5,'番号：１ と解答　　わけ：Ａ①，Ａ③を書いているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (396,504,6,'番号：１ と解答　　わけ：Ａ③を書いているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (397,504,7,'番号：１ と解答　　わけ：Ａ①を書いているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (398,504,8,'番号：１ と解答　　わけ：Ｂ①，Ｂ②の全てを書いているもの',1.8,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (399,504,9,'番号：１ と解答　　わけ：Ｂ②を書いているもの',0.5,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (400,504,10,'番号：１ と解答　　わけ：Ｂ①を書き，Ｂ②については，一人当たりの水の使用量を表す数のうち，いずれか一つを書いているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (401,504,11,'番号：１ と解答　　わけ：類型１から類型10以外の解答　無解答',3.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (402,504,12,'番号：3 と解答　　わけ：Ａ②，Ａ③を書き，一人当たりの水の使用量が(市の人口)÷(市全体の水の使用量)で求めることができると誤って書いているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (403,504,13,'番号：３ と解答　　わけ：Ａ③を書いているもの',6.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (404,504,14,'番号：３ と解答　　わけ：類型12，類型13以外の解答　無解答',5.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (405,504,15,'番号：２ と解答　　わけ：Ａ②を書いているもの',17.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (406,504,16,'番号：２ と解答　　わけ：類型15以外の解答　無解答',6.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (407,504,17,'番号：４ と解答しているもの',3.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (408,504,99,'上記以外の解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (409,504,0,'上記以外の解答',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (410,505,1,'７ と解答しているもの',60.4,1,'https://www.nier.go.jp/19chousakekkahoukoku/report/data/19pmath_04.pdf#page=20',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (411,505,2,'13 と解答しているもの',22.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (412,505,3,' 16 と解答しているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (413,505,4,'2.2 または 22 と解答しているもの',6.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (414,505,5,' ６ または 60 と解答しているもの',2.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (415,505,6,' 130 と解答しているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (416,505,7,'1.3 と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (417,505,8,'1.6 と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (418,505,99,'上記以外の解答',4.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (419,505,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (420,507,1,'㋐：353 と解答　　㋑：253 と解答　　㋒：253 と解答しているもの',81.9,1,'https://www.nier.go.jp/19chousakekkahoukoku/report/data/19pmath_04.pdf#page=26',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (421,507,2,'㋐：353 と解答　　㋑：253 と解答　　㋒：253 以外を解答しているもの　無解答',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (422,507,3,'㋐：353 と解答　　㋑：㋒： 253 以外で㋑と㋒に同じ数を解答しているもの',2.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (423,507,4,'㋐：353 と解答　　㋑：253 以外の解答　無解答　　㋒：253 と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (424,507,5,'㋐：353 と解答　　㋑：253 以外の解答　無解答　　㋒：253 以外を解答しているもの　無解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (425,507,6,'㋐：347 と解答　　㋑：247 と解答　　㋒：247 と解答しているもの',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (426,507,7,'㋐：347 と解答　　㋑：247 と解答　　㋒：253 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (427,507,8,'㋐：347 と解答　　㋑：253 と解答　　㋒：253 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (428,507,9,'㋐：347 と解答　　㋑：㋒：253，247 以外で㋑と㋒に同じ数を解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (429,507,10,'㋐：347 と解答　　㋑：㋒：類型６から類型９以外の解答　無解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (430,507,11,'㋐：353，347以外の解答　無解答　　㋑：㋒：253 以外で㋑と㋒に同じ数を解答しているもの',6.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (431,507,12,'㋐：353，347以外の解答　無解答　　㋑：253 と解答　　㋒：253 と解答しているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (432,507,13,'㋐：353，347以外の解答　無解答　　㋑：253 以外の解答　無解答　　㋒：253 と解答しているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (433,507,99,'上記以外の解答',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (434,507,0,'無解答',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (435,508,1,'①，②，③の全てを書いているもの',31.1,1,'https://www.nier.go.jp/19chousakekkahoukoku/report/data/19pmath_04.pdf#page=28',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (436,508,2,'③を書き，①の同じ数をかけることと，②の同じ数で割ることについては，具体的な数を用いて書いているもの',0.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (437,508,3,'①，③を書いているもの　②，③を書いているもの',6.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (438,508,4,'③を書き，①の同じ数をかけることについては，具体的な数を用いて書いているもの　③を書き，②の同じ数で割ることについては，具体的な数を用いて書いているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (439,508,5,'③を書き，①の同じ数を示す言葉については書いておらず，②の同じ数を示す言葉についても書いていないもの',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (440,508,6,'①，②を書き，商が変わることを書いているもの　商が変わることを書き，①の同じ数を示す言葉については書いておらず，②の同じ数を示す言葉についても書いていないもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (441,508,7,'①の同じ数をかけることと，②の同じ数で割ることについては，具体的な数を用いて書き，商が変わることを書いているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (442,508,8,'①，②を書いているもの　①の同じ数をかけることと，②の同じ数で割ることについては，具体的な数を用いて書いているもの',15.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (443,508,9,'③を書き，わられる数とわる数に同じ数をたしたり，わられる数とわる数から同じ数を引いたりすることを書いているもの',3.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (444,508,10,'③を書いているもの',4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (445,508,99,'上記以外の解答',25.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (446,508,0,'無解答',10.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (447,509,1,'①：×２と解答　　②：×２と解答　　㋓： 1200と解答　　㋔：30と解答　　㋕：40と解答　　㋖：40と解答しているもの',34.2,1,'https://www.nier.go.jp/19chousakekkahoukoku/report/data/19pmath_04.pdf#page=31',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (448,509,2,'①：÷３と解答　　②：÷３と解答　　㋓： 200と解答　　㋔：５と解答　　㋕：40と解答　　㋖：40と解答しているもの',21.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (449,509,3,'①：÷５と解答　　②：÷５と解答　　㋓： 120と解答　　㋔：３と解答　　㋕：40と解答　　㋖：40と解答しているもの',19.7,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (450,509,4,'①：②：類型１から類型３ を解答　㋓： ㋔：①，②に正しく対応した㋓，㋔を解答　　㋕：㋖：40 以外で㋕と㋖に同じ数を解答しているもの',4.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (451,509,5,'①：②：類型１から類型３ を解答　㋓： ㋔：類型４以外の解答　無解答　　㋕：㋖：40 以外で㋕と㋖に同じ数を解答しているもの',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (452,509,6,'①：②：類型１から類型３ を解答　㋓： ㋔：類型４以外の解答　無解答　　㋕：40と解答　㋖：40 と解答しているもの',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (453,509,7,'①：②：類型１から類型３ を解答　　㋕：㋖：類型４から類型６以外の解答　　無解答　',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (454,509,8,'①：②：類型１から類型７以外の解答　無解答　　㋕：㋖：40 以外で㋕と㋖に同じ数を解答しているもの',3.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (455,509,9,'①：②：類型１から類型７以外の解答　無解答　　㋕：40と解答　　㋖： 40 と解答しているもの',6.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (456,509,10,'①：②：類型１から類型７以外の解答　無解答　　㋕：40以外の解答　無解答　　㋖： 40 と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (457,509,99,'上記以外の解答',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (458,509,0,'無解答',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (459,510,1,'あ と解答しているもの',12.8,NULL,'https://www.nier.go.jp/19chousakekkahoukoku/report/data/19pmath_04.pdf#page=34',1,'あ','0.6 m 分の代金');
INSERT INTO "answer_type" VALUES (460,510,2,'い と解答しているもの',47.1,1,NULL,1,'い','1 m 分の代金');
INSERT INTO "answer_type" VALUES (461,510,3,'う と解答しているもの',22.1,NULL,NULL,1,'う','6 m 分の代金');
INSERT INTO "answer_type" VALUES (462,510,4,'え と解答しているもの',15.1,NULL,NULL,1,'え','10 m 分の代金');
INSERT INTO "answer_type" VALUES (463,510,99,'上記以外の解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (464,510,0,'無解答',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (465,512,1,'ア と解答しているもの',3.8,NULL,'https://www.nier.go.jp/19chousakekkahoukoku/report/data/19pmath_04.pdf#page=38',1,'ア','5 人で何mの列になっているか。');
INSERT INTO "answer_type" VALUES (466,512,2,'イ と解答しているもの',4.8,NULL,NULL,1,'イ','5 mで何人並んでいるか。');
INSERT INTO "answer_type" VALUES (467,512,3,'ウ と解答しているもの',6.4,NULL,NULL,1,'ウ','5 分後は何時何分になっているか。');
INSERT INTO "answer_type" VALUES (468,512,4,'エ と解答しているもの',82.8,1,NULL,1,'エ','5 分間で何人買ったか。');
INSERT INTO "answer_type" VALUES (469,512,99,'上記以外の解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (470,512,0,'無解答',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (471,513,1,'20×10 と解答しているもの',68.8,1,'https://www.nier.go.jp/19chousakekkahoukoku/report/data/19pmath_04.pdf#page=39',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (472,513,2,' 20÷10 と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (473,513,3,'20＋10 と解答しているもの　20－10 と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (474,513,4,' 36を使った式を解答しているもの',14.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (475,513,5,' 20×11 と解答しているもの',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (476,513,6,' 20×９ と解答しているもの',3.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (477,513,99,'上記以外の解答',5.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (478,513,0,'無解答',4.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (479,514,1,'求め方：①，②の全てを書いている　　答え：21 と解答　　番号：１ と解答しているもの',59.9,1,'https://www.nier.go.jp/19chousakekkahoukoku/report/data/19pmath_04.pdf#page=41',1,'1','着くことができる。');
INSERT INTO "answer_type" VALUES (480,514,2,'求め方：①，②の全てを書いている　　答え：21 と解答　　番号：１ 以外を解答しているもの　無解答',0.6,NULL,NULL,1,'2','着くことができない。');
INSERT INTO "answer_type" VALUES (481,514,3,'求め方：①，②の全てを書いている　　答え：21 以外 の解答　無解答　　番号：１ と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (482,514,4,'求め方：①，②の全てを書いている　　答え：21 以外 の解答　無解答　　番号：１ 以外を解答しているもの　無解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (483,514,5,'求め方：②を書いている　　答え：21 と解答　　番号：１ と解答しているもの',2.9,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (484,514,6,'求め方：②を書いている　　答え：21 と解答　　番号：１ 以外を解答しているもの　無解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (485,514,7,'求め方：②を書いている　　答え：21 以外 の解答　無解答　　番号：１ と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (486,514,8,'求め方：②を書いている　　答え：21 以外 の解答　無解答　　番号：１ 以外を解答しているもの　無解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (487,514,9,'求め方：①を書いている　　答え：21 と解答　　番号：１ と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (488,514,10,'求め方：①を書いている　　答え：21 と解答　　番号：１ 以外を解答しているもの　無解答',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (489,514,11,'求め方：①を書いている　　答え：21 以外 の解答　無解答　　番号：１ と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (490,514,12,'求め方：①を書いている　　答え：21 以外 の解答　無解答　　番号：１ 以外を解答しているもの　無解答',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (491,514,13,'４ポール分進むのにかかった時間と３ポール分進むのにかかった時間を合計しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (492,514,14,' １ポール分当たりに２分間かかると捉えているもの',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (493,514,15,'求め方：類型１から類型14以外の解答　無解答　　答え：21 と解答　　番号：１ と解答しているもの',3.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (494,514,16,'求め方：類型１から類型14以外の解答　無解答　　答え：21 と解答　　番号：１ 以外を解答しているもの　無解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (495,514,99,'上記以外の解答',19.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (496,514,0,'無解答',3.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (497,465,1,'0.2ｍの重さ：30 と解答　　0.1ｍの重さ：15 と解答しているもの',63.2,1,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_04.pdf#page=3',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (498,465,2,'0.2ｍの重さ：30 と解答　　0.1ｍの重さ：7.5 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (499,465,3,'0.2ｍの重さ：30 と解答　　0.1ｍの重さ：類型１，類型２以外の解答　無解答',11.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (500,465,4,'0.2ｍの重さ： 300 と解答　　0.1ｍの重さ：600 と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (501,465,5,'0.2ｍの重さ：12 と解答　　0.1ｍの重さ：６ と解答しているもの',7.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (502,465,6,'0.2ｍの重さ：３ と解答　300 と解答　　0.1ｍの重さ：15 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (503,465,7,'0.2ｍの重さ：類型１から類型４，類型６以外の解答　無解答　　0.1ｍの重さ：15 と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (504,465,8,'0.2ｍの重さ：59.8 と解答　60.2 と解答　　0.1ｍの重さ：59.7 と解答しているもの　59.9 と解答しているもの　60.1 と解答しているもの　60.3 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (505,465,99,'上記以外の解答',14.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (506,465,0,'無解答',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (507,466,1,'0.4の場所：エ と解答　　60の場所：ア と解答　　□の場所：イ と解答しているもの',66.9,1,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_04.pdf#page=5',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (508,466,2,'0.4の場所：エ と解答　　60の場所：ウ と解答　　□の場所：イ と解答しているもの',3.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (509,466,3,'0.4の場所：エ と解答　　60の場所：オ と解答　　□の場所：イ と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (510,466,4,'0.4の場所：ア と解答　　60の場所：エ と解答　　□の場所：イ と解答しているもの',2.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (511,466,5,'0.4の場所：ア と解答　　60の場所：ウ と解答　　□の場所：イ と解答しているもの',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (512,466,6,'0.4の場所：ア と解答　　60の場所：オ と解答　　□の場所：イ と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (513,466,7,'0.4の場所：60の場所：類型１から類型６以外の解答　無解答　　□の場所：イ と解答しているもの',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (514,466,8,'0.4の場所：エ と解答　　60の場所：ア と解答　　□の場所：イ 以外を解答しているもの　無解答',5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (515,466,99,'上記以外の解答',15,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (516,466,0,'無解答',2.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (517,467,1,'１ と解答しているもの',2.7,NULL,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_04.pdf#page=7',1,'1','60+0.6');
INSERT INTO "answer_type" VALUES (518,467,2,'２ と解答しているもの',22.9,NULL,NULL,1,'2','60×0.4');
INSERT INTO "answer_type" VALUES (519,467,3,'３ と解答しているもの',65.5,1,NULL,1,'3','60÷0.4');
INSERT INTO "answer_type" VALUES (520,467,4,'４ と解答しているもの',6.4,NULL,NULL,1,'4','0.4÷60');
INSERT INTO "answer_type" VALUES (521,467,99,'上記以外の解答',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (522,467,0,'無解答',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (523,468,1,'２，４ と解答しているもの ',40.1,1,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_04.pdf#page=10',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (524,468,2,'１ と解答しているもの',1.6,NULL,NULL,1,'1','1mの重さが12kgの鉄の棒があります。この鉄の棒0.8mの重さは何kgですか。');
INSERT INTO "answer_type" VALUES (525,468,3,'２ と解答しているもの',2,NULL,NULL,1,'2','0.8Lで板を12m2ぬることができるペンキがあります。このペンキ1Lでは、板を何m2ぬることができますか。');
INSERT INTO "answer_type" VALUES (526,468,4,'３ と解答しているもの',1.4,NULL,NULL,1,'3','赤いテープの長さは12cmです。白いテープの長さは、赤いテープの長さの0.8倍です。白いテープの長さは何cmですか。');
INSERT INTO "answer_type" VALUES (527,468,5,'４ と解答しているもの',6.1,NULL,NULL,1,'4','長さが12mのリボンを0.8mずつ切っていきます。0.8mのリボンは何本できますか。');
INSERT INTO "answer_type" VALUES (528,468,6,'１，２，４ と解答しているもの',6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (529,468,7,'１，２ と解答しているもの',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (530,468,8,'１，４ と解答しているもの',21.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (531,468,99,'上記以外の解答',18.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (532,468,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (533,469,1,'６，７，８，９ と解答しているもの',76.5,1,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_04.pdf#page=13',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (534,469,2,' ７，８，９ と解答しているもの',16.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (535,469,3,'類型１，類型２以外で，６，７，８，９ のうち複数解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (536,469,4,'６，７，８，９ のうち一つを解答しているもの',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (537,469,5,'０，１，２，３，４，５ のうち複数解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (538,469,6,'０，１，２，３，４，５ のうち一つを解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (539,469,99,'上記以外の解答',3.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (540,469,0,'無解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (541,471,1,'１ と解答しているもの',8.3,NULL,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_04.pdf#page=16',1,'1','㋐のほうがこんでいる。');
INSERT INTO "answer_type" VALUES (542,471,2,'２ と解答しているもの',87.9,1,NULL,1,'2','㋑のほうがこんでいる。');
INSERT INTO "answer_type" VALUES (543,471,3,'３ と解答しているもの',1.7,NULL,NULL,1,'3','どちらもこみぐあいは同じである。');
INSERT INTO "answer_type" VALUES (544,471,99,'上記以外の解答',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (545,471,0,'無解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (546,472,1,'１ と解答しているもの',50.3,1,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_04.pdf#page=17',1,'1','1m2あたりの人数は2人と1.8人なので、㋒のほうがこんでいる。');
INSERT INTO "answer_type" VALUES (547,472,2,'２ と解答しているもの',8.6,NULL,NULL,1,'2','1m2あたりの人数は2人と1.8人なので、㋓のほうがこんでいる。');
INSERT INTO "answer_type" VALUES (548,472,3,'３ と解答しているもの',18.4,NULL,NULL,1,'3','1人あたりの面積は2m2と1.8m2なので、㋒のほうがこんでいる。');
INSERT INTO "answer_type" VALUES (549,472,4,'４ と解答しているもの',18,NULL,NULL,1,'4','1人あたりの面積は2m2と1.8m2なので、㋓のほうがこんでいる。');
INSERT INTO "answer_type" VALUES (550,472,99,'上記以外の解答',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (551,472,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (552,474,1,'１ と解答しているもの',0.3,NULL,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_04.pdf#page=23',1,'1','0°');
INSERT INTO "answer_type" VALUES (553,474,2,'２ と解答しているもの',2.6,NULL,NULL,1,'2','90°');
INSERT INTO "answer_type" VALUES (554,474,3,'３ と解答しているもの',94.5,1,NULL,1,'3','180°');
INSERT INTO "answer_type" VALUES (555,474,4,'４ と解答しているもの',0.5,NULL,NULL,1,'4','270°');
INSERT INTO "answer_type" VALUES (556,474,5,'５ と解答しているもの',0.5,NULL,NULL,1,'5','360°');
INSERT INTO "answer_type" VALUES (557,474,99,'上記以外の解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (558,474,0,'無解答',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (559,475,1,' 250 と解答しているもの',58.7,1,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_04.pdf#page=24',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (560,475,2,'110 と解答しているもの',25.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (561,475,3,'70 と解答しているもの',3.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (562,475,4,' 290 と解答しているもの',4.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (563,475,5,'類型１から類型４以外で，180°以上270°未満の角度を解答しているもの',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (564,475,6,'類型１から類型４以外で，270°以上360°未満の角度を解答しているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (565,475,7,'類型１から類型４以外で，90°未満の角度を解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (566,475,8,'類型１から類型４以外で，90°以上180°未満の角度を解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (567,475,99,'上記以外の解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (568,475,0,'無解答',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (569,476,1,'（横６つめ，縦３つめ，高さ４段め）と解答しているもの',73.7,1,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_04.pdf#page=28',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (570,476,2,'マス目を正しく数えているが，（横，縦，高さ）の順で解答することができていないもの　例 （横３つめ，縦６つめ，高さ４段め）',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (571,476,3,'次のように解答しているもの　（横５つめ，縦２つめ，高さ３段め）　（横５つめ，縦２つめ，高さ４段め）　（横５つめ，縦３つめ，高さ３段め）　（横５つめ，縦３つめ，高さ４段め）　（横６つめ，縦２つめ，高さ３段め）　（横６つめ，縦２つめ，高さ４段め）　（横６つめ，縦３つめ，高さ３段め）',4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (572,476,4,'立方体アの位置以外の方眼紙の隅から数え始めて解答しているもの　例 （横２つめ，縦３つめ，高さ４段め）',3.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (573,476,5,'（横６つめ，縦９つめ，高さ13段め）と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (574,476,6,' 立方体アまたは立方体イの位置を解答しているもの',3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (575,476,99,'上記以外の解答',12.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (576,476,0,'無解答',3.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (577,478,1,'１ と解答しているもの',5.4,NULL,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_04.pdf#page=31',1,'1','円周の長さ×半径の長さ');
INSERT INTO "answer_type" VALUES (578,478,2,'２ と解答しているもの',36.9,NULL,NULL,1,'2','円周の長さ×直径の長さ');
INSERT INTO "answer_type" VALUES (579,478,3,'３ と解答しているもの',41.9,1,NULL,1,'3','円周の長さ÷直径の長さ');
INSERT INTO "answer_type" VALUES (580,478,4,'４ と解答しているもの',12.6,NULL,NULL,1,'4','直径の長さ÷円周の長さ');
INSERT INTO "answer_type" VALUES (581,478,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (582,478,0,'無解答',3.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (583,479,1,'アと解答しているもの',55.9,1,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_04.pdf#page=32',1,'ア','2');
INSERT INTO "answer_type" VALUES (584,479,2,'イと解答しているもの',27.8,NULL,NULL,1,'イ','3.14');
INSERT INTO "answer_type" VALUES (585,479,3,'ウと解答しているもの',5.5,NULL,NULL,1,'ウ','4');
INSERT INTO "answer_type" VALUES (586,479,4,'エと解答しているもの',6.6,NULL,NULL,1,'エ','6.28');
INSERT INTO "answer_type" VALUES (587,479,99,'上記以外の解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (588,479,0,'無解答',3.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (589,480,1,'１ と解答しているもの',8.8,NULL,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_04.pdf#page=34',1,'1','0.4%');
INSERT INTO "answer_type" VALUES (590,480,2,'２ と解答しているもの',27.6,NULL,NULL,1,'2','2.5%');
INSERT INTO "answer_type" VALUES (591,480,3,'３ と解答しているもの',53.1,1,NULL,1,'3','40%');
INSERT INTO "answer_type" VALUES (592,480,4,'４ と解答しているもの',5.7,NULL,NULL,1,'4','80%');
INSERT INTO "answer_type" VALUES (593,480,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (594,480,0,'無解答',4.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (595,481,1,'１ と解答しているもの',15,NULL,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_04.pdf#page=38',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (596,481,2,'２ と解答しているもの',63.8,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (597,481,3,'３ と解答しているもの',8.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (598,481,4,'４ と解答しているもの',4.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (599,481,99,'上記以外の解答',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (600,481,0,'無解答',7.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (601,483,1,'１ と解答しているもの',3,NULL,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_05.pdf#page=4',1,'1','長方形');
INSERT INTO "answer_type" VALUES (602,483,2,'２ と解答しているもの',10.5,NULL,NULL,1,'2','直角三角形');
INSERT INTO "answer_type" VALUES (603,483,3,'３ と解答しているもの',71.8,1,NULL,1,'3','平行四辺形');
INSERT INTO "answer_type" VALUES (604,483,4,'４ と解答しているもの',14.2,NULL,NULL,1,'4','正六角形');
INSERT INTO "answer_type" VALUES (605,483,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (606,483,0,'無解答',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (607,484,1,'①，②の全てを書き，着目した図形の角の大きさを正しく書いているもの',48.5,1,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_05.pdf#page=6',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (608,484,2,'①，②の全てを書いているが，着目した図形の角の大きさを誤って書いているもの',9.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (609,484,3,'②を書いているもの',5.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (610,484,4,'①を書き，②については，角の大きさを表す言葉や数は書いているが，その角の大きさが幾つ分で360°になるかを表す言葉や式は書いておらず，着目した図形の角の大きさについては，正しく書いているもの',2.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (611,484,5,'①を書き，②については，角の大きさを表す言葉や数は書いているが，その角の大きさが幾つ分で360°になるかを表す言葉や式は書いておらず，着目した図形の角の大きさについては，誤って書いているもの',7.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (612,484,6,' ①を書いているもの',2.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (613,484,99,'上記以外の解答',9.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (614,484,0,'無解答',14.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (615,486,1,' ５ と解答しているもの',70.7,1,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_05.pdf#page=9',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (616,486,2,' ８ と解答しているもの',2.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (617,486,3,' ７ と解答しているもの',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (618,486,4,' 12 と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (619,486,5,'15 と解答しているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (620,486,6,'20 と解答しているもの　３ と解答しているもの　２ と解答しているもの',7.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (621,486,7,'６ と解答しているもの',8.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (622,486,8,' 34 と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (623,486,99,'上記以外の解答',6.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (624,486,0,'無解答',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (625,487,1,'表：(128,178）(160,220)と書いている　　答え： 50（秒）と解答しているもの',48.1,1,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_05.pdf#page=12',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (626,487,2,'表：(128,178）(160,220)と書いている　　答え：  40（秒）と解答しているもの',3.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (627,487,3,'表：(128,178）(160,220)と書いている　　答え： 60（秒）と解答しているもの',6.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (628,487,4,'表：(128,178）(160,220)と書いている　　答え：  類型１から類型３以外の解答　無解答',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (629,487,5,'表：「入った玉を数える時間」はどちらも正しく書き，50秒の場合の「１回の玉入れゲームの時間」も正しく書いている　　答え：   50（秒）と解答しているもの',4.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (630,487,6,'表：「入った玉を数える時間」はどちらも正しく書き，50秒の場合の「１回の玉入れゲームの時間」も正しく書いている　　答え：   50（秒）以外を解答しているもの　無解答',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (631,487,7,'表：「入った玉を数える時間」はどちらも正しく書き，60秒の場合の「１回の玉入れゲームの時間」も正しく書いている　　答え：   50（秒）と解答しているもの',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (632,487,8,'表：「入った玉を数える時間」はどちらも正しく書き，60秒の場合の「１回の玉入れゲームの時間」も正しく書いている　　答え：   50（秒）以外を解答しているもの　無解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (633,487,9,'表：50秒の場合の「入った玉を数える時間」と「１回の玉入れゲームの時間」は正しく書いている　　答え：   50（秒）と解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (634,487,10,'表：50秒の場合の「入った玉を数える時間」と「１回の玉入れゲームの時間」は正しく書いている　　答え：   50（秒）以外を解答しているもの　無解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (635,487,11,'表：60秒の場合の「入った玉を数える時間」と「１回の玉入れゲームの時間」は正しく書いている　　答え：   50（秒）と解答しているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (636,487,12,'表：60秒の場合の「入った玉を数える時間」と「１回の玉入れゲームの時間」は正しく書いている　　答え：   50（秒）以外を解答しているもの　無解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (637,487,13,'「入った玉を数える時間」はどちらも正しく書いていないが，「１回の玉入れゲームの時間」はどちらも「玉を投げる時間」と「入った玉を数える時間」をたして求めているもの',3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (638,487,14,'「入った玉を数える時間」はどちらも正しく書いているが，「１回の玉入れ ゲームの時間」はどちらも「入った玉を数える時間」と40（秒）をたして求めているもの',4.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (639,487,15,'「入った玉を数える時間」はどちらも，またはどちらか一方を正し く書いておらず，「１回の玉入れゲームの時間」はどちらも「入った玉を数える時間」と40（秒）をたして求めているもの',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (640,487,16,'「入った玉を数える時間」はどちらも正しく書いているが，「１回の玉入れゲームの時間」はどちらも「玉を投げる時間」と102（秒）をたして求めているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (641,487,17,'「入った玉を数える時間」はどちらも，またはどちらか一方を正しく書いておらず，「１回の玉入れゲームの時間」はどちらも「玉を投げる時間」と102（秒）をたして求めているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (642,487,18,'類型９から類型12以外で，「入った玉を数える時間」はどちらも，またはどちらか一方を正しく書いていないが，「１回の玉入れゲームの時間」はどちらか一方を「玉を投げる時間」と「入った玉を数える時間」をたして求めているもの',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (643,487,19,'類型５から類型８，類型14，類型16以外で，「入った玉を数える時間」はどちらも正しく書いているが，「１回の玉入れゲームの時間」はどちらか一方を，「入った玉を数える時間」と40（秒）をたして求めている，または「玉を投げる時間」と102（秒）をたして求めているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (644,487,20,'類型９から類型12，類型18以外で，「入った玉を数える時間」はどちらも，またはどちらか一方を正しく書いておらず，「１回の玉入れゲームの時間」はどちらか一方を，「入った玉を数える時間」と40（秒）をたして求めている，または「玉を投げる時間」と102（秒）をたして求めているもの',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (645,487,21,'「入った玉を数える時間」はどちらも正しく書いているが,「１回の玉入れゲームの時間」はどちらも，「入った玉の個数」と「入った玉を数える時間」をたして求めている，または「玉を投げる時間」と「入った玉の個数」と「入った玉を数える時間」をたして求めているもの',3.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (646,487,22,'「入った玉を数える時間」はどちらも，またはどちらか一方を正しく書いておらず，「１回の玉入れゲームの時間」はどちらも，「入った玉の個数」と「入った玉を数える時間」をたして求めている，または「玉を投げる時間」と「入った玉の個数」と「入った玉を数える時間」をたして求めているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (647,487,23,'類型１から類型22以外で，「入った玉を数える時間」はどちらも正しく書いているもの',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (648,487,99,'上記以外の解答',8.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (649,487,0,'無解答',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (650,489,1,'①，②の全てを書いているもの',20.9,1,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_05.pdf#page=17',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (651,489,2,'12月の人数に着目して書かれていることと，７月の人数と12月の人数の差に着目して書かれていることは書いているが，メモ１とメモ２のどちらを対象としているのかが明確ではないもの，または対象を誤って書いているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (652,489,3,'①を書き，②について，７月の人数と12月の人数に着目して書かれていることは書いているが，人数の差に着目して書かれていることは書いていないもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (653,489,4,' ①を書いているもの',11.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (654,489,5,' ②を書いているもの',5.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (655,489,6,'②について，７月の人数と12月の人数に着目して書かれていることは書いているが，人数の差に着目して書かれていることは書いていないもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (656,489,99,'上記以外の解答',43.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (657,489,0,'無解答',17.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (658,490,1,'㋐：１ と解答　　㋑：５ と解答しているもの',24,1,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_05.pdf#page=19',1,'㋐-1','1・2年生');
INSERT INTO "answer_type" VALUES (659,490,2,'㋐：１ と解答　　㋑：４ と解答しているもの',4.6,NULL,NULL,1,'㋐-2','3・4年生');
INSERT INTO "answer_type" VALUES (660,490,3,'㋐：１ と解答　　㋑：類型１，類型２以外の解答　無解答',0.5,NULL,NULL,1,'㋐-3','5・6年生');
INSERT INTO "answer_type" VALUES (661,490,4,'㋐：２ と解答しているもの',2.6,NULL,NULL,1,'㋑-1','小さい');
INSERT INTO "answer_type" VALUES (662,490,5,'㋐：３ と解答　　㋑：４ と解答しているもの',52.2,NULL,NULL,1,'㋑-2','大きい');
INSERT INTO "answer_type" VALUES (663,490,6,'㋐：３ と解答　　㋑：類型５以外の解答　無解答',14.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (664,490,99,'上記以外の解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (665,490,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (666,492,1,'㋐：４×８＋５×８ と解答　　㋑：（４＋５)×８ と解答しているもの',57.8,1,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_05.pdf#page=23',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (667,492,2,'㋐：４×８＋５×８ と解答　　㋑：（５＋４)×８ と解答しているもの　８×(４＋５） と解答しているもの　８×(５＋４） と解答しているもの',0.9,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (668,492,3,'㋐：４×８＋５×８ と解答　　㋑：類型１，類型２以外の解答　無解答',4.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (669,492,4,'㋐：８×４＋８×５ と解答　４×８＋８×５ と解答　８×４＋５×８ と解答　５×８＋４×８ と解答　８×５＋８×４ と解答　５×８＋８×４ と解答　８×５＋４×８ と解答　　㋑：（４＋５)×８ と解答しているもの　',3.4,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (670,492,5,'㋐：８×４＋８×５ と解答　４×８＋８×５ と解答　８×４＋５×８ と解答　５×８＋４×８ と解答　８×５＋８×４ と解答　５×８＋８×４ と解答　８×５＋４×８ と解答　　㋑：（５＋４)×８ と解答しているもの　８×(４＋５） と解答しているもの　８×(５＋４） と解答しているもの',0.8,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (671,492,6,'㋐：８×４＋８×５ と解答　４×８＋８×５ と解答　８×４＋５×８ と解答　５×８＋４×８ と解答　８×５＋８×４ と解答　５×８＋８×４ と解答　８×５＋４×８ と解答　　㋑：類型４，類型５以外の解答　無解答',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (672,492,7,'㋐：類型１から類型６以外の 解答　無解答　　㋑：（４＋５)×８ と解答しているもの　（５＋４)×８ と解答しているもの　８×(４＋５） と解答しているもの　８×(５＋４） と解答しているもの',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (673,492,8,'分配法則を正しく用いているが，類型１，類型２，類型４，類型５以外の式を書いているもの',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (674,492,99,'上記以外の解答',21.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (675,492,0,'無解答',6.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (676,493,1,'①，②，③の全てを書き，和と真ん中の数の関係を正しく書いているもの',51.8,1,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_05.pdf#page=25',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (677,493,2,'①，③を書き，②の「真ん中の数を示す言葉」を書いており，和と真ん中の数の関係は正しく書いているが，②の「10」は書いていないもの',0.9,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (678,493,3,'①，③を書き，②の「10」を書いており，和と真ん中の数の関係は正しく書いているが，②の「真ん中の数を示す言葉」は書いていないもの',4.5,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (679,493,4,'②，③を書き，①の「和を示す言葉」を書いており，和と真ん中の数の関係は正しく書いているが，①の「70」は書いていないもの',1.3,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (680,493,5,'②，③を書き，①の「70」を書いており，和と真ん中の数の関係は正しく書いているが，①の「和を示す言葉」は書いていないもの',0.3,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (681,493,6,'③を書き，①の「和を示す言葉」，②の「真ん中の数を示す言葉」 を書いており，和と真ん中の数の関係は正しく書いているが，①の「70」，②の「10」は書いていないもの',0.9,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (682,493,7,'③を書き，①の「和を示す言葉」，②の「10」を書いており，和と 真ん中の数の関係は正しく書いているが，①の「70」，②の「真ん中の数を示す言葉」は書いていないもの',0.1,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (683,493,8,'③を書き，①の「70」，②の「真ん中の数を示す言葉」を書いてお り，和と真ん中の数の関係は正しく書いているが，①の「和を示す言葉」，②の「10」は書いていないもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (684,493,9,'③を書き，①の「70」，②の「10」を書いており，和と真ん中の数の関係は正しく書いているが，①の「和を示す言葉」，②の「真ん中の数を示す言葉」は書いていないもの',0.1,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (685,493,10,'③を書き，①の「和を示す言葉」，「70」の両方，またはどちらか一方と，②の「真ん中の数を示す言葉」，「10」の両方，またはどちらか一方は書いているが，和と真ん中の数の関係は正しく書いていないもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (686,493,11,'③を書き，①の「和を示す言葉」，「70」の両方，またはどちらか一方を書いているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (687,493,12,'③を書き，②の「真ん中の数を示す言葉」，「10」の両方，またはど',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (688,493,13,'③を書いているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (689,493,14,'①の「和を示す言葉」，「70」の両方，またはどちらか一方と，②の「真ん中の数を示す言葉」，「10」の両方，またはどちらか一方を書いているもの',12.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (690,493,15,'①の「和を示す言葉」，「70」の両方，またはどちらか一方を書いているもの',4.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (691,493,16,'②の「真ん中の数を示す言葉」，「10」の両方，またはどちらか一方を書いているもの',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (692,493,99,'上記以外の解答',7.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (693,493,0,'無解答',11.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (694,495,1,' Ａ①α，Ａ②α，Ａ③の全てを書いているもの',10.2,1,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_05.pdf#page=31',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (695,495,2,'Ａ①β，Ａ②β，Ａ③の全てを書いているもの',15.7,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (696,495,3,'Ｂ①α，Ｂ②α，Ｂ③の全てを書いているもの ',4.1,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (697,495,4,'Ｂ①β，Ｂ②β，Ｂ③の全てを書いているもの',0.5,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (698,495,5,'Ｃ①，Ｃ②，Ｃ③，Ｃ④の全てを書いているもの',4.3,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (699,495,6,'Ａ②α，Ａ③を書いているもの　Ａ②β，Ａ③を書いているもの　Ｂ②α，Ｂ③を書いているもの　Ｂ②β，Ｂ③を書いているもの',8.6,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (700,495,7,'Ｃ①，Ｃ②，Ｃ④を書いているもの　Ｃ②，Ｃ③，Ｃ④を書いているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (701,495,8,'Ａ①α，Ａ②αを書いているもの　Ａ①β，Ａ②βを書いているもの　Ｂ①α，Ｂ②αを書いているもの　Ｂ①β，Ｂ②βを書いているもの　Ｃ①，Ｃ②，Ｃ③を書いているもの　Ｃ①，Ｃ③，Ｃ④を書いているもの　Ｃ①，Ｃ③を書いているもの',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (702,495,9,'Ａ②αを書いているもの　Ａ②βを書いているもの　Ｂ②αを書いているもの　Ｂ②βを書いているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (703,495,10,'Ａ①αを書いているもの　Ｃ①，Ｃ②を書いているもの　Ｃ①を書いているもの',3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (704,495,11,'Ｂ①αを書いているもの　Ｃ③，Ｃ④を書いているもの　Ｃ③を書いているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (705,495,12,'Ａ①βを書いているもの　Ｂ①βを書いているもの',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (706,495,99,'上記以外の解答',31.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (707,495,0,'無解答',16.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (708,496,1,'１ と解答しているもの',8.3,NULL,'https://www.nier.go.jp/18chousakekkahoukoku/report/data/18pmath_05.pdf#page=34',1,'1','赤');
INSERT INTO "answer_type" VALUES (709,496,2,'２ と解答しているもの',66.7,1,NULL,1,'2','青');
INSERT INTO "answer_type" VALUES (710,496,3,'３ と解答しているもの',11.1,NULL,NULL,1,'3','黄');
INSERT INTO "answer_type" VALUES (711,496,4,'４ と解答しているもの',5.5,NULL,NULL,1,'4','緑');
INSERT INTO "answer_type" VALUES (712,496,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (713,496,0,'無解答',8.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (714,431,1,'2m買ったとき：120 と解答　　３ｍ買ったとき：180 と解答しているもの',97,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_04.pdf#page=3',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (715,431,2,'2m買ったとき：120 と解答　　３ｍ買ったとき：240 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (716,431,3,'2m買ったとき：120 と解答　　３ｍ買ったとき：360 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (717,431,4,'2m買ったとき：120 と解答　　３ｍ買ったとき：類型１から類型３以外の解答　無解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (718,431,5,'2m買ったとき：30 と解答　　３ｍ買ったとき：20 と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (719,431,6,'2m買ったとき：62 と解答　　３ｍ買ったとき：63 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (720,431,7,'【２ｍ買ったとき】に，60 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (721,431,99,'上記以外の解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (722,431,0,'無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (723,432,1,'60の場所：イ と解答　　0.4の場所：エ と解答　　□の場所：ア と解答しているもの',70,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_04.pdf#page=4',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (724,432,2,'60の場所：イ と解答　　0.4の場所：オ と解答　　□の場所：ウ と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (725,432,3,'60の場所：イ と解答　　0.4の場所：ア と解答　　□の場所：エ と解答しているもの',2.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (726,432,4,'60の場所：イ と解答　　0.4の場所：ウ と解答　　□の場所：オ と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (727,432,5,'60の場所：イ と解答　　0.4の場所：□の場所：類型１から類型４以外の解答　無解答',7.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (728,432,6,'60の場所：イ以外の解答　無解答　　0.4の場所：エ と解答　　□の場所：ア と解答しているもの',6.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (729,432,99,'上記以外の解答',10.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (730,432,0,'無解答',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (731,433,1,'１ と解答しているもの',4.7,NULL,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_04.pdf#page=6',1,'1','10をかける');
INSERT INTO "answer_type" VALUES (732,433,2,'２ と解答しているもの',91.1,1,NULL,1,'2','10でわる');
INSERT INTO "answer_type" VALUES (733,433,3,'３ と解答しているもの',2.7,NULL,NULL,1,'3','そのまま答えにする');
INSERT INTO "answer_type" VALUES (734,433,99,'上記以外の解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (735,433,0,'無解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (736,435,1,'6396 と解答しているもの',85.3,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_04.pdf#page=10',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (737,435,2,'6296 と解答しているもの',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (738,435,3,'5396 と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (739,435,4,' 5296 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (740,435,5,'861 と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (741,435,6,'61746 または 615246 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (742,435,7,' 51746 または 515246 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (743,435,8,'51396 または 510396 と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (744,435,99,'上記以外の解答',11.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (745,435,0,'無解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (746,436,1,'14.3 と解答しているもの',79.9,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_04.pdf#page=11',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (747,436,2,'143 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (748,436,3,'10.7 と解答しているもの',14.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (749,436,4,'107 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (750,436,5,'50.3 と解答しているもの',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (751,436,6,' 503 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (752,436,7,' 10.34 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (753,436,8,'9.9 と解答しているもの　6.3 と解答しているもの　99 と解答しているもの　63 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (754,436,99,'上記以外の解答',2.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (755,436,0,'無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (756,437,1,' ７ と解答しているもの',66.8,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_04.pdf#page=13',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (757,437,2,'13 と解答しているもの',17.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (758,437,3,'16 と解答しているもの',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (759,437,4,'2.2 または 22 と解答しているもの',5.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (760,437,5,'６ または 60 と解答しているもの',2.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (761,437,6,'130 と解答しているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (762,437,7,'1.3 と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (763,437,8,'1.6 と解答しているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (764,437,99,'上記以外の解答',3.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (765,437,0,'無解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (766,438,1,'5/9 と解答しているもの',69.4,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_04.pdf#page=16',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (767,438,2,'9/5または1(4/5)と解答しているもの',6.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (768,438,3,'商を小数で表しているもの 例 0.55 例 0.56',4.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (769,438,4,'類型１以外で0.555…を分数で表そうとしているもの 例 55/100 56/100',6.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (770,438,5,'1.8 と解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (771,438,99,'上記以外の解答',8.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (772,438,0,'無解答',3.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (773,439,1,'24 と解答しているもの',86.3,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_04.pdf#page=19',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (774,439,2,' 96 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (775,439,3,'類型１，類型２以外で，８と12の公倍数を解答しているもの',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (776,439,4,' ４ と解答しているもの',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (777,439,5,'２ と解答しているもの',4.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (778,439,6,'１ と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (779,439,7,'24を含めて８と12の公倍数を複数解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (780,439,8,'類型１から類型３以外で，８の倍数または12の倍数を解答しているもの',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (781,439,99,'上記以外の解答',2.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (782,439,0,'無解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (783,440,1,'１，４ と解答しているもの',70.8,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_04.pdf#page=22',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (784,440,2,'１，２ と解答しているもの',5.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (785,440,3,'１，３ と解答しているもの',7.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (786,440,4,'２，３ と解答しているもの',3.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (787,440,5,'２，４ と解答しているもの ',5.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (788,440,6,'３，４ と解答しているもの',6.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (789,440,7,'１のみを解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (790,440,8,'４のみを解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (791,440,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (792,440,0,' 無解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (793,441,1,'２，３ と解答しているもの',67.2,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_04.pdf#page=23',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (794,441,2,'２ と解答しているもの',9.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (795,441,3,'３ と解答しているもの',2.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (796,441,4,'４ と解答しているもの',2.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (797,441,5,'１，２，４ と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (798,441,6,'１，３，４ と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (799,441,7,'１ と解答しているもの　１，２ と解答しているもの',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (800,441,8,'１，２，３ と解答しているもの　２，３，４ と解答しているもの　１，２，３，４ と解答しているもの',3.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (801,441,99,'上記以外の解答',10.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (802,441,0,' 無解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (803,442,1,'72 と解答しているもの',75.7,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_04.pdf#page=27',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (804,442,2,'108 と解答しているもの',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (805,442,3,'54 と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (806,442,4,'20 と解答しているもの　36 と解答しているもの',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (807,442,5,' 60 と解答しているもの',5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (808,442,6,'90 と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (809,442,7,'60から90までの数で，60，72，90 以外を解答しているもの',5.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (810,442,8,' 45 と解答しているもの',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (811,442,99,'上記以外の解答',5.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (812,442,0,' 無解答',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (813,443,1,'１ と解答しているもの',0.7,NULL,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_04.pdf#page=29',1,'1','㋐');
INSERT INTO "answer_type" VALUES (814,443,2,'２ と解答しているもの',86.8,1,NULL,1,'2','㋑');
INSERT INTO "answer_type" VALUES (815,443,3,'３ と解答しているもの',3.5,NULL,NULL,1,'3','㋒と㋓');
INSERT INTO "answer_type" VALUES (816,443,4,'４ と解答しているもの',3.1,NULL,NULL,1,'4','㋐と㋑と㋔');
INSERT INTO "answer_type" VALUES (817,443,5,'５ と解答しているもの',4.6,NULL,NULL,1,'5','㋐と㋒と㋓と㋔');
INSERT INTO "answer_type" VALUES (818,443,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (819,443,0,' 無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (820,444,1,'１ と解答しているもの',7.7,NULL,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_04.pdf#page=31',1,'1','□×5=10');
INSERT INTO "answer_type" VALUES (821,444,2,'２ と解答しているもの',2,NULL,NULL,1,'2','10×□=5');
INSERT INTO "answer_type" VALUES (822,444,3,'３ と解答しているもの',83.7,1,NULL,1,'3','□÷5=10');
INSERT INTO "answer_type" VALUES (823,444,4,'４ と解答しているもの',5.2,NULL,NULL,1,'4','10÷□=5');
INSERT INTO "answer_type" VALUES (824,444,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (825,444,0,'無解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (826,446,1,'アと解答しているもの',6.6,NULL,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_04.pdf#page=33',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (827,446,2,'イと解答しているもの',88.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (828,446,3,'ウと解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (829,446,4,'エと解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (830,446,99,'上記以外の解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (831,446,0,'無解答',2.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (832,447,1,'13 と解答しているもの',63.1,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_04.pdf#page=35',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (833,447,2,' 26 と解答しているもの',12.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (834,447,3,'39 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (835,447,4,'６ と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (836,447,5,' 11 と解答しているもの',4.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (837,447,6,'15 と解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (838,447,99,'上記以外の解答',14,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (839,447,0,'無解答',5.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (840,449,1,'式：51－15 と解答　62－26 と解答　73－37 と解答　84－48 と解答　95－59 と解答　　答え：36 と解答しているもの',76.1,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_05.pdf#page=3',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (841,449,2,'式：51－15 と解答　62－26 と解答　73－37 と解答　84－48 と解答　95－59 と解答　　答え：36 以外を解答しているもの　無解答',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (842,449,3,'式：類型１，類型２以外の式を解答　無解答　　答え：36 と解答しているもの',5.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (843,449,4,'式：類型１，類型２以外で，差が４になる１から９までの数を，十の位と一の位にもつ２けたの整数どうしの減法の式を解答　　答え：36 以外を解答しているもの　無解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (844,449,5,'式：答えが４になる式を解答　　答え：36 以外を解答しているもの　無解答',3.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (845,449,99,'上記以外の解答',10.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (846,449,0,'無解答',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (847,450,1,'54の⑩と45の①を囲んでいるもの',81.9,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_05.pdf#page=5',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (848,450,2,'類型１以外で，54の⑩と45の①を一つずつ囲んでいるもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (849,450,3,'54の⑩と①または45の⑩と①を一つずつ囲んでいるもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (850,450,4,'①を九つ囲んでいるもの',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (851,450,5,'54の⑩と45の①の組を囲み，その左側の⑩と⑩の組または右側の①と①の組を囲んでいるもの',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (852,450,6,'54の⑩と45の①の組を囲み，その両側の⑩と⑩の組と①と①の組を囲んでいるもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (853,450,99,'上記以外の解答',10.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (854,450,0,'無解答',3.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (855,451,1,'①，②，③の全てを書き，「カードの差」が与えられたときに「２ けたのひき算の答え」が一つに定まるきまりを書いているもの例 カードの差に９をかけると，２けたのひき算の答えになります。',25.1,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_05.pdf#page=7',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (856,451,2,'①，②，③の全てを書き，「カードの差」が与えられたときに「２けたのひき算の答え」が一つに定まる具体的な例を書いているもの例 カードの差が４のとき，９をかけて，２けたのひき算の答えは36になります。',9.3,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (857,451,3,'①，②を書き，「カードの差」が与えられたときに「２けたのひき算の答え」が一つに定まるきまりを乗法以外で書いているもの例 カードの差が１増えるごとに２けたのひき算の答えは９ずつ増えます。',4.4,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (858,451,4,'②を書き，「カードの差」と「９」または「２けたのひき算の答え」と「９」の関係を乗法で表現しているもの',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (859,451,5,'①，②を書いているが，「カードの差」が与えられたときに「２けたのひき算の答え」が一つに定まらないきまりを書いているもの',4.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (860,451,6,'①，②を書いているが，「カードの差」，「２けたのひき算の答え」，「９」の関係を誤って書いているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (861,451,7,'具体的な「カードの差」と「２けたのひき算の答え」の例を書いているもの',16,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (862,451,8,'②を書いているもの',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (863,451,99,'上記以外の解答',22.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (864,451,0,'無解答',14.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (865,453,1,'求め方：Ａ①，Ａ②，Ａ③の全てを書いている　Ｂ①，Ｂ②の全てを書いている　　答え：560 と解答しているもの',40.7,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_05.pdf#page=12',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (866,453,2,'求め方：Ａ①，Ａ②，Ａ③の全てを書いている　Ｂ①，Ｂ②の全てを書いている　　答え：560，28 以外を解答しているもの　無解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (867,453,3,'求め方：Ａ①，Ａ②を書いている　Ａ①，Ａ③を書いている　Ａ②，Ａ③を書いている　Ａ①を書いている　Ａ②を書いている　Ａ③を書いている　Ｂ①を書いている 　Ｂ②を書いている　　答え：560 と解答しているもの',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (868,453,4,'求め方：Ａ①，Ａ②を書いている　Ａ①，Ａ③を書いている　Ａ②，Ａ③を書いている　Ａ①を書いている　Ａ②を書いている　Ａ③を書いている　Ｂ①を書いている 　Ｂ②を書いている　　答え：560，28 以外を解答しているもの　無解答',10.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (869,453,5,'【答え】に，28 と解答しているもの',4.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (870,453,6,'求め方：１通送るのにかかる料金を誤って捉えているもの',6.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (871,453,7,'求め方：重さを用いた式を書いているもの',19.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (872,453,8,'求め方：類型１から類型７以外の解答　無解答　　答え：560 と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (873,453,99,'上記以外の解答',9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (874,453,0,'無解答',6.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (875,454,1,'上から５本目と９本目 と解答しているもの',27.7,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_05.pdf#page=15',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (876,454,2,'上から４本目と８本目 と解答しているもの',18,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (877,454,3,'上から４本目と９本目 と解答しているもの',4.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (878,454,4,'上から５本目と８本目 と解答しているもの',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (879,454,5,'上から４本目と10本目 と解答しているもの',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (880,454,6,'上から２本目と３本目 と解答しているもの',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (881,454,99,'上記以外の解答',38.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (882,454,0,'無解答',5.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (883,456,1,'１ と解答しているもの',68.1,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_05.pdf#page=18',1,'1','(273 + 287 + 269 + 291)÷4');
INSERT INTO "answer_type" VALUES (884,456,2,'２ と解答しているもの',4.4,NULL,NULL,1,'2','(273 + 80 + 287 + 269 + 291)÷4');
INSERT INTO "answer_type" VALUES (885,456,3,'３ と解答しているもの',9,NULL,NULL,1,'3','(273 + 287 + 269 + 291)÷5');
INSERT INTO "answer_type" VALUES (886,456,4,'４ と解答しているもの',17.1,NULL,NULL,1,'4','(273 + 80 + 287 + 269 + 291)÷5');
INSERT INTO "answer_type" VALUES (887,456,99,'上記以外の解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (888,456,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (889,457,1,'①，②，③の全てを書いているもの　①，②を書いているもの',25.4,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_05.pdf#page=21',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (890,457,2,'①，③を書いているもの',0.9,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (891,457,3,'①を書いているもの',10,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (892,457,4,'②，③を書いているもの　②を書いているもの',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (893,457,5,' ③を書いているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (894,457,6,' ４回目の記録を除いて，４回分の平均を求めているもの',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (895,457,7,'７ｍを基準にして記述しているもの',17.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (896,457,8,'７ｍと７ｍ20cm以外を基準にして記述しているもの',8.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (897,457,99,'上記以外の解答',20,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (898,457,0,'無解答',12.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (899,459,1,'「８」が表す人数：①，②の全てを書いている　　記号：イ と解答しているもの',40.2,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_05.pdf#page=25',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (900,459,2,'「８」が表す人数：①，②の全てを書いている　　記号：イ 以外を解答しているもの　無解答',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (901,459,3,'「８」が表す人数：①を書いている　 ②を書いている　　記号：イ と解答しているもの',7.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (902,459,4,'「８」が表す人数：①を書いている　 ②を書いている　　記号：イ 以外を解答しているもの　無解答',9.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (903,459,5,'「８」が表す人数：イ 以外の記号の示す表の位置を正しく説明している　　記号：エ と解答しているもの',7.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (904,459,6,'「８」が表す人数：イ 以外の記号の示す表の位置を正しく説明している　　記号：イ，エ 以外を解答しているもの',5.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (905,459,7,'「８」が表す人数：類型１から類型６以外の解答　無解答　　記号：イ と解答しているもの',6.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (906,459,99,'上記以外の解答',17.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (907,459,0,'無解答',4.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (908,460,1,'１ と解答しているもの',23.4,NULL,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_05.pdf#page=29',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (909,460,2,'２ と解答しているもの',10,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (910,460,3,'３ と解答しているもの',29.4,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (911,460,4,'４ と解答しているもの',32.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (912,460,99,'上記以外の解答',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (913,460,0,'無解答',4.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (914,462,1,'１ と解答しているもの',2.6,NULL,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_05.pdf#page=32',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (915,462,2,'２ と解答しているもの',6.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (916,462,3,'３ と解答しているもの',65.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (917,462,4,'４ と解答しているもの',20.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (918,462,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (919,462,0,'無解答',5.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (920,463,1,'番号：１ と解答　　わけ：Ａ①，Ａ②の全てを書いているもの　Ｂ①，Ｂ②の全てを書いているもの　Ｃ①，Ｃ②の全てを書いているもの',2.3,1,'https://www.nier.go.jp/17chousakekkahoukoku/report/data/17pmath_05.pdf#page=36',1,'1','100円玉');
INSERT INTO "answer_type" VALUES (921,463,2,'番号：１ と解答　　わけ：Ａ①を書いているもの　Ｂ①を書いているもの　Ｃ①を書いているもの',11.2,1,NULL,1,'2','500円玉');
INSERT INTO "answer_type" VALUES (922,463,3,'番号：１ と解答　　わけ：100円玉や500円玉の直径の86％に当たる大きさを考えているもの　例 22.6×0.86，22.6×(1－0.14)　26.5×0.86，26.5×(1－0.14)',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (923,463,4,'番号：１ と解答　　わけ：「最小の満月の直径」を１円玉の直径としたときの「最大の満月の直径」に当たる値を次のように求めているもの　20÷1.14，20＋1.14，20－1.14',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (924,463,5,'番号：１ と解答　　わけ：「最小の満月の直径」を１円玉の直径としたときの「最大の満月の直径」に当たる値を次のように求めているもの　20×0.14，20＋0.14，20－0.14　20÷1.4，20＋1.4，20－1.4　20÷14，20－14',4.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (925,463,6,'番号：１ と解答　　わけ：類型１から類型５以外の解答　無解答',28.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (926,463,7,'番号：２ と解答　　わけ：「最小の満月の直径」を１円玉の直径としたときの「最大の満月の直径」に当たる値を次のように求めているもの　20÷0.14　20×1.4　20×14，20＋14',5.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (927,463,8,'番号：２ と解答　　わけ：類型７以外の解答　無解答',36.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (928,463,99,'上記以外の解答',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (929,463,0,'無解答',8.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (930,393,1,'１ と解答しているもの',65,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_04.pdf#page=3',1,'1','□÷0.8の商は、□より大きくなる。');
INSERT INTO "answer_type" VALUES (931,393,2,'２ と解答しているもの',29.2,NULL,NULL,1,'2','□÷0.8の商は、□より小さくなる。');
INSERT INTO "answer_type" VALUES (932,393,3,'３ と解答しているもの',4.3,NULL,NULL,1,'3','□÷0.8の商は、□と同じになる。');
INSERT INTO "answer_type" VALUES (933,393,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (934,393,0,'無解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (935,394,1,'㋐：21 と解答　　㋑：3 と解答　　㋒：3 と解答しているもの',68.7,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_04.pdf#page=5',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (936,394,2,'㋐：21 と解答　　㋑：3 と解答　　㋒：0.3 と解答しているもの',22.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (937,394,3,'㋐：21 と解答　　㋑：3 と解答　　㋒： 0.03と解答しているもの',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (938,394,4,'㋐：21 と解答　　㋑：3 と解答　　㋒：300 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (939,394,5,'㋐：2.1 と解答　　㋑：0.3 と解答　　㋒：0.3 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (940,394,6,'㋐：2.1 と解答　　㋑：0.3 と解答　　㋒：3 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (941,394,7,'類型1から類型6以外で,㋑と㋒に同じ数を解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (942,394,8,'類型1から類型7以外で,㋒に3と解答しているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (943,394,99,'上記以外の解答',5.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (944,394,0,'無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (945,395,1,'㋓：37 と解答　　㋔：1.3 と解答　　㋕：48.1 と解答しているもの',60.3,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_04.pdf#page=8',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (946,395,2,'㋓：1.3 と解答　　㋔：37 と解答　　㋕：48.1 と解答しているもの',27.7,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (947,395,3,'㋓：48.1 と解答　　㋔：1.3 と解答　　㋕：37 と解答しているもの',4.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (948,395,4,'㋓：1.3 と解答　　㋔：48.1 と解答　　㋕：37 と解答しているもの',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (949,395,5,'㋓：48.1 と解答　　㋔：37 と解答　　㋕：1.3 と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (950,395,6,'㋓：37 と解答　　㋔：48.1 と解答　　㋕：1.3 と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (951,395,99,'上記以外の解答',4.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (952,395,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (953,397,1,'897と解答しているもの',91,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_04.pdf#page=11',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (954,397,2,'907と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (955,397,3,'903と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (956,397,4,'913と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (957,397,5,'807と解答しているもの',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (958,397,6,'997と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (959,397,7,'893と解答しているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (960,397,99,'上記以外の解答',4.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (961,397,0,'無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (962,398,1,'4. 95と解答しているもの',77.3,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_04.pdf#page=12',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (963,398,2,'49.5または495と解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (964,398,3,'0. 495と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (965,398,4,'4. 68または46.8と解答しているもの',10.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (966,398,5,'468と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (967,398,6,'0. 468と解答しているもの',4.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (968,398,7,'7. 65 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (969,398,8,'1.65または4. 35または4. 62と解答しているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (970,398,99,'上記以外の解答',3.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (971,398,0,'無解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (972,399,1,'20と解答しているもの',77.9,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_04.pdf#page=15',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (973,399,2,'2と解答しているもの',12.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (974,399,3,'0.2と解答しているもの',6.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (975,399,4,'2,  0.2以外の位取りの誤りがあるもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (976,399,5,'除数と被除数を逆にして計算を考えているもの　例 0. 05　0. 5　5',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (977,399,99,'上記以外の解答',2.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (978,399,0,'無解答',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (979,400,1,'2/3と解答しているもの',87.1,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_04.pdf#page=18',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (980,400,2,'6/9と解答しているもの',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (981,400,3,'類型1,類型2以外で2/3と大きさの等しい分数を解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (982,400,4,'2/27と解答しているもの(分母に3をかけて計算している)',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (983,400,5,'2/9と解答しているもの(分母と分子に3をかけて計算し,約分している)',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (984,400,6,'6/27と解答しているもの(分母と分子に3をかけて計算し,約分していない)',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (985,400,99,'上記以外の解答',5.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (986,400,0,'無解答',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (987,402,1,'①：＞と解答　　②：＜と解答しているもの','96. 7',1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_04.pdf#page=19',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (988,402,2,'①：＜と解答　　②：＞と解答しているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (989,402,3,'①：＞と解答　　②：＞と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (990,402,4,'①：＜と解答　　②：＜と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (991,402,99,'上記以外の解答',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (992,402,0,'無解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (993,403,1,'いちばん小さい数：7 と解答　　いちばん大きい数：7.1 と解答しているもの',74.2,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_04.pdf#page=20',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (994,403,2,'いちばん小さい数：7 と解答　　いちばん大きい数：7.01 と解答しているもの','3. 3',NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (995,403,3,'いちばん小さい数：7.01 と解答　　いちばん大きい数：7.1 と解答しているもの',8.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (996,403,4,'いちばん小さい数：7.01 と解答　　いちばん大きい数：7 と解答しているもの',10.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (997,403,5,'いちばん小さい数：7.1 と解答　　いちばん大きい数：7.01 と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (998,403,6,'いちばん小さい数：7.1 と解答　　いちばん大きい数：7 と解答しているもの',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (999,403,99,'上記以外の解答',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1000,403,0,'無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1001,404,1,'14÷8  と解答しているもの',72,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_04.pdf#page=23',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1002,404,2,'言葉の式で解答しているもの　例 シートにすわっている人数÷シートの面積',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1003,404,3,'□や言葉を用いて乗法の式で関係を正しく解答しているもの 例 □X8=14',0.1,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1004,404,4,'8÷14  と解答しているもの',15.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1005,404,5,'14÷14  と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1006,404,6,'8÷8  と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1007,404,7,'1×14と解答しているもの　2×7 と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1008,404,99,'上記以外の解答',8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1009,404,0,'無解答',4.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1010,405,1,'１ と解答しているもの',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1011,405,2,'２ と解答しているもの',2.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1012,405,3,'３ と解答しているもの',7.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1013,405,4,'４ と解答しているもの',4.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1014,405,5,'5 と解答しているもの',82.1,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_04.pdf#page=25',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1015,405,99,'上記以外の解答',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1016,405,0,'無解答',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1017,406,1,'1,3,4 と解答しているもの',79.8,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_04.pdf#page=29',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1018,406,2,'1,2,3 と解答しているもの　(つくることができる1,3と,つくることができない2を選択している)',2.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1019,406,3,'1,3,5 と解答しているもの　(つくることができる1,3と,つくることができない5を選択して いる)',3.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1020,406,4,'1,2,4 と解答しているもの　(つくることができる1,4と,つくることができない2を選択して いる)',4.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1021,406,5,'1,4,5 と解答しているもの　(つくることができる1,4と,つくることができない5を選択している)',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1022,406,6,'2, 3, 4  と解答しているもの　(つくることができる3,4と,つくることができない2を選択している)',3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1023,406,7,'3, 4, 5  と解答しているもの (つくることができる3,4と,つくることができない5を選択している)',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1024,406,8,'1,3,4のうち2つのみを解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1025,406,99,'上記以外の解答',3.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1026,406,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1027,407,1,'2, 3, 4, 5  と解答しているもの',78.2,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_04.pdf#page=32',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1028,407,2,'2, 3, 4, 5のうち3つを解答しているもの',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1029,407,3,'3, 5  と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1030,407,4,'2,  4  と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1031,407,5,'類型3,類型4以外で,2, 3, 4, 5のうち2つを解答しているもの(面㋐に垂直な面のうち,隣り合う2つの面を選択している)',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1032,407,6,'2, 3, 4, 5のうち1つを解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1033,407,7,'1と解答しているもの',4.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1034,407,8,'1を含めて解答しているもの',11.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1035,407,99,'上記以外の解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1036,407,0,'無解答',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1037,408,1,'１ と解答しているもの',5.4,NULL,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_04.pdf#page=33',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1038,408,2,'２ と解答しているもの',74.5,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1039,408,3,'３ と解答しているもの',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1040,408,4,'４ と解答しているもの',16.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1041,408,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1042,408,0,'無解答',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1043,410,1,'式：10+1+19 と解答　　答え：30と解答しているもの',79.1,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_04.pdf#page=36',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1044,410,2,'式：類型1以外で,問題に示された10,19及び,さゆりさん本人を表す1を用いたことが分かる式を解答 例10 +20  例11+20-1　　答え：30と解答しているもの',1.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1045,410,3,'式：類型1,類型2以外で,人数を求めていることが分かる式を解答　　答え：30と解答しているもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1046,410,4,'式：類型1の式を解答　　答え：30以外を解答しているもの　無解答',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1047,410,5,'式：類型2の式を解答　　答え：30以外を解答しているもの　無解答',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1048,410,6,'式：10+19 と解答しているもの',9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1049,410,7,'式：10+19-1 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1050,410,8,'式：類型1から類型7以外の解答　無解答　　答え：30と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1051,410,99,'上記以外の解答',3.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1052,410,0,'無解答',4.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1053,411,1,'㋐：100と解答　　㋑：120と解答しているもの',51.2,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_04.pdf#page=38',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1054,411,2,'㋐：100と解答　　㋑：20と解答しているもの',2.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1055,411,3,'㋐：100と解答　　㋑：類型1,類型2以外を解答しているもの　無解答',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1056,411,4,'㋐：80と解答　　㋑：100と解答しているもの',13.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1057,411,5,'㋐：20と解答　　㋑：100と解答しているもの',2.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1058,411,6,'㋐：類型1から類型5以外を解答　無解答　　㋑：100と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1059,411,7,'㋐：20と解答　　㋑：120と解答しているもの',3.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1060,411,8,'㋐：80と解答　　㋑：20と解答しているもの',3.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1061,411,99,'上記以外の解答',15.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1062,411,0,'無解答',5.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1063,413,1,'㋐：8と解答　　㋑：10と解答　　㋒：80と解答しているもの',91.1,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_05.pdf#page=3',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1064,413,2,'㋐：10と解答　　㋑：8と解答　　㋒：80と解答しているもの',1.5,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1065,413,3,'㋐：㋑：㋐に8,㋑に9と解答しているもの　㋐に9,㋑に8と解答しているもの　㋐に9,㋑に10と解答しているもの　㋐に10,㋑に9と解答しているもの',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1066,413,4,'㋐：8と解答　　㋑：8と解答しているもの',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1067,413,5,'㋐：10と解答　　㋑：10と解答しているもの','0. 3',NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1068,413,6,'㋐：㋑：類型1から類型5以外を解答　　㋒：80 と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1069,413,99,'上記以外の解答',3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1070,413,0,'無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1071,414,1,'㋓：①を書いている　　㋔：②を書いている　　㋕：③,④の全てを書いている',42.2,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_05.pdf#page=5',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1072,414,2,'㋓：①を書いている　　㋔：②を書いている　　㋕：③を書いているもの　④を書いているもの',3.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1073,414,3,'㋓：①を書いている　　㋔：②を書いている　　㋕：類型1,類型2以外の解答　無解答',5.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1074,414,4,'㋓：㋔：①または②の記述に不足がある　　㋕：③,④の全てを書いているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1075,414,5,'㋓：㋔：①または②の記述に不足がある　　㋕：③を書いているもの　④を書いているもの',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1076,414,6,'㋓：㋔：類型1から類型5以外の解答　無解答　　㋕：類型1,類型2を解答しているもの',10.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1077,414,7,'㋓：2X7を書いている　　㋔：6X2を書いているもの',4.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1078,414,8,'正方形の面積とできた長方形の面積の差を求めているもの　例【㋓】正方形の面積は7 X  7 =49で,49cm2です。　【㋔】できた長方形の面積は5 X 9 =45で,45cm2です。　【㋕】49-45= 4で,正方形の面積のほうが4cm2小さいです。',3.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1079,414,99,'上記以外の解答',24.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1080,414,0,'無解答',3.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1081,416,1,'式：アプローチとインターバルの距離を分けて正しい式を解答　例12+ 5X3　12+ 5 + 5 + 5　　答え：27 と解答しているもの',56.3,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_05.pdf#page=10',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1082,416,2,'式：アプローチとインターバルの距離を合わせて正しい式を解答　例 17+ 5X2　17+ 5 + 5　　答え：27 と解答しているもの',0.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1083,416,3,'式：言葉が含まれる式を解答　例 12+ 5 ×ハードルの間の数　　答え：27 と解答しているもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1084,416,4,'式：類型1から類型3の式を解答　　答え：51,44と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1085,416,5,'式：類型1から類型3の式を解答　　答え：27,51,44 以外を解答しているもの　無解答',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1086,416,6,'式：類型1から類型5以外の式を解答　無解答　　答え：27 と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1087,416,7,'式：5X3 と解答しているもの　5+5+5 と解答しているもの　',3.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1088,416,8,'式：12+ 5X4 と解答しているもの　12+5 + 5 + 5 + 5 と解答しているもの　5X4 と解答しているもの　5+5+5+5 と解答しているもの',17.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1089,416,99,'上記以外の解答',17.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1090,416,0,'無解答',3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1091,417,1,'式：8.1 + 0.4X 4 と解答　　目標のタイム：9.7と解答しているもの',50,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_05.pdf#page=12',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1092,417,2,'式：8.1 + 1.6    と解答　　目標のタイム：9.7と解答しているもの',0.7,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1093,417,3,'式：言葉が含まれる式を解答　例  40m走のタイム+0. 4Xハードルの数　8.1 + 0. 4Xハードルの数　40m走のタイム+0. 4X 4　　目標のタイム：9.7と解答しているもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1094,417,4,'式：類型1,類型3の式を解答　　目標のタイム：34と解答しているもの',15.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1095,417,5,'式：類型1,類型3の式を解答　　目標のタイム：9.7,  34以外を解答しているもの　無解答',10.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1096,417,6,'式：類型2の式を解答　　目標のタイム：9.7,  34以外を解答しているもの　無解答',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1097,417,7,'式：類型1から類型6以外の式を解答　無解答　　目標のタイム：9.7と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1098,417,8,'式：類型1から類型6以外の式を解答　無解答　　目標のタイム：34と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1099,417,99,'上記以外の解答',18.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1100,417,0,'無解答',4.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1101,418,1,'0. 4や0. 3が,ハードル1台当たりに増える時間であることを書いているもの',15.7,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_05.pdf#page=14',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1102,418,2,'0.4や0. 3が,40mハードル走のときに増える分の時間をハードルの数でわった数であることを書いているもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1103,418,3,'増える時間であることを解答しているもの',35.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1104,418,4,'走る距離を基にしているもの　例40mの0. 01倍であると考えられます。',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1105,418,5,'ハードルの数を基にしているもの　例  4台の0.1倍であると考えられます。',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1106,418,6,'目標のタイムであることを解答しているもの',4.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1107,418,99,'上記以外の解答',23.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1108,418,0,'無解答',18.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1109,420,1,'ともみ：1 と解答　　はるお：2 と解答　　　あかね：3 と解答　',3.2,NULL,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_05.pdf#page=17',1,'1','今あるリボンから、1人分のリボンを何本取ることができるか');
INSERT INTO "answer_type" VALUES (1110,420,2,'ともみ：1 と解答　　はるお：3 と解答　　　あかね：2 と解答　',3.5,NULL,NULL,1,'2','今あるリボンから、1人あたり何cm取ることができるか');
INSERT INTO "answer_type" VALUES (1111,420,3,'ともみ：2 と解答　　はるお：1 と解答　　　あかね：3 と解答　',6.8,NULL,NULL,1,'3','全員分のリボンを取るのに必要な長さは何cmか');
INSERT INTO "answer_type" VALUES (1112,420,4,'ともみ：2 と解答　　はるお：3 と解答　　　あかね：1 と解答　',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1113,420,5,'ともみ：3 と解答　　はるお：1 と解答　　　あかね：2 と解答　',62.7,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1114,420,6,'ともみ：3 と解答　　はるお：2 と解答　　　あかね：1 と解答　',19.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1115,420,99,'上記以外の解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1116,420,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1117,421,1,'①,②,③の全てを書いているもの　①,③を書いているもの',38.7,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_05.pdf#page=19',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1118,421,2,'①,②を書いているもの',7.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1119,421,3,'①を書いているもの',4.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1120,421,4,'②,③を書いているもの',3.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1121,421,5,'③を書いているもの',4.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1122,421,6,'①を書いていて,正方形を縦に5個かくことができるとしているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1123,421,7,'①を書いていて,正方形を縦に7個かくことができるとしているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1124,421,8,'厚紙の面積が正方形1個の面積の何倍かを考えているもの　例 厚紙の面積は2106cm2で,正方形の面積は81cm2だから,　2106÷81 = 26で,26個かくことができます。',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1125,421,99,'上記以外の解答',22.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1126,421,0,'無解答',17.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1127,422,1,'１ と解答しているもの',10.7,NULL,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_05.pdf#page=21',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1128,422,2,'２ と解答しているもの',76.6,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1129,422,3,'３ と解答しているもの',4.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1130,422,4,'４ と解答しているもの',5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1131,422,99,'上記以外の解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1132,422,0,'無解答',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1133,424,1,'１ と解答しているもの',28.8,NULL,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_05.pdf#page=24',1,'1','各学校の、図書館を利用した人数');
INSERT INTO "answer_type" VALUES (1134,424,2,'２ と解答しているもの',48.4,1,NULL,1,'2','各学校の、学校全体の児童の人数');
INSERT INTO "answer_type" VALUES (1135,424,3,'３ と解答しているもの',10,NULL,NULL,1,'3','各学校の、図書館にある本の冊数');
INSERT INTO "answer_type" VALUES (1136,424,4,'４ と解答しているもの',10.8,NULL,NULL,1,'4','各学校の、本の種類ごとの貸出冊数');
INSERT INTO "answer_type" VALUES (1137,424,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1138,424,0,'無解答',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1139,425,1,'１ と解答しているもの',8.2,NULL,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_05.pdf#page=25',1,'1','【どちらの学校も6月の貸出冊数がいちばん多い】ですね。校内読書週間の効果だと思います。秋にも校内読書週間をしましょう。（【】は下線部）');
INSERT INTO "answer_type" VALUES (1140,425,2,'２ と解答しているもの',8.1,NULL,NULL,1,'2','【A小学校は「物語」の貸出冊数がいちばん多い】ですね。面白かった物語について、しょうかい文を書いてもらいましょう。（【】は下線部）');
INSERT INTO "answer_type" VALUES (1141,425,3,'３ と解答しているもの',70.8,1,NULL,1,'3','【5月は「伝記」の貸出冊数が少ない】ですね。ポスターを作って呼びかけましょう。（【】は下線部）');
INSERT INTO "answer_type" VALUES (1142,425,4,'４ と解答しているもの',10.2,NULL,NULL,1,'4','【A小学校の貸出冊数は、合計で9738冊】ですね。次の4か月間葉」10000冊以上を目指しましょう。（【】は下線部）');
INSERT INTO "answer_type" VALUES (1143,425,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1144,425,0,'無解答',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1145,426,1,'①,②,③の全てを書いているもの',20.5,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_05.pdf#page=27',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1146,426,2,'①,②を書いているもの',4.6,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1147,426,3,'①,③を書いているもの　①を書いているもの',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1148,426,4,'②,③を書いているもの　②を書いているもの',4.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1149,426,5,'③を書いているもの',13.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1150,426,6,'6月の貸出冊数のみを基に判断しているもの　例  A小学校は約1200冊,B小学校は約1100冊だからです。',5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1151,426,7,'グラフの目盛りの幅に関することを理由として書いているもの　例　1目もりの幅が違うからです。　例　B小学校のグラフは波線で省略しているからです。',7.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1152,426,8,'表1の5月と6月の数値を比べて判断しているもの　例  　表1の5月と6月を見ると,A小学校の貸出冊数は3414 — 2918 = 496で,496冊増えていて,B小学校の貸出冊数は,938-2523 = 415で,415冊増えているからです。',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1153,426,99,'上記以外の解答',28.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1154,426,0,'無解答',13.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1155,428,1,'①,②,③の全てを書いているもの',7,1,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_05.pdf#page=32',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1156,428,2,'①,③を書いているもの',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1157,428,3,'②,③を書いているもの',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1158,428,4,'③を書いているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1159,428,5,'①,②を書いているもの',21.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1160,428,6,'①を書いているもの',13.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1161,428,7,'②を書いているもの',14.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1162,428,8,'被除数を除数で等分している式であることを記述しているもの 例  360÷120は,360を120等分している式です。',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1163,428,99,'上記以外の解答','19. 3',NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1164,428,0,'無解答',18.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1165,429,1,'１ と解答しているもの',11.1,NULL,'https://www.nier.go.jp/16chousakekkahoukoku/report/data/16pmath_05.pdf#page=34',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1166,429,2,'２ と解答しているもの',39,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1167,429,3,'３ と解答しているもの',25.4,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1168,429,4,'４ と解答しているもの',15.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1169,429,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1170,429,0,'無解答',8.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1171,334,1,'１ と解答しているもの',11.2,NULL,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_04.pdf#page=2',1,'1','0.1');
INSERT INTO "answer_type" VALUES (1172,334,2,'２ と解答しているもの',3.9,NULL,NULL,1,'2','1');
INSERT INTO "answer_type" VALUES (1173,334,3,'３ と解答しているもの',11.6,NULL,NULL,1,'3','0.8');
INSERT INTO "answer_type" VALUES (1174,334,4,'４ と解答しているもの',71.3,1,NULL,1,'4','8');
INSERT INTO "answer_type" VALUES (1175,334,99,'上記以外の解答',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1176,334,0,'無解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1177,335,1,'㋐：521と解答　　㋑：70と解答しているもの',74.5,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_04.pdf#page=4',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1178,335,2,'㋐：52.1と解答　　㋑：7と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1179,335,3,'㋐：521と解答　　㋑：700と解答しているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1180,335,4,'㋐：521と解答　　㋑：7と解答しているもの',12.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1181,335,5,'㋐：521と解答　　㋑：類型1から類型4以外の解答  無解答',2.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1182,335,6,'㋐：521以外の解答  無解答　　㋑：70と解答しているもの',2.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1183,335,7,'㋐：5.21と解答　　㋑：0.7と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1184,335,99,'上記以外の解答',5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1185,335,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1186,336,1,'㋒：6.52と解答　　㋓：0.22と解答　　㋔：6.3と解答しているもの',63.7,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_04.pdf#page=4',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1187,336,2,'㋒：6.52と解答　　㋓：6.3と解答　　㋔：0.22と解答しているもの',18.4,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1188,336,3,'㋒：6.3と解答　　㋓：0.22と解答　　㋔：6.52と解答しているもの',4.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1189,336,4,'㋒：6.3と解答　　㋓：6.52と解答　　㋔：0.22と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1190,336,5,'㋒：0.22と解答　　㋓：6.3と解答　　㋔：6.52と解答しているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1191,336,6,'㋒：0.22と解答　　㋓：6.52と解答　　㋔：6.3と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1192,336,99,'上記以外の解答',9.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1193,336,0,'無解答',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1194,338,1,'100と解答しているもの',98.2,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_04.pdf#page=9',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1195,338,2,'90と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1196,338,3,'110と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1197,338,99,'上記以外の解答',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1198,338,0,'無解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1199,339,1,'5.99と解答しているもの',69.7,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_04.pdf#page=10',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1200,339,2,'59.9または599と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1201,339,3,'0. 599と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1202,339,4,'6.71または67.1または671と解答しているもの',13,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1203,339,5,'0. 671と解答しているもの',6.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1204,339,6,'6.19   と解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1205,339,7,'7. 59または6. 87または14. 79と解答しているもの',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1206,339,99,'上記以外の解答',6.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1207,339,0,'無解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1208,340,1,'11/36と解答しているもの(大きさの等しい分数を含む)',81.5,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_04.pdf#page=13',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1209,340,2,'1/9または4/36と解答しているもの(大きさの等しい分数を含む)',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1210,340,3,'41/36と解答しているもの(大きさの等しい分数を含む)',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1211,340,4,'類型1から類型3以外で,分母が36である分数を解答しているもの',6.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1212,340,5,'4/5と解答しているもの',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1213,340,99,'上記以外の解答',6.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1214,340,0,'無解答',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1215,341,1,'5/42と解答しているもの(大きさの等しい分数を含む)',84.3,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_04.pdf#page=14',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1216,341,2,'35/6と解答しているもの(大きさの等しい分数を含む)',4.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1217,341,3,'42/5と解答しているもの(大きさの等しい分数を含む)',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1218,341,99,'上記以外の解答',7.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1219,341,0,'無解答',4.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1220,342,1,'(午後)2 (時)45 (分)と解答しているもの',75,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_04.pdf#page=16',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1221,342,2,'(午後)3 (時)45 (分)と解答しているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1222,342,3,'(午後)2 (時)50 (分)と解答しているもの(20分だけひいている)  (午後)3 (時)5 (分) と解答しているもの(5分だけひいている) ',11.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1223,342,4,'(午後)3 (時)25 (分)と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1224,342,5,'(午後)2 (時)85 (分)と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1225,342,6,'(午後)3 (時)35 (分)と解答しているもの(所要時間をたしている)',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1226,342,7,'(午後)3 (時)30 (分) と解答しているもの(20分だけたしている)　(午後)3 (時)15 (分) と解答しているもの(5分だけたしている)',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1227,342,99,'上記以外の解答',9.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1228,342,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1229,344,1,'１ と解答しているもの',1.3,NULL,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_04.pdf#page=20',1,'1','90°未満である。');
INSERT INTO "answer_type" VALUES (1230,344,2,'２ と解答しているもの',15,NULL,NULL,1,'2','90°以上で、180°未満である。');
INSERT INTO "answer_type" VALUES (1231,344,3,'３ と解答しているもの',81.4,1,NULL,1,'3','180°以上で、270°未満である。');
INSERT INTO "answer_type" VALUES (1232,344,4,'４ と解答しているもの',1.8,NULL,NULL,1,'4','270°以上で、360°未満である。');
INSERT INTO "answer_type" VALUES (1233,344,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1234,344,0,'無解答',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1235,345,1,'210と解答しているもの',58.2,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_04.pdf#page=21',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1236,345,2,'150と解答しているもの',34.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1237,345,3,'30と解答しているもの',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1238,345,4,'330と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1239,345,5,'類型1から類型4以外で,180°以上270°未満の角度を解答しているもの',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1240,345,6,'類型1から類型4以外で,90°未満の角度を解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1241,345,7,'類型1から類型4以外で,90°以上180°未満の角度を解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1242,345,8,'類型1から類型4以外で,270°以上360°未満の角度を解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1243,345,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1244,345,0,'無解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1245,347,1,'１ と解答しているもの',50.9,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_04.pdf#page=25',1,'1','1つの円の半径の長さは、どれも同じ長さになる。');
INSERT INTO "answer_type" VALUES (1246,347,2,'２ と解答しているもの',20.8,NULL,NULL,1,'2','円周の長さは、直径の長さの約3.14倍になる。');
INSERT INTO "answer_type" VALUES (1247,347,3,'３ と解答しているもの',15.2,NULL,NULL,1,'3','1つの円の直径の長さは、半径の長さの2倍になる。');
INSERT INTO "answer_type" VALUES (1248,347,4,'４ と解答しているもの',11.3,NULL,NULL,1,'4','1つの円の直径の長さは、円周の上の2つの点を結ぶ直径の中でいちばん長い。');
INSERT INTO "answer_type" VALUES (1249,347,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1250,347,0,'無解答',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1251,348,1,'55と解答しているもの',64.7,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_04.pdf#page=26',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1252,348,2,'110と解答しているもの(180-70をしている)',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1253,348,3,'40と解答しているもの(㋑の角を二等辺三角形の頂角と捉えている)',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1254,348,4,'70と解答しているもの(㋐の角と同じ角度を解答している)',13.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1255,348,5,'60と解答しているもの(正三角形の一つの角の大きさを解答している)',3.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1256,348,99,'上記以外の解答',12.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1257,348,0,'無解答',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1258,350,1,'4,   5     と解答しているもの',75.6,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_04.pdf#page=29',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1259,350,2,'3,  5     と解答しているもの',15.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1260,350,3,'3,  4    と解答しているもの',2.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1261,350,4,'3,  3または4,  4または5,  5と解答しているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1262,350,99,'上記以外の解答',3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1263,350,0,'無解答',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1264,351,1,'１ と解答しているもの',4.5,NULL,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_04.pdf#page=30',1,'1','辺ウエ');
INSERT INTO "answer_type" VALUES (1265,351,2,'２ と解答しているもの',11.1,NULL,NULL,1,'2','辺エオ');
INSERT INTO "answer_type" VALUES (1266,351,3,'３ と解答しているもの',67.8,1,NULL,1,'3','辺キク');
INSERT INTO "answer_type" VALUES (1267,351,4,'４ と解答しているもの',13.1,NULL,NULL,1,'4','辺サシ');
INSERT INTO "answer_type" VALUES (1268,351,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1269,351,0,'無解答',3.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1270,352,1,'１ と解答しているもの',4.8,NULL,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_04.pdf#page=33',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1271,352,2,'２ と解答しているもの',81.9,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1272,352,3,'３ と解答しているもの',4.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1273,352,4,'４ と解答しているもの',6.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1274,352,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1275,352,0,'無解答',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1276,353,1,'頂点の三つの〇を黒く塗っているもの',88.2,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_04.pdf#page=36',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1277,353,2,'囲んである三つの〇を黒く塗っているもの',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1278,353,3,'頂点の三つ以外の全ての〇を黒く塗っているもの',4.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1279,353,4,'類型1,類型2以外の三つの〇を黒く塗っているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1280,353,5,'全ての〇を黒く塗っているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1281,353,6,'一列の〇を黒く塗っているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1282,353,99,'上記以外の解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1283,353,0,'無解答',4.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1284,355,1,'１ と解答しているもの',0.6,NULL,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_05.pdf#page=3',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1285,355,2,'２ と解答しているもの',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1286,355,3,'３ と解答しているもの',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1287,355,4,'４ と解答しているもの',95.3,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1288,355,99,'上記以外の解答',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1289,355,0,'無解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1290,356,1,'㋐と解答しているもの',54.7,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_05.pdf#page=4',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1291,356,2,'㋑と解答しているもの',24,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1292,356,3,'㋒と解答しているもの',18.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1293,356,99,'上記以外の解答',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1294,356,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1295,357,1,'①,②の全てを書いているもの',27.8,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_05.pdf#page=6',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1296,357,2,'①,②を書いていて,②以外の平行四辺形の特徴も書いているもの',7.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1297,357,3,'①を書いていて,②以外の平行四辺形の特徴を書いているもの',7.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1298,357,4,'①を書いているもの',23.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1299,357,5,'②を書いているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1300,357,6,'②を書いていて,②以外の平行四辺形の特徴も書いているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1301,357,7,'②以外の平行四辺形の特徴を書いているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1302,357,8,'地図から平行四辺形以外の図形を見いだして書いているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1303,357,99,'上記以外の解答',16.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1304,357,0,'無解答',14.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1305,359,1,'番号：3  と解答　　代金：630と解答しているもの',64.9,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_05.pdf#page=9',1,'1','1個入りパックを7つ買う。');
INSERT INTO "answer_type" VALUES (1306,359,2,'番号：3  と解答　　代金：630以外を解答しているもの　無解答',7.2,NULL,NULL,1,'2','2個入りパックを2つと、3個入りパックを1つ買う。');
INSERT INTO "answer_type" VALUES (1307,359,3,'番号：2または4と解答しているもの',24.2,NULL,NULL,1,'3','2個入りパックを3つと、1個入りパックを1つ買う。');
INSERT INTO "answer_type" VALUES (1308,359,4,'番号：1と解答しているもの　',3,NULL,NULL,1,'4','3個入りパックを2つと、1個入りパックを1つ買う。');
INSERT INTO "answer_type" VALUES (1309,359,99,'上記以外の解答',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1310,359,0,'無解答',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1311,360,1,'式：480÷1.2と解答　□ ×1.2 =480 と解答　480 ÷ 120×100 と解答　(増量後のせんざいの量)÷1.2と解答　　答え：400と解答しているもの',13.4,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_05.pdf#page=11',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1312,360,2,'式：類型1以外の式を解答　無解答　　答え：400と解答しているもの',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1313,360,3,'式：類型1の式を解答　　答え：400と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1314,360,4,'式：増量前の量の1%や10%に当たる量を求める式を解答　例 4804÷120　例 480 ÷ 12　　答え：400  以外の答えを解答しているもの　無解答',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1315,360,5,'式：増量後の量の1.2倍,12倍,120倍に当たる量を求める式を解答　例  480×1.2　　答え：400  以外の答えを解答しているもの　無解答',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1316,360,6,'式：増量後の量の80%に当たる量を求める式を解答　例　480×0.8　　答え：400  以外の答えを解答しているもの　無解答',27.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1317,360,7,'式：480÷0.2と解答  480÷20と解答  480×0.2と解答  480×20と解答　　答え：400  以外の答えを解答しているもの　無解答',36.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1318,360,8,'式：480-20と解答  480-0.2と解答  480-120と解答  480-1.2と解答　　答え：400  以外の答えを解答しているもの　無解答',5.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1319,360,99,'上記以外の解答',9.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1320,360,0,'無解答',4.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1321,361,1,'正しい数：270  と解答　　求め方と答え：A①,A②,A③の全てを書いているもの',48.2,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_05.pdf#page=14',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1322,361,2,'正しい数：270  と解答　　求め方と答え：B①,B②,B③の全てを書いているもの　B②,B③を書いているもの',3.1,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1323,361,3,'正しい数：270  と解答　　求め方と答え：A①,A②を書いているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1324,361,4,'正しい数：270  と解答　　求め方と答え：B①,B②を書いているもの　B②を書いているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1325,361,5,'正しい数：270  と解答　　求め方と答え：A①,A③を書いているもの　A①を書いているもの',5.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1326,361,6,'正しい数：270  と解答　　求め方と答え：A②,A③を書いているもの　A②を書いているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1327,361,7,'正しい数：270  と解答　　求め方と答え：類型1から類型6以外の解答　無解答',5.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1328,361,8,'正しい数：270以外の解答　　求め方と答え：【正しい数】で答えた数を食パンの今月の値段とし,A①を書いているもの　【正しい数】で答えた数を食パンの今月の値段とし,B②を書いているもの',5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1329,361,99,'上記以外の解答',18.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1330,361,0,'無解答',12.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1331,363,1,'あさ子：8と解答　たかし：16と解答しているもの',31.9,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_05.pdf#page=17',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1332,363,2,'あさ子：16と解答　たかし：8と解答しているもの',0.9,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1333,363,3,'あさ子：8と解答　たかし：8と解答しているもの',10.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1334,363,4,'あさ子：16と解答　たかし：16と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1335,363,5,'0,  24の二数を解答しているもの(二数の入替えは問わない)',13.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1336,363,6,'8,16の二数以外で,2倍の関係である二数を解答しているもの(二数の入替えは問わない)',8.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1337,363,7,'8,16の二数以外で,等しい二数を解答しているもの',15.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1338,363,99,'上記以外の解答',11.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1339,363,0,'無解答',6.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1340,364,1,'①,②,③の全てを書いているもの　①,②を書いているもの',2.1,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_05.pdf#page=19',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1341,364,2,'①,③を書いているもの',47.3,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1342,364,3,'①を書いているもの',4.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1343,364,4,'②,③を書いているもの　②を書いているもの',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1344,364,5,'③を書いているもの',9.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1345,364,6,'説明する対象を示さずに解答しているもの　(①,②,③の記述に不足があるもの)',4.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1346,364,99,'上記以外の解答',11.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1347,364,0,'無解答',18.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1348,366,1,'①の式に入る数：2000 +2000 +3000 +2000  と解答　　②に入る数：9000と解答しているもの',52.8,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_05.pdf#page=23',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1349,366,2,'①の式に入る数：2000 +2000 +3000 +2000  と解答　　②に入る数：9000  以外を解答しているもの　無解答',4.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1350,366,3,'①の式に入る数：類型1,類型2以外の式で,四つの数を全て何千の数にして,解答しているもの　例 2000 +2000 +3000 +3000　例 3000 + 3000 +3000 +3000　例   3000 +2000 +2000 +2000',21.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1351,366,4,'①の式に入る数：1900 +2000 +2900 + 2500  と解答しているもの(百の位までのおよその数にして,正しく四捨五入している)',4.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1352,366,5,'①の式に入る数：1890+1980 + 2900 + 2470  と解答しているもの(十の位までのおよその数にして,正しく四捨五入している)',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1353,366,6,'①の式に入る数：数によって異なる位を四捨五入して,解答しているもの　例 2000 +2000 +3000 +2500　例 2000 +2000 +2900 +2500',3.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1354,366,7,'①の式に入る数：1891 + 1982 + 2903 + 2473 と解答しているもの',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1355,366,99,'上記以外の解答',5.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1356,366,0,'無解答',2.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1357,367,1,'１ と解答しているもの',19.5,NULL,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_05.pdf#page=25',1,'1','実際の数より大きい数にして和が10000だから、目標に達している');
INSERT INTO "answer_type" VALUES (1358,367,2,'２ と解答しているもの',62.2,1,NULL,1,'2','実際の数より大きい数にして和が10000だから、目標に達していない');
INSERT INTO "answer_type" VALUES (1359,367,3,'３ と解答しているもの',7.3,NULL,NULL,1,'3','実際の数より小さい数にして和が10000だから、目標に達している');
INSERT INTO "answer_type" VALUES (1360,367,4,'４ と解答しているもの',6.7,NULL,NULL,1,'4','実際の数より小さい数にして和が10000だから、目標に達していない');
INSERT INTO "answer_type" VALUES (1361,367,99,'上記以外の解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1362,367,0,'無解答',3.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1363,368,1,'①,②,③,④の全てを書いているもの　①,②,③を書いているもの　①,③,④を書いているもの　①,③を書いているもの',16.4,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_05.pdf#page=27',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1364,368,2,'①,②,④を書いているもの　①,②を書いているもの',6.1,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1365,368,3,'①,④を書いているもの',5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1366,368,4,'①を書いているもの',8.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1367,368,5,'①の誤りを書いているもの',8.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1368,368,6,'②,③,④を書いているもの　②,③を書いているもの　③,④を書いているもの　③を書いているもの',4.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1369,368,7,'②,④を書いているもの　④を書いているもの',20.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1370,368,8,'②を書いているもの',4.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1371,368,99,'上記以外の解答',11.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1372,368,0,'無解答',15.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1373,370,1,'言葉で①,②,③の全てまたは①,②を書いているもの',12.4,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_05.pdf#page=32',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1374,370,2,'数または数と言葉を使って①,②,③の全てまたは①,②を書いているもの',0.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1375,370,3,'①,③または①を書いているもの',31.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1376,370,4,'②,③または②を書いているもの',5.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1377,370,5,'③を書いているもの',6.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1378,370,6,'才と力が合同であることを書いているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1379,370,99,'上記以外の解答',21.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1380,370,0,'無解答',20.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1381,371,1,'40と解答しているもの',48.1,1,'https://www.nier.go.jp/15chousakekkahoukoku/report/data/pmath_05.pdf#page=34',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1382,371,2,'80と解答しているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1383,371,3,'32または8と解答しているもの',2.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1384,371,4,'64または16と解答しているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1385,371,99,'上記以外の解答',29.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1386,371,0,'無解答',17.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1387,294,1,'103 と解答しているもの',96.9,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_04.pdf#page=3',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1388,294,2,' 93 と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1389,294,3,'113 と解答しているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1390,294,99,'上記以外の解答',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1391,294,0,'無解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1392,295,1,'5418 と解答しているもの',92.9,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_04.pdf#page=4',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1393,295,2,'54018 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1394,295,3,'558 と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1395,295,4,'548 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1396,295,5,'72 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1397,295,99,'上記以外の解答',5.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1398,295,0,'無解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1399,296,1,'8.2 と解答しているもの',83.9,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_04.pdf#page=5',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1400,296,2,'１ と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1401,296,3,'0.1 と解答しているもの',9.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1402,296,4,'82 と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1403,296,5,'0.82 と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1404,296,6,'9.2 と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1405,296,7,'9.8 と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1406,296,99,'上記以外の解答',4.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1407,296,0,'無解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1408,297,1,'0.4 と解答しているもの',91.9,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_04.pdf#page=6',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1409,297,2,'４ と解答しているもの',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1410,297,3,'2.5 と解答しているもの',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1411,297,4,'25 と解答しているもの',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1412,297,5,'2/5と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1413,297,6,'5/2と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1414,297,7,'０あまり２ と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1415,297,99,'上記以外の解答',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1416,297,0,'無解答',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1417,298,1,'20 と解答しているもの',81.1,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_04.pdf#page=7',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1418,298,2,'320 と解答しているもの',15.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1419,298,3,'180 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1420,298,4,'480 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1421,298,99,'上記以外の解答',2.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1422,298,0,'無解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1423,299,1,'11/15と解答しているもの(大きさの等しい分数を含む)',90.7,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_04.pdf#page=9',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1424,299,2,'1/5または3/15と解答しているもの(大きさの等しい分数を含む)',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1425,299,3,'13/15と解答しているもの(大きさの等しい分数を含む) （通分を誤って3/15 + 10/15 と計算している）
',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1426,299,4,'類型１から類型３以外で，分母が15である分数を解答しているもの',2.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1427,299,5,'3/8と解答しているもの(大きさの等しい分数を含む)',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1428,299,99,'上記以外の解答',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1429,299,0,'無解答',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1430,301,1,'１ と解答しているもの',17,NULL,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_04.pdf#page=11',1,'1','80 ＋ 0.2');
INSERT INTO "answer_type" VALUES (1431,301,2,'２ と解答しているもの',2.1,NULL,NULL,1,'2','80 − 0.2');
INSERT INTO "answer_type" VALUES (1432,301,3,'３ と解答しているもの',72.1,1,NULL,1,'3','80 × 1.2');
INSERT INTO "answer_type" VALUES (1433,301,4,'４ と解答しているもの',8.5,NULL,NULL,1,'4','80 ÷ 1.2');
INSERT INTO "answer_type" VALUES (1434,301,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1435,301,0,'無解答',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1436,302,1,'１ と解答しているもの',1.5,NULL,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_04.pdf#page=12',1,'1','80 ＋ 0.6');
INSERT INTO "answer_type" VALUES (1437,302,2,'２ と解答しているもの',15.6,NULL,NULL,1,'2','80 − 0.6');
INSERT INTO "answer_type" VALUES (1438,302,3,'３ と解答しているもの',54.3,1,NULL,1,'3','80 × 0.4');
INSERT INTO "answer_type" VALUES (1439,302,4,'４ と解答しているもの',28.1,NULL,NULL,1,'4','80 ÷ 0.4');
INSERT INTO "answer_type" VALUES (1440,302,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1441,302,0,'無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1442,303,1,'１ と解答しているもの',72.7,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_04.pdf#page=15',1,'1','3/5');
INSERT INTO "answer_type" VALUES (1443,303,2,'２ と解答しているもの',10.1,NULL,NULL,1,'2','3/6');
INSERT INTO "answer_type" VALUES (1444,303,3,'３ と解答しているもの',4.7,NULL,NULL,1,'3','3/8');
INSERT INTO "answer_type" VALUES (1445,303,4,'４ と解答しているもの',8.8,NULL,NULL,1,'4','3/10');
INSERT INTO "answer_type" VALUES (1446,303,5,'１，２ と解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1447,303,99,'上記以外の解答',2.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1448,303,0,'無解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1449,305,1,'１ と解答しているもの',1.2,NULL,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_04.pdf#page=18',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1450,305,2,'２ と解答しているもの',14.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1451,305,3,'３ と解答しているもの',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1452,305,4,'４ と解答しているもの',82.4,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1453,305,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1454,305,0,'無解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1455,306,1,' 16÷８ と解答しているもの',61,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_04.pdf#page=19',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1456,306,2,'言葉の式で解答しているもの  例 Ａの部屋の人数÷Ａの部屋の面積',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1457,306,3,'□や言葉を用いて乗法の式で関係を正しく解答しているもの  例 □×８＝16',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1458,306,4,'８÷16 と解答しているもの',14.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1459,306,5,' 16÷16 と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1460,306,6,' ８÷８ と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1461,306,99,'上記以外の解答',20.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1462,306,0,'無解答',3.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1463,308,1,'式：６×3.14 と解答　３×２×3.14 と解答　　答え： 18.84 と解答しているもの',84,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_04.pdf#page=22',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1464,308,2,'式：直径×円周率 と解答　　答え： 18.84 と解答しているもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1465,308,3,'式：□÷６＝3.14 と解答　□÷3.14＝６ と解答　　答え： 18.84 と解答しているもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1466,308,4,'式：類型１から類型３以外の式を解答　無解答　　答え： 18.84 と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1467,308,5,'式：類型１から類型３の式を解答　　答え： 18.84 以外を解答しているもの　無解答',5.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1468,308,6,'式：３×3.14 と解答　　答え： 18.84 以外を解答しているもの　無解答',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1469,308,7,'式：12×3.14 と解答　６×２×3.14 と解答　　答え： 18.84 以外を解答しているもの　無解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1470,308,8,'式：６×(円周率以外の数） と解答　　答え： 18.84 以外を解答しているもの　無解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1471,308,99,'上記以外の解答',6.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1472,308,0,'無解答',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1473,309,1,'40 と解答しているもの',81.3,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_04.pdf#page=23',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1474,309,2,' 28 と解答しているもの（見えている立方体の個数を数えている）',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1475,309,3,'76 と解答しているもの（表面積を求めている）',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1476,309,4,'38 と解答しているもの（見えている面の面積を求めている）',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1477,309,5,' 20 と解答しているもの（底面の面積を求めている）',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1478,309,6,'10または８ と解答しているもの（側面の面積を求めている）',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1479,309,7,'11 と解答しているもの（４＋５＋２をしている）',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1480,309,99,'上記以外の解答',11.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1481,309,0,'無解答',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1482,310,1,'１ と解答しているもの',24.1,NULL,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_04.pdf#page=24',1,'1','向かい合っている辺が平行である。');
INSERT INTO "answer_type" VALUES (1483,310,2,'２ と解答しているもの',52.1,1,NULL,1,'2','向かい合っている辺の長さが等しい。');
INSERT INTO "answer_type" VALUES (1484,310,3,'３ と解答しているもの',12.5,NULL,NULL,1,'3','向かい合っている角の大きさが等しい。');
INSERT INTO "answer_type" VALUES (1485,310,4,'４ と解答しているもの',10.6,NULL,NULL,1,'4','2 本の対角線がそれぞれの真ん中の点で交わる。');
INSERT INTO "answer_type" VALUES (1486,310,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1487,310,0,'無解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1488,311,1,'１ と解答しているもの',69.6,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_04.pdf#page=26',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1489,311,2,'２ と解答しているもの',4.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1490,311,3,'３ と解答しているもの',23.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1491,311,4,'４ と解答しているもの',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1492,311,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1493,311,0,'無解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1494,312,1,'１ と解答しているもの',4.2,NULL,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_04.pdf#page=28',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1495,312,2,'２ と解答しているもの',81.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1496,312,3,'３ と解答しているもの',4.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1497,312,4,'４ と解答しているもの',9.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1498,312,99,'上記以外の解答',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1499,312,0,'無解答',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1500,313,1,'１ と解答しているもの',2.6,NULL,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_04.pdf#page=31',1,'1','△ + 5 = □');
INSERT INTO "answer_type" VALUES (1501,313,2,'２ と解答しているもの',5.2,NULL,NULL,1,'2','□ + 5 = △');
INSERT INTO "answer_type" VALUES (1502,313,3,'３ と解答しているもの',8.8,NULL,NULL,1,'3','△ × 5 = □');
INSERT INTO "answer_type" VALUES (1503,313,4,'４ と解答しているもの',82.1,1,NULL,1,'4','□ × 5 = △');
INSERT INTO "answer_type" VALUES (1504,313,99,'上記以外の解答',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1505,313,0,'無解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1506,315,1,'１ と解答しているもの',1.3,NULL,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_05.pdf#page=3',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1507,315,2,'２ と解答しているもの',3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1508,315,3,'３ と解答しているもの',94.6,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1509,315,99,'上記以外の解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1510,315,0,'無解答',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1511,316,1,'さとしさんの説明（式のみで説明）を基に①，②，③，④の全てを書いているもの',25.6,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_05.pdf#page=4',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1512,316,2,'よし子さんの説明（式と言葉で説明）を基に①，②，③，④の全てを書いているもの',19.4,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1513,316,3,'さとしさんの説明を基に①，②，③または①，②，④を書いているもの  ①で24を６×４とみて，②，③，④または②，③または②，④を書いているもの',6.7,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1514,316,4,'よし子さんの説明を基に①，②，③または①，②，④を書いているもの  ①で24を６×４とみて，②，③，④または②，③または②，④を書いているもの',3.8,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1515,316,5,'②，③，④または①，②または②，③または②，④または②を書いているもの',13.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1516,316,6,'①，③，④または①，③または①，④を書いているもの',7.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1517,316,7,'計算の工夫を書いているが，37×３＝111（37×６＝222）を基にしていないもの',8.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1518,316,8,'37×24を筆算で計算しているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1519,316,99,'上記以外の解答',7.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1520,316,0,'無解答',5.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1521,318,1,'式： 1500÷250 と解答　　答え：６ と解答しているもの ',81.8,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_05.pdf#page=8',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1522,318,2,'式： 250×□＝1500 と解答　　答え：６ と解答しているもの ',0.8,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1523,318,3,'式： 類型１，類型２の式を解答　　答え：60 と解答しているもの  0.6 と解答しているもの',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1524,318,4,'式： 類型１，類型２の式を解答　　答え：類型１から類型３以外の解答  無解答',4.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1525,318,5,'式： 類型１，類型２以外の式を解答  無解答　　答え：６ と解答しているもの ',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1526,318,6,'式： 250÷1500 と解答しているもの ',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1527,318,7,'式： 1500×250 と解答しているもの',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1528,318,8,'式： 1500－250 と解答しているもの   1500＋250 と解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1529,318,99,'上記以外の解答',3.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1530,318,0,'無解答',2.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1531,319,1,'番号：１ と解答　　わけ：Ａ①，Ａ②，Ａ③の全てを書いているもの　Ｂ①，Ｂ②，Ｂ③の全てを書いているもの　Ｃ①，Ｃ②，Ｃ③の全てを書いているもの',21.6,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_05.pdf#page=12',1,'1','6 ・ 7 月');
INSERT INTO "answer_type" VALUES (1532,319,2,'番号：１ と解答　　わけ：Ａ②，Ａ③を書いているもの　Ｂ②，Ｂ③を書いているもの　Ｃ②，Ｃ③を書いているもの',32.1,1,NULL,1,'2','8 ・ 9 月');
INSERT INTO "answer_type" VALUES (1533,319,3,'番号：１ と解答　　わけ：Ａ①，Ａ③を書いているもの　Ｂ①，Ｂ③を書いているもの　Ｃ①，Ｃ③を書いているもの',0.3,1,NULL,1,'3','10・11 月');
INSERT INTO "answer_type" VALUES (1534,319,4,'番号：１ と解答　　わけ：Ａ①，Ａ②を書いているもの　Ｂ①，Ｂ②を書いているもの　Ｃ①，Ｃ②を書いているもの　Ａ②またはＢ②またはＣ②を書いているもの',15.3,1,NULL,1,'4','12・ 1 月');
INSERT INTO "answer_type" VALUES (1535,319,5,'番号：１ と解答　　わけ：説明する対象を示さずに1000ｍ3または30マスまたは75ｍ3を書いているもの（Ａ②，Ｂ②，Ｃ②の記述に不足があるもの） 　例  1000ｍ3だからです。　例 30マスだからです。　例 75ｍ3だからです。',0.8,NULL,NULL,1,'5','2 ・ 3 月');
INSERT INTO "answer_type" VALUES (1536,319,6,'番号：１ と解答　　わけ：Ａ③またはＢ③またはＣ③を書いているもの',6.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1537,319,7,'番号：１ と解答　　わけ：類型１から類型６以外の解答  無解答',12.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1538,319,8,'番号：１ 以外を解答しているもの',8.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1539,319,99,'上記以外の解答',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1540,319,0,'無解答',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1541,320,1,'１ と解答しているもの',4.8,NULL,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_05.pdf#page=14',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1542,320,2,'２ と解答しているもの',23,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1543,320,3,'３ と解答しているもの',9.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1544,320,4,'４ と解答しているもの',61.7,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1545,320,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1546,320,0,'無解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1547,322,1,' 27 と解答しているもの',38.8,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_05.pdf#page=17',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1548,322,2,'35 と解答しているもの',3.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1549,322,3,'８ と解答しているもの',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1550,322,4,' 30 と解答しているもの',8.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1551,322,5,'37 と解答しているもの',8.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1552,322,6,'時刻を解答しているもの  例 午後０時27（分間）',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1553,322,99,'上記以外の解答',33,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1554,322,0,'無解答',3.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1555,323,1,'１，３ と解答しているもの',56.9,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_05.pdf#page=19',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1556,323,2,'１ と解答しているもの（縦を２等分，横を２等分した図）',16.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1557,323,3,'３ と解答しているもの（横を４等分した図）',8.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1558,323,4,'２ と解答しているもの（縦を２等分，横を５等分した図）',4.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1559,323,5,'４ と解答しているもの（縦を８等分，横を５等分した図）',4.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1560,323,6,'２ または ４ を含めて解答しているもの',7.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1561,323,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1562,323,0,'無解答',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1563,324,1,'番号：３ と解答　　わけ：①，②，③，④の全てを書いているもの　①，②，③を書いているもの',26.5,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_05.pdf#page=21',1,'1','足りなくなって，分けることができない。');
INSERT INTO "answer_type" VALUES (1564,324,2,'番号：３ と解答　　わけ：①，②，④を書いているもの',2.9,1,NULL,1,'2','残さず分けることができる。');
INSERT INTO "answer_type" VALUES (1565,324,3,'番号：３ と解答　　わけ：②，③，④を書いているもの　②，③を書いているもの　②，④を書いているもの',1.4,1,NULL,1,'3','分けることはできるが，残る。');
INSERT INTO "answer_type" VALUES (1566,324,4,'番号：３ と解答　　わけ：①，②を書いているもの　②を書いているもの',5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1567,324,5,'番号：３ と解答　　わけ：①，③，④を書いているもの　①，③を書いているもの　③，④を書いているもの　③を書いているもの',13.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1568,324,6,'番号：３ と解答　　わけ：類型１から類型５以外の解答　無解答',30.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1569,324,7,'番号：１ と解答しているもの',12.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1570,324,8,'番号：２ と解答しているもの',5.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1571,324,99,'上記以外の解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1572,324,0,'無解答',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1573,326,1,'９ と解答しているもの',62.4,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_05.pdf#page=24',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1574,326,2,'13 と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1575,326,3,'10 と解答しているもの',15.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1576,326,4,' 12 と解答しているもの',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1577,326,99,'上記以外の解答',17.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1578,326,0,'無解答',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1579,327,1,'12が４と６の最小公倍数であることを書いているもの',38.6,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_05.pdf#page=26',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1580,327,2,'12が４と６の公倍数であることを書いているもの',10.4,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1581,327,3,'倍数という用語を用いて，12が２つの数に共通の倍数であることを書いているもの  例 12は，４と６の倍数です。',3.6,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1582,327,4,'倍数という用語を用いずに，12が２つの数に共通の倍数であることを 書いているもの  例 12は，かけ算の４の段の答えでも，６の段の答えでもある数です。',8.1,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1583,327,5,'12が４または６の倍数であることは書いているが，２つの数に共通の倍数であることは書いていないもの  例 12は，４の倍数です。',7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1584,327,6,'用語を誤って用いているもの  例 12は，４と６の最大公倍数です。
',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1585,327,99,'上記以外の解答',18.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1586,327,0,'無解答',12,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1587,330,1,'約束３に基づいて，４つの長方形で敷き詰められた図をかいているもの',65.8,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_05.pdf#page=29',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1588,330,2,'４つの長方形で敷き詰められた図をかいているが，約束３に基づいていないもの',23.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1589,330,3,'長方形と正方形で敷き詰められた図をかいているもの',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1590,330,4,'正方形で敷き詰められた図をかいているもの',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1591,330,5,'長方形を１枚または２枚用いた図をかいているもの',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1592,330,99,'上記以外の解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1593,330,0,'無解答',5.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1594,331,1,'１ と解答しているもの',12.9,NULL,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_05.pdf#page=32',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1595,331,2,'２ と解答しているもの',8.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1596,331,3,'３ と解答しているもの',28.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1597,331,4,'４ と解答しているもの',46.3,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1598,331,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1599,331,0,'無解答',3.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1600,332,1,'求め方：①，②の全てを書いている　　答え：21 と解答しているもの',32.8,1,'https://www.nier.go.jp/14chousakekkahoukoku/report/data/pmath_05.pdf#page=34',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1601,332,2,'求め方： ②を書いている　　答え：21 と解答しているもの',0.5,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1602,332,3,'求め方： ①を書いている　　答え：21 と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1603,332,4,'求め方：類型１から類型３以外の解答　無解答　　答え：21 と解答しているもの',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1604,332,5,'求め方：類型１，類型２を解答　　答え：21 以外を解答しているもの　無解答',3.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1605,332,6,'求め方：②を次のように求めている　14＋1.5，14－1.5，14÷1.5　14＋0.5，14－0.5，14÷0.5　　答え：21 以外を解答しているもの　無解答',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1606,332,7,'求め方： ①のみを書いている　　答え：21 以外を解答しているもの　無解答',28.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1607,332,8,'求め方：①を次のように求めている　 140÷0.1，140＋0.1，140－0.1　140×10， 140＋10， 140－10　　答え：21 以外を解答しているもの　無解答',5.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1608,332,99,'上記以外の解答',11.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1609,332,0,'無解答',13,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1610,253,1,'178と解答しているもの',88.3,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=3',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1611,253,2,'188と解答しているもの',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1612,253,3,'278と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1613,253,4,'288と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1614,253,5,'222と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1615,253,6,'172と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1616,253,7,'282と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1617,253,8,'272と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1618,253,99,'上記以外の解答',9.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1619,253,0,'無解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1620,254,1,'1.65と解答しているもの',71.5,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=4',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1621,254,2,'0.165と解答しているもの',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1622,254,3,'0. 65と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1623,254,4,'0. 84, 8. 4, 84 と解答しているもの',14.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1624,254,5,'0. 084と解答しているもの',6.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1625,254,99,'上記以外の解答',5.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1626,254,0,'無解答',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1627,255,1,'7. 44と解答しているもの',83.8,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=6',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1628,255,2,'74.4と解答しているもの',7.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1629,255,3,'744と解答しているもの',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1630,255,4,'74. 4,   744    以外の位取りの誤りがあるもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1631,255,5,'7. 24,   72. 4,   724    と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1632,255,6,'7. 224, 72. 24, 722. 4, 7224 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1633,255,99,'上記以外の解答',6.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1634,255,0,'無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1635,256,1,'1.2と解答しているもの',88.4,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=7',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1636,256,2,'12と解答しているもの',6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1637,256,3,'0.8, 0.83 など 5/6 を小数で表しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1638,256,4,'6/5 と解答しているもの (大きさの等しい分数を含む)',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1639,256,5,'5/6 と解答しているもの (大きさの等しい分数を含む)',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1640,256,6,'1あまり1と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1641,256,99,'上記以外の解答',3.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1642,256,0,'無解答',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1643,257,1,'7 と解答しているもの',94.4,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=8',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1644,257,2,'13 と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1645,257,99,'上記以外の解答',4.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1646,257,0,'無解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1647,258,1,'3(6/7),27/7と解答しているもの',88.2,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=9',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1648,258,2,'3(6/7)と大きさの等しい分数を解答しているもの   (類型1を除く)',0.8,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1649,258,3,'6/7と解答しているもの   (大きさの等しい分数を含む)',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1650,258,4,'1(6/7),2(6/7)と解答しているもの   (大きさの等しい分数を含む)',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1651,258,5,'3(6/14)と解答しているもの   (大きさの等しい分数を含む)',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1652,258,6,'1(4/7)と解答しているもの   (大きさの等しい分数を含む)',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1653,258,99,'上記以外の解答',6.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1654,258,0,'無解答',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1655,259,1,'8/9と解答しているもの   (大きさの等しい分数を含む)',89.6,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=10',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1656,259,2,'1/18と解答しているもの   (大きさの等しい分数を含む)',3.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1657,259,3,'2/9と解答しているもの   (大きさの等しい分数を含む)',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1658,259,99,'上記以外の解答',3.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1659,259,0,'無解答',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1660,260,1,'2,  3,  4    と解答しているもの',60.4,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=11',1,'1','14500');
INSERT INTO "answer_type" VALUES (1661,260,2,'3 と解答しているもの',1.9,NULL,NULL,1,'2','15000');
INSERT INTO "answer_type" VALUES (1662,260,3,'2,  3     と解答しているもの',11.8,NULL,NULL,1,'3','19500');
INSERT INTO "answer_type" VALUES (1663,260,4,'3,  4     と解答しているもの',2.8,NULL,NULL,1,'4','24999');
INSERT INTO "answer_type" VALUES (1664,260,5,'4,  5     と解答しているもの',0.7,NULL,NULL,1,'5','25000');
INSERT INTO "answer_type" VALUES (1665,260,6,'2, 3, 4, 5 と解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1666,260,7,'1を含めて解答しているもの',9.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1667,260,99,'上記以外の解答',9.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1668,260,0,'無解答',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1669,261,1,'１ と解答しているもの',10.4,NULL,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=13',1,'1','9 ÷ 3 ＋ 2');
INSERT INTO "answer_type" VALUES (1670,261,2,'２ と解答しているもの',11.6,NULL,NULL,1,'2','9 ÷ 3 − 2');
INSERT INTO "answer_type" VALUES (1671,261,3,'３ と解答しているもの',71.8,1,NULL,1,'3','3 × 9 ＋ 2');
INSERT INTO "answer_type" VALUES (1672,261,4,'４ と解答しているもの',4.3,NULL,NULL,1,'4','3 × 9 − 2');
INSERT INTO "answer_type" VALUES (1673,261,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1674,261,0,'無解答',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1675,262,1,'１ と解答しているもの',50.2,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=15',1,'1','1 m2あたりの人数は 2 人 と 1.6 人 なので，Ａのほうがこんでいる。');
INSERT INTO "answer_type" VALUES (1676,262,2,'２ と解答しているもの',11.7,NULL,NULL,1,'2','1 m2あたりの人数は 2 人 と 1.6 人 なので，Ｂのほうがこんでいる。');
INSERT INTO "answer_type" VALUES (1677,262,3,'３ と解答しているもの',16.6,NULL,NULL,1,'3',' 人 あたりの面積は 2 m2と 1.6 m2なので，Ａのほうがこんでいる。');
INSERT INTO "answer_type" VALUES (1678,262,4,'４ と解答しているもの',18.7,NULL,NULL,1,'4','1 人 あたりの面積は 2 m2と 1.6 m2なので，Ｂのほうがこんでいる。');
INSERT INTO "answer_type" VALUES (1679,262,99,'上記以外の解答',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1680,262,0,'無解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1681,264,1,'１ と解答しているもの',0.9,NULL,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=18',1,'1','ものさし');
INSERT INTO "answer_type" VALUES (1682,264,2,'２ と解答しているもの',0.7,NULL,NULL,1,'2','コンパス');
INSERT INTO "answer_type" VALUES (1683,264,3,'３ と解答しているもの',0.5,NULL,NULL,1,'3','三角定規');
INSERT INTO "answer_type" VALUES (1684,264,4,'４ と解答しているもの',97.4,1,NULL,1,'4','巻き尺');
INSERT INTO "answer_type" VALUES (1685,264,99,'上記以外の解答',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1686,264,0,'無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1687,265,1,'１ と解答しているもの',10.3,NULL,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=19',1,'1','10 cm');
INSERT INTO "answer_type" VALUES (1688,265,2,'２ と解答しているもの',12.2,NULL,NULL,1,'2','1 m');
INSERT INTO "answer_type" VALUES (1689,265,3,'３ と解答しているもの',52.5,1,NULL,1,'3','10 m');
INSERT INTO "answer_type" VALUES (1690,265,4,'４ と解答しているもの',23.6,NULL,NULL,1,'4','100 m');
INSERT INTO "answer_type" VALUES (1691,265,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1692,265,0,'無解答',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1693,266,1,'式：(3 + 8) × 4 ÷2   と解答　　答え：22 と解答しているもの',73.2,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=20',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1694,266,2,'式：(上底+下底)X高さ+2など,言葉の式を解答　　答え：22 と解答しているもの',0.1,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1695,266,3,'式：三角形に分割するなど,台形の面積を求める式を工夫して解答　　答え：22 と解答しているもの',0.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1696,266,4,'式：()を用いずに,類型1の式を解答　　答え：22 と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1697,266,5,'式：類型1から類型3の式を解答　　答え：22以外を解答しているもの　無解答',3.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1698,266,6,'式：(3 + 8) × 4    と解答しているもの　3×4+8×4 と解答しているもの',5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1699,266,7,'式：8×4 と解答しているもの　3×4 と解答しているもの　8×4+2 と解答しているもの　3×4+2 と解答しているもの',3.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1700,266,8,'式：斜辺の長さ5cmを用いた式を書いているもの',3.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1701,266,99,'上記以外の解答',8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1702,266,0,'無解答',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1703,267,1,'１ と解答しているもの',8.8,NULL,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=22',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1704,267,2,'２ と解答しているもの',22.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1705,267,3,'３ と解答しているもの',5.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1706,267,4,'４ と解答しているもの',60.9,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1707,267,99,'上記以外の解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1708,267,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1709,269,1,'8 と解答しているもの',90.6,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=25',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1710,269,2,'6 と解答しているもの',3.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1711,269,3,'3.14,  9.42,12. 56,18. 84, 25.12 と解答しているもの  (小数点の位取りが誤っているものを含む)',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1712,269,99,'上記以外の解答',2.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1713,269,0,'無解答',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1714,270,1,'式：6 ×3.14 と解答　3×2×3.14 と解答　　答え：18. 84と解答しているもの',66.5,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=26',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1715,270,2,'式：直径x円周率と解答　　答え：18. 84と解答しているもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1716,270,3,'式：□ ÷6=3.14と解答　□ ÷ 3.14=6    と解答　　答え：18. 84と解答しているもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1717,270,4,'式：類型1から類型3以外の式を解答　無解答　　答え：18. 84と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1718,270,5,'式：類型1から類型3の式を解答　　答え：18. 84以外を解答しているもの　無解答',3.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1719,270,6,'式：3 ×3.14と解答　12×3.14      と解答　6×2×3.14     と解答　　答え：18. 84以外を解答しているもの　無解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1720,270,7,'式：8×3.14と解答　4×2×3.14 と解答　　答え：18. 84以外を解答しているもの　無解答',7.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1721,270,8,'式：6×2と解答　8×2 と解答　　答え：18. 84以外を解答しているもの　無解答',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1722,270,99,'上記以外の解答',14,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1723,270,0,'無解答',5.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1724,272,1,'１ と解答しているもの',76.9,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=28',1,'1','100');
INSERT INTO "answer_type" VALUES (1725,272,2,'２ と解答しているもの',6.4,NULL,NULL,1,'2','150');
INSERT INTO "answer_type" VALUES (1726,272,3,'３ と解答しているもの',4.6,NULL,NULL,1,'3','250');
INSERT INTO "answer_type" VALUES (1727,272,4,'４ と解答しているもの',9.5,NULL,NULL,1,'4','400');
INSERT INTO "answer_type" VALUES (1728,272,99,'上記以外の解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1729,272,0,'無解答',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1730,273,1,'１ と解答しているもの',16.5,NULL,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=30',1,'1','500 g より軽い');
INSERT INTO "answer_type" VALUES (1731,273,2,'２ と解答しているもの',77.1,1,NULL,1,'2','500 g より重い');
INSERT INTO "answer_type" VALUES (1732,273,3,'３ と解答しているもの',3,NULL,NULL,1,'3','500 g と同じ');
INSERT INTO "answer_type" VALUES (1733,273,99,'上記以外の解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1734,273,0,'無解答',2.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1735,274,1,'曜日：金と解答　本の冊数：24と解答しているもの',85.8,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-04.pdf#page=31',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1736,274,2,'曜日：金と解答　本の冊数：22と解答しているもの',6.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1737,274,3,'曜日：金と解答　本の冊数：12と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1738,274,4,'曜日：金と解答　本の冊数：27と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1739,274,5,'曜日：金と解答　本の冊数：類型1から類型4以外の解答  無解答',3.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1740,274,6,'曜日：金以外を解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1741,274,99,'上記以外の解答',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1742,274,0,'無解答',2.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1743,276,1,'ゴーカートと解答しているもの',51.2,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-05.pdf#page=3',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1744,276,2,'ゴーカートとボートと解答しているもの',15.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1745,276,3,'ボートと解答しているもの',6.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1746,276,4,'メリーゴーランド  と解答しているもの  コーヒーカップと解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1747,276,99,'上記以外の解答',23.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1748,276,0,'無解答',3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1749,277,1,'番号：2と解答　　わけ：①,②,③,④の全てを書いているもの',29.4,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-05.pdf#page=5',1,'1','1枚券をI 5枚買う。');
INSERT INTO "answer_type" VALUES (1750,277,2,'番号：2と解答　　わけ：①,②,④を書いているもの',21.6,1,NULL,1,'2','11枚つづりの乗り物券を1つと,1枚券を4枚買う。');
INSERT INTO "answer_type" VALUES (1751,277,3,'番号：2と解答　　わけ：説明する対象を示さずに料金が1500円と1400円であることを書いているもの','7,2',NULL,NULL,1,'3','乗り放題券を買う。');
INSERT INTO "answer_type" VALUES (1752,277,4,'番号：2と解答　　わけ：最も安い料金が1400円であることは書いているが,他の買い方をしたときの料金が1500円であることを書いていないもの',9.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1753,277,5,'番号：2と解答　　わけ：類型1から類型4以外の解答　無解答',13.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1754,277,6,'番号：3と解答しているもの',16.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1755,277,7,'番号：1と解答しているもの',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1756,277,99,'上記以外の解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1757,277,0,'無解答',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1758,279,1,'10往復する時間の平均  と書いているもの',46.9,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-05.pdf#page=9',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1759,279,2,'10往復の平均と書いているもの',5,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1760,279,3,'6回測定した時の平均  と書いているもの','2. 7',NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1761,279,4,'1往復する時間の平均  と書いているもの',12.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1762,279,5,'平均と書いているもの',5.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1763,279,6,'10往復する時間をたして6でわった数 と書いているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1764,279,7,'合計と書いているもの',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1765,279,8,'10往復する時間と書いているもの',12.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1766,279,99,'上記以外の解答',9.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1767,279,0,'無解答',3.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1768,280,1,'1と解答しているもの',75.8,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-05.pdf#page=11',1,'1','(14 + 15 + 14 +  14 + 15 )÷ 5÷ 10');
INSERT INTO "answer_type" VALUES (1769,280,2,'2と解答しているもの',5.5,NULL,NULL,1,'2','( 14 +  7+  15 +  14 +  14 +  15)÷5÷ 10');
INSERT INTO "answer_type" VALUES (1770,280,3,'3と解答しているもの',11.6,NULL,NULL,1,'3','( 14 +  15 +  14 +  14 +  15 )÷ 6 ÷ 10');
INSERT INTO "answer_type" VALUES (1771,280,4,'4と解答しているもの',5.7,NULL,NULL,1,'4','( 14 +  7+  15 +  14 +  14 +  15)÷6 ÷  10');
INSERT INTO "answer_type" VALUES (1772,280,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1773,280,0,'無解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1774,281,1,'①,②,③,④を書いているもの',20.6,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-05.pdf#page=12',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1775,281,2,'①,②,③を書いているもの  ①,③,④を書いているもの  ①,③を書いているもの',14.9,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1776,281,3,'①,②,④を書いているもの  ②,③,④を書いているもの',5.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1777,281,4,'②,④を書いているもの',14,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1778,281,5,'ふりこの長さと10往復する時間との対応が不適切なものを書いているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1779,281,6,'①,②または①を書いているもの',4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1780,281,7,'③,④または③を書いているもの',4.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1781,281,99,'上記以外の解答',17.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1782,281,0,'無解答',18.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1783,283,1,'はるみ：2　　げんた：1　　あきこ：3',87.4,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-05.pdf#page=15',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1784,283,2,'はるみ：3　　げんた：1　　あきこ：2',3.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1785,283,3,'はるみ：1　　げんた：2　　あきこ：3',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1786,283,4,'はるみ：3　　げんた：2　　あきこ：1',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1787,283,5,'はるみ：1　　げんた：3　　あきこ：2',2.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1788,283,6,'はるみ：2　　げんた：3　　あきこ：1',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1789,283,99,'上記以外の解答',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1790,283,0,'無解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1799,284,1,'A①,A②の全てを書いているもの',39.9,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-05.pdf#page=17',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1800,284,2,'B①,B②の全てを書いているもの  C①,C②,C③の全てを書いているもの',2.8,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1801,284,3,'A②を書き,三角形アとイの底辺について具体的な長さを示さずに等しいことを書いているもの',0.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1802,284,4,'三角形アとイの底辺と高さについて具体的な長さを示さずに等しいことを書いているもの',3.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1803,284,5,'A①を書いているもの',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1804,284,6,'A②を書いているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1805,284,7,'A①,A②またはB①,B②またはC①,C②,C③を示そうとしているが,数値に誤りがあるもの',10.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1806,284,8,'底辺と高さについて用語を誤っているもの  三角形アとイが合同であることを書いているもの',6.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1807,284,99,'上記以外の解答',18.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1808,284,0,'無解答',15.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1809,285,1,'1と解答しているもの',56.5,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-05.pdf#page=18',1,'1','①でできた2つの三角形の面積が等しい。');
INSERT INTO "answer_type" VALUES (1810,285,2,'2と解答しているもの',19.9,NULL,NULL,1,'2','②でできた三角形アと三角形イの面積が等しい。');
INSERT INTO "answer_type" VALUES (1811,285,3,'3と解答しているもの',19,NULL,NULL,1,'3','②でできた三角形ウと三角形エの面積が等しい。');
INSERT INTO "answer_type" VALUES (1812,285,99,'上記以外の解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1813,285,0,'無解答',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1814,287,1,'求め方：A①,A②の全てを書いている　　答え：10と解答しているもの',40.1,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-05.pdf#page=22',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1815,287,2,'求め方：B①,B②の全てを書いている　　答え：10と解答しているもの',0.3,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1816,287,3,'求め方：A②を書いている　B②を書いている　　答え：10と解答しているもの',3,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1817,287,4,'求め方：類型1から類型3以外の解答　無解答　　　答え：10と解答しているもの',9.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1818,287,5,'求め方：類型1から類型3を解答　　答え：10  以外を解答しているもの　無解答',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1819,287,6,'求め方：A①を書いている　　答え：10  以外を解答しているもの　無解答',10.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1820,287,7,'求め方：B①を書いている　　答え：10  以外を解答しているもの　無解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1821,287,8,'求め方：ワールドカップ後の観客数をワールドカップ前の観客数でわっている　　答え：10  以外を解答しているもの　無解答',8.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1822,287,99,'上記以外の解答',16.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1823,287,0,'無解答',11.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1824,288,1,'2列4番 の位置に〇をかいているもの',94.2,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-05.pdf#page=24',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1825,288,2,'4列2番 の位置に〇をかいているもの',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1826,288,3,'4列4番 の位置に〇をかいているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1827,288,4,'2列2番 の位置に〇をかいているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1828,288,99,'上記以外の解答',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1829,288,0,'無解答',2.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1830,289,1,'式：3×3 +1×0  と解答　　勝ち点の合計：9と解答　　順位：2と解答しているもの',33.3,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-05.pdf#page=25',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1831,289,2,'式：3 × 3 + 0  と解答　3×3 と解答　9+0     と解答　　勝ち点の合計：9と解答　　順位：2と解答しているもの',17.6,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1832,289,3,'式：類型1,類型2の式を解答　　勝ち点の合計：9と解答　　順位：2     以外を解答しているもの  無解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1833,289,4,'式：類型1,類型2以外の式を解答 無解答　　勝ち点の合計：9と解答しているもの',3.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1834,289,5,'式：3×3+1×0  と解答　3×3 +1と解答　9+1     と解答　　勝ち点の合計：10と解答しているもの',22.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1835,289,6,'式：類型5以外の式を解答  無解答　　勝ち点の合計：10と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1836,289,7,'式：3 ×  3 +1× 0  と解答　9+1×0と解答　10×0と解答　　勝ち点の合計：0と解答しているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1837,289,8,'式：類型7以外の式を解答 無解答　　勝ち点の合計：0と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1838,289,99,'上記以外の解答',12.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1839,289,0,'無解答',7.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1840,291,1,'１ と解答しているもの',5.2,NULL,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-05.pdf#page=28',1,'1','平成15年から平成17年まで');
INSERT INTO "answer_type" VALUES (1841,291,2,'２ と解答しているもの',76.2,1,NULL,1,'2','平成17年から平成19年まで');
INSERT INTO "answer_type" VALUES (1842,291,3,'３ と解答しているもの',5.2,NULL,NULL,1,'3','平成19年から平成21年まで');
INSERT INTO "answer_type" VALUES (1843,291,4,'４ と解答しているもの',7.9,NULL,NULL,1,'4','平成21年から平成23年まで');
INSERT INTO "answer_type" VALUES (1844,291,99,'上記以外の解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1845,291,0,'無解答',5.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1846,292,1,'番号：1と解答　　わけ：A①,A②を書いているもの',31.3,1,'https://www.nier.go.jp/13chousakekkahoukoku/data/research-report/13-p-math-05.pdf#page=30',1,'1','平成22年よリ平成23年のほうが増えている。');
INSERT INTO "answer_type" VALUES (1847,292,2,'番号：1と解答　　わけ：B①,B②,B③を書いているもの',4.5,1,NULL,1,'2','平成22年よリ平成23年のほうが減っている。');
INSERT INTO "answer_type" VALUES (1848,292,3,'番号：1と解答　　わけ：A②を書いているもの',1.4,1,NULL,1,'3','平成22年と平成23年は変わらない。');
INSERT INTO "answer_type" VALUES (1849,292,4,'番号：1と解答　　わけ：B②,B③を書いているもの',7.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1850,292,5,'番号：1と解答　　わけ：B③を書いているもの',4.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1851,292,6,'番号：1と解答　　わけ：類型1から類型5以外の解答　無解答',17.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1852,292,7,'番号：3と解答しているもの',18.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1853,292,8,'番号：2と解答しているもの',6.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1854,292,99,'上記以外の解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1855,292,0,'無解答',7.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1856,211,1,'591と解答しているもの',95.8,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=2',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1857,211,2,'581と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1858,211,99,'上記以外の解答',3.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1859,211,0,'無解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1860,212,1,'4    と解答しているもの',94.4,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=3',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1861,212,2,'40,400     と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1862,212,99,'上記以外の解答',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1863,212,0,'無解答',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1864,213,1,'4. 39と解答しているもの',63.5,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=4',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1865,213,2,'0. 25,   2.5,  25と解答しているもの',10.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1866,213,3,'4. 49と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1867,213,4,'4.41と解答しているもの',4.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1868,213,99,'上記以外の解答',19.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1869,213,0,'無解答',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1870,214,1,'63と解答しているもの',90.8,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=7',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1871,214,2,'6.3と解答しているもの',2.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1872,214,3,'6. 3以外の位取りに誤りがあるもの',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1873,214,99,'上記以外の解答',3.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1874,214,0,'無解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1875,215,1,'36と解答しているもの',80.3,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=8',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1876,215,2,'60と解答しているもの',12.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1877,215,3,'180と解答しているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1878,215,99,'上記以外の解答',6.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1879,215,0,'無解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1880,216,1,'1/35と解答しているもの (大きさの等しい分数を含む)',85.9,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=10',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1881,216,2,'1/2と解答しているもの (大きさの等しい分数を含む)',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1882,216,3,'類型1以外で,分母が35である分数を解答しているもの',5.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1883,216,99,'上記以外の解答',4.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1884,216,0,'無解答',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1885,217,1,'1/10と解答しているもの',75.4,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=11',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1886,217,2,'類型1以外で1/10と大きさの等しい分数を解答しているもの',7.1,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1887,217,3,'32/5と解答しているもの   (大きさの等しい分数を含む)',3.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1888,217,99,'上記以外の解答',10,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1889,217,0,'無解答',4.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1890,219,1,'47と解答しているもの',89,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=13',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1891,219,2,'470と解答しているもの',2.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1892,219,3,'4.7と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1893,219,4,'7 と解答しているもの',2.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1894,219,99,'上記以外の解答',4.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1895,219,0,'無解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1896,220,1,'5. 96と解答しているもの',73.9,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=14',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1897,220,2,'0. 596 と解答しているもの',8.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1898,220,3,'59.6と解答しているもの',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1899,220,4,'59600 と解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1900,220,5,'596/100と解答しているもの   (大きさの等しい分数を含む',2.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1901,220,99,'上記以外の解答',7.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1902,220,0,'無解答',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1903,222,1,'１ と解答しているもの',5.7,NULL,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=16',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1904,222,2,'２ と解答しているもの',7.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1905,222,3,'３ と解答しているもの',50.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1906,222,4,'４ と解答しているもの',34.3,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1907,222,99,'上記以外の解答',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1908,222,0,'無解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1909,223,1,'120 ÷ 0. 6     と解答しているもの',41,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=18',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1910,223,2,'120÷ 6 ×10    と解答しているもの　(整数の式で解答しているもの)',0.3,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1911,223,3,'赤いテープの長さ÷0.6と解答しているもの(言葉の式で解答しているもの)',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1912,223,4,'□や言葉を用いて乗法の式で関係を正しく解答しているもの  例  0×0.6=120　　例  白いテープの長さX0. 6 =赤いテープの長さ',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1913,223,5,'120X0.6 と解答しているもの',48.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1914,223,99,'上記以外の解答',6.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1915,223,0,'無解答',3.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1916,224,1,'4    と解答しているもの',87.1,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=24',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1917,224,2,'5     と解答しているもの(日数を4日として平均を求めているもの)',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1918,224,3,'20と解答しているもの(合計を求めているもの)',3.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1919,224,4,'4.5と解答しているもの (中間の値を求めているもの)',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1920,224,5,'3     と解答しているもの (中央の値を求めているもの)',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1921,224,99,'上記以外の解答',5.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1922,224,0,'無解答',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1923,226,1,'１ と解答しているもの',19.4,NULL,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=28',1,'1','約50cm2');
INSERT INTO "answer_type" VALUES (1924,226,2,'２ と解答しているもの',60.7,1,NULL,1,'2','約150cm2');
INSERT INTO "answer_type" VALUES (1925,226,3,'３ と解答しているもの',16.3,NULL,NULL,1,'3','約450cm2');
INSERT INTO "answer_type" VALUES (1926,226,4,'４ と解答しているもの',1.7,NULL,NULL,1,'4','約1350cm2');
INSERT INTO "answer_type" VALUES (1927,226,99,'上記以外の解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1928,226,0,'無解答',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1929,227,1,'１ と解答しているもの',11.3,NULL,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=33',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1930,227,2,'２ と解答しているもの',24.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1931,227,3,'３ と解答しているもの',7.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1932,227,4,'４ と解答しているもの',54.9,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1933,227,99,'上記以外の解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1934,227,0,'無解答',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1935,229,1,'130と解答しているもの',77.2,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=36',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1936,229,2,'40と解答しているもの(四角形の四つの角の大きさの和を180°と誤って捉え,180°から60°と80°の二つの角の大きさを引いているもの)',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1937,229,3,'220と解答しているもの(四角形の四つの角の大きさの和を360°として,360°から60°と 80°の二つの角の大きさを引き,90°を引いていないもの)',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1938,229,4,'類型2以外で90(°  )未満の角度を解答しているもの',3.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1939,229,5,'四角形の二つの角,または三つの角の大きさの和を解答しているもの 例140',5.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1940,229,99,'上記以外の解答',9.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1941,229,0,'無解答',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1942,230,1,'アオ,イカ,ウキ,エクのいずれか一つを解答しているもの(記号の順序は不問。以下同様。)',65,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=38',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1943,230,2,'面あに平行な辺(アイ,イウ,ウエ,エア)を解答しているもの',8.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1944,230,3,'面あに含まれる辺(オカ,カキ,キク,クオ)を解答しているもの',5.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1945,230,4,'頂点(ア,イ,ウ,エ,オ,力,キ,ク)を解答しているもの',9.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1946,230,5,'面あに垂直な面(面アイカオ,面イウキカ,面ウェクキ,面ェアオク)を解答しているもの',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1947,230,6,'面あに平行な面(面アイウエ)を解答しているもの',4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1948,230,99,'上記以外の解答',3.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1949,230,0,'無解答',2.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1950,231,1,'番号：3     と解答　　長さ：2     と解答しているもの',76.3,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=41',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1951,231,2,'番号：3     と解答　　長さ：4    と解答しているもの',2.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1952,231,3,'番号：3     と解答　　長さ：型1,類型2以外を解答しているもの　無解答',4.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1953,231,4,'番号：1 と解答　　長さ：2     と解答しているもの',3.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1954,231,5,'番号：1 と解答　　長さ：4    と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1955,231,6,'番号：1 と解答　　長さ：類型4,類型5以外を解答しているもの　無解答',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1956,231,7,'番号：2 と解答',3.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1957,231,8,'番号：4     と解答',5.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1958,231,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1959,231,0,'無解答',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1960,232,1,'式：8÷0.25と解答　　答え：32    と解答しているもの',37.9,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=43',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1961,232,2,'式：8X4と解答　　答え：32    と解答しているもの',20.7,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1962,232,3,'式：□ X0.25=8と解答　　答え：32    と解答しているもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1963,232,4,'式：類型1から類型3以外の式を解答  無解答　　答え：32    と解答しているもの',4.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1964,232,5,'式：類型1から類型3の式を解答　　答え：32以外を解答しているもの　無解答',2.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1965,232,6,'式：8÷25と解答(百分率を小数に換算できていないもの）　　答え：32以外を解答しているもの　無解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1966,232,7,'式：8 X0.25,    8 X25    と解答　　答え：32以外を解答しているもの　無解答',10.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1967,232,8,'式：100を使った式を解答  例100—25　答え：32以外を解答しているもの　無解答',4.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1968,232,99,'上記以外の解答',9.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1969,232,0,'無解答',9.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1970,233,1,'１ と解答しているもの',85,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuua.pdf#page=49',1,'1','2倍、3倍、.....になる。');
INSERT INTO "answer_type" VALUES (1971,233,2,'２ と解答しているもの',4.2,NULL,NULL,1,'2','15倍、30倍、.....になる。');
INSERT INTO "answer_type" VALUES (1972,233,3,'３ と解答しているもの',6.7,NULL,NULL,1,'3','15倍になる。');
INSERT INTO "answer_type" VALUES (1973,233,4,'４ と解答しているもの',0.6,NULL,NULL,1,'4','変わらない。');
INSERT INTO "answer_type" VALUES (1974,233,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1975,233,0,'無解答',3.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1976,235,1,'100と解答しているもの',92.7,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuub.pdf#page=2',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1977,235,2,'200と解答しているもの',2.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1978,235,3,'180と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1979,235,99,'上記以外の解答',4.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1980,235,0,'無解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1981,236,1,'①,②,③,④の全てを書いているもの',35.7,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuub.pdf#page=3',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1982,236,2,'①,②,④を書いているもの  ②,③,④を書いているもの ②,④ を書いているもの  例　100円玉4枚と500円玉1枚だからです。',7.1,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1983,236,3,'たかしさんとお姉さんがそれぞれもらうおつりの硬貨の枚数を書いているもの  例　たかしさんがもらう枚数は4枚で,お姉さんがもらう枚数は•1枚だからです。',4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1984,236,4,'④を書いているもの　例 お姉さんの出し方は,1130—630=500で,500円玉が1枚になるからです。',15.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1985,236,5,'②を書いているもの  例  たかしさんの出し方は,1030-630 = 400で,100円玉が4枚になるからです。',2.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1986,236,6,'たかしさんまたはお姉さんがもうおつりの硬貨の枚数を書いているもの  例　お姉さんがもらう枚数は1枚だけだからです。',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1987,236,7,'たかしさんとお姉さんがそれぞれもらうおつりの金額を書いているもの　例　たかしさんは400円で、お姉さんは500円だからです。',5.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1988,236,99,'上記以外の解答',24.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1989,236,0,'無解答',5.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1990,238,1,'１ と解答しているもの',4.5,NULL,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuub.pdf#page=13',1,'1','35 + 15 × 8');
INSERT INTO "answer_type" VALUES (1991,238,2,'２ と解答しているもの',2.8,NULL,NULL,1,'2','35 + 15 × 7');
INSERT INTO "answer_type" VALUES (1992,238,3,'３ と解答しているもの',4.2,NULL,NULL,1,'3','35 + 15 × 4 + 10 × 3');
INSERT INTO "answer_type" VALUES (1993,238,4,'４ と解答しているもの',87.2,1,NULL,1,'4','35 + 15 × 3 + 10 × 4');
INSERT INTO "answer_type" VALUES (1994,238,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1995,238,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1996,239,1,'番号：2と解答　　わけ：A①,A②,A③の全てを書いているもの　A①,A③を書いているもの　B①,B②,B③の全てを書いているもの',22.4,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuub.pdf#page=15',1,'1','中型のとび箱を70cmの高さにすることはできる。');
INSERT INTO "answer_type" VALUES (1997,239,2,'番号：2と解答　　わけ：A①,A②を書いているもの　A②,A③を書いているもの　B①,B③を書いているもの',4.6,1,NULL,1,'2','中型のとび箱を70cmの高さにすることはできない。');
INSERT INTO "answer_type" VALUES (1998,239,3,'番号：2と解答　　わけ：A①を書いているもの　AA③を書いているもの　B①,B②を書いているもの',7.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (1999,239,4,'番号：2と解答　　わけ：A②を書いているもの　B③を書いているもの',5.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2000,239,5,'番号：2と解答　　わけ：類型1から類型4以外の解答　無解答',26.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2001,239,6,'番号：1と解答　　わけ：3段または4段の高さが70cmになることを書いているもの',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2002,239,7,'番号：1と解答　　わけ：類型6以外の解答　無解答',29.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2003,239,99,'上記以外の解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2004,239,0,'無解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2005,240,1,'１ と解答しているもの',12.2,NULL,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuub.pdf#page=19',1,'1','30cmの「30」が10と15の最大公約数だかに');
INSERT INTO "answer_type" VALUES (2006,240,2,'２ と解答しているもの',13.8,NULL,NULL,1,'2','30 cmの「30」が15と30の最大公的教だから。');
INSERT INTO "answer_type" VALUES (2007,240,3,'３ と解答しているもの',56.6,1,NULL,1,'3','30 cmの「30」が10と15の最小公倍数だから。');
INSERT INTO "answer_type" VALUES (2008,240,4,'４ と解答しているもの',15.2,NULL,NULL,1,'4','30 cmの「30」が15と30の最小公倍数だから。');
INSERT INTO "answer_type" VALUES (2009,240,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2010,240,0,'無解答',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2011,242,1,'式：6X10÷2 と解答　　答え：30と解答しているもの',70.4,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuub.pdf#page=23',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2012,242,2,'式：直角三角形の面積を求めてから,ひし形の面積を求める式を解答　例  6X10÷8X4　　答え：30と解答しているもの',0.9,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2013,242,3,'式：ひし形を長方形に変形したり,二つの二等辺三角形に分割したりして面積を求める式を解答　例10X 3　例10X3 ÷ 2X2　　答え：30と解答しているもの',3.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2014,242,4,'式：類型1から類型3以外の解答　無解答　　答え：30と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2015,242,5,'式：類型1から類型3を解答　　答え：30以外を解答しているもの　無解答',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2016,242,6,'式：長方形の面積を求める式を解答　例  6 X10　　答え：30以外を解答しているもの　無解答',7.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2017,242,7,'式：直角三角形や二等辺三角形の面積を求める式を解答　例 3X54÷2　例10X3÷2　　答え：30以外を解答しているもの　無解答',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2018,242,99,'上記以外の解答',9.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2019,242,0,'無解答',4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2020,243,1,'ア、イ：ア、イいずれにも「〇と△と□と◎をあわせた大きさ」であることを書いている　　ウ：「四角形の面積は長方形の面積の半分になる」ことを書いているもの',49.4,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuub.pdf#page=24',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2021,243,2,'ア、イ：ア、イいずれにも「〇と△と□と◎をあわせた大きさ」であることを書いている　　ウ：「半分になる」ことを書いている',1.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2022,243,3,'ア、イ：ア,イいずれにも〇,△,□,◎の記号を1つずつ書いている　例　【ア】〇,△,□,◎　【イ】〇,△,□,◎　　ウ：類型1,類型2を解答しているもの',0.9,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2023,243,4,'ア、イ：類型1から類型3以外で,ア,イに同じ 内容を書いている　例　【ア】〇を2つと△を2つあわせた大きさ　【イ】〇を2つと△を2つあわせた大きさ　　ウ：類型1,類型2を解答しているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2024,243,5,'ア、イ：類型1から類型4以外の解答　無解答　ウ：類型1,類型2を解答しているもの',5.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2025,243,6,'ア、イ：類型1から類型3を解答　ウ：「四角形の面積は白い部分の面積と同じ」であることを書いているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2026,243,7,'ア、イ：類型1から類型3を解答　ウ：「半分にならない」ことを書いているもの',16.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2027,243,8,'ア、イ：類型1から類型3を解答　ウ：類型6,類型7以外の解答　無解答',5.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2028,243,99,'上記以外の解答',10.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2029,243,0,'無解答',8.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2030,245,1,'10 (時)50 (分)と解答しているもの',81.5,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuub.pdf#page=30',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2031,245,2,'11(時)50 (分)と解答しているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2032,245,3,'12 (時)10 (分) と解答しているもの',3.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2033,245,4,'9 (時)50 (分)と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2034,245,99,'上記以外の解答',12.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2035,245,0,'無解答',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2036,246,1,'①：15と解答　　②：25と解答しているもの',73.1,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuub.pdf#page=31',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2037,246,2,'①：15と解答　　②：20と解答しているもの',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2038,246,3,'①：15と解答　　②：類型1,類型2以外の解答　無解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2039,246,4,'①：10と解答　　②：25と解答しているもの',2.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2040,246,5,'①：類型4以外の解答　無解答　　②：25と解答しているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2041,246,6,'①：10と解答　　②：20と解答しているもの',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2042,246,7,'①：12.5と解答　　②：22.5と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2043,246,8,'①：11から14までの整数を解答　　②：21から24までの整数を解答しているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2044,246,99,'上記以外の解答',15.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2045,246,0,'無解答',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2046,247,1,'求め方：A①,A②の全てを書いている　　答え：480と解答しているもの',22.8,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuub.pdf#page=33',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2047,247,2,'求め方：B①,B②,B③の全てを書いている　　答え：480と解答しているもの',5.9,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2048,247,3,'求め方：A②を書いている　例 米の重さは320 gだから,320X1.5=480で,480 g です。　　B②,B③を書いている　例 米の重さは320 gだから,320 ÷ 80=4,120X 4 =480で480 gになります。　　　答え：480と解答しているもの',4.5,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2049,247,4,'求め方：類型1から類型3以外の解答　無解答　　答え：480と解答しているもの',4.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2050,247,5,'求め方：類型1から類型3を解答　　答え：480以外を解答しているもの　無解答',3.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2051,247,6,'求め方：米の重さ(320 g )を書いている　　答え：480以外を解答しているもの　無解答',5.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2052,247,7,'求め方：類型1から類型6以外で,〇X1.5の形の式を書いている　(米の重さが間違っているもの)　　答え：480以外を解答しているもの　無解答',23,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2053,247,8,'求め方：類型1から類型7以外で,〇÷80の形の式を書いている　(米の重さが間違っているもの)　　答え：480以外を解答しているもの　無解答',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2054,247,99,'上記以外の解答',18.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2055,247,0,'無解答',10.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2056,249,1,'70と解答しているもの',64.8,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuub.pdf#page=41',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2057,249,2,'45と解答しているもの',9.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2058,249,3,'50と解答しているもの',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2059,249,4,'60と解答しているもの  75と解答しているもの',4.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2060,249,99,'上記以外の解答',14,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2061,249,0,'無解答',5.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2062,250,1,'１ と解答しているもの',61.3,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuub.pdf#page=42',1,'1','157 × 120');
INSERT INTO "answer_type" VALUES (2063,250,2,'２ と解答しているもの',3.6,NULL,NULL,1,'2','314 × 120');
INSERT INTO "answer_type" VALUES (2064,250,3,'３ と解答しているもの',18.8,NULL,NULL,1,'3','120 × 3.14');
INSERT INTO "answer_type" VALUES (2065,250,4,'４ と解答しているもの',10.1,NULL,NULL,1,'4','157 × 3.14');
INSERT INTO "answer_type" VALUES (2066,250,99,'上記以外の解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2067,250,0,'無解答',5.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2068,251,1,'番号：3と解答　　わけ：①,②,③の全てを書いているもの',23,1,'https://www.nier.go.jp/12chousakekkahoukoku/03shou-gaiyou/24_shou_houkokusyo-4_sansuub.pdf#page=44',1,'1','男子のほうが乗れる人数の割合が大きい。');
INSERT INTO "answer_type" VALUES (2069,251,2,'番号：3と解答　　わけ：①,②を書いているもの',0.8,1,NULL,1,'2','女子のほうが乗れる人数の割合が大きい。');
INSERT INTO "answer_type" VALUES (2070,251,3,'番号：3と解答　　わけ：③を書いているもの　　例  男子と女子の乗れる人数の割合は0.6で同じだからです。',3.9,NULL,NULL,1,'3','男子と女子の乗れる人数の割合は同じ。');
INSERT INTO "answer_type" VALUES (2071,251,4,'番号：3と解答　　わけ：基準量や比較量が異なるもの　例  男子の乗れる人数の割合は,9 ÷ 6=1.5です。　女子の乗れる人数の割合は,12 ÷ 8=1.5です。',14.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2072,251,5,'番号：3と解答　　わけ：乗れる人数は女子の方が多いが,乗れない人数は男子の方が少ないことを書いているもの　例  乗れる人数は女子のほうが多いけど,乗れない人数は男子のほうが少ないからです。',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2073,251,6,'番号：3と解答　　わけ：類型1から類型5以外の解答　無解答',13,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2074,251,7,'番号：１または２と解答　　わけ：男子の人数と女子の人数を比較しているもの　例  男子の乗れる人数は9人です。女子の乗れる人数は12人です。乗れる人数は女子のほうが3人多いからです。',5.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2075,251,8,'番号：１または２と解答　　わけ：類型7以外の解答　無解答',27.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2076,251,99,'上記以外の解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2077,251,0,'無解答',10.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2078,170,1,'797と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=134',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2079,170,2,'807と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2080,170,3,'803と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2081,170,4,'815と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2082,170,5,'707と解答しているもの  897と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2083,170,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2084,170,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2085,171,1,'97.3と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=134',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2086,171,2,'973と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2087,171,3,'973以外の位取りの誤りがあるもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2088,171,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2089,171,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2090,172,1,'20と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=134',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2091,172,2,'2 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2092,172,3,'0.2と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2093,172,4,'2, 0.2以外の位取りの誤りがあるもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2094,172,5,'除数と被除数を逆にして計算を考えているもの 例  0. 05 例0.5 例5',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2095,172,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2096,172,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2097,173,1,'22と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=134',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2098,173,2,'150と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2099,173,3,'80と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2100,173,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2101,173,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2102,174,1,'25と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=135',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2103,174,2,'13と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2104,174,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2105,174,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2106,175,1,'5/7と解答しているもの   (大きさの等しい分数を含む)',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=135',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2107,175,2,'8/7または1(1/7)と解答しているもの   (大きさの等しい分数を含む)',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2108,175,3,'9/7または1(2/7)と解答しているもの   (大きさの等しい分数を含む)',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2109,175,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2110,175,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2111,176,1,'13/20と解答しているもの   (大きさの等しい分数を含む)',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=135',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2112,176,2,'1/3または3/9と解答しているもの   (大きさの等しい分数を含む)',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2113,176,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2114,176,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2115,178,1,'100408     と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=136',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2116,178,2,'10408と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2117,178,3,'1000004008 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2118,178,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2119,178,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2120,179,1,'35と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=136',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2121,179,2,'0.35と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2122,179,3,'3.5と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2123,179,4,'735と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2124,179,5,'35/100と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2125,179,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2126,179,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2127,180,1,'5137と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=136',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2128,180,2,'5173, 5317, 5371, 5713, 5731 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2129,180,3,'3751と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2130,180,4,'1357と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2131,180,5,'7531と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2132,180,6,'同じ数字を2回以上使って4桁の整数を解答しているもの  例  5111',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2133,180,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2134,180,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2135,182,1,'310と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=137',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2136,182,2,'302と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2137,182,3,'320と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2138,182,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2139,182,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2140,183,1,'1(時間)25(分)と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=137',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2141,183,2,'類型1と同じ量の時間を書いているが,表現が異なるもの  例  (時間)85   (分)',NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2142,183,3,'(時間)25(分)と解答しているもの  0(時間)25(分)と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2143,183,4,'2 (時間)25(分)と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2144,183,5,'9 (時間)50(分)と解答しているもの  11(時間)15(分)と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2145,183,6,'(時間)35(分)と解答しているもの   0(時間)35(分)と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2146,183,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2147,183,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2148,184,1,'式：7X3   と解答　　答え：21  と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=138',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2149,184,2,'式：底辺X高さと解答　　答え：21  と解答しているもの',NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2150,184,3,'式：7X4 と解答　　答え：28  と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2151,184,4,'式：4X3   と解答　　答え：12  と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2152,184,5,'式：7X3   と解答　　答え：21以外を解答しているもの  無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2153,184,6,'式：7X4   と解答　　答え：28以外を解答しているもの  無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2154,184,7,'式：4X3   と解答　　答え：12以外を解答しているもの  無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2155,184,8,'式：7X4÷2 　4X3÷2　7X3÷2　 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2156,184,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2157,184,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2158,186,1,'1 と解答しているもの',NULL,NULL,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=139',1,'1','たてが 2 cm，横が 5 cm の長方形');
INSERT INTO "answer_type" VALUES (2159,186,2,'2 と解答しているもの',NULL,1,NULL,1,'2','たてが 2 cm，横が 7 cm の長方形');
INSERT INTO "answer_type" VALUES (2160,186,3,'3 と解答しているもの',NULL,NULL,NULL,1,'3','たてが 7 cm，横が 5 cm の長方形');
INSERT INTO "answer_type" VALUES (2161,186,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2162,186,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2163,187,1,'式：7X5X2   と解答　　答え：70と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=139',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2164,187,2,'式：たてX横X高さ   と解答　　答え：70と解答しているもの',NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2165,187,3,'式：類型1,類型2以外を解答　無解答　　答え：70と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2166,187,4,'式：類型1,類型2を解答　　答え：70以外を解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2167,187,5,'式：類型1,類型2を解答　　答え：無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2168,187,6,'式：7X2 と解答しているもの  7X5 と解答しているもの  5X2と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2169,187,7,'式：7 + 5 + 2 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2170,187,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2171,187,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2172,188,1,'4と6 と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=140',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2173,188,2,'2と4 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2174,188,3,'2と6 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2175,188,4,'4 のみを解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2176,188,5,'6 のみを解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2177,188,6,'類型1から類型5以外で,4または6を解答をしているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2178,188,7,'類型2,類型3以外で,2を解答をしているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2179,188,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2180,188,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2181,189,1,'㋐ と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=140',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2182,189,2,'㋑ と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2183,189,3,'㋒ と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2184,189,4,'㋓ と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2185,189,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2186,189,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2187,190,1,'北と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=141',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2188,190,2,'東と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2189,190,3,'西と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2190,190,4,'南と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2191,190,5,'中央と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2192,190,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2193,190,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2194,191,1,'答え：40と解答　　式：(基準量)X(割合)の式を書いているもの　例100X0.4　例100X40÷100　例100 ÷ 100X40',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=141',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2195,191,2,'答え：40と解答　　式：「100,40,60」を用いて計算結果が40になる減法の式を解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2196,191,3,'答え：40と解答　　式：類型1,類型2以外で40になる式を解答しているの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2197,191,4,'答え：40と解答　　式：類型1から類型3以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2198,191,5,'答え：40と解答　　式：無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2199,191,6,'答え：40以外を解答 無解答　　式：100÷40 と解答しているもの  100÷4 と解答しているもの  100÷0.4 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2200,191,7,'答え：40以外を解答 無解答　　式：100×40 と解答しているもの  100×4 と解答しているもの  100×0.4 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2201,191,8,'答え：40以外を解答 無解答　　式：100-40 と解答しているもの  100-4 と解答しているもの  100-0.4 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2202,191,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2203,191,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2204,193,1,'3辺の合計：105 と解答　　荷物サイズ：120と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=144',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2205,193,2,'3辺の合計：105 と解答　　荷物サイズ：105と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2206,193,3,'3辺の合計：105 と解答　　荷物サイズ：100と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2207,193,4,'3辺の合計：105 と解答　　荷物サイズ：類型1から類型3以外の解答 無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2208,193,5,'3辺の合計：35000と解答しているもの  3500と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2209,193,6,'3辺の合計：85と解答    荷物サイズ：100と解答しているもの       3辺の合計：70と解答  　荷物サイズ：80と解答しているもの      3辺の合計：55と解答  　荷物サイズ：60と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2210,193,7,'3辺の合計：85と解答    荷物サイズ：100以外を解答しているもの 無解答
3辺の合計：70と解答  　荷物サイズ：80以外を解答しているもの 無解答
3辺の合計：55と解答  　荷物サイズ：60以外を解答しているもの 無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2211,193,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2212,193,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2213,194,1,'送料：1000と解答　　考え：①,②,③の全てを書いているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=145',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2214,194,2,'送料：1000と解答　　考え：①,②を書いているもの　例 3辺の合計だけで見ると荷物サイズは80サイズです。箱の重さだけで見ると荷物サイズは100サイズです。',NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2215,194,3,'送料：1000と解答　　考え：③を書いているもの　例 重さは8.6kgです。このときの荷物サイズは100サイズになります。送料は,荷物サイズの大きいほうになるので,1000円です。',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2216,194,4,'送料：1000と解答　　考え：②を書いているもの　例 重さは8.6kgで,荷物サイズが100サイズになるからです。',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2217,194,5,'送料：1000と解答　　考え：類型1から類型4以外の解答　無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2218,194,6,'送料：800と解答　　考え：何らかの解答があるもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2219,194,7,'送料：800と解答　　考え：無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2220,194,8,'送料：1800と解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2221,194,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2222,194,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2223,196,1,'4 と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=146',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2224,196,2,'3 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2225,196,3,'2 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2226,196,4,'0.25と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2227,196,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2228,196,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2229,197,1,'記号：イ と解答　　わけ：①,②,③の全てを書いているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=146',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2230,197,2,'記号：イ と解答　　わけ：①,③を書いているもの　例 2分音ぷの長さが目もり4つ分で,付点2分音ぷの長さは,その1.5倍だからです。',NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2231,197,3,'記号：イ と解答　　わけ：アの2つの音符の長さを表す目盛りの数と2つの音符の関係に即して,①,②,③の全てを書いている,または①,③の条件を満たして書いているもの　例 アの図は,付点2分音ぷの長さが目もり5つ分で,2分音ぷの長さが目もり4つ分です。5 5÷4=1.25で,付点2分音ぷの長さが2分音ぷの長さの1.25倍なので,イが正しいです。',NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2232,197,4,'記号：イ と解答　　わけ：③を書いているもの　例 付点2分音ぷの長さが2分音ぷの長さの1.5倍だからです。',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2233,197,5,'記号：イ と解答　　わけ：類型1から類型4以外の解答　例 2分音ぷの長さが目もり4つ分で,付点2分音ぷの長さが目もり6つ分だからです。　無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2234,197,6,'記号：アと解答　　わけ：目盛りが1つ分増えていることを書いているもの　例  付点4分音ぷの長さは,4分音ぷの長さより目もり1つ分長いです。だから,付点2分音ぷの長さが2分音ぷの長さより目もり1つ分長くなっているアが正しいです。',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2235,197,7,'記号：イ と解答　　わけ：1.5倍であることを書いているもの　例 付点2分音ぷの長さが2分音ぷの長さの1.5倍だからです。',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2236,197,8,'記号：イ と解答　　わけ：類型6,類型7以外の解答　無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2237,197,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2238,197,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2239,199,1,'番号(1〜3)：2 と解答　　番号(4〜6)：6 と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=147',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2240,199,2,'番号(1〜3)：2 と解答　　番号(4〜6)：4 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2241,199,3,'番号(1〜3)：2 と解答　　番号(4〜6)：5 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2242,199,4,'番号(1〜3)：2 と解答　　番号(4〜6)：類型1から類型3以外の解答　無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2243,199,5,'番号(1〜3)：1 と解答　　番号(4〜6)：6 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2244,199,6,'番号(1〜3)：1 と解答　　番号(4〜6)：類型5以外の解答　　無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2245,199,7,'番号(1〜3)：3 と解答　　番号(4〜6)：6 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2246,199,8,'番号(1〜3)：3 と解答　　番号(4〜6)：類型7以外の解答　無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2247,199,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2248,199,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2249,200,1,'１ と解答しているもの',NULL,NULL,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=147',1,'1','対角線が垂直に交わること');
INSERT INTO "answer_type" VALUES (2250,200,2,'２ と解答しているもの',NULL,NULL,NULL,1,'2','4 つの辺の長さが等しいこと');
INSERT INTO "answer_type" VALUES (2251,200,3,'３ と解答しているもの',NULL,NULL,NULL,1,'3','対角線がそれぞれの真ん中で交わること');
INSERT INTO "answer_type" VALUES (2252,200,4,'４ と解答しているもの',NULL,1,NULL,1,'4','4 つの角が直角で，4 つの辺の長さが等しいこと');
INSERT INTO "answer_type" VALUES (2253,200,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2254,200,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2255,201,1,' 「1辺」の長さが7cmであることと,正方形であることを書いているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=148',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2256,201,2,'「1辺」という言葉を用いずに,辺の長さが7cmであることと,正方形であることを書いているもの　例  4辺が7 cmの正方形',NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2257,201,3,'「7cm」を書いて,正方形であることのみを書いているもの 例  7 cmの正方形',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2258,201,4,'「7cm」以外の長さを書き,正方形であることを書いているもの 例1辺が5 cmの正方形',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2259,201,5,'類型1から類型4以外で正方形であることを書いているもの 例  4つの辺と角が等しい正方形',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2260,201,6,'「7 cm」を書いて,長方形であることを書いているもの 例  7 cmの長方形',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2261,201,7,'類型6以外で長方形であることを書いているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2262,201,8,'類型1,2,  3,  6以外で「7cm」を書いているもの(誤った記述のあるものなど) 例1辺が7 cmの四角形',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2263,201,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2264,201,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2265,203,1,'1990と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=149',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2266,203,2,'1985と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2267,203,3,'1995と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2268,203,4,'1980と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2269,203,5,'1975と解答しているもの 　2005と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2270,203,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2271,203,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2272,204,1,'１ と解答しているもの',NULL,NULL,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=149',1,'1','2000 年の国内生産台数が，1995 年の国内生産台数より多いから');
INSERT INTO "answer_type" VALUES (2273,204,2,'２ と解答しているもの',NULL,NULL,NULL,1,'2','1995 年と 2000 年の輸出した台数の割合はほぼ同じで，国内生産台数が 2000 年のほうが多いから。');
INSERT INTO "answer_type" VALUES (2274,204,3,'３ と解答しているもの',NULL,NULL,NULL,1,'3','2000 年の輸出した台数の割合が，1995 年の輸出した台数の割合より大きいから。');
INSERT INTO "answer_type" VALUES (2275,204,4,'４ と解答しているもの',NULL,1,NULL,1,'4','1995 年と 2000 年の国内生産台数はほぼ同じで，輸出した台数の割合が 2000 年のほうが大きいから。');
INSERT INTO "answer_type" VALUES (2276,204,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2277,204,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2278,205,1,'A①,A②,A③,A④の全てを書き,輸出した台数などを求める式を書いていないもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=150',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2279,205,2,'B①, B②,B③,B④の全てを書き,輸出した台数などを求める式を書いていないもの',NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2280,205,3,'類型5以外で,A①,A (2),    A③を書いているもの  例 輸出した台数の割合は,1980年が54%で,1985年が55%です。全体が10〇%なので,半分の50%と比べれば分かります。
類型5以外で,A①,A③,A④を書いているもの 例  1980年と1985年は,輸出した台数の割合が50%より大きいからです。',NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2281,205,4,'類型5以外で,B①,B②,B③を書いているもの  例  輸出した台数の割合が,1980年は54%,   1985年は55%です。 輸出しなかった台数の割合が,1980年は46%,   1985年は45%です。
類型5以外で,B①,B③,B④を書いているもの  例  輸出しなかった台数の割合は,1980年が46%, 1985年が45%です。 輸出した台数の割合が,輸出しなかった台数の割合より大きいからです。',NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2282,205,5,'1980年と1985年を示す言葉と式で求める対象を示す言葉を書き,両年の輸出した台数を求める式と輸出しなかった台数を求める式,合計4つの式を 書いているもの  例  輸出した台数は,1980年が約1100万X 0. 54で約594万台,1985年が約1200万X0. 55で約660万台です。輸出しなかった台数は,1980年が約1100万X0. 46で約506万台,1985年が約1200万 X0. 45で約540万台です。だから1980年と1985年は,輸出した台数のほうが輸出しなかった台数が多いとわかります
両年の輸出した台数を求める2つの式と,判断の目安となる割合や,台数を書いているもの  例 輪出した台数は,1980年が1100万X0. 54で594万台,1985年は,1200万X0. 55で660万台です。国内生産台数の半分に当たる台数は,1980年は550万台で,1985年は600万台だか ら,輸出した台数のほうが輸出しなかった台数より多いとわかります。
両年の輸出しなかった台数を求める2つの式と,判断の目安となる割合や,台数を 書いているもの',NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2283,205,6,'A③を書いているもの 例 割合が50%より大きいからです。',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2284,205,7,'1980年と1985年の両年,またはどちらか一方の年の輸出しなかった台数の割合を書いているもの  例  1980年の輸出しなかった台数が46%だからです。',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2285,205,8,'1980年と1985年の両年,またはどちらか一方の年の輸出した台数の割合を書いているもの 例  1980年が54%,   1985年が55%だからです。',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2286,205,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2287,205,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2288,207,1,' 7 と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=152',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2289,207,2,'6 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2290,207,3,'1 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2291,207,4,'5 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2292,207,5,'8 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2293,207,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2294,207,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2295,208,1,'オからカ：14 と解答　　カからア：7 と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=152',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2296,208,2,'オからカ：7 と解答　　カからア：14 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2297,208,3,'オからカ：14 と解答　　カからア：14 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2298,208,4,'オからカ：7 と解答　　カからア：7 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2299,208,5,'オからカ：14 と解答　　カからア：類型1,類型3以外の解答　無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2300,208,6,'オからカ：類型1,類型4以外の解答　無解答　　　カからア：7 と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2301,208,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2302,208,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2303,209,1,'説明：「オからカでは,14m下がります。カからアでは7m下がります。」と書いているもの　　記号：(オ)から(カ)と解答しているもの',NULL,1,'https://www.nier.go.jp/11chousa/11kaisetsu_shou_sansuu.pdf#page=153',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2304,209,2,'説明：「オ からカ では,14m下がる」ことと「カ から アでは,7m下がる」ことを書いているが,遊園地の係の人の説明と表現が異なるもの 例  オからカでは,1分間に14m下がり,カからアでは,1分間に7 m下がります。　　記号：(オ)から(カ)と解答しているもの',NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2305,209,3,'説明：類型1,類型2の「オからカ」または「カからア」というゴンドラの位置の変化を表す部分のみが誤っているもの　例  オからカでは,14m下がります。カからキでは,7 m下がります。　　記号：(オ)から(カ)と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2306,209,4,'説明：類型１、類型2の「下がる」という部分のみを,「上がる」などと書いているもの,または記述していないもの　例　オからカでは,14m上がります。カからアでは7 m上がります。　　　記号：(オ)から(カ)と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2307,209,5,'説明：類型1,類型2の「14」mまたは「7」mという数値のみが誤っているもの　例 オからカでは,14m下がります。力からアでは,12m下がります。　　　記号：(オ)から(カ)と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2308,209,6,'説明：類型1から類型5以外の解答 例 オ からカ では,14m下がります。   無解答　　記号：(オ)から(カ)と解答しているもの',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2309,209,7,'説明：遊園地の係の人の説明を書いている　　記号：(オ)から(カ)以外を解答しているもの　無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2310,209,8,'説明：類型1,類型2を解答 例  オからカでは,1分間に14m下がり,カからアでは,1分間に7 m下がります。　　記号：(オ)から(カ)以外を解答しているもの　無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2311,209,99,'上記以外の解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2312,209,0,'無解答',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2313,128,1,' 178 と解答しているもの',87,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=2',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2314,128,2,'188 と解答しているもの',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2315,128,3,'278 と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2316,128,4,'288 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2317,128,5,'222 と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2318,128,99,'上記以外の解答',10.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2319,128,0,'無解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2320,129,1,'91.8 と解答しているもの',84.4,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=3',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2321,129,2,'918 と解答しているもの',4.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2322,129,3,'918 以外の位取りの誤りがあるもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2323,129,4,'18.9 や 189 などと解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2324,129,99,'上記以外の解答',9.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2325,129,0,'無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2326,130,1,'228 と解答しているもの',89.7,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=4',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2327,130,2,'230 と解答しているもの 203 と解答しているもの 23 と解答しているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2328,130,99,'上記以外の解答',7.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2329,130,0,'無解答',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2330,131,1,'7.5 と解答しているもの',83.4,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=5',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2331,131,2,' ３ と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2332,131,3,'0.3 と解答しているもの',10.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2333,131,99,'上記以外の解答',5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2334,131,0,'無解答',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2335,132,1,'1.2 と解答しているもの',86.2,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=6',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2336,132,2,'12 と解答しているもの',6.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2337,132,3,'0.8，0.83 など，5/6を小数で表しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2338,132,4,'6/5と解答しているもの （大きさの等しい分数を含む）',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2339,132,5,'5/6と解答しているもの （大きさの等しい分数を含む）',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2340,132,6,'１あまり１ と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2341,132,99,'上記以外の解答',4.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2342,132,0,'無解答',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2343,133,1,'350 と解答しているもの',66.3,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=7',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2344,133,2,'400 と解答しているもの',29.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2345,133,99,'上記以外の解答',3.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2346,133,0,'無解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2347,135,1,'式：４÷８ と解答　　答え：0.5 と解答しているもの',54.1,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=9',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2348,135,2,'式：４÷８ と解答　　答え：4/8と解答しているもの （大きさの等しい分数を含む）',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2349,135,3,'式：４÷８ と解答　　答え：2 と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2350,135,4,'式：４÷８ と解答　　答え：上記以外の解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2351,135,5,'式：８÷４ と解答',31.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2352,135,6,'式：８×４ と解答しているもの  ４×８ と解答しているもの',5.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2353,135,99,'上記以外の解答',5.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2354,135,0,'無解答',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2355,136,1,'2/3と解答しているもの （大きさの等しい分数を含む）',40.6,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=11',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2356,136,2,'3/2と解答しているもの （大きさの等しい分数を含む）',14.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2357,136,3,'1/3と解答しているもの （大きさの等しい分数を含む）',19.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2358,136,4,' 0.66，0.67 など，商を小数で表しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2359,136,5,'6/10と解答しているもの （大きさの等しい分数を含む）',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2360,136,99,'上記以外の解答',17.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2361,136,0,'無解答',5.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2362,137,1,'１ と解答しているもの',1.1,NULL,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=16',1,'1','1/4');
INSERT INTO "answer_type" VALUES (2363,137,2,'２ と解答しているもの',69,1,NULL,1,'2','1/3');
INSERT INTO "answer_type" VALUES (2364,137,3,'３ と解答しているもの',24.3,NULL,NULL,1,'3','6/12');
INSERT INTO "answer_type" VALUES (2365,137,4,'４ と解答しているもの',4.9,NULL,NULL,1,'4','2/3');
INSERT INTO "answer_type" VALUES (2366,137,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2367,137,0,'無解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2368,139,1,'１ と解答しているもの',80.3,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=18',1,'1','半径');
INSERT INTO "answer_type" VALUES (2369,139,2,'２ と解答しているもの',5.4,NULL,NULL,1,'2','直径');
INSERT INTO "answer_type" VALUES (2370,139,3,'３ と解答しているもの',3.3,NULL,NULL,1,'3','円周');
INSERT INTO "answer_type" VALUES (2371,139,4,'４ と解答しているもの',9.9,NULL,NULL,1,'4','円周の半分');
INSERT INTO "answer_type" VALUES (2372,139,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2373,139,0,'無解答',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2374,140,1,'１ と解答しているもの',5.6,NULL,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=19',1,'1','半径');
INSERT INTO "answer_type" VALUES (2375,140,2,'２ と解答しているもの',15.3,NULL,NULL,1,'2','直径');
INSERT INTO "answer_type" VALUES (2376,140,3,'３ と解答しているもの',22.4,NULL,NULL,1,'3','円周');
INSERT INTO "answer_type" VALUES (2377,140,4,'４ と解答しているもの',55.5,1,NULL,1,'4','円周の半分');
INSERT INTO "answer_type" VALUES (2378,140,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2379,140,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2380,142,1,' 120 と解答しているもの',82.9,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=23',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2381,142,2,'鋭角（０度より大きく，90度より小さい角）を解答しているもの',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2382,142,3,'90 と解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2383,142,4,' 105 と解答しているもの',4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2384,142,5,'類型１，類型４以外の鈍角（90度より大きく，180度より小さい角）を解答しているもの',3.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2385,142,6,'300 と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2386,142,99,'上記以外の解答',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2387,142,0,'無解答',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2388,143,1,'式：(３＋７)×４÷２ と解答　　答え：20 と解答しているもの',69.6,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=24',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2389,143,2,'式：(上底＋下底)×高さ÷２ など，言葉の式を解答　　答え：20 と解答しているもの',0.3,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2390,143,3,'式：三角形に分割するなど，台形の面 積を求める式を工夫して解答　例 ３×４÷２＋７×４÷２　　答え：20 と解答しているもの',0.5,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2391,143,4,'式：（ ）を用いずに，類型１の式を解答　例 ３＋７×４÷２　　答え：20 と解答しているもの',2.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2392,143,5,'式：７×４ と解答しているもの　３×４ と解答しているもの　７×４÷２ と解答しているもの　３×４÷２ と解答しているもの',6.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2393,143,6,'式：(３＋７)×４ と解答しているもの　３×４＋７×４ と解答しているもの',6.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2394,143,7,'式：類型１から６以外を解答　無解答　　答え：20 と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2395,143,8,'式：類型１，類型２を解答　　答え：20 以外を解答しているもの　無解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2396,143,99,'上記以外の解答',10.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2397,143,0,'無解答',2.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2398,144,1,'ア と解答しているもの',4.2,NULL,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=27',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2399,144,2,'イ と解答しているもの',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2400,144,3,'ウ と解答しているもの',2.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2401,144,4,'エ と解答しているもの',88.4,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2402,144,5,'オ と解答しているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2403,144,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2404,144,0,'無解答',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2405,145,1,'１ と解答しているもの',5.9,NULL,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=29',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2406,145,2,'２ と解答しているもの',4.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2407,145,3,'３ と解答しているもの',3.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2408,145,4,'４ と解答しているもの',76.3,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2409,145,5,'5 と解答しているもの',4.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2410,145,6,'6 と解答しているもの',2.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2411,145,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2412,145,0,'無解答',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2413,147,1,'１ と解答しているもの',5.1,NULL,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=31',1,'1','面積は，0.5 倍になる。');
INSERT INTO "answer_type" VALUES (2414,147,2,'２ と解答しているもの',3.9,NULL,NULL,1,'2','面積は，1.5 倍になる。');
INSERT INTO "answer_type" VALUES (2415,147,3,'３ と解答しているもの',5.9,NULL,NULL,1,'3','面積は，2 倍になる。');
INSERT INTO "answer_type" VALUES (2416,147,4,'４ と解答しているもの',82.3,1,NULL,1,'4','面積は，変わらない。');
INSERT INTO "answer_type" VALUES (2417,147,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2418,147,0,'無解答',2.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2419,148,1,'１ と解答しているもの',5.4,NULL,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=33',1,'1','直角三角形');
INSERT INTO "answer_type" VALUES (2420,148,2,'２ と解答しているもの',84.9,1,NULL,1,'2','二等辺三角形');
INSERT INTO "answer_type" VALUES (2421,148,3,'３ と解答しているもの',4.9,NULL,NULL,1,'3','正三角形');
INSERT INTO "answer_type" VALUES (2422,148,4,'４ と解答しているもの',1.2,NULL,NULL,1,'4','平行四辺形');
INSERT INTO "answer_type" VALUES (2423,148,5,'5 と解答しているもの',1,NULL,NULL,1,'5','ひし形');
INSERT INTO "answer_type" VALUES (2424,148,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2425,148,0,'無解答',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2426,150,1,' 0.8 と解答しているもの（「～倍」と書いているものを含む）  0.8と同じ割合を分数で解答しているもの（「～倍」と書いているものを含む）  例 8/10倍',26.9,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=35',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2427,150,2,'80％ と解答しているもの　８割 と解答しているもの',30.9,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2428,150,3,'複数の解答が書かれており，正答と誤答の両方を解答しているもの　例 0.8（８％）',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2429,150,4,'0.8 の位取りの誤りがあるもの　0.8 を基に百分率や歩合を書いているがその表現に誤りがあるもの　例 80',4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2430,150,5,'1.25 または，1.25と同じ割合を解答しているもの　1.25 の位取りの誤りがあるもの　1.25 を基に百分率や歩合を書いているがその表現に誤りがあるもの　例 1.25',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2431,150,6,'0.2 または，0.2と同じ割合を解答しているもの　0.2 の位取りの誤りがあるもの　0.2 を基に百分率や歩合を書いているがその表現に誤りがあるもの　例 0.2％',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2432,150,7,'４ または，４と同じ割合を解答しているもの　４ の位取りの誤りがあるもの　４ を基に百分率や歩合を書いているがその表現に誤りがあるもの　例 40％',6.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2433,150,8,'90，90ｍ2 ，90％，９割 と解答しているもの　10，10ｍ2 ，10％，１割 と解答しているもの',9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2434,150,99,'上記以外の解答',7.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2435,150,0,'無解答',10.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2436,151,1,'午後１ 時と 午後２ 時の間 と解答しているもの',74,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=39',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2437,151,2,'午後４ 時と 午後５ 時の間 と解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2438,151,3,'午後２ 時と 午後３ 時の間 と解答しているもの',14.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2439,151,4,'午前10 時と 午前11 時の間 と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2440,151,5,'午前９ 時と 午後２ 時の間 と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2441,151,99,'上記以外の解答',6.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2442,151,0,'無解答',4.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2443,153,1,'１ と解答しているもの',5.7,NULL,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=41',1,'1','400円');
INSERT INTO "answer_type" VALUES (2444,153,2,'２ と解答しているもの',12,NULL,NULL,1,'2','300円');
INSERT INTO "answer_type" VALUES (2445,153,3,'３ と解答しているもの',56.2,1,NULL,1,'3','200円');
INSERT INTO "answer_type" VALUES (2446,153,4,'４ と解答しているもの',24.3,NULL,NULL,1,'4','150円');
INSERT INTO "answer_type" VALUES (2447,153,99,'上記以外の解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2448,153,0,'無解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2449,154,1,'500－(50＋150×２) と解答しているもの',42.7,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=44',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2450,154,2,' 500－(50＋150)×２ と解答しているもの',11.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2451,154,3,'500－50＋(150×２) と解答しているもの',16.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2452,154,4,'(500－50)＋150×２ と解答しているもの',10.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2453,154,5,'(500－50＋150)×２ と解答しているもの',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2454,154,99,'上記以外の解答',6.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2455,154,0,'無解答',12,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2456,156,1,'辺の長さが15cm，20cmであることと，長方形であることを書いているもの',28.6,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=48',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2457,156,2,'辺の長さが15cm，20cmであることのみを書いているもの 例 たて15cm，横20cm',3.4,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2458,156,3,'「15cm」，「20cm」，長方形であることのみを書いているもの 例 15cmと20cmの長方形',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2459,156,4,'「15cm」，「20cm」のみを書いているもの 例 15cm，20cm',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2460,156,5,'類型１から４以外で，「15cm」，「20cm」を書いているもの（誤った記述のあるものなど）  例 たて15cm，横20cmの四角形',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2461,156,6,'「15」，「20」を書いているが，単位（cm）が誤っているもの 「15」，「20」を書いているが，単位（cm）を書いていないもの  例 辺の長さが15と20の長方形',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2462,156,7,'白い部分の半分であることを書いているもの 例 白い部分の半分の長方形',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2463,156,8,'白い部分を表す言葉や数値を書いているもの 例 たて30cm，横20cmの長方形',17.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2464,156,99,'上記以外の解答',17.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2465,156,0,'無解答',13.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2466,157,1,'１ と ５ と解答しているもの',65.9,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=51',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2467,157,2,' １ と ４ と解答しているもの',4.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2468,157,3,' ４ と ５ と解答しているもの',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2469,157,4,'類型１，２以外で，１ を解答しているもの',6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2470,157,5,'類型１，３以外で，５ を解答しているもの',7.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2471,157,99,'上記以外の解答',12.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2472,157,0,'無解答',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2473,159,1,' 運動場 と解答しているもの',96,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=55',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2474,159,2,' 切りきず・すりきず と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2475,159,3,'休み時間 と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2476,159,4,'運動場 以外の場所を解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2477,159,99,'上記以外の解答',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2478,159,0,'無解答',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2479,160,1,'①，②，③のすべてを書き，①と②の両方を満たしていることを適切に表現しているもの',61.6,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=56',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2480,160,2,'①，②，③を書いているもの 例 放課後とだぼくの人数',2.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2481,160,3,'①，②を書いているもの 例 放課後にだぼくした人',25.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2482,160,4,'①を書いているもの ①，③を書いているもの 例 放課後にけがをした人数',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2483,160,5,'②を書いているもの  ②，③を書いているもの',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2484,160,99,'上記以外の解答',3.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2485,160,0,'無解答',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2486,161,1,'１ と解答しているもの',40.2,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=58',1,'1','①の円グラフ');
INSERT INTO "answer_type" VALUES (2487,161,2,'２ と解答しているもの',9.8,NULL,NULL,1,'2','②の円グラフ');
INSERT INTO "answer_type" VALUES (2488,161,3,'３ と解答しているもの',6.4,NULL,NULL,1,'3','③の円グラフ');
INSERT INTO "answer_type" VALUES (2489,161,4,'４ と解答しているもの',42.2,NULL,NULL,1,'4','①と③の円グラフ');
INSERT INTO "answer_type" VALUES (2490,161,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2491,161,0,'無解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2492,162,1,'「三角形⑥は，これら２つの三角形に共通しています。三角形④と三角形⑤は，面積が等しい三角形から共通の三角形⑥をひいたものです。」と書いているもの',15,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=63',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2493,162,2,'「三角形⑥が，２つの三角形（三角形カキクと三角形ケキク）に共通している」ことと「三角形④と三角形⑤は，面積が等しい三角形から共通の三角形⑥をひいたものである」ことを言葉で書いているが，たかしさんの説明と表現が異なるもの  例 三角形カキクと三角形ケキクに共通している三角形⑥を，それらの２つの三角形からひいたものが三角形④と三角形⑤です。',18.5,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2494,162,3,'たかしさんの説明を書いているもの',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2495,162,4,'類型１，２の④，⑤，⑥の一部分を①，②，③と誤って書いているもの 例 三角形⑥は，これら２つの三角形に共通しています。三角形④と⑤は，面積が等しい三角形から共通の三角形③をひいたものです。',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2496,162,5,'三角形④，⑤，⑥，三角形カキク，ケキクの関係を，式で書いているもの 例 三角形カキク－三角形⑥＝三角形④ 三角形ケキク－三角形⑥＝三角形⑤ ',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2497,162,6,'下のいずれか一方を言葉で書いているもの  ・三角形⑥が，２つの三角形（三角形カキクと三角形ケキク）に共通していること ・三角形④と⑤は，面積が等しい三角形から共通の三角形⑥をひいたものであること',11.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2498,162,7,'三角形カキクと三角形ケキクの面積が等しい理由を書いているもの',3.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2499,162,8,'三角形④と三角形⑤について，図形の構成要素や形の特徴を書いているもの 例 三角形④は幅が広いけれど，三角形⑤は細長いから。',4.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2500,162,99,'上記以外の解答',19.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2501,162,0,'無解答',21.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2502,164,1,'１ と解答しているもの',2,NULL,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=69',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2503,164,2,'２ と解答しているもの',16.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2504,164,3,'３ と解答しているもの',69.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2505,164,4,'４ と解答しているもの',8.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2506,164,5,'5 と解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2507,164,99,'上記以外の解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2508,164,0,'無解答',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2509,165,1,'記号：ウ と解答　　わけ：①，②，③，④を書いているもの　　①，②，③を書いているもの　　①，②，④を書いているもの　　①，③，④を書いているもの　　②，③，④を書いているもの　　①，④を書いているもの　　②，④を書いているもの　　③，④を書いているもの　　④を書いているもの',17.1,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=71',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2510,165,2,'記号：ウ と解答　　わけ：①，③を書いているもの',0.3,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2511,165,3,'記号：ウ と解答　　わけ：①，②を書いているもの　　①を書いているもの　例 くつがいちばん高いから',22.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2512,165,4,'記号：ウ と解答　　わけ：②，③を書いているもの　　③を書いているもの　例 値引きされる金額＝定価×値引きの割合だから。　',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2513,165,5,'記号：ウ と解答　　わけ：類型１から類型４以外の解答　例 定価5800円のくつを20％引きすると4640円で1160円も引いてくれることになるので，くつがいちばん値引きされる値段が大きくなる　無解答',36.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2514,165,6,'記号：ア と解答　　わけ：商品の定価はシャツが最も安いことを書いているもの',2.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2515,165,7,'記号：ア と解答　　わけ：類型６以外の解答　無解答',8.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2516,165,8,'記号を イ と解答しているもの',4.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2517,165,99,'上記以外の解答',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2518,165,0,'無解答',4.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2519,167,1,'三角形：２ と解答　　わけ：い と解答しているもの',65.1,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=77',1,'1','直角三角形');
INSERT INTO "answer_type" VALUES (2520,167,2,'三角形：２ と解答　　わけ：う と解答しているもの',6.8,NULL,NULL,1,'2','二等辺三角形');
INSERT INTO "answer_type" VALUES (2521,167,3,'三角形：２ と解答　　わけ：あ と解答しているもの　え と解答しているもの　お と解答しているもの　',3.4,NULL,NULL,1,'3','正三角形');
INSERT INTO "answer_type" VALUES (2522,167,4,'三角形：２ と解答　　わけ：類型１から類型３以外の解答　無解答',4.8,NULL,NULL,1,'あ','三角形アイウの 3 つの辺の長さが等しいから。');
INSERT INTO "answer_type" VALUES (2523,167,5,'三角形：２ と解答　　わけ：え と解答しているもの　お と解答しているもの',1.8,NULL,NULL,1,'い','辺アイの長さと辺イウの長さが等しいから。');
INSERT INTO "answer_type" VALUES (2524,167,6,'三角形：２ と解答　　わけ：類型５以外の解答　無解答',5.4,NULL,NULL,1,'う','辺アウの長さと辺イウの長さが等しいから。');
INSERT INTO "answer_type" VALUES (2525,167,7,'三角形：２ と解答　　わけ：あ と解答しているもの',4.9,NULL,NULL,1,'え','角き が直角だから。');
INSERT INTO "answer_type" VALUES (2526,167,8,'三角形：２ と解答　　わけ： 類型７以外の解答　無解答',3.5,NULL,NULL,1,'お','角く が直角だから。');
INSERT INTO "answer_type" VALUES (2527,167,99,'上記以外の解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2528,167,0,'無解答',3.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2529,168,1,'番号：２ と解答　　わけ：①，②，③のすべてを書いているもの',14.9,1,'https://www.nier.go.jp/10chousakekkahoukoku/02shou/shou_4s.pdf#page=78',1,'1','Ⓑ の長さは，Ⓐ の長さ（100 cm）より長い。');
INSERT INTO "answer_type" VALUES (2530,168,2,'番号：２ と解答　　わけ：①，②を書いているもの　例 50×２×3.14÷４＝78.5 だから。',5.9,NULL,NULL,1,'2','Ⓑ の長さは，Ⓐ の長さ（100 cm）より短い。');
INSERT INTO "answer_type" VALUES (2531,168,3,'番号：２ と解答　　わけ：①，③を書いているもの 例 ○Ｂ の長さは，50×２×3.14÷４ だから。　　②，③を書いているもの 例 ○Ｂ の長さは，78.5cmだから。 例 ○Ｂ の長さは，314÷４＝78.5 だから。　　①を書いているもの 例 50×２×3.14÷４　　②を書いているもの 例 78.5cm',5.2,NULL,NULL,1,'3','Ⓑ の長さは，Ⓐ の長さ（100 cm）と等しい。');
INSERT INTO "answer_type" VALUES (2532,168,4,'番号：２ と解答　　わけ：円周を，(半径)×(円周率) で求めているもの  例 ○Ｂ の長さは，50×3.14÷４＝39.25 だから。',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2533,168,5,'番号：２ と解答　　わけ：類型１から類型４以外の解答 例 円周の求め方は，直径×円周率で，その答えを÷４をすればよいから。　　無解答',21.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2534,168,6,'番号：１ または３ と解答　　わけ：円周を求めているもの　例 Ｂ の長さは，50×２×3.14＝314 だから。',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2535,168,7,'番号：１ または３ と解答　　わけ：円周を，(直径)×２×(円周率) で求めているもの　例 Ｂ の長さは，100×２×3.14÷４＝157 だから。',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2536,168,8,'番号：１ または３ と解答　　わけ：円周を，(半径)×(半径)×(円周率) で求めているもの　例 Ｂ の長さは，50×50×3.14÷４ で求められる。',2.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2537,168,99,'上記以外の解答',37.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2538,168,0,'無解答',9.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2539,88,1,'202と解答しているもの',95.1,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=2',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2540,88,2,'192と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2541,88,3,'102と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2542,88,99,'上記以外の解答',4.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2543,88,0,'無解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2544,89,1,'5800と解答しているもの',85.7,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=3',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2545,89,2,'5600と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2546,89,3,'5700と解答しているもの',5.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2547,89,4,'5660と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2548,89,99,'上記以外の解答',8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2549,89,0,'無解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2550,90,1,'51と解答しているもの',95.4,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=4',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2551,90,2,'6と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2552,90,3,'510と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2553,90,4,'501と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2554,90,99,'上記以外の解答',3.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2555,90,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2556,91,1,'37と解答しているもの',80.5,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=5',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2557,91,2,'3.7と解答しているもの',9.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2558,91,3,'3.7以外の位取りの誤りがあるもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2559,91,99,'上記以外の解答',5.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2560,91,0,'無解答',3.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2561,92,1,'5/6と解答しているもの',97.8,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=6',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2562,92,2,'5と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2563,92,99,'上記以外の解答',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2564,92,0,'無解答',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2565,93,1,'74と解答しているもの',67,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=7',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2566,93,2,'10と解答しているもの',26.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2567,93,99,'上記以外の解答',5.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2568,93,0,'無解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2569,95,1,'10600と解答しているもの',64.3,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=10',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2570,95,2,'16000と解答しているもの',26.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2571,95,3,'10060と解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2572,95,4,'10006と解答しているもの',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2573,95,99,'上記以外の解答',6.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2574,95,0,'無解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2575,96,1,'4500と解答しているもの',73.5,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=12',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2576,96,2,'450と解答しているもの',22,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2577,96,3,'145と解答しているもの',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2578,96,99,'上記以外の解答',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2579,96,0,'無解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2580,97,1,'１ と解答しているもの',11.9,NULL,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=13',1,'1','70000');
INSERT INTO "answer_type" VALUES (2581,97,2,'２ と解答しているもの',75.9,1,NULL,1,'2','74000');
INSERT INTO "answer_type" VALUES (2582,97,3,'３ と解答しているもの',9.1,NULL,NULL,1,'3','74300');
INSERT INTO "answer_type" VALUES (2583,97,4,'４ と解答しているもの',2.2,NULL,NULL,1,'4','75000');
INSERT INTO "answer_type" VALUES (2584,97,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2585,97,0,'無解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2586,98,1,'0,  78,100と解答しているもの',77.5,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=14',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2587,98,2,'78,100と解答しているもの',8.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2588,98,3,'78と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2589,98,4,'類型1から類型3以外で,偶数のみを解答しているもの',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2590,98,5,'0,1,35と解答しているもの    0,1と解答しているもの    0,  35と解答しているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2591,98,6,'1,35と解答しているもの',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2592,98,99,'上記以外の解答',8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2593,98,0,'無解答',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2594,99,1,'１ と解答しているもの',1.3,NULL,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=15',1,'1','3cm');
INSERT INTO "answer_type" VALUES (2595,99,2,'２ と解答しているもの',89.9,1,NULL,1,'2','15cm');
INSERT INTO "answer_type" VALUES (2596,99,3,'３ と解答しているもの',6.3,NULL,NULL,1,'3','30cm');
INSERT INTO "answer_type" VALUES (2597,99,4,'４ と解答しているもの',1.3,NULL,NULL,1,'4','50cm');
INSERT INTO "answer_type" VALUES (2598,99,99,'上記以外の解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2599,99,0,'無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2600,100,1,'115と解答しているもの',78.9,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=17',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2601,100,2,'65と解答しているもの',10.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2602,100,3,'75と解答しているもの',6.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2603,100,4,'125と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2604,100,99,'上記以外の解答',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2605,100,0,'無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2606,102,1,'180X 2と解答しているもの',51.3,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=19',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2607,102,2,'180+180と解答しているもの',16.8,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2608,102,3,'360と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2609,102,4,'180X 4と解答しているもの',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2610,102,5,'類型1,2以外で,計算結果が360になる式を解答しているもの',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2611,102,99,'上記以外の解答',16.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2612,102,0,'無解答',10.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2613,103,1,'１ と解答しているもの',0.5,NULL,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=21',1,'1','ひし形');
INSERT INTO "answer_type" VALUES (2614,103,2,'２ と解答しているもの',0.6,NULL,NULL,1,'2','長方形');
INSERT INTO "answer_type" VALUES (2615,103,3,'３ と解答しているもの',2.8,NULL,NULL,1,'3','正三角形');
INSERT INTO "answer_type" VALUES (2616,103,4,'４ と解答しているもの',83.5,1,NULL,1,'4','直角三角形');
INSERT INTO "answer_type" VALUES (2617,103,5,'5 と解答しているもの',10.8,NULL,NULL,1,'5','二等辺三角形');
INSERT INTO "answer_type" VALUES (2618,103,99,'上記以外の解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2619,103,0,'無解答',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2620,104,1,'10と解答しているもの',92.7,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=22',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2621,104,2,'8と解答しているもの',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2622,104,3,'80と解答しているもの',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2623,104,99,'上記以外の解答',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2624,104,0,'無解答',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2625,105,1,'4X6÷2と解答しているもの',66.2,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=24',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2626,105,2,'7X6÷2-3X6÷2と解答しているもの',0.1,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2627,105,3,'6X7-7X6÷2-3X6÷2と解答しているもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2628,105,4,'(7 + 4) X 6 ÷ 2 - 7 X 6 ÷ 2と解答しているもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2629,105,5,'類型1から類型4以外で,計算結果が12になる式を書いているもの',0.7,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2630,105,6,'4X6と解答しているもの',8.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2631,105,7,'7X6÷2と解答しているもの',2.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2632,105,8,'類型7以外で,計算結果が12にならない〇X□÷2の形の式を書いているもの',5.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2633,105,99,'上記以外の解答',9.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2634,105,0,'無解答',7.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2635,106,1,'１ と解答しているもの',11.2,NULL,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=26',1,'1','0.4%');
INSERT INTO "answer_type" VALUES (2636,106,2,'２ と解答しているもの',22.6,NULL,NULL,1,'2','2.5%');
INSERT INTO "answer_type" VALUES (2637,106,3,'３ と解答しているもの',57.1,1,NULL,1,'3','40%');
INSERT INTO "answer_type" VALUES (2638,106,4,'４ と解答しているもの',6.9,NULL,NULL,1,'4','80%');
INSERT INTO "answer_type" VALUES (2639,106,99,'上記以外の解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2640,106,0,'無解答',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2641,107,1,'6と解答しているもの',69,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=29',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2642,107,2,'10と解答しているもの',12.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2643,107,3,'8と解答しているもの',2.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2644,107,4,'1と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2645,107,5,'4と解答しているもの  2と解答しているもの',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2646,107,99,'上記以外の解答',10.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2647,107,0,'無解答',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2648,109,1,'記号：ウ,エと解答　　式：14X15と解答しているもの',51.3,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=33',1,'ア','①の長さ　200cm');
INSERT INTO "answer_type" VALUES (2649,109,2,'記号：ウ,エと解答　　式：210と解答しているもの',0,NULL,NULL,1,'イ','②の長さ　30cm');
INSERT INTO "answer_type" VALUES (2650,109,3,'記号：ウ,エと解答　　式：型1,類型2以外を解答しているもの　無解答',5.1,NULL,NULL,1,'ウ','③の長さ　14cm');
INSERT INTO "answer_type" VALUES (2651,109,4,'記号：類型1から類型3以外を解答　無解答　　式：14X15と解答しているもの',6,NULL,NULL,1,'エ','階段の段数　15段');
INSERT INTO "answer_type" VALUES (2652,109,5,'記号：イ,エと解答　　式：30X15と解答しているもの',2.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2653,109,6,'記号：イ,ウ,エと解答　　式：(14+30)X15と解答しているもの',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2654,109,99,'上記以外の解答',31.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2655,109,0,'無解答',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2656,110,1,'１ と解答しているもの',5.6,NULL,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=35',1,'1','平行四辺形は、2つの対角線の長さが等しいから。');
INSERT INTO "answer_type" VALUES (2657,110,2,'２ と解答しているもの',3.1,NULL,NULL,1,'2','平行四辺形は、4つの辺の長さが等しいから。');
INSERT INTO "answer_type" VALUES (2658,110,3,'３ と解答しているもの',65.3,1,NULL,1,'3','平行四辺形は、向かい合っている辺の長さが等しいから。');
INSERT INTO "answer_type" VALUES (2659,110,4,'４ と解答しているもの',3.4,NULL,NULL,1,'4','平行四辺形は、向かい合っている角の大ささが等しいから。');
INSERT INTO "answer_type" VALUES (2660,110,5,'5 と解答しているもの',19.9,NULL,NULL,1,'5','平行四辺形は、向かい合っている辺が平行だから。');
INSERT INTO "answer_type" VALUES (2661,110,99,'上記以外の解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2662,110,0,'無解答',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2663,111,1,'式：120÷3=40　40÷2=20　　説明：①,②,③のすべてを書いているもの',30,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=37',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2664,111,2,'式：120÷3=40　40÷2=20　　説明：①,③を書いているもの',0.6,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2665,111,3,'式：120÷3=40　40÷2=20　　説明：①,②を書いているもの    ①を書いているもの',6.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2666,111,4,'式：120÷3=40　40÷2=20　　説明：②,③を書いているもの    ③を書いているもの',8.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2667,111,5,'式：120÷3=40　40÷2=20　　説明：類型1から類型4以外の解答',19.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2668,111,6,'式：120÷3=40　40÷2=20　　説明：無解答',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2669,111,7,'式：一つ目の式,または,二つ目の式で120 + 6＝20と解答　　説明：紙の横の長さが半径の長さの六つ分と等しく,半径の長さが20cmであることを書いているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2670,111,8,'一つ目の式で,120÷2と解答しているもの',5.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2671,111,99,'上記以外の解答',20.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2672,111,0,'無解答',5.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2673,113,1,'6.5と解答しているもの',90.2,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=42',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2674,113,2,'11と解答しているもの　1.1と解答しているもの',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2675,113,99,'上記以外の解答',5.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2676,113,0,'無解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2677,114,1,'ア：「15gより重く 20gより軽い」と書いている　　イ：17gと解答しているもの',26.2,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=43',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2678,114,2,'ア：「15gより重い」ことと「20gより軽い」ことを書き,実験を基に導き出した事実などを書いている　　イ：17gと解答しているもの',7.9,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2679,114,3,'ア：「15gより重い」ことと「20gより軽い」ことを書き,10gより重いことを書いている　　イ：17gと解答しているもの',11.9,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2680,114,4,'ア：「15gより重い」ことを書いている　　イ：17gと解答しているもの',4.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2681,114,5,'ア：類型1から類型4以外の解答  無解答　　イ：17gと解答しているもの',7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2682,114,6,'ア：類型1を解答  類型2を解答  類型3を解答　　イ：17 g以外を解答しているもの  無解答',15.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2683,114,7,'ア：「15gより重い」ことを書いている　　イ：17g,24gと解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2684,114,99,'上記以外の解答',20.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2685,114,0,'無解答',6.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2686,116,1,'午前9時45分,午前9時55分と解答しているもの',40,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=47',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2687,116,2,'午前9時45分と解答しているもの  午前9時55分と解答しているもの',11.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2688,116,3,'午前9時45分,午前9時55分,午前10時10分と解答しているもの       ',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2689,116,4,'午前10時と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2690,116,99,'上記以外の解答',40,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2691,116,0,'無解答',6.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2692,117,1,'3万と解答しているもの  30000と解答しているもの',54.9,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=50',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2693,117,2,'31000と解答しているもの  32000と解答しているもの  33000と解答しているもの  34000と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2694,117,3,'3と解答しているもの',2.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2695,117,4,'7万と解答しているもの  70000と解答しているもの  4万と解答しているもの  40000と解答しているもの',8.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2696,117,99,'上記以外の解答',27.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2697,117,0,'無解答',6.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2698,118,1,'①,②,③のすべてを書いているもの',5.5,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=52',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2699,118,2,'①,②,③のすべてを書いて,ボールペンを買う場合,ノートを買う場合の両方について調べる説明を書いているもの',10,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2700,118,3,'①,②を書いているもの',18.1,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2701,118,4,'買うことができる組み合わせが2通りであることを書き,その組み合わせと合計金額,500円との大小比較を書いているもの',0.1,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2702,118,5,'買うことができる組み合わせが2通りであることを書き,その組み合わせと合計金額を書いているもの',0.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2703,118,6,'類型1から類型3で,式の表現や計算などに誤りがあるもの',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2704,118,7,'①を書いて,ボールペンを買う場合,ノートを買う場合の両方,または,いずれか一方について調べる説明を書いているもの',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2705,118,8,'① を書いているもの  ② を書いているもの',39.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2706,118,99,'上記以外の解答',14.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2707,118,0,'無解答',9.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2708,120,1,'図：10枚のカードを敷き詰めた図を2通りかいている　　答え：10と解答しているもの',79.2,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=56',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2709,120,2,'図：10枚のカードを敷き詰めた図を2通りかいている　　答え：10以外を解答しているもの　無解答',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2710,120,3,'図：10枚のカードを敷き詰めた図を1通りかいている　　答え：10と解答しているもの',4.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2711,120,4,'図：10枚のカードを敷き詰めた図を1通りかいている　　答え：10以外を解答しているもの　無解答',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2712,120,5,'図：類型1から類型4以外を解答　　答え：10と解答しているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2713,120,6,'図：無解答　　答え：10と解答しているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2714,120,99,'上記以外の解答',8.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2715,120,0,'無解答',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2716,121,1,'①,②,③のすべてを書いているもの',30.8,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=57',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2717,121,2,'①,②を書いているもの  ①,③を書いているもの',25.5,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2718,121,3,'②,③を書いているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2719,121,4,'③を書いているもの',3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2720,121,5,'②を書いているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2721,121,6,'①を書いているもの',11.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2722,121,99,'上記以外の解答',10.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2723,121,0,'無解答',17.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2724,122,1,'縦に5より大きい奇数を解答し,横に7より大きい奇数を解答しているもの',49,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=60',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2725,122,2,'縦を5と解答し,横を7と解答しているもの',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2726,122,3,'縦を7と解答し,横を5と解答しているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2727,122,4,'類型1から類型3以外で,縦と横の両方に奇数を解答しているもの      ',9.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2728,122,5,'縦に偶数を解答し,横に奇数を解答しているもの  縦に奇数を解答し,横に偶数を解答しているもの',12.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2729,122,6,'縦と横の両方に偶数を解答しているもの',15.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2730,122,99,'上記以外の解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2731,122,0,'無解答',8.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2732,124,1,'20と解答しているもの',82.1,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=64',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2733,124,2,'80と解答しているもの',10.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2734,124,99,'上記以外の解答',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2735,124,0,'無解答',4.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2736,125,1,'１ と解答しているもの',72.9,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=65',1,'1','空きびんの重さは，だんだん減っている。');
INSERT INTO "answer_type" VALUES (2737,125,2,'２ と解答しているもの',3.1,NULL,NULL,1,'2','空きびんの重さは，変化していない。');
INSERT INTO "answer_type" VALUES (2738,125,3,'３ と解答しているもの',18.5,NULL,NULL,1,'3','空きびんの重さは，だんだん増えている。');
INSERT INTO "answer_type" VALUES (2739,125,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2740,125,0,'無解答',5.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2741,126,1,'番号：1   と解答　　わけ：①,②,③,④を書いているもの　　①,②,③を書いているもの　　①,②,④を書いているもの　　①,③,④を書いているもの　　②,③,④を書いているもの　　①,④を書いているもの　　②,④を書いているもの　　③,④を書いているもの　　④を書いているもの',14.7,1,'https://www.nier.go.jp/09chousakekkahoukoku/09shou_data/shiryou/04_2_shou_bunseki_sansuu.pdf#page=66',1,'1','ペットボトルの重さの割合は，4 月のほうが大きい。');
INSERT INTO "answer_type" VALUES (2742,126,2,'番号：1   と解答　　わけ：①,②を書いているもの',3.3,1,NULL,1,'2','ペットボトルの重さの割合は，4 月と 6 月で同じ。');
INSERT INTO "answer_type" VALUES (2743,126,3,'番号：1   と解答　　わけ：①,③を書いているもの　　②,③を書いているもの　　①を書いているもの　　②を書いているもの',3.8,NULL,NULL,1,'3','ペットボトルの重さの割合は，6 月のほうが大きい。');
INSERT INTO "answer_type" VALUES (2744,126,4,'番号：1   と解答　　わけ：類型1から類型3以外の解答　　無解答',9.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2745,126,5,'番号を2 と解答しているもの',42.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2746,126,6,'番号：3   と解答　　わけ：割合を 基準量÷比較量 で計算したり,判断したりしているもの',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2747,126,7,'番号：3   と解答　　わけ：①,②を書いているもの    ①を書いているもの',2.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2748,126,8,'番号：3   と解答　　わけ：類型6,類型7以外の解答    無解答',13.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2749,126,99,'上記以外の解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2750,126,0,'無解答',7.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2751,45,1,'8と解答しているもの',93.1,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=2',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2752,45,2,'18と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2753,45,99,'上記以外の解答',6.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2754,45,0,'無解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2755,46,1,'2132と解答しているもの',86.5,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=3',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2756,46,2,'2032と解答しているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2757,46,3,'260と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2758,46,99,'上記以外の解答',11.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2759,46,0,'無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2760,47,1,'6.5と解答しているもの',83.1,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=4',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2761,47,2,'11と解答しているもの  1.1と解答しているもの',13.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2762,47,99,'上記以外の解答',3.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2763,47,0,'無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2764,48,1,'1.9と解答しているもの',76.3,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=5',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2765,48,2,'19と解答しているもの',11.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2766,48,3,'19以外の位取りの誤りがあるもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2767,48,99,'上記以外の解答',8.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2768,48,0,'無解答',4.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2769,49,1,'11と解答しているもの',71.1,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=6',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2770,49,2,'20と解答しているもの',23.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2771,49,99,'上記以外の解答',5.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2772,49,0,'無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2773,50,1,'2/3と解答しているもの',73.8,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=7',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2774,50,2,'3/2と解答しているもの',5.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2775,50,3,'0.66、0.67など、商を小数で表しているもの',2.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2776,50,99,'上記以外の解答',13.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2777,50,0,'無解答',4.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2778,52,1,'68.3と解答しているもの',89.5,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=9',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2779,52,2,'683と解答しているもの',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2780,52,99,'上記以外の解答',8.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2781,52,0,'無解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2782,53,1,'１ と解答しているもの',8.6,NULL,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=10',1,'1','70');
INSERT INTO "answer_type" VALUES (2783,53,2,'２ と解答しているもの',7.2,NULL,NULL,1,'2','7');
INSERT INTO "answer_type" VALUES (2784,53,3,'３ と解答しているもの',82.3,1,NULL,1,'3','0.7');
INSERT INTO "answer_type" VALUES (2785,53,4,'４ と解答しているもの',1.3,NULL,NULL,1,'4','0.07');
INSERT INTO "answer_type" VALUES (2786,53,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2787,53,0,'無解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2788,54,1,'1、4  と解答しているもの',45.3,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=13',1,'1','●×1.2');
INSERT INTO "answer_type" VALUES (2789,54,2,'1と解答しているもの',2.9,NULL,NULL,1,'2','●×0.7');
INSERT INTO "answer_type" VALUES (2790,54,3,'4  と解答しているもの',1.8,NULL,NULL,1,'3','●÷1.3');
INSERT INTO "answer_type" VALUES (2791,54,4,'1、2  と解答しているもの',4.4,NULL,NULL,1,'4','●÷0.8');
INSERT INTO "answer_type" VALUES (2792,54,5,'1、3  と解答しているもの',12,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2793,54,99,'上記以外の解答',23.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2794,54,0,'無解答',9.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2795,56,1,'式：12÷3と解答　　答え：4と解答しているもの',83.1,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=15',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2796,56,2,'式：黄色のテーフの長さ÷赤色のテープの長さと解答　　答え：4と解答しているもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2797,56,3,'式：類型1、類型2以外を解答　無解答　　答え：4と解答しているもの',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2798,56,4,'式：類型1を解答　　答え：4以外を解答しているもの　　無解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2799,56,5,'式：3÷12と解答　　答え：4以外を解答しているもの　　無解答',3.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2800,56,6,'式：12×3と解答　　答え：4以外を解答しているもの　　無解答',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2801,56,99,'上記以外の解答',7.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2802,56,0,'無解答',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2803,57,1,'式：6÷12と解答　　答え：0.5と解答しているもの',55.7,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=16',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2804,57,2,'式：青色のテープの長さ÷黄色のテープの長さと解答　　答え：0.5と解答しているもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2805,57,3,'式：類型1,類型2以外を解答　無解答　答え：0.5と解答しているもの',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2806,57,4,'式：類型1を解答　　答え：0.5以外を解答しているもの　　無解答',4.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2807,57,5,'式：12÷6と解答　　答え：0.5以外を解答しているもの　　無解答',24,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2808,57,6,'式：6×12と解答　　答え：0.5以外を解答しているもの　　無解答',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2809,57,99,'上記以外の解答',10.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2810,57,0,'無解答',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2811,58,1,'式：8X6 と解答　　答え：48と解答しているもの',85.2,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=19',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2812,58,2,'式：底辺X高さと解答　　答え：48と解答しているもの',0.1,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2813,58,3,'式：8X7 と解答しているもの','6,5',NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2814,58,4,'式：類型1から類型3以外を解答　無解答　　答え：48と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2815,58,5,'式：類型1を解答　　答え：48以外を解答しているもの　　無解答',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2816,58,6,'式：類型1、類型3以外を解答　無解答　　答え：56と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2817,58,7,'式：8X6÷2 と解答　　答え：24と解答しているもの',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2818,58,99,'上記以外の解答',2.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2819,58,0,'無解答',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2820,60,1,'１ と解答しているもの',65.8,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=21',1,'1','空のランドセル1個の重さ');
INSERT INTO "answer_type" VALUES (2821,60,2,'２ と解答しているもの',4.8,NULL,NULL,1,'2','1円玉1枚の重さ');
INSERT INTO "answer_type" VALUES (2822,60,3,'３ と解答しているもの',25.5,NULL,NULL,1,'3','5段のとび箱全体の重さ');
INSERT INTO "answer_type" VALUES (2823,60,4,'４ と解答しているもの',3.1,NULL,NULL,1,'4','ハンカチ1枚の重さ');
INSERT INTO "answer_type" VALUES (2824,60,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2825,60,0,'無解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2826,61,1,'１ と解答しているもの',1.3,NULL,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=22',1,'1','切手1枚の面積');
INSERT INTO "answer_type" VALUES (2827,61,2,'２ と解答しているもの',17.8,1,NULL,1,'2','年賀はがき1枚の面積');
INSERT INTO "answer_type" VALUES (2828,61,3,'３ と解答しているもの',49.2,NULL,NULL,1,'3','算数の教科書1冊の表紙の面積');
INSERT INTO "answer_type" VALUES (2829,61,4,'４ と解答しているもの',30.6,NULL,NULL,1,'4','教室１部屋のゆかの面積');
INSERT INTO "answer_type" VALUES (2830,61,99,'上記以外の解答',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2831,61,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2832,62,1,'１ と解答しているもの',9.3,NULL,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=24',1,'1','半径の長さ');
INSERT INTO "answer_type" VALUES (2833,62,2,'２ と解答しているもの',76.9,1,NULL,1,'2','直径の長さ');
INSERT INTO "answer_type" VALUES (2834,62,3,'３ と解答しているもの',3,NULL,NULL,1,'3','円周の長さ');
INSERT INTO "answer_type" VALUES (2835,62,4,'４ と解答しているもの',9.7,NULL,NULL,1,'4','円の面積');
INSERT INTO "answer_type" VALUES (2836,62,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2837,62,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2838,64,1,'二等辺三角形 と解答しているもの',77.6,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=27',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2839,64,2,'直角三角形と解答しているもの',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2840,64,3,'正三角形と解答しているもの',5.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2841,64,99,'上記以外の解答',9.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2842,64,0,'無解答',6.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2843,65,1,'直角三角形と解答しているもの',64.3,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=28',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2844,65,2,'二等辺三角形 と解答しているもの',6.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2845,65,3,'正三角形と解答しているもの',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2846,65,99,'上記以外の解答',16.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2847,65,0,'無解答',11.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2848,67,1,'20と解答しているもの',91.5,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=30',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2849,67,2,'60と解答しているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2850,67,3,'40と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2851,67,99,'上記以外の解答',5.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2852,67,0,'無解答',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2853,68,1,'式：620X0.4と解答　　答え：248と解答しているもの',55.1,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=30',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2854,68,2,'式：全体の本の冊数X「物語」の本の冊数の割合と解答　　答え：248と解答しているもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2855,68,3,'式：類型1以外を解答　無解答　　答え：248と解答しているもの',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2856,68,4,'式：類型1を解答　　答え：248以外を解答しているもの　無解答',2.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2857,68,5,'式：620X40と解答　　答え：248以外を解答しているもの　無解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2858,68,6,'式：620÷0.4と解答　　答え：248以外を解答しているもの　無解答',14.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2859,68,7,'式：620÷40と解答　　答え：248以外を解答しているもの　無解答',8.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2860,68,99,'上記以外の解答',8.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2861,68,0,'無解答',7.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2862,70,1,'１ と解答しているもの',3.6,NULL,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=33',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2863,70,2,'２ と解答しているもの',6.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2864,70,3,'３ と解答しているもの',85,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2865,70,4,'４ と解答しているもの',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2866,70,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2867,70,0,'無解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2868,71,1,'①、②、③のすべてを書いているもの',6.6,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=34',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2869,71,2,'①、②、③のすべてを書いて、60cmと77cmの戸棚を置く場合、68cmと77cmの戸棚を置く場合の両方について調べているもの',5.6,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2870,71,3,'①、②を書いているもの',18.1,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2871,71,4,'類型1から類型3で、式の表現や計算などに誤りがあるもの',5.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2872,71,5,'①を書いて、60cmと77cmの戸棚を置く場合、68cmと77cmの戸棚を置く場合の両方、または、いずれか一方を調べているもの',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2873,71,6,'① を書いているもの    ② を書いているもの',25.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2874,71,99,'上記以外の解答',25.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2875,71,0,'無解答',11.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2876,73,1,'29億と解答しているもの  2900000000    と解答しているもの',84.4,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=37',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2877,73,2,'29と解答しているもの',5.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2878,73,3,'2900000000の位取りに誤りがあるもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2879,73,4,'棒グラフの中の29億以外の数値  を解答しているもの',3.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2880,73,5,'円グラフの中の数値を解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2881,73,99,'上記以外の解答',2.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2882,73,0,'無解答',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2883,74,1,'エとケと解答しているもの',58.5,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=38',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2884,74,2,'エと円グラフの中のケ以外の記号  を解答しているもの',5.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2885,74,3,'ケ と  棒グラフの中のエ以外の記号  を解答しているもの',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2886,74,99,'上記以外の解答',31.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2887,74,0,'無解答',3.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2888,75,1,'「正しくない」を選択　　わけ：①、②の両方を書いているもの　　①を書いているもの',8,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=40',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2889,75,2,'「正しくない」を選択　　わけ：②を書いているもの',6.8,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2890,75,3,'「正しくない」を選択　　わけ：：②を書いているが、大小比較について記述していないもの',2.7,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2891,75,4,'「正しくない」を選択　　わけ：:類型1から類型3で、記述の内容に誤りがあるもの',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2892,75,5,'「正しくない」を選択　　わけ：:類型1から類型4以外の解答　　:無解答',13.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2893,75,6,'「正しい」を選択しているもの',65,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2894,75,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2895,75,0,'無解答',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2896,77,1,'１ と解答しているもの',6.1,NULL,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=44',1,'1','10 × 2 × 3.14');
INSERT INTO "answer_type" VALUES (2897,77,2,'２ と解答しているもの',13.8,NULL,NULL,1,'2','10 × 10 × 3.14');
INSERT INTO "answer_type" VALUES (2898,77,3,'３ と解答しているもの',19.4,NULL,NULL,1,'3','10 × 2 × 3.14 ÷ 2');
INSERT INTO "answer_type" VALUES (2899,77,4,'４ と解答しているもの',58,1,NULL,1,'4','10 × 10 × 3.14 ÷ 2');
INSERT INTO "answer_type" VALUES (2900,77,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2901,77,0,'無解答',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2902,78,1,'2  と解答しているもの',69,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=45',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2903,78,2,'4 と解答しているもの',6.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2904,78,3,'314と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2905,78,99,'上記以外の解答',16.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2906,78,0,'無解答',7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2907,79,1,'番号：2と解答　　わけ：①、②、③のすべてを書いているもの　　②、③を書いているもの',5.3,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=46',1,'1','4 つの黒い部分をあわせた面積は，長方形アの方が大きい。');
INSERT INTO "answer_type" VALUES (2908,79,2,'番号：2と解答　　わけ：①、②を書いているもの　　②を書いているもの',18.3,1,NULL,1,'2','4 つの黒い部分をあわせた面積は，同じになる。');
INSERT INTO "answer_type" VALUES (2909,79,3,'番号：2と解答　　わけ：①、③を書いているもの　　③を書いているもの',9.8,1,NULL,1,'3','4 つの黒い部分をあわせた面積は，四角形イの方が大きい。');
INSERT INTO "answer_type" VALUES (2910,79,4,'番号：2と解答　　わけ：類型1から類型3以外の解答 　無解答　　',38.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2911,79,5,'番号を1と解答しているもの　　番号を  3と解答しているもの',18.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2912,79,99,'上記以外の解答',3.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2913,79,0,'無解答',6.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2914,81,1,'１ と解答しているもの',4.4,NULL,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=49',1,'1','1週目');
INSERT INTO "answer_type" VALUES (2915,81,2,'２ と解答しているもの',81.3,1,NULL,1,'2','2週目');
INSERT INTO "answer_type" VALUES (2916,81,3,'３ と解答しているもの',6.2,NULL,NULL,1,'3','3週目');
INSERT INTO "answer_type" VALUES (2917,81,4,'４ と解答しているもの',1.3,NULL,NULL,1,'4','4週目');
INSERT INTO "answer_type" VALUES (2918,81,5,'5 と解答しているもの',2.6,NULL,NULL,1,'5','5週目');
INSERT INTO "answer_type" VALUES (2919,81,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2920,81,0,'無解答',4.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2921,82,1,'□：3と解答　　点線□：①、②、③、④のすべてを書いているもの　②、③、④を書いているもの　　(  )：3週目、8週目、13週目と解答',22.5,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=50',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2922,82,2,'□：3と解答　　点線□：①、②、③を書いているもの ①、②、④を書いているもの ①、②を書いているもの ②、③を書いているもの ②、④を書いているもの ②を書いているもの　　　　(  )：3週目、8週目、13週目と解答',16,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2923,82,3,'□：3と解答　　点線□：類型1、類型2で、②、③を異なる表現の式で書いているもの　　(  )：3週目、8週目、13週目と解答',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2924,82,4,'□：3と解答　　点線□：類型1を解答 類型2を解答 類型3を解答　　(  )：15週目までの週を解答',10.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2925,82,5,'(       )の中に  3週目、8週目、13週目 と書いているもの',5.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2926,82,6,'(       )の中に  16週目以降の週を書いているもの',6.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2927,82,7,'□ (2箇所)の中に 3と解答しているもの',8.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2928,82,99,'上記以外の解答',28.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2929,82,0,'無解答',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2930,84,1,'答えを  6  と解答し、棒グラフで  6 cmを表す棒をかいているもの',68.8,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=53',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2931,84,2,'答えを  6  と解答し、棒グラフで12cmを表す棒をかいているもの',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2932,84,3,'答えを  6  と解答し、棒グラフで  類型1、類型2以外の棒をかいているもの  答えを  6と解答し、棒グラフが無解答',12.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2933,84,4,'答えを10と解答しているもの',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2934,84,99,'上記以外の解答',9.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2935,84,0,'無解答',4.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2936,85,1,'①、②の両方を書いているもの',19.6,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=55',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2937,85,2,'類型1で、記述の内容に誤りがあるもの',29,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2938,85,3,'①を書いているもの',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2939,85,4,'②を書いているもの',4.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2940,85,5,'類型3、類型4で、記述の内容に誤りがあるもの',10.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2941,85,99,'上記以外の解答',13.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2942,85,0,'無解答',21.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2943,86,1,'１ と解答しているもの',28.2,1,'https://www.nier.go.jp/08chousakekkahoukoku/08shou_data/houkokusho/05_shou_bunseki_sansuu.pdf#page=57',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2944,86,2,'２ と解答しているもの',26.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2945,86,3,'３ と解答しているもの',32.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2946,86,99,'上記以外の解答',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2947,86,0,'無解答',11.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2948,2,1,'100 と解答しているもの',98.3,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=2',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2949,2,2,'90 と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2950,2,99,'上記以外の解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2951,2,0,'無解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2952,3,1,'91.8 と解答しているもの',85.6,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=3',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2953,3,2,' 918 と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2954,3,3,'918 以外の位取りの誤りがあるもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2955,3,4,'18.9 や 189 などと解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2956,3,99,'上記以外の解答',11.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2957,3,0,'無解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2958,4,1,'7.44 と解答しているもの',84.8,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=4',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2959,4,2,'74.4 と解答しているもの',6.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2960,4,3,'744 と解答しているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2961,4,4,'74.4、744 以外の位取りの誤りがあるもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2962,4,99,'上記以外の解答',7.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2963,4,0,'無解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2964,5,1,'20 と解答しているもの',73,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=5',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2965,5,2,' ２ と解答しているもの',16.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2966,5,3,'0.2 と解答しているもの',6.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2967,5,4,'２、0.2 以外の位取りの誤りがあるもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2968,5,5,'除数と被除数を逆にして計算を考えているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2969,5,99,'上記以外の解答',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2970,5,0,'無解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2971,6,1,'3/8と解答しているもの',93.8,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=6',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2972,6,2,'5/8と解答しているもの',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2973,6,99,'上記以外の解答',4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2974,6,0,'無解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2975,7,1,'１ と解答しているもの',53.1,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=7',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2976,7,2,'7/7と解答しているもの',13.4,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2977,7,3,'7/7 と １ の両方を解答しているもの',31.9,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2978,7,4,'7/14と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2979,7,99,'上記以外の解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2980,7,0,'無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2981,8,1,' ７ と解答しているもの',69.1,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=8',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2982,8,2,'13 と解答しているもの',13.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2983,8,3,'16 と解答しているもの',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2984,8,99,'上記以外の解答',13,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2985,8,0,'無解答',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2986,9,1,'１ と解答しているもの',6.8,NULL,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=9',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2987,9,2,'２ と解答しているもの',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2988,9,3,'３ と解答しているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2989,9,4,'４ と解答しているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2990,9,5,'5 と解答しているもの',89.3,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2991,9,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2992,9,0,'無解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2993,11,1,'ク と解答しているもの',95.1,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=11',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2994,11,99,'上記以外の解答',4.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2995,11,0,'無解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2996,12,1,' ケ と解答しているもの',55.9,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=12',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2997,12,2,'カ と解答しているもの',3.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2998,12,3,'ク と解答しているもの',17.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (2999,12,99,'上記以外の解答',20.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3000,12,0,'無解答',2.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3001,13,1,'１ と解答しているもの',4.5,NULL,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=14',1,'1','砂糖を 0.6 kg 買って，210 円はらいました。この砂糖 1 kg のねだんはいくらでしょう。');
INSERT INTO "answer_type" VALUES (3002,13,2,'２ と解答しているもの',10.3,NULL,NULL,1,'2',' 210 kg の大豆を 0.6 kg ずつふくろにつめます。大豆を全部つめるには，ふくろはいくついるでしょう。');
INSERT INTO "answer_type" VALUES (3003,13,3,'３ と解答しているもの',54.3,1,NULL,1,'3','1 m のねだんが 210 円のリボンを 0.6 m 買いました。リボンの代金はいくらでしょう。');
INSERT INTO "answer_type" VALUES (3004,13,4,'４ と解答しているもの',30.1,NULL,NULL,1,'4','赤いテープの長さは 210 cm です。赤いテープの長さは白いテープの長さの 0.6 倍です。白いテープの長さは何 cm でしょう。');
INSERT INTO "answer_type" VALUES (3005,13,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3006,13,0,'無解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3007,15,1,'式：４×６ と解答　　答え：24 と解答しているもの',95.8,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=16',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3008,15,2,'式： 底辺×高さ と解答　　答え：24 と解答しているもの',0.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3009,15,3,'式：類型１、２以外の式を解答　無解答　　答え：24 と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3010,15,4,'式： 類型１を解答　　答え：24 以外を解答しているもの　無解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3011,15,5,'式： ４×６÷２ と解答　　答え：12 と解答しているもの',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3012,15,99,'上記以外の解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3013,15,0,'無解答',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3014,16,1,'式：６×４÷２ と解答　　答え：12 と解答しているもの',89.3,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=17',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3015,16,2,'式：24÷２ や ４×３ などと解答　　答え：12 と解答しているもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3016,16,3,'式：底辺×高さ÷２ と解答　　答え：12 と解答しているもの',0.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3017,16,4,'式：類型１から３以外の式を解答 無解答　　答え：12 と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3018,16,5,'式：類型１、２を解答　　答え：12 以外を解答しているもの 無解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3019,16,6,'式： ６×４ と解答　　答え：24 と解答しているもの',6.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3020,16,99,'上記以外の解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3021,16,0,'無解答',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3022,17,1,'式：10×10×3.14 と解答　　答え：314 と解答しているもの',72.9,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=18',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3023,17,2,'式：100×3.14 などと解答　　答え：314 と解答しているもの',0.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3024,17,3,'式：半径×半径×円周率 と解答　　答え：314 と解答しているもの',0.1,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3025,17,4,'式： 類型１から３以外の式を解答 無解答　　答え：314 と解答しているもの',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3026,17,5,'式：類型１、２を解答　　答え：314 以外を解答しているもの 無解答のもの',6.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3027,17,6,'式：10×10×３ などと解答　　答え：300 などと解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3028,17,7,'式：円周を求める式を書いているもの　　答え：62.8 などと解答しているもの',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3029,17,8,'式：10×3.14 と解答しているもの　　答え：31.4 と解答しているもの',5.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3030,17,99,'上記以外の解答',6.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3031,17,0,'無解答',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3032,19,1,' 70 と解答しているもの',83.8,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=20',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3033,19,2,'75 と解答しているもの',4.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3034,19,3,'80 と解答しているもの',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3035,19,99,'上記以外の解答',8.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3036,19,0,'無解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3037,20,1,'１ と解答しているもの',1.5,NULL,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=21',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3038,20,2,'２ と解答しているもの',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3039,20,3,'３ と解答しているもの',6.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3040,20,4,'４ と解答しているもの',88.6,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3041,20,5,'5 と解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3042,20,99,'上記以外の解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3043,20,0,'無解答',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3044,22,1,' ５ と解答しているもの',82.5,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=23',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3045,22,2,'13 と解答しているもの',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3046,22,3,'10 と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3047,22,99,'上記以外の解答',12.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3048,22,0,'無解答',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3049,23,1,'下の表のように解答しているもの（完答）
たて（cm） １ ２ ３ ４ ５ ６ ７
横　（cm） ７ ６ ５ ４ ３ ２ １',75.4,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=24',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3050,23,2,'類型１の表の「たて２、横６」と「たて３、横５」が正しく表されており、その他の箇所に誤りがあるもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3051,23,3,'類型１の表の「たて２、横６」が正しく表されており、「たて３、横５」に誤りがあるもの（その他の箇所に誤りがあるものも含む）',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3052,23,4,'下の表のように解答しているもの
たて（cm） １ ２ ３  ４  ５  ６  ７
横　（cm） ７ ８ ９ 10 11 12 13',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3053,23,5,'下の表のように解答しているもの
たて（cm） １ ２  ３   ４  ５   ６  ７
横　（cm） ７ 14 21 28 35 42 49',18.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3054,23,99,'上記以外の解答',2.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3055,23,0,'無解答',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3056,24,1,'数： １ と解答　　言葉：減る と解答しているもの',75.3,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=25',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3057,24,2,'数： １以外を解答 無解答　　言葉：減る と解答しているもの',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3058,24,3,'数： １ と解答　　言葉：増える と解答しているもの',7.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3059,24,4,'数： ７ と解答　　言葉：増える と解答しているもの',13,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3060,24,5,'数：  １、７以外を解答 無解答　　言葉：増える と解答しているもの',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3061,24,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3062,24,0,'無解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3063,26,1,'3と5と解答しているもの',67.5,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=27',1,'1','5+3');
INSERT INTO "answer_type" VALUES (3064,26,2,'3 のみを正しく解答しているもの（2と3と解答しているものは除く）',6.4,NULL,NULL,1,'2','5×3');
INSERT INTO "answer_type" VALUES (3065,26,3,'5 のみを正しく解答しているもの（2と5と解答しているものは除く）',7.5,NULL,NULL,1,'3','5+3+5+3');
INSERT INTO "answer_type" VALUES (3066,26,4,' 2が含まれているもの',17.4,NULL,NULL,1,'4','5×3×2');
INSERT INTO "answer_type" VALUES (3067,26,99,'上記以外の解答',0.7,NULL,NULL,1,'5','(5+3)×2');
INSERT INTO "answer_type" VALUES (3068,26,0,'無解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3069,27,1,'１ と解答しているもの',3.8,NULL,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=28',1,'1','5×3+3×9');
INSERT INTO "answer_type" VALUES (3070,27,2,'２ と解答しているもの',3.5,NULL,NULL,1,'2','3×6-5×3');
INSERT INTO "answer_type" VALUES (3071,27,3,'３ と解答しているもの',88.2,1,NULL,1,'3','6×9-3×5');
INSERT INTO "answer_type" VALUES (3072,27,4,'４ と解答しているもの',2.8,NULL,NULL,1,'4','3×9-3×5');
INSERT INTO "answer_type" VALUES (3073,27,99,'上記以外の解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3074,27,0,'無解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3075,28,1,' ①、②、③を「６×９－３×５」の式を用いて表し、④を書いているもの',7.9,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=29',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3076,28,2,'①、②、③、④のすべてを書いているもの',8.9,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3077,28,3,'①、②、④を書いているもの',28,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3078,28,4,' ②、③、④を書いているもの',1.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3079,28,5,'②、④を書いているもの',22.1,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3080,28,6,'すべての白い部分の面積が39㎡になることを書いているもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3081,28,7,' 「６×９－３×５」の式のみを書いているもの',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3082,28,8,'①、③、④を書いているもの  ①、④を書いているもの  ③、④を書いているもの  ④を書いているもの',12.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3083,28,99,'上記以外の解答',9.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3084,28,0,'無解答',8.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3085,29,1,'①、②、③のすべてを書いているもの',55.7,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=32',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3086,29,2,'32を２×16とみて、25を５×５に分解せずに、①を書いているもの',0.5,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3087,29,3,'①を書いているもの',2.8,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3088,29,4,'類型１から類型３の計算の工夫を書いているが、式の表現や計算に誤りがあるもの',3.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3089,29,5,'25×32を筆算で計算しているもの（筆算の考えを用いて計算しているものも含む）',4.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3090,29,6,' ②を書いているが、計算の過程を書いていないもの    25×４を用いることを書いているが、計算の過程を書いていないもの',4.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3091,29,99,'上記以外の解答',19.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3092,29,0,'無解答',9.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3093,31,1,' 1983年を２、2003年を３ と解答しているもの',91,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=35',1,'1','男性 15 ～ 39 歳');
INSERT INTO "answer_type" VALUES (3094,31,2,'1983年の２ のみを正しく解答しているもの',5.2,NULL,NULL,1,'2','男性 40 ～ 59 歳');
INSERT INTO "answer_type" VALUES (3095,31,3,' 2003年の３ のみを正しく解答しているもの',1.6,NULL,NULL,1,'3','男性 60 歳～');
INSERT INTO "answer_type" VALUES (3096,31,99,'上記以外の解答',1.6,NULL,NULL,1,'4','女性');
INSERT INTO "answer_type" VALUES (3097,31,0,'無解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3098,32,1,'①を書いているもの    ①、②を書いているもの',85.1,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=36',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3099,32,2,' ②を書いているもの',0.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3100,32,3,'①の否定を書いているもの(全体の数が変わっていないことや増加しているということを書いている)',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3101,32,99,'上記以外の解答',10.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3102,32,0,'無解答',3.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3103,33,1,'２と４ と解答しているもの',54.1,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=37',1,'1','漁業にたずさわる人の数が，減っていること。');
INSERT INTO "answer_type" VALUES (3104,33,2,'2 のみを正しく解答しているもの',28.7,NULL,NULL,1,'2','「男性 15 ∼ 39 歳」の漁業にたずさわる人の数の割合が，減っていること。');
INSERT INTO "answer_type" VALUES (3105,33,3,'4 のみを正しく解答しているもの',8.9,NULL,NULL,1,'3','「女性」の漁業にたずさわる人の数の割合が，およそ半分になっていること。');
INSERT INTO "answer_type" VALUES (3106,33,99,'上記以外の解答',7,NULL,NULL,1,'4','「男性60 歳∼」の漁業にたずさわる人の数の割合が，2 倍よりも増えていること。');
INSERT INTO "answer_type" VALUES (3107,33,0,'無解答',1.2,NULL,NULL,1,'5','「男性 60 歳∼」の漁業にたずさわる人の数が，2 倍よりも増えていること。');
INSERT INTO "answer_type" VALUES (3108,35,1,'ＡからＣのいずれかで、①、②、③、④のすべてを書いているもの',17.7,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=40',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3109,35,2,'ＡからＣのいずれかで、①、②、④を書いているもの    ＡからＣのいずれかで、①、③、④を書いているもの　　ＡからＣのいずれかで、②、③、④を書いているもの　　ＡからＣのいずれかで、③、④を書いているもの',11.8,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3110,35,3,'類型１、２で式の表現に誤りがあり、④を書いているもの',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3111,35,4,'Ａの①を書いていて、④を書いているもの　　木曜日のチーズケーキとチョコレートケーキの値段を求める式をそれぞれ書いて、④を書いているもの',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3112,35,5,'類型１から４以外で④を書いているもの',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3113,35,6,'類型１、２で、④を書いていないもの',6.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3114,35,7,'Ａの①を書いているもの　　チーズケーキとチョコレートケーキの木曜日の値段を求める式をそれぞれ書いているもの',4.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3115,35,8,'Ｂの①を木曜日の代金を求める式と考えているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3116,35,99,'上記以外の解答',45.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3117,35,0,'無解答',8.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3118,36,1,'チーズケーキ と イチゴケーキ と解答しているもの',35,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=41',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3119,36,2,'ロールケーキ と イチゴケーキ と解答しているもの',24.3,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3120,36,3,' 類型１、２でケーキの名前を値段で書いているもの',0,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3121,36,4,'ロールケーキ と ロールケーキ と解答しているもの　　ロールケーキ２個 と解答しているもの',3.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3122,36,5,'ロールケーキ と チーズケーキ と解答しているもの',14.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3123,36,99,'上記以外の解答',14.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3124,36,0,'無解答',14.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3125,38,1,'次のようにかいているもの',67.8,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=45',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3126,38,2,' 次のようにかいているもの',3.6,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3127,38,3,'類型１、２の両方をかいているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3128,38,4,'来た道の一部を含んで、同じ道のりの線をかいているもの（来た道と全く同じ線をかいているものは除く）',5.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3129,38,5,'来た道を含んでいないが、異なる道のりの線をかいているもの',9.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3130,38,99,'上記以外の解答',7.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3131,38,0,'無解答',6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3132,39,1,' 日曜日 と解答しているもの',79.2,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=46',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3133,39,2,'土曜日 と解答しているもの',18.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3134,39,99,'上記以外の解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3135,39,0,'無解答',1.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3136,40,1,'①、②、③、④のすべてを書いているもの　　①、②、③を書いているもの　　①、③、④を書いているもの',17.7,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=47',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3137,40,2,'①、②、④を書いているもの　　①、②を書いているもの',0.5,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3138,40,3,'類型１、２で、２つの公園の面積を求める計算に誤りがあるもの',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3139,40,4,'①を書いていて、面積を求めることについて書いているが、それを求める式や求めた面積について書いていないもの',4.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3140,40,5,' 中央公園の面積を「底辺×斜辺」で求めているもの',34.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3141,40,6,'辺の長さや周の長さで比較しているもの',7.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3142,40,7,' ①を書いているもの',9.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3143,40,99,'上記以外の解答',20.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3144,40,0,'無解答',3.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3145,42,1,'１ と解答しているもの',7,NULL,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=50',1,'1','記録は，めあてとなる高さとちょうど同じ。');
INSERT INTO "answer_type" VALUES (3146,42,2,'２ と解答しているもの',65.1,1,NULL,1,'2','記録は，めあてとなる高さを上回っている。');
INSERT INTO "answer_type" VALUES (3147,42,3,'３ と解答しているもの',19.6,NULL,NULL,1,'3','記録は，めあてとなる高さを下回っている。');
INSERT INTO "answer_type" VALUES (3148,42,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3149,42,0,'無解答',8.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3150,43,1,'①、②、③のすべてを書いているもの',3,1,'https://www.nier.go.jp/tyousakekka/gaiyou_shou/19shou_houkoku4_2.pdf#page=51',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3151,43,2,'②、③を書いているもの',14.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3152,43,3,' ①、②を書いているもの',2.5,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3153,43,4,'②のみを書いているもの',25.8,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3154,43,5,'①、③を書いていて、２人の身長に関する部分が異なることのみを書いているもの　　③を書いていて、２人の身長の値が異なることのみを書いているもの　　①を書いていて、２人の身長に関する部分が異なることのみを書いているもの',6.1,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3155,43,6,'２人の身長の値が異なることのみを書いているもの',7.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3156,43,7,' めあての値を計算して求め、それをもとにして説明しているもの',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3157,43,99,'上記以外の解答',19.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3158,43,0,'無解答',20.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3159,556,1,'4200 と解答しているもの',92.4,1,'https://www.nier.go.jp/22chousakekkahoukoku/report/data/22pmath_04.pdf#page=4',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3160,556,2,' 420 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3161,556,3,' 4020 と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3162,556,4,'40200 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3163,556,5,' 6000 と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3164,556,6,'600 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3165,556,7,'4050 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3166,556,8,' 1200 と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3167,556,9,' 1054 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3168,556,99,'上記以外の解答',5.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3169,556,0,'無解答',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3170,557,1,' 42 と解答しているもの',72.4,1,'https://www.nier.go.jp/22chousakekkahoukoku/report/data/22pmath_04.pdf#page=6',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3171,557,2,'294 と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3172,557,3,'類型１、類型２以外で、14と21の公倍数を解答しているもの',3.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3173,557,4,'７ と解答しているもの',12.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3174,557,5,' １ と解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3175,557,6,'42を含めて14と21の公倍数を複数解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3176,557,7,'類型１から類型３以外で、14の倍数を解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3177,557,8,'類型１から類型３以外で、21の倍数を解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3178,557,9,'２ と解答しているもの　３ と解答しているもの',2.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3179,557,99,'上記以外の解答',4.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3180,557,0,'無解答',2.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3181,558,1,'①、②の全てを書いているもの',76.1,1,'https://www.nier.go.jp/22chousakekkahoukoku/report/data/22pmath_04.pdf#page=10',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3182,558,2,'①を書いているもの',8.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3183,558,3,'②を書いているもの',2.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3184,558,99,'上記以外の解答',7.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3185,558,0,'無解答',5.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3186,559,1,'ア と解答しているもの',34.9,1,'https://www.nier.go.jp/22chousakekkahoukoku/report/data/22pmath_04.pdf#page=12',1,'ア','85を小さくみて80，21を小さくみて20として計算します。');
INSERT INTO "answer_type" VALUES (3187,559,2,'イ と解答しているもの',4.7,NULL,NULL,1,'イ','85を小さくみて80，21を大きくみて30として計算します。');
INSERT INTO "answer_type" VALUES (3188,559,3,'ウ と解答しているもの',49.7,NULL,NULL,1,'ウ','85を大きくみて90，21を小さくみて20として計算します。');
INSERT INTO "answer_type" VALUES (3189,559,4,'エ と解答しているもの',9.3,NULL,NULL,1,'エ','85を大きくみて90，21を大きくみて30として計算します。');
INSERT INTO "answer_type" VALUES (3190,559,99,'上記以外の解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3191,559,0,'無解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3192,561,1,'1/4と解答しているもの',45.5,1,'https://www.nier.go.jp/22chousakekkahoukoku/report/data/22pmath_04.pdf#page=20',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3193,561,2,'25/100と解答しているもの',25.5,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3194,561,3,' 類型１、類型２以外で1/4と大きさの等しい分数を解答しているもの',0.3,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3195,561,4,'0.25と解答しているもの',5.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3196,561,5,' 25％と解答しているもの',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3197,561,6,' ２割５分と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3198,561,7,'４と解答しているもの',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3199,561,99,'上記以外の解答',17.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3200,561,0,'無解答',3.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3201,562,1,'400 と解答しているもの',64.8,1,'https://www.nier.go.jp/22chousakekkahoukoku/report/data/22pmath_04.pdf#page=22',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3202,562,2,'40 と解答しているもの',4.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3203,562,3,'４ と解答しているもの',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3204,562,4,'0.4 と解答しているもの',3.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3205,562,5,'0.04 と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3206,562,6,'2/5 と解答しているもの（大きさの等しい分数を含む）',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3207,562,7,'2500 と解答しているもの',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3208,562,8,'250 と解答しているもの',7.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3209,562,9,' 25 と解答しているもの',5.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3210,562,10,'2.5 と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3211,562,11,'940 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3212,562,99,'上記以外の解答',8.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3213,562,0,'無解答',3.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3214,563,1,'１ と解答しているもの',67.7,NULL,'https://www.nier.go.jp/22chousakekkahoukoku/report/data/22pmath_04.pdf#page=24',1,'1','飲み物の量が 1/2 になると，果汁の割合も 1/2 になります。');
INSERT INTO "answer_type" VALUES (3215,563,2,'２ と解答しているもの ',9.2,NULL,NULL,1,'2','飲み物の量が 1/2 になると，果汁の割合は2倍になります。');
INSERT INTO "answer_type" VALUES (3216,563,3,'３ と解答しているもの',21.6,1,NULL,1,'3','飲み物の量が 1/2 になっても，果汁の割合は変わりません。');
INSERT INTO "answer_type" VALUES (3217,563,99,'上記以外の解答',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3218,563,0,'無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3219,564,1,'求め方：①、②の全てを書いている　　答え：600 と解答しているもの',48.3,1,'https://www.nier.go.jp/22chousakekkahoukoku/report/data/22pmath_04.pdf#page=27',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3220,564,2,'求め方：①、②の全てを書いている　　答え：600 以外を解答しているもの　無解答',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3221,564,3,'求め方：①を書いている　　答え：600 と解答しているもの',6.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3222,564,4,'求め方：①を書いている　　答え：600 以外を解答しているもの　無解答',4.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3223,564,5,'求め方：②を書いている　　答え：600 と解答しているもの',11.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3224,564,6,'求め方：②を書いている　　答え：600 以外を解答しているもの　無解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3225,564,7,'求め方：180÷0.3を書いているもの　　答え：600 と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3226,564,8,'求め方：180÷0.3を書いているもの　　答え：600 以外を解答しているもの　無解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3227,564,9,'求め方：180×0.3を書いているもの　　答え：600 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3228,564,10,'求め方：180×0.3を書いているもの　　答え：600 以外を解答しているもの　無解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3229,564,11,'求め方：180－(180以外の果汁の量）を用いた式を書いているもの　　答え：600 と解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3230,564,12,'求め方：180－(180以外の果汁の量）を用いた式を書いているもの　　答え：600 以外を解答しているもの　無解答',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3231,564,13,'求め方：類型１から類型12以外の解答　無解答　　答え：600 と解答しているもの',13.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3232,564,99,'上記以外の解答',7.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3233,564,0,'無解答',5.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3234,566,1,'式： 48－(17＋13＋12） と解答　　答え：６ と解答しているもの',71.9,1,'https://www.nier.go.jp/22chousakekkahoukoku/report/data/22pmath_04.pdf#page=37',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3235,566,2,'式： 48－17－13－12 と解答　　答え：６ と解答しているもの',2.4,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3236,566,3,'式： 17＋13＋12＋□＝48 と解答　　答え：６ と解答しているもの',1.2,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3237,566,4,'式： 48－17＋13＋12 と解答　　答え：６ と解答しているもの',1.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3238,566,5,'式：類型１から類型４以外の式　無解答　　答え：６ と解答しているもの',10.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3239,566,6,'式：類型１の式を解答　　答え：６ 以外を解答しているもの　無解答',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3240,566,7,'式：類型２の式を解答　　答え：６ 以外を解答しているもの　無解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3241,566,8,'式：類型３の式を解答　　答え：６ 以外を解答しているもの　無解答',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3242,566,9,'式：類型４の式を解答　　答え：６ 以外を解答しているもの　無解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3243,566,10,'式：17＋13＋12 と解答　17＋13＋12＋48 と解答　　答え：６ 以外を解答しているもの　無解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3244,566,11,'式：学級の人数24を用いて解答　　答え：６ 以外を解答しているもの　無解答',0.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3245,566,99,'上記以外の解答',5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3246,566,0,'無解答',2.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3247,567,1,'２、４ と解答しているもの',64.1,1,'https://www.nier.go.jp/22chousakekkahoukoku/report/data/22pmath_04.pdf#page=40',1,'1','クイズ');
INSERT INTO "answer_type" VALUES (3248,567,2,'１、２ と解答しているもの',5.2,NULL,NULL,1,'2','宝探し');
INSERT INTO "answer_type" VALUES (3249,567,3,'２、３ と解答しているもの',2.5,NULL,NULL,1,'3','しりとり');
INSERT INTO "answer_type" VALUES (3250,567,4,'１、４ と解答しているもの',23.2,NULL,NULL,1,'4','ビンゴ');
INSERT INTO "answer_type" VALUES (3251,567,5,'３、４ と解答しているもの',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3252,567,6,'１、３ と解答しているもの',1.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3253,567,7,'２のみを解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3254,567,8,'４のみを解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3255,567,9,'１のみを解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3256,567,10,'３のみを解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3257,567,99,'上記以外の解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3258,567,0,'無解答',1.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3259,568,1,'グラフ：ウ と解答　　遊び：縄とび と解答しているもの',66.9,1,'https://www.nier.go.jp/22chousakekkahoukoku/report/data/22pmath_04.pdf#page=42',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3260,568,2,'グラフ：ウ と解答　　遊び：輪投げ と解答しているもの',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3261,568,3,'グラフ：ウ と解答　　遊び：かくれんぼ と解答しているもの',12.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3262,568,4,'グラフ：ウ と解答　　遊び：なぞなぞ と解答しているもの',2.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3263,568,5,'グラフ：ウ と解答　　遊び：紙飛行機 と解答しているもの',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3264,568,6,'グラフ：ウ と解答　　遊び：類型１から類型５以外の解答　無解答',1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3265,568,7,'グラフ：ア と解答　　遊び：縄とび と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3266,568,8,'グラフ：ア と解答　　遊び：輪投げ と解答しているもの',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3267,568,9,'グラフ：ア と解答　　遊び：類型７、類型８以外の解答　無解答',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3268,568,10,'グラフ：イ と解答　　遊び：縄とび と解答しているもの',3.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3269,568,11,'グラフ：イ と解答　　遊び：縄とび 以外を解答しているもの　無解答',1.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3270,568,99,'上記以外の解答',3.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3271,568,0,'無解答',2.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3272,569,1,'求め方：①、②、③の全てを書いている　　答え：180 と解答しているもの',67.9,1,'https://www.nier.go.jp/22chousakekkahoukoku/report/data/22pmath_04.pdf#page=45',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3273,569,2,'求め方：①、②、③の全てを書いている　　答え：計算の順序についてのきまりに従わずに解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3274,569,3,'求め方：①、②、③の全てを書いている　　答え：類型１、類型２以外の解答　無解答',3.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3275,569,4,'求め方：①、②を書いている　　答え：180 と解答しているもの',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3276,569,5,'求め方：①、②を書いている　　答え：180 以外を解答しているもの　無解答',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3277,569,6,'求め方：①、③を書いている　②、③を書いている　　答え：180 と解答しているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3278,569,7,'求め方：①、③を書いている　②、③を書いている　　答え：計算の順序についてのきまりに従わずに解答しているもの',0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3279,569,8,'求め方：①、③を書いている　②、③を書いている　　答え：類型６、類型７以外の解答　無解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3280,569,9,'求め方：③を書いている　　答え：180 と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3281,569,10,'求め方：③を書いている　　答え：180 以外を解答しているもの　無解答',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3282,569,11,'求め方：①を書いている　 ②を書いている　　答え：180 と解答しているもの',0.4,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3283,569,12,'求め方：①を書いている　 ②を書いている　　答え：180 以外を解答しているもの　無解答',5.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3284,569,13,'求め方：類型１から類型12以外の解答　無解答　　答え：180 と解答しているもの',1.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3285,569,14,'求め方：類型１から類型12以外の解答　無解答　　答え：170 と解答しているもの　160 と解答しているもの　150 と解答しているもの　75 と解答しているもの',3.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3286,569,15,'求め方：類型１から類型12以外の解答　無解答　　答え：22 と解答しているもの',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3287,569,99,'上記以外の解答',6.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3288,569,0,'無解答',8.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3289,571,1,'記号：イ と解答　　正しい命令：①、②の全てを書いているもの',49.1,1,'https://www.nier.go.jp/22chousakekkahoukoku/report/data/22pmath_04.pdf#page=56',1,'ア','5cm の直線を引く。');
INSERT INTO "answer_type" VALUES (3290,571,2,'記号：イ と解答　　正しい命令：①について右と書き、②を書いているもの',0.3,NULL,NULL,1,'イ','左に60°回転する。');
INSERT INTO "answer_type" VALUES (3291,571,3,'記号：イ と解答　　正しい命令：②を書いているもの',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3292,571,4,'記号：イ と解答　　正しい命令：①を書き、②について60°と書いているもの',7.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3293,571,5,'記号：イ と解答　　正しい命令：①について右と書き、②について60°と書いているもの',11.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3294,571,6,'記号：イ と解答　　正しい命令：類型４、類型５以外で、②について60°と書いているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3295,571,7,'記号：イ と解答　　正しい命令：類型１から類型６以外で、角の大きさについて書いているもの',8.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3296,571,8,'記号：イ と解答　　正しい命令：長さについて書いているもの',0.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3297,571,9,'記号：イ と解答　　正しい命令：類型１から類型８以外の解答　無解答',5.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3298,571,10,'記号：ア と解答　　正しい命令：①、②の全てを書いているもの',0.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3299,571,11,'記号：ア と解答　　正しい命令：②を書いているもの',0.1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3300,571,12,'記号：ア と解答　　正しい命令：類型10、類型11以外で、角の大きさについて書いているもの',2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3301,571,13,'記号：ア と解答　　正しい命令：長さについて書いているもの',2.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3302,571,14,'記号：ア と解答　　正しい命令：類型10から類型13以外の解答　無解答',2.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3303,571,99,'上記以外の解答',3.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3304,571,0,'無解答',3.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3305,572,1,'㋐：３ と解答　　㋑：５ と解答しているもの',83.3,1,'https://www.nier.go.jp/22chousakekkahoukoku/report/data/22pmath_04.pdf#page=59',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3306,572,2,'㋐：５ と解答　　㋑：３ と解答しているもの',4.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3307,572,3,'㋐：３ と解答　　㋑：３ と解答しているもの',1.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3308,572,4,'㋐：５ と解答　　㋑：５ と解答しているもの',3.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3309,572,5,'㋐：３ と解答　　㋑：３、５ 以外を解答しているもの　無解答',0.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3310,572,6,'㋐：３、５ 以外の解答　無解答　　㋑：５ と解答しているもの',0.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3311,572,7,'類型５、類型６以外で、90と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3312,572,8,'類型５から類型７以外で、８、10、11、13、16と解答しているもの',0.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3313,572,99,'上記以外の解答',1.8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3314,572,0,'無解答',4.6,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3315,573,1,'ア と解答しているもの',18,NULL,'https://www.nier.go.jp/22chousakekkahoukoku/report/data/22pmath_04.pdf#page=62',NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3316,573,2,'イ と解答しているもの',66.7,1,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3317,573,3,'ウ と解答しているもの',6.2,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3318,573,4,'エ と解答しているもの',3.9,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3319,573,99,'上記以外の解答',0.7,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3320,573,0,'無解答',4.5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3321,574,1,'１ と解答しているもの',11.2,NULL,'https://www.nier.go.jp/22chousakekkahoukoku/report/data/22pmath_04.pdf#page=65',1,'1','二等辺三角形');
INSERT INTO "answer_type" VALUES (3322,574,2,'２ と解答しているもの',4.5,NULL,NULL,1,'2','長方形');
INSERT INTO "answer_type" VALUES (3323,574,3,'３ と解答しているもの',57.7,1,NULL,1,'3','平行四辺形');
INSERT INTO "answer_type" VALUES (3324,574,4,'４ と解答しているもの',12.6,NULL,NULL,1,'4','ひし形');
INSERT INTO "answer_type" VALUES (3325,574,5,'５ と解答しているもの',7.7,NULL,NULL,1,'5','正六角形');
INSERT INTO "answer_type" VALUES (3326,574,99,'上記以外の解答',1.3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "answer_type" VALUES (3327,574,0,'無解答',5,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "image" VALUES (1,373,1,'2021-1.PNG');
INSERT INTO "image" VALUES (2,374,1,'2021-2.PNG');
INSERT INTO "image" VALUES (3,375,1,'2021-3.PNG');
INSERT INTO "image" VALUES (4,375,2,'2021-4.PNG');
INSERT INTO "image" VALUES (5,376,1,'2021-5.PNG');
INSERT INTO "image" VALUES (6,377,1,'2021-6.PNG');
INSERT INTO "image" VALUES (7,378,1,'2021-7.PNG');
INSERT INTO "image" VALUES (8,380,1,'2021-8.PNG');
INSERT INTO "image" VALUES (9,380,2,'2021-9.PNG');
INSERT INTO "image" VALUES (10,381,1,'2021-10.PNG');
INSERT INTO "image" VALUES (11,381,2,'2021-11.PNG');
INSERT INTO "image" VALUES (12,382,1,'2021-12.PNG');
INSERT INTO "image" VALUES (13,382,2,'2021-13.PNG');
INSERT INTO "image" VALUES (14,385,1,'2021-14.PNG');
INSERT INTO "image" VALUES (15,385,2,'2021-15.PNG');
INSERT INTO "image" VALUES (16,386,1,'2021-16.PNG');
INSERT INTO "image" VALUES (17,386,2,'2021-17.PNG');
INSERT INTO "image" VALUES (18,386,3,'2021-18.PNG');
INSERT INTO "image" VALUES (19,387,1,'2021-19.PNG');
INSERT INTO "image" VALUES (20,389,1,'2021-20.PNG');
INSERT INTO "image" VALUES (21,391,1,'2021-21.PNG');
INSERT INTO "image" VALUES (22,391,2,'2021-22.PNG');
INSERT INTO "image" VALUES (23,391,3,'2021-23.PNG');
INSERT INTO "image" VALUES (24,516,1,'2020-1.PNG');
INSERT INTO "image" VALUES (25,516,2,'2020-2.PNG');
INSERT INTO "image" VALUES (26,517,1,'2020-3.PNG');
INSERT INTO "image" VALUES (27,517,2,'2020-4.PNG');
INSERT INTO "image" VALUES (28,518,1,'2020-5.PNG');
INSERT INTO "image" VALUES (29,518,2,'2020-6.PNG');
INSERT INTO "image" VALUES (30,519,1,'2020-7.PNG');
INSERT INTO "image" VALUES (31,519,2,'2020-8.PNG');
INSERT INTO "image" VALUES (32,519,3,'2020-8-1.PNG');
INSERT INTO "image" VALUES (33,520,1,'2020-9.PNG');
INSERT INTO "image" VALUES (34,520,2,'2020-9-1.PNG');
INSERT INTO "image" VALUES (35,522,1,'2020-10.PNG');
INSERT INTO "image" VALUES (36,522,2,'2020-11.PNG');
INSERT INTO "image" VALUES (37,523,1,'2020-12.PNG');
INSERT INTO "image" VALUES (38,523,2,'2020-13.PNG');
INSERT INTO "image" VALUES (39,523,3,'2020-14.PNG');
INSERT INTO "image" VALUES (40,523,4,'2020-15.PNG');
INSERT INTO "image" VALUES (41,524,1,'2020-16.PNG');
INSERT INTO "image" VALUES (42,524,2,'2020-17.PNG');
INSERT INTO "image" VALUES (43,524,3,'2020-18.PNG');
INSERT INTO "image" VALUES (44,524,4,'2020-19.PNG');
INSERT INTO "image" VALUES (45,525,1,'2020-20.PNG');
INSERT INTO "image" VALUES (46,525,2,'2020-20-1.PNG');
INSERT INTO "image" VALUES (47,528,1,'2020-21.PNG');
INSERT INTO "image" VALUES (48,528,2,'2020-22.PNG');
INSERT INTO "image" VALUES (49,528,3,'2020-22-1.PNG');
INSERT INTO "image" VALUES (50,528,4,'2020-22-2.PNG');
INSERT INTO "image" VALUES (51,528,5,'2020-23.PNG');
INSERT INTO "image" VALUES (52,528,6,'2020-23-1.PNG');
INSERT INTO "image" VALUES (53,528,7,'2020-24.PNG');
INSERT INTO "image" VALUES (54,529,1,'2020-25.PNG');
INSERT INTO "image" VALUES (55,529,2,'2020-25-1.PNG');
INSERT INTO "image" VALUES (56,529,3,'2020-26.PNG');
INSERT INTO "image" VALUES (57,530,1,'2020-27.PNG');
INSERT INTO "image" VALUES (58,530,2,'2020-28.PNG');
INSERT INTO "image" VALUES (59,531,1,'2020-29.PNG');
INSERT INTO "image" VALUES (60,532,1,'2020-30.PNG');
INSERT INTO "image" VALUES (61,533,1,'2020-31.PNG');
INSERT INTO "image" VALUES (62,533,2,'2020-32.PNG');
INSERT INTO "image" VALUES (63,533,3,'2020-33.PNG');
INSERT INTO "image" VALUES (64,533,4,'2020-34.PNG');
INSERT INTO "image" VALUES (65,534,1,'2020-35.PNG');
INSERT INTO "image" VALUES (66,534,2,'2020-36.PNG');
INSERT INTO "image" VALUES (67,497,1,'2019-1.PNG');
INSERT INTO "image" VALUES (68,498,1,'2019-2.PNG');
INSERT INTO "image" VALUES (69,499,1,'2019-3.PNG');
INSERT INTO "image" VALUES (70,499,2,'2019-4.PNG');
INSERT INTO "image" VALUES (71,500,1,'2019-5.PNG');
INSERT INTO "image" VALUES (72,500,2,'2019-6.PNG');
INSERT INTO "image" VALUES (73,500,3,'2019-7.PNG');
INSERT INTO "image" VALUES (74,500,4,'2019-8.PNG');
INSERT INTO "image" VALUES (75,500,5,'2019-9.PNG');
INSERT INTO "image" VALUES (76,501,1,'2019-10.PNG');
INSERT INTO "image" VALUES (77,504,1,'2019-11.PNG');
INSERT INTO "image" VALUES (78,505,1,'2019-12.PNG');
INSERT INTO "image" VALUES (79,506,1,'2019-13.PNG');
INSERT INTO "image" VALUES (80,506,2,'2019-14.PNG');
INSERT INTO "image" VALUES (81,507,1,'2019-15.PNG');
INSERT INTO "image" VALUES (82,508,1,'2019-16.PNG');
INSERT INTO "image" VALUES (83,508,2,'2019-17.PNG');
INSERT INTO "image" VALUES (84,508,3,'2019-18.PNG');
INSERT INTO "image" VALUES (85,509,1,'2019-19.PNG');
INSERT INTO "image" VALUES (86,509,2,'2019-20.PNG');
INSERT INTO "image" VALUES (87,510,1,'2019-21.PNG');
INSERT INTO "image" VALUES (88,510,2,'2019-22.PNG');
INSERT INTO "image" VALUES (89,512,1,'2019-23.PNG');
INSERT INTO "image" VALUES (90,513,1,'2019-24.PNG');
INSERT INTO "image" VALUES (91,514,1,'2019-25.PNG');
INSERT INTO "image" VALUES (92,514,2,'2019-26.PNG');
INSERT INTO "image" VALUES (93,514,3,'2019-27.PNG');
INSERT INTO "image" VALUES (94,464,1,'2018-1.PNG');
INSERT INTO "image" VALUES (95,466,1,'2018-2.PNG');
INSERT INTO "image" VALUES (96,471,1,'2018-3.PNG');
INSERT INTO "image" VALUES (97,471,2,'2018-4.PNG');
INSERT INTO "image" VALUES (98,472,1,'2018-5.PNG');
INSERT INTO "image" VALUES (99,472,2,'2018-6.PNG');
INSERT INTO "image" VALUES (100,473,1,'2018-7.PNG');
INSERT INTO "image" VALUES (101,473,2,'2018-8.PNG');
INSERT INTO "image" VALUES (102,474,1,'2018-9.PNG');
INSERT INTO "image" VALUES (103,475,1,'2018-10.PNG');
INSERT INTO "image" VALUES (104,476,1,'2018-11.PNG');
INSERT INTO "image" VALUES (105,476,2,'2018-12.PNG');
INSERT INTO "image" VALUES (106,476,3,'2018-13.PNG');
INSERT INTO "image" VALUES (107,479,1,'2018-14.PNG');
INSERT INTO "image" VALUES (108,481,1,'2018-15.PNG');
INSERT INTO "image" VALUES (109,481,2,'2018-16.PNG');
INSERT INTO "image" VALUES (110,482,1,'2018-17.PNG');
INSERT INTO "image" VALUES (111,482,2,'2018-18.PNG');
INSERT INTO "image" VALUES (112,482,3,'2018-19.PNG');
INSERT INTO "image" VALUES (113,483,1,'2018-20.PNG');
INSERT INTO "image" VALUES (114,484,1,'2018-21.PNG');
INSERT INTO "image" VALUES (115,484,2,'2018-22.PNG');
INSERT INTO "image" VALUES (116,485,1,'2018-23.PNG');
INSERT INTO "image" VALUES (117,485,2,'2018-24.PNG');
INSERT INTO "image" VALUES (118,487,1,'2018-25.PNG');
INSERT INTO "image" VALUES (119,487,2,'2018-26.PNG');
INSERT INTO "image" VALUES (120,487,3,'2018-27.PNG');
INSERT INTO "image" VALUES (121,488,1,'2018-28.PNG');
INSERT INTO "image" VALUES (122,488,2,'2018-29.PNG');
INSERT INTO "image" VALUES (123,490,1,'2018-30.PNG');
INSERT INTO "image" VALUES (124,490,2,'2018-31.PNG');
INSERT INTO "image" VALUES (125,490,3,'2018-32.PNG');
INSERT INTO "image" VALUES (126,491,1,'2018-33.PNG');
INSERT INTO "image" VALUES (127,491,2,'2018-34.PNG');
INSERT INTO "image" VALUES (128,492,1,'2018-35.PNG');
INSERT INTO "image" VALUES (129,493,1,'2018-36.PNG');
INSERT INTO "image" VALUES (130,493,2,'2018-37.PNG');
INSERT INTO "image" VALUES (131,493,3,'2018-38.PNG');
INSERT INTO "image" VALUES (132,494,1,'2018-39.PNG');
INSERT INTO "image" VALUES (133,494,2,'2018-40.PNG');
INSERT INTO "image" VALUES (134,495,1,'2018-41.PNG');
INSERT INTO "image" VALUES (135,496,1,'2018-42.PNG');
INSERT INTO "image" VALUES (136,432,1,'2017-1.PNG');
INSERT INTO "image" VALUES (137,433,1,'2017-2.PNG');
INSERT INTO "image" VALUES (138,440,1,'2017-3.PNG');
INSERT INTO "image" VALUES (139,440,2,'2017-4.PNG');
INSERT INTO "image" VALUES (140,440,3,'2017-5.PNG');
INSERT INTO "image" VALUES (141,441,1,'2017-6.PNG');
INSERT INTO "image" VALUES (142,442,1,'2017-7.PNG');
INSERT INTO "image" VALUES (143,442,2,'2017-8.PNG');
INSERT INTO "image" VALUES (144,443,1,'2017-9.PNG');
INSERT INTO "image" VALUES (145,445,1,'2017-10.PNG');
INSERT INTO "image" VALUES (146,445,2,'2017-11.PNG');
INSERT INTO "image" VALUES (147,448,1,'2017-12.PNG');
INSERT INTO "image" VALUES (148,448,2,'2017-13.PNG');
INSERT INTO "image" VALUES (149,448,3,'2017-14.PNG');
INSERT INTO "image" VALUES (150,450,1,'2017-15.PNG');
INSERT INTO "image" VALUES (151,450,2,'2017-16.PNG');
INSERT INTO "image" VALUES (152,451,1,'2017-17.PNG');
INSERT INTO "image" VALUES (153,452,1,'2017-18.PNG');
INSERT INTO "image" VALUES (154,454,1,'2017-19.PNG');
INSERT INTO "image" VALUES (155,454,2,'2017-20.PNG');
INSERT INTO "image" VALUES (156,454,3,'2017-21.PNG');
INSERT INTO "image" VALUES (157,455,1,'2017-22.PNG');
INSERT INTO "image" VALUES (158,455,2,'2017-23.PNG');
INSERT INTO "image" VALUES (159,457,1,'2017-24.PNG');
INSERT INTO "image" VALUES (160,457,2,'2017-25.PNG');
INSERT INTO "image" VALUES (161,457,3,'2017-26.PNG');
INSERT INTO "image" VALUES (162,458,1,'2017-27.PNG');
INSERT INTO "image" VALUES (163,458,2,'2017-28.PNG');
INSERT INTO "image" VALUES (164,458,3,'2017-29.PNG');
INSERT INTO "image" VALUES (165,460,1,'2017-30.PNG');
INSERT INTO "image" VALUES (166,460,2,'2017-31.PNG');
INSERT INTO "image" VALUES (167,461,1,'2017-32.PNG');
INSERT INTO "image" VALUES (168,462,1,'2017-33.PNG');
INSERT INTO "image" VALUES (169,463,1,'2017-34.PNG');
INSERT INTO "image" VALUES (170,394,1,'2016-1.PNG');
INSERT INTO "image" VALUES (171,395,1,'2016-2.PNG');
INSERT INTO "image" VALUES (172,404,1,'2016-3.PNG');
INSERT INTO "image" VALUES (173,404,2,'2016-4.PNG');
INSERT INTO "image" VALUES (174,405,1,'2016-5.PNG');
INSERT INTO "image" VALUES (175,406,1,'2016-6.PNG');
INSERT INTO "image" VALUES (176,406,2,'2016-7.PNG');
INSERT INTO "image" VALUES (177,406,3,'2016-8.PNG');
INSERT INTO "image" VALUES (178,407,1,'2016-9.PNG');
INSERT INTO "image" VALUES (179,407,2,'2016-10.PNG');
INSERT INTO "image" VALUES (180,408,1,'2016-11.PNG');
INSERT INTO "image" VALUES (181,410,1,'2016-12.PNG');
INSERT INTO "image" VALUES (182,411,1,'2016-13.PNG');
INSERT INTO "image" VALUES (183,412,1,'2016-14.PNG');
INSERT INTO "image" VALUES (184,412,2,'2016-15.PNG');
INSERT INTO "image" VALUES (185,413,1,'2016-16.PNG');
INSERT INTO "image" VALUES (186,414,1,'2016-17.PNG');
INSERT INTO "image" VALUES (187,414,2,'2016-18.PNG');
INSERT INTO "image" VALUES (188,414,3,'2016-19.PNG');
INSERT INTO "image" VALUES (189,414,4,'2016-20.PNG');
INSERT INTO "image" VALUES (190,415,1,'2016-21.PNG');
INSERT INTO "image" VALUES (191,415,2,'2016-22.PNG');
INSERT INTO "image" VALUES (192,417,1,'2016-23.PNG');
INSERT INTO "image" VALUES (193,418,1,'2016-24.PNG');
INSERT INTO "image" VALUES (194,419,1,'2016-25.PNG');
INSERT INTO "image" VALUES (195,420,1,'2016-26.PNG');
INSERT INTO "image" VALUES (196,421,1,'2016-27.PNG');
INSERT INTO "image" VALUES (197,421,2,'2016-28.PNG');
INSERT INTO "image" VALUES (198,422,1,'2016-29.PNG');
INSERT INTO "image" VALUES (199,422,2,'2016-30.PNG');
INSERT INTO "image" VALUES (200,423,1,'2016-31.PNG');
INSERT INTO "image" VALUES (201,423,2,'2016-32.PNG');
INSERT INTO "image" VALUES (202,423,3,'2016-33.PNG');
INSERT INTO "image" VALUES (203,423,4,'2016-34.PNG');
INSERT INTO "image" VALUES (204,426,1,'2016-35.PNG');
INSERT INTO "image" VALUES (205,426,2,'2016-36.PNG');
INSERT INTO "image" VALUES (206,427,1,'2016-37.PNG');
INSERT INTO "image" VALUES (207,427,2,'2016-38.PNG');
INSERT INTO "image" VALUES (208,428,1,'2016-39.PNG');
INSERT INTO "image" VALUES (209,429,1,'2016-40.PNG');
INSERT INTO "image" VALUES (210,429,2,'2016-41.PNG');
INSERT INTO "image" VALUES (211,335,1,'2015-1.PNG');
INSERT INTO "image" VALUES (212,336,1,'2015-2.PNG');
INSERT INTO "image" VALUES (213,342,1,'2015-3.PNG');
INSERT INTO "image" VALUES (214,343,1,'2015-4.PNG');
INSERT INTO "image" VALUES (215,345,1,'2015-5.PNG');
INSERT INTO "image" VALUES (216,346,1,'2015-6.PNG');
INSERT INTO "image" VALUES (217,348,1,'2015-7.PNG');
INSERT INTO "image" VALUES (218,349,1,'2015-8.PNG');
INSERT INTO "image" VALUES (219,352,1,'2015-9.PNG');
INSERT INTO "image" VALUES (220,352,2,'2015-10.PNG');
INSERT INTO "image" VALUES (221,353,1,'2015-11.PNG');
INSERT INTO "image" VALUES (222,353,2,'2015-12.PNG');
INSERT INTO "image" VALUES (223,354,1,'2015-13.PNG');
INSERT INTO "image" VALUES (224,355,1,'2015-14.PNG');
INSERT INTO "image" VALUES (225,356,1,'2015-15.PNG');
INSERT INTO "image" VALUES (226,356,2,'2015-16.PNG');
INSERT INTO "image" VALUES (227,357,1,'2015-17.PNG');
INSERT INTO "image" VALUES (228,357,2,'2015-18.PNG');
INSERT INTO "image" VALUES (229,357,3,'2015-19.PNG');
INSERT INTO "image" VALUES (230,357,4,'2015-19-1.PNG');
INSERT INTO "image" VALUES (231,359,1,'2015-20.PNG');
INSERT INTO "image" VALUES (232,360,1,'2015-21.PNG');
INSERT INTO "image" VALUES (233,361,1,'2015-22.PNG');
INSERT INTO "image" VALUES (234,361,2,'2015-22-1.PNG');
INSERT INTO "image" VALUES (235,361,3,'2015-22-2.PNG');
INSERT INTO "image" VALUES (236,361,4,'2015-22-3.PNG');
INSERT INTO "image" VALUES (237,361,5,'2015-23.PNG');
INSERT INTO "image" VALUES (238,362,1,'2015-24.PNG');
INSERT INTO "image" VALUES (239,362,2,'2015-25.PNG');
INSERT INTO "image" VALUES (240,364,1,'2015-26.PNG');
INSERT INTO "image" VALUES (241,364,2,'2015-27.PNG');
INSERT INTO "image" VALUES (242,364,3,'2015-28.PNG');
INSERT INTO "image" VALUES (243,365,1,'2015-29.PNG');
INSERT INTO "image" VALUES (244,365,2,'2015-30.PNG');
INSERT INTO "image" VALUES (245,366,1,'2015-31.PNG');
INSERT INTO "image" VALUES (246,367,1,'2015-32.PNG');
INSERT INTO "image" VALUES (247,368,1,'2015-33.PNG');
INSERT INTO "image" VALUES (248,368,2,'2015-34.PNG');
INSERT INTO "image" VALUES (249,369,1,'2015-35.PNG');
INSERT INTO "image" VALUES (250,369,2,'2015-36.PNG');
INSERT INTO "image" VALUES (251,370,1,'2015-37.PNG');
INSERT INTO "image" VALUES (252,370,2,'2015-38.PNG');
INSERT INTO "image" VALUES (253,371,1,'2015-39.PNG');
INSERT INTO "image" VALUES (254,371,2,'2015-40.PNG');
INSERT INTO "image" VALUES (255,300,1,'2014-1.PNG');
INSERT INTO "image" VALUES (256,305,1,'2014-2.PNG');
INSERT INTO "image" VALUES (257,308,1,'2014-3.PNG');
INSERT INTO "image" VALUES (258,309,1,'2014-4.PNG');
INSERT INTO "image" VALUES (259,310,1,'2014-5.PNG');
INSERT INTO "image" VALUES (260,310,2,'2014-6.PNG');
INSERT INTO "image" VALUES (261,310,3,'2014-7.PNG');
INSERT INTO "image" VALUES (262,311,1,'2014-8.PNG');
INSERT INTO "image" VALUES (263,311,2,'2014-9.PNG');
INSERT INTO "image" VALUES (264,313,1,'2014-10.PNG');
INSERT INTO "image" VALUES (265,314,1,'2014-11.PNG');
INSERT INTO "image" VALUES (266,314,2,'2014-12.PNG');
INSERT INTO "image" VALUES (267,314,3,'2014-13.PNG');
INSERT INTO "image" VALUES (268,315,1,'2014-14.PNG');
INSERT INTO "image" VALUES (269,316,1,'2014-15.PNG');
INSERT INTO "image" VALUES (270,317,1,'2014-16.PNG');
INSERT INTO "image" VALUES (271,319,1,'2014-17.PNG');
INSERT INTO "image" VALUES (272,320,1,'2014-18.PNG');
INSERT INTO "image" VALUES (273,321,1,'2014-19.PNG');
INSERT INTO "image" VALUES (274,322,1,'2014-20.PNG');
INSERT INTO "image" VALUES (275,323,1,'2014-21.PNG');
INSERT INTO "image" VALUES (276,323,2,'2014-22.PNG');
INSERT INTO "image" VALUES (277,323,3,'2014-23.PNG');
INSERT INTO "image" VALUES (278,324,1,'2014-24.PNG');
INSERT INTO "image" VALUES (279,324,2,'2014-25.PNG');
INSERT INTO "image" VALUES (280,325,1,'2014-26.PNG');
INSERT INTO "image" VALUES (281,326,1,'2014-27.PNG');
INSERT INTO "image" VALUES (282,327,1,'2014-28.PNG');
INSERT INTO "image" VALUES (283,330,1,'2014-29.PNG');
INSERT INTO "image" VALUES (284,330,2,'2014-30.PNG');
INSERT INTO "image" VALUES (285,330,3,'2014-31.PNG');
INSERT INTO "image" VALUES (286,330,4,'2014-32.PNG');
INSERT INTO "image" VALUES (287,330,5,'2014-33.PNG');
INSERT INTO "image" VALUES (288,330,6,'2014-34.PNG');
INSERT INTO "image" VALUES (289,331,1,'2014-35.PNG');
INSERT INTO "image" VALUES (290,331,2,'2014-36.PNG');
INSERT INTO "image" VALUES (291,331,3,'2014-37.PNG');
INSERT INTO "image" VALUES (292,332,1,'2014-38.PNG');
INSERT INTO "image" VALUES (293,262,1,'2013-1.PNG');
INSERT INTO "image" VALUES (294,262,2,'2013-2.PNG');
INSERT INTO "image" VALUES (295,264,1,'2013-3.PNG');
INSERT INTO "image" VALUES (296,266,1,'2013-4.PNG');
INSERT INTO "image" VALUES (297,267,1,'2013-5.PNG');
INSERT INTO "image" VALUES (298,267,2,'2013-6.PNG');
INSERT INTO "image" VALUES (299,268,1,'2013-7.PNG');
INSERT INTO "image" VALUES (300,268,2,'2013-8.PNG');
INSERT INTO "image" VALUES (301,272,1,'2013-9.PNG');
INSERT INTO "image" VALUES (302,273,1,'2013-10.PNG');
INSERT INTO "image" VALUES (303,274,1,'2013-11.PNG');
INSERT INTO "image" VALUES (304,276,1,'2013-12.PNG');
INSERT INTO "image" VALUES (305,276,2,'2013-13.PNG');
INSERT INTO "image" VALUES (306,276,3,'2013-14.PNG');
INSERT INTO "image" VALUES (307,277,1,'2013-15.PNG');
INSERT INTO "image" VALUES (308,278,1,'2013-16.PNG');
INSERT INTO "image" VALUES (309,279,1,'2013-17.PNG');
INSERT INTO "image" VALUES (310,279,2,'2013-18.PNG');
INSERT INTO "image" VALUES (311,280,1,'2013-19.PNG');
INSERT INTO "image" VALUES (312,281,1,'2013-20.PNG');
INSERT INTO "image" VALUES (313,281,2,'2013-21.PNG');
INSERT INTO "image" VALUES (314,282,1,'2013-22.PNG');
INSERT INTO "image" VALUES (315,282,2,'2013-23.PNG');
INSERT INTO "image" VALUES (316,282,3,'2013-24.PNG');
INSERT INTO "image" VALUES (317,284,1,'2013-25.PNG');
INSERT INTO "image" VALUES (318,284,2,'2013-26.PNG');
INSERT INTO "image" VALUES (319,285,1,'2013-27.PNG');
INSERT INTO "image" VALUES (320,286,1,'2013-28.PNG');
INSERT INTO "image" VALUES (321,287,1,'2013-29.PNG');
INSERT INTO "image" VALUES (322,288,1,'2013-30.PNG');
INSERT INTO "image" VALUES (323,289,1,'2013-31.PNG');
INSERT INTO "image" VALUES (324,289,2,'2013-32.PNG');
INSERT INTO "image" VALUES (325,291,1,'2013-33.PNG');
INSERT INTO "image" VALUES (326,291,2,'2013-34.PNG');
INSERT INTO "image" VALUES (327,292,1,'2013-35.PNG');
INSERT INTO "image" VALUES (328,292,2,'2013-36.PNG');
INSERT INTO "image" VALUES (329,292,3,'2013-37.PNG');
INSERT INTO "image" VALUES (330,218,1,'2012-1.PNG');
INSERT INTO "image" VALUES (331,219,1,'2012-2.PNG');
INSERT INTO "image" VALUES (332,220,1,'2012-3.PNG');
INSERT INTO "image" VALUES (333,221,1,'2012-4.PNG');
INSERT INTO "image" VALUES (334,222,1,'2012-5.PNG');
INSERT INTO "image" VALUES (335,224,1,'2012-6.PNG');
INSERT INTO "image" VALUES (336,226,1,'2012-7.PNG');
INSERT INTO "image" VALUES (337,227,1,'2012-8.PNG');
INSERT INTO "image" VALUES (338,229,1,'2012-9.PNG');
INSERT INTO "image" VALUES (339,230,1,'2012-10.PNG');
INSERT INTO "image" VALUES (340,231,1,'2012-11.PNG');
INSERT INTO "image" VALUES (341,231,2,'2012-12.PNG');
INSERT INTO "image" VALUES (342,231,3,'2012-13.PNG');
INSERT INTO "image" VALUES (343,232,1,'2012-14.PNG');
INSERT INTO "image" VALUES (344,233,1,'2012-15.PNG');
INSERT INTO "image" VALUES (345,233,2,'2012-16.PNG');
INSERT INTO "image" VALUES (346,235,1,'2012-17.PNG');
INSERT INTO "image" VALUES (347,235,2,'2012-18.PNG');
INSERT INTO "image" VALUES (348,236,1,'2012-19.PNG');
INSERT INTO "image" VALUES (349,237,1,'2012-20.PNG');
INSERT INTO "image" VALUES (350,239,1,'2012-21.PNG');
INSERT INTO "image" VALUES (351,240,1,'2012-22.PNG');
INSERT INTO "image" VALUES (352,242,1,'2012-23.PNG');
INSERT INTO "image" VALUES (353,242,2,'2012-24.PNG');
INSERT INTO "image" VALUES (354,242,3,'2012-25.PNG');
INSERT INTO "image" VALUES (355,243,1,'2012-26.PNG');
INSERT INTO "image" VALUES (356,243,2,'2012-27.PNG');
INSERT INTO "image" VALUES (357,245,1,'2012-28.PNG');
INSERT INTO "image" VALUES (358,246,1,'2012-29.PNG');
INSERT INTO "image" VALUES (359,246,2,'2012-30.PNG');
INSERT INTO "image" VALUES (360,247,1,'2012-31.PNG');
INSERT INTO "image" VALUES (361,247,2,'2012-32.PNG');
INSERT INTO "image" VALUES (362,249,1,'2012-33.PNG');
INSERT INTO "image" VALUES (363,250,1,'2012-34.PNG');
INSERT INTO "image" VALUES (364,250,2,'2012-35.PNG');
INSERT INTO "image" VALUES (365,251,1,'2012-36.PNG');
INSERT INTO "image" VALUES (366,251,2,'2012-37.PNG');
INSERT INTO "image" VALUES (367,251,3,'2012-38.PNG');
INSERT INTO "image" VALUES (368,178,1,'2011-1.PNG');
INSERT INTO "image" VALUES (369,179,1,'2011-2.PNG');
INSERT INTO "image" VALUES (370,179,2,'2011-3.PNG');
INSERT INTO "image" VALUES (371,180,1,'2011-4.PNG');
INSERT INTO "image" VALUES (372,182,1,'2011-5.PNG');
INSERT INTO "image" VALUES (373,183,1,'2011-6.PNG');
INSERT INTO "image" VALUES (374,184,1,'2011-7.PNG');
INSERT INTO "image" VALUES (375,185,1,'2011-8.PNG');
INSERT INTO "image" VALUES (376,188,1,'2011-9.PNG');
INSERT INTO "image" VALUES (377,189,1,'2011-10.PNG');
INSERT INTO "image" VALUES (378,190,1,'2011-11.PNG');
INSERT INTO "image" VALUES (379,191,1,'2011-12.PNG');
INSERT INTO "image" VALUES (380,192,1,'2011-13.PNG');
INSERT INTO "image" VALUES (381,193,1,'2011-14.PNG');
INSERT INTO "image" VALUES (382,194,1,'2011-15.PNG');
INSERT INTO "image" VALUES (383,195,1,'2011-16.PNG');
INSERT INTO "image" VALUES (384,195,2,'2011-17.PNG');
INSERT INTO "image" VALUES (385,195,3,'2011-18.PNG');
INSERT INTO "image" VALUES (386,195,4,'2011-19.PNG');
INSERT INTO "image" VALUES (387,196,1,'2011-20.PNG');
INSERT INTO "image" VALUES (388,196,2,'2011-21.PNG');
INSERT INTO "image" VALUES (389,197,1,'2011-22.PNG');
INSERT INTO "image" VALUES (390,197,2,'2011-23.PNG');
INSERT INTO "image" VALUES (391,197,3,'2011-24.PNG');
INSERT INTO "image" VALUES (392,197,4,'2011-25.PNG');
INSERT INTO "image" VALUES (393,197,5,'2011-26.PNG');
INSERT INTO "image" VALUES (394,197,6,'2011-27.PNG');
INSERT INTO "image" VALUES (395,197,7,'2011-29.PNG');
INSERT INTO "image" VALUES (396,199,1,'2011-30.PNG');
INSERT INTO "image" VALUES (397,199,2,'2011-31.PNG');
INSERT INTO "image" VALUES (398,199,3,'2011-32.PNG');
INSERT INTO "image" VALUES (399,200,1,'2011-33.PNG');
INSERT INTO "image" VALUES (400,201,1,'2011-34.PNG');
INSERT INTO "image" VALUES (401,201,2,'2011-35.PNG');
INSERT INTO "image" VALUES (402,202,1,'2011-36.PNG');
INSERT INTO "image" VALUES (403,204,1,'2011-37.PNG');
INSERT INTO "image" VALUES (404,204,2,'2011-38.PNG');
INSERT INTO "image" VALUES (405,205,1,'2011-39.PNG');
INSERT INTO "image" VALUES (406,205,2,'2011-40.PNG');
INSERT INTO "image" VALUES (407,205,3,'2011-41.PNG');
INSERT INTO "image" VALUES (408,206,1,'2011-42.PNG');
INSERT INTO "image" VALUES (409,206,2,'2011-43.PNG');
INSERT INTO "image" VALUES (410,206,3,'2011-44.PNG');
INSERT INTO "image" VALUES (411,208,1,'2011-45.PNG');
INSERT INTO "image" VALUES (412,208,2,'2011-46.PNG');
INSERT INTO "image" VALUES (413,208,3,'2011-47.PNG');
INSERT INTO "image" VALUES (414,209,1,'2011-48.PNG');
INSERT INTO "image" VALUES (415,209,2,'2011-49.PNG');
INSERT INTO "image" VALUES (416,137,1,'2010-1.PNG');
INSERT INTO "image" VALUES (417,138,1,'2010-2.PNG');
INSERT INTO "image" VALUES (418,142,1,'2010-3.PNG');
INSERT INTO "image" VALUES (419,143,1,'2010-4.PNG');
INSERT INTO "image" VALUES (420,144,1,'2010-5.PNG');
INSERT INTO "image" VALUES (421,144,2,'2010-6.PNG');
INSERT INTO "image" VALUES (422,144,3,'2010-7.PNG');
INSERT INTO "image" VALUES (423,145,1,'2010-8.PNG');
INSERT INTO "image" VALUES (424,146,1,'2010-9.PNG');
INSERT INTO "image" VALUES (425,146,2,'2010-10.PNG');
INSERT INTO "image" VALUES (426,150,1,'2010-11.PNG');
INSERT INTO "image" VALUES (427,151,1,'2010-12.PNG');
INSERT INTO "image" VALUES (428,153,1,'2010-13.PNG');
INSERT INTO "image" VALUES (429,153,2,'2010-14.PNG');
INSERT INTO "image" VALUES (430,154,1,'2010-15.PNG');
INSERT INTO "image" VALUES (431,154,2,'2010-16.PNG');
INSERT INTO "image" VALUES (432,154,3,'2010-17.PNG');
INSERT INTO "image" VALUES (433,154,4,'2010-18.PNG');
INSERT INTO "image" VALUES (434,156,1,'2010-19.PNG');
INSERT INTO "image" VALUES (435,156,2,'2010-20.PNG');
INSERT INTO "image" VALUES (436,156,3,'2010-21.PNG');
INSERT INTO "image" VALUES (437,156,4,'2010-22.PNG');
INSERT INTO "image" VALUES (438,156,5,'2010-23.PNG');
INSERT INTO "image" VALUES (439,157,1,'2010-24.PNG');
INSERT INTO "image" VALUES (440,157,2,'2010-25.PNG');
INSERT INTO "image" VALUES (441,157,3,'2010-26.PNG');
INSERT INTO "image" VALUES (442,157,4,'2010-27.PNG');
INSERT INTO "image" VALUES (443,159,1,'2010-28.PNG');
INSERT INTO "image" VALUES (444,159,2,'2010-29.PNG');
INSERT INTO "image" VALUES (445,160,1,'2010-30.PNG');
INSERT INTO "image" VALUES (446,161,1,'2010-31.PNG');
INSERT INTO "image" VALUES (447,162,1,'2010-32.PNG');
INSERT INTO "image" VALUES (448,162,2,'2010-33.PNG');
INSERT INTO "image" VALUES (449,162,3,'2010-34.PNG');
INSERT INTO "image" VALUES (450,162,4,'2010-35.PNG');
INSERT INTO "image" VALUES (451,162,5,'2010-36.PNG');
INSERT INTO "image" VALUES (452,162,6,'2010-37.PNG');
INSERT INTO "image" VALUES (453,162,7,'2010-38.PNG');
INSERT INTO "image" VALUES (454,164,1,'2010-39.PNG');
INSERT INTO "image" VALUES (455,164,2,'2010-40.PNG');
INSERT INTO "image" VALUES (456,165,1,'2010-41.PNG');
INSERT INTO "image" VALUES (457,165,2,'2010-42.PNG');
INSERT INTO "image" VALUES (458,166,1,'2010-43.PNG');
INSERT INTO "image" VALUES (459,166,2,'2010-44.PNG');
INSERT INTO "image" VALUES (460,166,3,'2010-45.PNG');
INSERT INTO "image" VALUES (461,168,1,'2010-46.PNG');
INSERT INTO "image" VALUES (462,168,2,'2010-47.PNG');
INSERT INTO "image" VALUES (463,168,3,'2010-48.PNG');
INSERT INTO "image" VALUES (464,168,4,'2010-49.PNG');
INSERT INTO "image" VALUES (465,95,1,'2009-1.PNG');
INSERT INTO "image" VALUES (466,100,1,'2009-2.PNG');
INSERT INTO "image" VALUES (467,100,2,'2009-3.PNG');
INSERT INTO "image" VALUES (468,102,1,'2009-4.PNG');
INSERT INTO "image" VALUES (469,103,1,'2009-5.PNG');
INSERT INTO "image" VALUES (470,103,2,'2009-6.PNG');
INSERT INTO "image" VALUES (471,104,1,'2009-7.PNG');
INSERT INTO "image" VALUES (472,105,1,'2009-8.PNG');
INSERT INTO "image" VALUES (473,107,1,'2009-9.PNG');
INSERT INTO "image" VALUES (474,107,2,'2009-10.PNG');
INSERT INTO "image" VALUES (475,109,1,'2009-11.PNG');
INSERT INTO "image" VALUES (476,109,2,'2009-12.PNG');
INSERT INTO "image" VALUES (477,109,3,'2009-13.PNG');
INSERT INTO "image" VALUES (478,110,1,'2009-14.PNG');
INSERT INTO "image" VALUES (479,110,2,'2009-15.PNG');
INSERT INTO "image" VALUES (480,111,1,'2009-16.PNG');
INSERT INTO "image" VALUES (481,111,2,'2009-17.PNG');
INSERT INTO "image" VALUES (482,111,3,'2009-18.PNG');
INSERT INTO "image" VALUES (483,113,1,'2009-19.PNG');
INSERT INTO "image" VALUES (484,114,1,'2009-20.PNG');
INSERT INTO "image" VALUES (485,114,2,'2009-21.PNG');
INSERT INTO "image" VALUES (486,114,3,'2009-24.PNG');
INSERT INTO "image" VALUES (487,116,1,'2009-25.PNG');
INSERT INTO "image" VALUES (488,117,1,'2009-26.PNG');
INSERT INTO "image" VALUES (489,118,1,'2009-27.PNG');
INSERT INTO "image" VALUES (490,118,2,'2009-28.PNG');
INSERT INTO "image" VALUES (491,119,1,'2009-29.PNG');
INSERT INTO "image" VALUES (492,119,2,'2009-30.PNG');
INSERT INTO "image" VALUES (493,120,1,'2009-31.PNG');
INSERT INTO "image" VALUES (494,120,2,'2009-32.PNG');
INSERT INTO "image" VALUES (495,121,1,'2009-33.PNG');
INSERT INTO "image" VALUES (496,121,2,'2009-34.PNG');
INSERT INTO "image" VALUES (497,121,3,'2009-35.PNG');
INSERT INTO "image" VALUES (498,122,1,'2009-36.PNG');
INSERT INTO "image" VALUES (499,122,2,'2009-37.PNG');
INSERT INTO "image" VALUES (500,123,1,'2009-38.PNG');
INSERT INTO "image" VALUES (501,55,1,'2008-1.PNG');
INSERT INTO "image" VALUES (502,58,1,'2008-2.PNG');
INSERT INTO "image" VALUES (503,63,1,'2008-3.PNG');
INSERT INTO "image" VALUES (504,64,1,'2008-4.PNG');
INSERT INTO "image" VALUES (505,65,1,'2008-5.PNG');
INSERT INTO "image" VALUES (506,66,1,'2008-6.PNG');
INSERT INTO "image" VALUES (507,69,1,'2008-7.PNG');
INSERT INTO "image" VALUES (508,70,1,'2008-8.PNG');
INSERT INTO "image" VALUES (509,70,2,'2008-9.PNG');
INSERT INTO "image" VALUES (510,70,3,'2008-10.PNG');
INSERT INTO "image" VALUES (511,71,1,'2008-11.PNG');
INSERT INTO "image" VALUES (512,71,2,'2008-12.PNG');
INSERT INTO "image" VALUES (513,71,3,'2008-13.PNG');
INSERT INTO "image" VALUES (514,71,4,'2008-14.PNG');
INSERT INTO "image" VALUES (515,72,1,'2008-15.PNG');
INSERT INTO "image" VALUES (516,72,2,'2008-16.PNG');
INSERT INTO "image" VALUES (517,74,1,'2008-17.PNG');
INSERT INTO "image" VALUES (518,75,1,'2008-18.PNG');
INSERT INTO "image" VALUES (519,76,1,'2008-19.PNG');
INSERT INTO "image" VALUES (520,76,2,'2008-20.PNG');
INSERT INTO "image" VALUES (521,78,1,'2008-21.PNG');
INSERT INTO "image" VALUES (522,79,1,'2008-22.PNG');
INSERT INTO "image" VALUES (523,80,1,'2008-23.PNG');
INSERT INTO "image" VALUES (524,80,2,'2008-24.PNG');
INSERT INTO "image" VALUES (525,82,1,'2008-25.PNG');
INSERT INTO "image" VALUES (526,82,2,'2008-26.PNG');
INSERT INTO "image" VALUES (527,82,3,'2008-27.PNG');
INSERT INTO "image" VALUES (528,82,4,'2008-28.PNG');
INSERT INTO "image" VALUES (529,82,5,'2008-29.PNG');
INSERT INTO "image" VALUES (530,83,1,'2008-30.PNG');
INSERT INTO "image" VALUES (531,83,2,'2008-31.PNG');
INSERT INTO "image" VALUES (532,84,1,'2008-32.PNG');
INSERT INTO "image" VALUES (533,84,2,'2008-33.PNG');
INSERT INTO "image" VALUES (534,84,3,'2008-34.PNG');
INSERT INTO "image" VALUES (535,84,4,'2008-35.PNG');
INSERT INTO "image" VALUES (536,85,1,'2008-36.PNG');
INSERT INTO "image" VALUES (537,85,2,'2008-37.PNG');
INSERT INTO "image" VALUES (538,85,3,'2008-38.PNG');
INSERT INTO "image" VALUES (539,9,1,'2007-1.PNG');
INSERT INTO "image" VALUES (540,10,1,'2007-2.PNG');
INSERT INTO "image" VALUES (541,15,1,'2007-3.PNG');
INSERT INTO "image" VALUES (542,16,1,'2007-4.PNG');
INSERT INTO "image" VALUES (543,17,1,'2007-5.PNG');
INSERT INTO "image" VALUES (544,19,1,'2007-6.PNG');
INSERT INTO "image" VALUES (545,20,1,'2007-7.PNG');
INSERT INTO "image" VALUES (546,21,1,'2007-8.PNG');
INSERT INTO "image" VALUES (547,23,1,'2007-9.PNG');
INSERT INTO "image" VALUES (548,25,1,'2007-10.PNG');
INSERT INTO "image" VALUES (549,25,2,'2007-11.PNG');
INSERT INTO "image" VALUES (550,26,1,'2007-12.PNG');
INSERT INTO "image" VALUES (551,27,1,'2007-13.PNG');
INSERT INTO "image" VALUES (552,27,2,'2007-14.PNG');
INSERT INTO "image" VALUES (553,28,1,'2007-15.PNG');
INSERT INTO "image" VALUES (554,28,2,'2007-16.PNG');
INSERT INTO "image" VALUES (555,28,3,'2007-17.PNG');
INSERT INTO "image" VALUES (556,29,1,'2007-18.PNG');
INSERT INTO "image" VALUES (557,29,2,'2007-19.PNG');
INSERT INTO "image" VALUES (558,29,3,'2007-20.PNG');
INSERT INTO "image" VALUES (559,30,1,'2007-21.PNG');
INSERT INTO "image" VALUES (560,33,1,'2007-22.PNG');
INSERT INTO "image" VALUES (561,34,1,'2007-23.PNG');
INSERT INTO "image" VALUES (562,34,2,'2007-24.PNG');
INSERT INTO "image" VALUES (563,34,3,'2007-25.PNG');
INSERT INTO "image" VALUES (564,35,1,'2007-26.PNG');
INSERT INTO "image" VALUES (565,36,1,'2007-27.PNG');
INSERT INTO "image" VALUES (566,37,1,'2007-28.PNG');
INSERT INTO "image" VALUES (567,37,2,'2007-29.PNG');
INSERT INTO "image" VALUES (568,38,1,'2007-30.PNG');
INSERT INTO "image" VALUES (569,39,1,'2007-31.PNG');
INSERT INTO "image" VALUES (570,40,1,'2007-32.PNG');
INSERT INTO "image" VALUES (571,41,1,'2007-33.PNG');
INSERT INTO "image" VALUES (572,41,2,'2007-34.PNG');
INSERT INTO "image" VALUES (573,43,1,'2007-35.PNG');
INSERT INTO "image" VALUES (574,555,1,'2022-1.PNG');
INSERT INTO "image" VALUES (575,557,1,'2022-2.PNG');
INSERT INTO "image" VALUES (576,558,1,'2022-3.PNG');
INSERT INTO "image" VALUES (577,558,2,'2022-4.PNG');
INSERT INTO "image" VALUES (578,558,3,'2022-5.PNG');
INSERT INTO "image" VALUES (579,559,1,'2022-6.PNG');
INSERT INTO "image" VALUES (580,559,2,'2022-7.PNG');
INSERT INTO "image" VALUES (581,561,1,'2022-8.PNG');
INSERT INTO "image" VALUES (582,561,2,'2022-9.PNG');
INSERT INTO "image" VALUES (583,562,1,'2022-10.PNG');
INSERT INTO "image" VALUES (584,562,2,'2022-11.PNG');
INSERT INTO "image" VALUES (585,563,1,'2022-12.PNG');
INSERT INTO "image" VALUES (586,563,2,'2022-13.PNG');
INSERT INTO "image" VALUES (587,564,1,'2022-14.PNG');
INSERT INTO "image" VALUES (588,564,2,'2022-15.PNG');
INSERT INTO "image" VALUES (589,564,3,'2022-16.PNG');
INSERT INTO "image" VALUES (590,566,1,'2022-17.PNG');
INSERT INTO "image" VALUES (591,566,2,'2022-18.PNG');
INSERT INTO "image" VALUES (592,567,1,'2022-19.PNG');
INSERT INTO "image" VALUES (593,567,2,'2022-20.PNG');
INSERT INTO "image" VALUES (594,568,1,'2022-21.PNG');
INSERT INTO "image" VALUES (595,568,2,'2022-22.PNG');
INSERT INTO "image" VALUES (596,568,3,'2022-23.PNG');
INSERT INTO "image" VALUES (597,568,4,'2022-24.PNG');
INSERT INTO "image" VALUES (598,569,1,'2022-25.PNG');
INSERT INTO "image" VALUES (599,569,2,'2022-26.PNG');
INSERT INTO "image" VALUES (600,569,3,'2022-27.PNG');
INSERT INTO "image" VALUES (601,570,1,'2022-28.PNG');
INSERT INTO "image" VALUES (602,570,2,'2022-29.PNG');
INSERT INTO "image" VALUES (603,570,3,'2022-30.PNG');
INSERT INTO "image" VALUES (604,570,4,'2022-31.PNG');
INSERT INTO "image" VALUES (605,570,5,'2022-32.PNG');
INSERT INTO "image" VALUES (606,570,6,'2022-33.PNG');
INSERT INTO "image" VALUES (607,570,7,'2022-34.PNG');
INSERT INTO "image" VALUES (608,571,1,'2022-35.PNG');
INSERT INTO "image" VALUES (609,571,2,'2022-36.PNG');
INSERT INTO "image" VALUES (610,571,3,'2022-37.PNG');
INSERT INTO "image" VALUES (611,571,4,'2022-38.PNG');
INSERT INTO "image" VALUES (612,572,1,'2022-39.PNG');
INSERT INTO "image" VALUES (613,572,2,'2022-40.PNG');
INSERT INTO "image" VALUES (614,573,1,'2022-41.PNG');
INSERT INTO "image" VALUES (615,573,2,'2022-42.PNG');
INSERT INTO "image" VALUES (616,573,3,'2022-43.PNG');
INSERT INTO "image" VALUES (617,574,1,'2022-44.PNG');
INSERT INTO "question" VALUES (1,2007,'A',1,0,'次の計算をしましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (2,2007,'A',1,1,'28 + 72',2,98.3,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_a.pdf#page=3',2,1);
INSERT INTO "question" VALUES (3,2007,'A',1,2,' 27 × 3.4',2,85.6,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_a.pdf#page=3',5,1);
INSERT INTO "question" VALUES (4,2007,'A',1,3,' 9.3 × 0.8',2,84.8,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_a.pdf#page=3',5,1);
INSERT INTO "question" VALUES (5,2007,'A',1,4,'12 ÷ 0.6',2,73.0,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_a.pdf#page=3',5,1);
INSERT INTO "question" VALUES (6,2007,'A',1,5,' 1 - 5/8',2,93.8,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_a.pdf#page=3',5,1);
INSERT INTO "question" VALUES (7,2007,'A',1,6,' 3/7 + 4/7',2,98.4,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_a.pdf#page=3',5,1);
INSERT INTO "question" VALUES (8,2007,'A',1,7,' 6 + 0.5 × 2',2,69.1,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_a.pdf#page=3',5,1);
INSERT INTO "question" VALUES (9,2007,'A',2,0,'次の正方形のうち，2/3 が黒くぬられているのは，どれですか。
下の １ から ５ までの中から 1つ選んで，その番号を書きましょう。
{image1}',1,89.3,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_a.pdf#page=4',4,1);
INSERT INTO "question" VALUES (10,2007,'A',3,0,'次の数直線には，となりあった整数の間を 10 
等分した目もりがついています。
下の問題に答えましょう。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (11,2007,'A',3,1,'7/10 の目もりの記号を，アからスまでの中から 1 
つ選んで，書きましょう。',1,95.1,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_a.pdf#page=5',4,1);
INSERT INTO "question" VALUES (12,2007,'A',3,2,'0.5，7/10，4/5の中で，いちばん大きい数を数直線で見つけま
す。いちばん大きい数の目もりの記号を，アからスまでの中から 
1 つ選んで，書きましょう。',1,55.9,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_a.pdf#page=5',5,1);
INSERT INTO "question" VALUES (13,2007,'A',4,0,'答えが 210 × 0.6 の式で求められる問題を，下の １ から ４ までの中から 1 つ選んで，その番号を書きましょう。',1,54.3,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_a.pdf#page=6',5,1);
INSERT INTO "question" VALUES (14,2007,'A',5,0,'次の図形の面積を求める式と答えを書きましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (15,2007,'A',5,1,'平行四辺形
{image1}',2,96.0,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_a.pdf#page=7',5,2);
INSERT INTO "question" VALUES (16,2007,'A',5,2,'三角形
{image1}',2,89.5,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_a.pdf#page=7',5,NULL);
INSERT INTO "question" VALUES (17,2007,'A',5,3,'円 （円周率は 3.14 を使います。)
{image1}',2,73.2,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_a.pdf#page=7',5,3);
INSERT INTO "question" VALUES (18,2007,'A',6,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (19,2007,'A',6,1,'下の三角形の角アの大きさは何度ですか。
答えを書きましょう。
{image1}',2,83.8,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=8',5,4);
INSERT INTO "question" VALUES (20,2007,'A',6,2,'下の方眼紙に平行四辺形をかいています。
もう 1 つの頂点はどこになりますか。
１ から ５ までの中から 1 つ選んで，その番号を書きましょう。
{image1}',1,88.6,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=8',5,4);
INSERT INTO "question" VALUES (21,2007,'A',7,0,'下の図のように，16 cm の長さのひもを使って，長方形や正方形を作ります。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (22,2007,'A',7,1,' 長方形のたての長さが 3 cm のとき，横の長さは何 cm になりますか。
答えを書きましょう。',2,82.5,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=9',4,8);
INSERT INTO "question" VALUES (23,2007,'A',7,2,'作った長方形や正方形のたてと横の長さの関係を，表にまとめます。
解答用紙の表のあいているところに，数を書き入れましょう。
{image1}',2,75.4,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=10',4,8);
INSERT INTO "question" VALUES (24,2007,'A',7,3,' 長方形や正方形のたての長さが 1 cm ずつ増えると，横の長さはどう
なりますか。
解答用紙にあてはまる数を書き，「増える」か「減る」かのどちらかを
○ で囲みましょう。',2,75.3,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=10',4,8);
INSERT INTO "question" VALUES (25,2007,'B',1,0,'図アのような，たてが 6 m，横が 9 m の長方形の形をした花だんがあります。
この中に，たてが 3 m，横が 5 m の長方形の{image1}の部分があります。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (26,2007,'B',1,1,'{image1}の部分のまわりにロープをはります。 {image1}の部分のまわり
にはるロープの長さは，どのような式で求められますか。
下の １ から ５ までの中から２つ選んで，その番号を書きましょう。',1,67.5,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_b.pdf#page=2',4,8);
INSERT INTO "question" VALUES (27,2007,'B',1,2,' みさきさんは，花だんの白い {image1}の部分にチューリップを植えます。
 {image2}
{image1} の部分の面積は，どのような式で求められますか。
下の １ から ４ までの中から 1 つ選んで，その番号を書きましょう。',1,88.2,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_b.pdf#page=3',4,8);
INSERT INTO "question" VALUES (28,2007,'B',1,3,'下の図イ，ウ，エ，オは，たてが 6 m，横が 9 mの長方形の形をした
花だんです。この中に，たてが 3 m，横が 5 mの長方形の {image1}の部分が
あります。
図イ，ウ，エ，オの白い部分の面積は，図アの {image2}の部分の面積と
同じになります。なぜ，面積が同じになるのですか。
そのわけを，言葉や式や図を使ってかきましょう。
{image3}',3,68.1,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_b.pdf#page=4',4,3);
INSERT INTO "question" VALUES (29,2007,'B',2,0,'1 個 25 円のチョコレートを 12 個買います。代金は何円になるかを求めます。
そこで，さちよさんは，筆算をしようとしました。
{image1}
それを聞いて，たかしさんとえつ子さんは，筆算をしないで 25 × 12 を
かんたんに求めるくふうを思いつきました。
{image2}
次に，さちよさんは，32 個のときの代金は何円になるかを求めようとして
います。
{image3}
あなたも，たかしさんやえつ子さんと同じように，25 × 32 をくふうして
計算しましょう。
計算のくふうを，言葉や式を使って書きましょう。',3,59.0,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_b.pdf#page=5',5,8);
INSERT INTO "question" VALUES (30,2007,'B',3,0,'あき子さんは，日本の漁業の学習で下の棒グラフを見ています。
この棒グラフは，漁業にたずさわる人の数を，男性の年
齢別のグループと
女性のグループに分けて，1983 年（昭和58 年）から10 年ごとに表しています。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (31,2007,'B',3,1,'1983 年（昭和 58 年）で，漁業にたずさわる人の数がいちばん多いのは，
どのグループですか。また，2003 年（平成 15 年）で，漁業にたずさわる
人の数がいちばん多いのは，どのグループですか。
下の １ から ４ までの中から，それぞれ 1 つずつ選んで，その番号
を書きましょう。',1,91.0,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_b.pdf#page=8',3,8);
INSERT INTO "question" VALUES (32,2007,'B',3,2,'左の棒グラフを見ると，漁業にたずさわる人の全体の数が変わってきた
ことがわかります。
1983 年（昭和 58 年）から 2003 年（平成 15 年）までに，全体の数が
どのように変わってきたかを書きましょう。',2,85.3,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_b.pdf#page=8',3,8);
INSERT INTO "question" VALUES (33,2007,'B',3,3,' 次に，あき子さんは，1983 年（昭和 58 年）から 10 年ごとに，漁業に
たずさわる人の数のグループ別の割合
を，帯グラフで表してみました。
{image1}
左の帯グラフを見ると，1983 年（昭和 58 年）から 2003 年（平成 15年）
までの変化について，どのようなことがわかりますか。
下の １ から ５ までの中から正しいものを２つ選んで，その番号を書き
ましょう。',1,54.1,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_b.pdf#page=9',5,8);
INSERT INTO "question" VALUES (34,2007,'B',4,0,'まなぶさんの町にケーキ屋があります。
{image1}
このケーキ屋のロールケーキ，チーズケーキ，
イチゴケーキ，チョコレートケーキの定価は，
次のとおりです。
{image2}
このケーキ屋は，木曜日と日曜日が安売りの日です。木曜日と日曜日は，
次のようにケーキを売っています。
{image3}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (35,2007,'B',4,1,'まなぶさんは，チーズケーキ 1 個とチョコレートケーキ 1 個を買おうと
思います。
{image1}
木曜日の代金と日曜日の代金では，どちらのほうがいくら安くなりますか。
求める式と答えを，それぞれ書きましょう。',3,29.5,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_b.pdf#page=12',5,8);
INSERT INTO "question" VALUES (36,2007,'B',4,2,' 日曜日に，まなぶさんはケーキを 5 個買いに行きました。
ケーキ 5 個の代金を，ちょうど1500円にしようと思います。
まなぶさんは，まず，ロールケーキ，イチゴケーキ，チョコレートケーキを
1 個ずつ選びました。
{image1}
残り 2 個のケーキは，ロールケーキ，チーズケーキ，イチゴケーキ，
チョコレートケーキの中から何を選べばよいですか。
1 通りだけ，答えを書きましょう。',2,59.3,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_b.pdf#page=12',3,1);
INSERT INTO "question" VALUES (37,2007,'B',5,0,'ひろしさんは，土曜日に買い物に行きました。交差点Ⓐから交差点Ⓑまで
行くのに，下の地図の中にある{image1}の道を通りました。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (38,2007,'B',5,1,'ひろしさんは買い物を終えたので，交差点Ⓑから交差点Ⓐまで帰ろうと
思います。
ひろしさんは，次のようなことを考えています。
{image1}
来たときに通った道を通らずに，同じ道のりで帰るためには，ひろしさん
はどの道を通ればよいですか。
解答用紙の地図に，1 通りだけ，線（ ー ）をかきましょう。',2,71.4,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_b.pdf#page=14',5,4);
INSERT INTO "question" VALUES (39,2007,'B',5,2,'ひろしさんは，次の日の日曜日に，交差点Ⓐから交差点Ⓒを通って
交差点Ⓑまで行きました。
土曜日に通った道と，日曜日に通った道では，どちらの道のりのほうが
長いですか。
答えを書きましょう。
{image1}',2,79.2,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_b.pdf#page=15',3,4);
INSERT INTO "question" VALUES (40,2007,'B',5,3,' ひろしさんの家の近くに東公園があります。
東公園の面積と中央公園の面積では，どちらのほうが広いですか。
答えを書きましょう。また，そのわけを，言葉や式などを使って書きま
しょう。
{image1}',3,18.2,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_b.pdf#page=16',5,3);
INSERT INTO "question" VALUES (41,2007,'B',6,0,'体育で走り高とびの学習をしています。
走り高とびの記録は，身長と50 m 走の記録に関係すると言われています。
次の式で計算すると，走り高とびのめあてとなる高さが何 cm になるかが
わかります。
{image1}
けんたさんとよしおさんの身長と50m走の記録は，次のとおりです。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (42,2007,'B',6,1,'けんたさんは，左の式を使って，自分のめあてとなる高さを計算して
求めました。
実際に走り高とびをすると，記録は 115 cm でした。この記録を，けんた
さんのめあてとなる高さと比べると，どのようなことが言えますか。
下の １ から ３ までの中から正しいものを 1 つ選んで，その番号を
書きましょう。',1,65.1,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_b.pdf#page=18',4,8);
INSERT INTO "question" VALUES (43,2007,'B',6,2,' よしおさんも，左の式を使って，自分のめあてとなる高さを計算して
求めようとしています。
けんたさんは，けんたさんとよしおさんの身長と 50 m 走の記録を見て，
次のように言いました。
{image1}
けんたさんは，なぜ「高くなることが，計算しなくてもわかる」と
言ったのですか。
そのわけを，言葉や式を使って書きましょう。',3,51.4,'https://www.nier.go.jp/tyousa/07mondai_shou_sansuu_b.pdf#page=18',5,8);
INSERT INTO "question" VALUES (44,2008,'A',1,0,'次の計算をしましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (45,2008,'A',1,1,'132 - 124',2,93.1,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=3',3,1);
INSERT INTO "question" VALUES (46,2008,'A',1,2,' 52 × 41',2,86.5,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=3',3,1);
INSERT INTO "question" VALUES (47,2008,'A',1,3,' 6 + 0.5',2,83.1,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=3',4,1);
INSERT INTO "question" VALUES (48,2008,'A',1,4,'68.4 ÷ 36',2,76.3,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=3',5,1);
INSERT INTO "question" VALUES (49,2008,'A',1,5,'3 + 2 × 4',2,71.1,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=3',4,1);
INSERT INTO "question" VALUES (50,2008,'A',1,6,'2 ÷ 3 （商を分数で表しましょう。)',2,73.8,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=3',5,1);
INSERT INTO "question" VALUES (51,2008,'A',2,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (52,2008,'A',2,1,'10 を 6 個，1 を 8 個，0.1 を 3 個あわせた数を書きましょう。',2,89.5,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=4',4,1);
INSERT INTO "question" VALUES (53,2008,'A',2,2,'10 は，7/10は，次のどれと同じ大きさですか。下の １ から ４ までの中から
1 つ選んで，その番号を書きましょう。',1,82.3,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=4',5,1);
INSERT INTO "question" VALUES (54,2008,'A',3,0,'下にあげた 4 つの式で， ●は，0 でない同じ数を表しています。
計算の答えが●の表す数より大きくなるものを，下の １ から ４ まで
の中からすべて選んで，その番号を書きましょう。',1,45.3,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=5',5,1);
INSERT INTO "question" VALUES (55,2008,'A',4,0,'テープが 3 本あります。テープの長さは，次のようになっています。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (56,2008,'A',4,1,'黄色のテープの長さは，赤色のテープの長さの何倍ですか。求める式と
答えを書きましょう。',2,83.1,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=6',4,1);
INSERT INTO "question" VALUES (57,2008,'A',4,2,'青色のテープの長さは，黄色のテープの長さの何倍ですか。求める式と
答えを書きましょう。',2,55.7,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=6',5,1);
INSERT INTO "question" VALUES (58,2008,'A',5,0,'次の平行四辺形の面積を求める式と答えを書きましょう。
{image1}',2,85.3,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=7',5,3);
INSERT INTO "question" VALUES (59,2008,'A',6,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (60,2008,'A',6,1,' 約 1 kg の重さのものを，下の １ から ４ までの中から 1 つ選んで，
その番号を書きましょう。',1,65.8,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=8',3,3);
INSERT INTO "question" VALUES (61,2008,'A',6,2,' 約 150 cm2の面積のものを，下の １ から ４ までの中から 1 つ選んで，
その番号を書きましょう。',1,17.8,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=8',4,3);
INSERT INTO "question" VALUES (62,2008,'A',7,0,'円周率は，
円周の長さ ÷□
で求めることができます。
□の中にあてはまる言葉を，下の １ から ４ までの中から 1 つ
選んで，その番号を書きましょう。',1,76.9,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=9',5,4);
INSERT INTO "question" VALUES (63,2008,'A',8,0,'次の図のようなひし形アがあります。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (64,2008,'A',8,1,' ひし形アを，下の図のように 1 本の対角線で切ります。
このときにできる①の部分の三角形の名前を書きましょう。
{image1}',2,77.6,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=10',5,4);
INSERT INTO "question" VALUES (65,2008,'A',8,2,'ひし形アを，下の図のように 2 本の対角線で切ります。
このときにできる②の部分の三角形の名前を書きましょう。
{image1}',2,64.3,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=10',5,4);
INSERT INTO "question" VALUES (66,2008,'A',9,0,'あきらさんの学校で，3 月に貸し出された本を調べました。下の円グラフは，
貸し出された本の冊数の種類別の割合を表したものです。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (67,2008,'A',9,1,'「科学」の本の冊数の割合は，全体の何％ですか。答えを書きましょう。',2,91.5,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=11',5,8);
INSERT INTO "question" VALUES (68,2008,'A',9,2,' 3 月に貸し出された本の冊数は 620 冊で，そのうち，「物語」の本の冊数
の割合は，全体の 40 ％です。「物語」の本の冊数は何冊ですか。求める式と
答えを書きましょう。',2,55.1,'https://www.nier.go.jp/08tyousa/08mondai_03.pdf#page=11',5,8);
INSERT INTO "question" VALUES (69,2008,'B',1,0,'下の図のような，縦が 4 m，横が 3 m の長方形の部屋があります。
部屋の東側には，ドアがあります。このドアは，はばが 75 cm で，部屋の内
側に開きます。
たか子さんは，この部屋の中に，いろいろな物を置こうと考えています。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (70,2008,'B',1,1,' ドアを開け閉めするときに，置いた物にドアが当たってしまう場所と，
当たらない場所を調べて図に表します。
ドアが当たってしまう場所を{image1}で，当たらない場所を{image2}で表す
とき，それぞれの場所を正しく表している図を，下の １ から ４ までの中
から 1 つ選んで，その番号を書きましょう。
{image3}',1,85.0,'https://www.nier.go.jp/08tyousa/08mondai_04.pdf#page=3',4,4);
INSERT INTO "question" VALUES (71,2008,'B',1,2,'たか子さんは，下の図のように，北側と西側のかべにつくように机を置き
ました。
{image1}
たか子さんの家には，次の図のような，はばが異なる戸だなが全部で 3 つ
あります。
{image2}
たか子さんは，3 つの戸だなの中から 2 つを選び，下の図のように，ドアが
当たらない場所に置きたいと考えています。2 つの戸だなは，後ろ側を北側
のかべにつけて，机の横に並べて置きます。
{image3}
すると，たか子さんのお姉さんが，次のように言いました。
{image4}
お姉さんが，「3 つの戸だなの中から，どれとどれを選んで置いても，ドア
を開け閉めすると，戸だなに当たってしまう」と言ったことが正しいわけを，
式と言葉を使って書きましょう。',3,30.3,'https://www.nier.go.jp/08tyousa/08mondai_04.pdf#page=4',3,1);
INSERT INTO "question" VALUES (72,2008,'B',2,0,'ひろしさんが住んでいるＡ町の農業生産額について，下の 2 種類の資料を
使って調べます。
棒グラフは，農業生産額を
1970 年から 10 年ごとに表しています。
{image1}
円 グ ラ フ は，1970 年 と
2000 年の農業生産額の種類別の割合を表しています。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (73,2008,'B',2,1,'Ａ町の 1980 年の農業生産額は何円ですか。答えを書きましょう。',2,84.4,'https://www.nier.go.jp/08tyousa/08mondai_04.pdf#page=6',4,1);
INSERT INTO "question" VALUES (74,2008,'B',2,2,' 下のように，棒グラフと円グラフに表された生産額や割合に， ア から コ
までの記号を付けました。
Ａ町の 2000 年の野菜の生産額を求めるためには，資料の中の ア から
コ までのうち，どれが必要ですか。 ア から コ までの中から２つ選んで，そ
の記号を書きましょう。
{image1}',1,58.5,'https://www.nier.go.jp/08tyousa/08mondai_04.pdf#page=7',5,8);
INSERT INTO "question" VALUES (75,2008,'B',2,3,'次は，米について考えます。
Ａ町の 1970 年と 2000 年の米の生産額について，ひろしさんは，次の
ように言いました。
{image1}
ひろしさんの言っていることは，正しいですか。「正しい」か「正しくない」
かのどちらかを○で囲みましょう。また，そのわけを，言葉や式を使って
書きましょう。',3,17.6,'https://www.nier.go.jp/08tyousa/08mondai_04.pdf#page=7',5,8);
INSERT INTO "question" VALUES (76,2008,'B',3,0,'下の図のように，三角形の頂点を中心に半径 10 cm の円の一部をかいて，
黒くぬります。
{image1}
下の図のように，三角形を 3 つの部分に切って頂点であわせると，黒くぬっ
た部分は，円の半分の図形になりました。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (77,2008,'B',3,1,' 三角形の 3 つの黒い部分をあわせた面積を求める式を，下の １ から ４
までの中から 1 つ選んで，その番号を書きましょう。
ただし，円周率は，3.14 とします。',1,58.0,'https://www.nier.go.jp/08tyousa/08mondai_04.pdf#page=8',5,4);
INSERT INTO "question" VALUES (78,2008,'B',3,2,' 次に，下の図のように，長方形の頂点を中心に半径 10 cm の円
の一部をかいて，黒くぬります。長方形の 4 つの黒い部分をあ
わせた面積は，左のページの三角形の 3 つの黒い部分をあわせた
面積の，何倍になりますか。答えを書きましょう。
{image1}',2,69.3,'https://www.nier.go.jp/08tyousa/08mondai_04.pdf#page=9',5,3);
INSERT INTO "question" VALUES (79,2008,'B',3,3,'今度は，長方形アと四角形イについて，下の図のように，頂点を中心に
半径 10 cm の円の一部をかいて，黒くぬります。
{image1}
長方形アの 4 つの黒い部分をあわせた面積と，四角形イの 4 つの黒い部
分をあわせた面積を比べると，どのようなことが言えますか。下の １ から
３ までの中から正しいものを 1 つ選んで，その番号を書きましょう。また，
その番号を選んだわけを，言葉や式を使って書きましょう。',3,33.4,'https://www.nier.go.jp/08tyousa/08mondai_04.pdf#page=9',5,3);
INSERT INTO "question" VALUES (80,2008,'B',4,0,'まなみさんの学級では，5 か所のそうじを，5 つの班で
分担して行います。そこで，下の図のようなそうじ当番
表を作りました。中の円は，回すことができます。
{image1}
そうじは 1 学期の最初の週から始めます。そうじ場所は 1 週間で交代し，
2 週目からは，中の円を右回りに 1 つずつ回します。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (81,2008,'B',4,1,' 7 週目のそうじ当番表は，上の 1 週目から 5 週目までのそうじ当番表の中
で，どれと同じになりますか。下の １ から ５ までの中から 1 つ選んで，
その番号を書きましょう。',1,81.3,'https://www.nier.go.jp/08tyousa/08mondai_04.pdf#page=11',1,1);
INSERT INTO "question" VALUES (82,2008,'B',4,2,'まなみさんは，1 班です。 1 週目
カレンダーを見ると，1 学期は，全部で 15週ありま
す。1 学期の中で，1 班が教室のそうじをする週をすべ
て求めます。
{image1}
まなみさんは，式を使って，次のように求めました。
{image2}
次に，まなみさんと同じ求め方で，1 学期の中で，1 班が校庭のそうじを
する週をすべて求めます。
下にある求め方の， {image3}の中には数を， {image4}の中には式と言葉を，（ ）
の中には言葉を入れましょう。それぞれ解答用紙に書きましょう。
{image5}',3,38.5,'https://www.nier.go.jp/08tyousa/08mondai_04.pdf#page=12',4,8);
INSERT INTO "question" VALUES (83,2008,'B',5,0,'洋平さんの学校では，毎年 4 月に身長を測っています。
保健の学習で，学年ごとの身長を次のように表にまとめました。
{image1}
そして，上の表を見て，身長を下の折れ線グラフに表しました。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (84,2008,'B',5,1,'洋平さんは，身長が学年ごとにどのくらいのびたのかを表で調べ，身長の
のびを棒グラフに表しています。
5 年生から 6 年生までの身長ののびは，何 cm ですか。答えを書きましょ
う。
また，解答用紙に棒（{image1}）をかいて，棒グラフを完成させましょう。
他の棒と同じように，棒の中にななめの線を入れてかきましょう。
{image2}
棒グラフの「 1 ∼ 2 」は，「 1 年生から 2 年生まで」を表しています。
下の折れ線グラフは，洋平さんと同じ学級の京子さん，幸二さん，
直美さん，健太さんの 4 人のうち，ある 1 人の身長を表しています。
{image3}
下の棒グラフは，4 人の学年ごとの身長ののびを表しています。
{image4}',2,68.8,'https://www.nier.go.jp/08tyousa/08mondai_04.pdf#page=15',3,8);
INSERT INTO "question" VALUES (85,2008,'B',5,2,'左のページの折れ線グラフが，だれの身長を表したものかを考えます。
洋平さんは，折れ線グラフの{image1}の部分と，棒グラフ４の{image2}の部分
を見て，次のように言いました。
{image3}
洋平さんが，「健太さんの身長を表したものではない」とわかったのは，
折れ線グラフの{image1}の部分の変わり方と，棒グラフ４の{image2}の部分
の身長ののびを比べて，どのようなちがいがあるからですか。それぞれの
グラフを見て，そのちがいを，言葉や数を使って書きましょう。',3,19.6,'https://www.nier.go.jp/08tyousa/08mondai_04.pdf#page=17',4,8);
INSERT INTO "question" VALUES (86,2008,'B',5,3,'左のページの折れ線グラフは，健太さんの身長を表したものではないことが，
⑵でわかりました。
左のページの折れ線グラフは，京子さん，幸二さん，直美さんの 3 人のうち，
だれの身長を表したものですか。左のページの １ から ３ までの中から，
あてはまる人の身長ののびを表している棒グラフを 1 つ選んで，その番号を
書きましょう。',1,28.2,'https://www.nier.go.jp/08tyousa/08mondai_04.pdf#page=17',4,8);
INSERT INTO "question" VALUES (87,2009,'A',1,0,'次の計算をしましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (88,2009,'A',1,1,'153 ＋ 49',2,95.1,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_a.pdf#page=3',3,1);
INSERT INTO "question" VALUES (89,2009,'A',1,2,'725 × 8',2,85.7,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_a.pdf#page=3',3,1);
INSERT INTO "question" VALUES (90,2009,'A',1,3,'204 ÷ 4',2,95.4,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_a.pdf#page=3',4,1);
INSERT INTO "question" VALUES (91,2009,'A',1,4,'48.1 ÷ 1.3',2,80.5,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_a.pdf#page=3',5,1);
INSERT INTO "question" VALUES (92,2009,'A',1,5,'7/6 - 2/6',2,97.8,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_a.pdf#page=3',5,1);
INSERT INTO "question" VALUES (93,2009,'A',1,6,'80 − 30 ÷ 5',2,67.0,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_a.pdf#page=3',4,8);
INSERT INTO "question" VALUES (94,2009,'A',2,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (95,2009,'A',2,1,'次の数直線のアの目もりが表す数を書きましょう。
{image1}',2,64.3,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_a.pdf#page=4',3,1);
INSERT INTO "question" VALUES (96,2009,'A',2,2,'100 を 45 個集めた数を書きましょう。',2,73.5,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_a.pdf#page=4',2,1);
INSERT INTO "question" VALUES (97,2009,'A',2,3,' 74291 を，四捨五入して，千の位までの概数で表したものを，下の
１ から ４ までの中から 1 つ選んで，その番号を書きましょう。',1,75.9,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_a.pdf#page=4',4,1);
INSERT INTO "question" VALUES (98,2009,'A',2,4,'次の数の中から偶数をすべて選んで，書きましょう。
0 ， 1 ， 35 ， 78 ， 100',1,77.5,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_a.pdf#page=4',5,1);
INSERT INTO "question" VALUES (99,2009,'A',3,0,'千円札を長方形とみると，長いほうの辺は，どれくらいの長さですか。
下の １ から ４ までの中から 1 つ選んで，その番号を書きましょう。',1,89.9,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_a.pdf#page=5',2,3);
INSERT INTO "question" VALUES (100,2009,'A',4,0,'ア の角の大きさを分度器ではかろうとしています。
{image1}
ア の角の大きさは何度ですか。答えを書きましょう。
{image2}',2,78.9,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_a.pdf#page=6',4,3);
INSERT INTO "question" VALUES (101,2009,'A',5,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (102,2009,'A',5,1,'下の図のように，四角形を 2 つの三角形に分けて，四角形の 4 つの角の大
きさの和を求めます。
三角形の 3 つの角の大きさの和が 180°であることを使って，四角形の
4 つの角の大きさの和を求める式を書きましょう。
ただし，計算の答えを書く必要はありません。
{image1}',2,68.1,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_a.pdf#page=7',5,4);
INSERT INTO "question" VALUES (103,2009,'A',5,2,'次の図のような長方形があります。
{image1}
この長方形を，下の図のように 1 本の対角線で切ります。
{image2}
このときにできる ア の部分の図形の名前を，下の １ から ５ までの中
から 1 つ選んで，その番号を書きましょう。',1,83.5,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_a.pdf#page=8',3,4);
INSERT INTO "question" VALUES (104,2009,'A',5,3,'下の図のような平行四辺形アイウエがあります。
{image1}
辺アエの長さは何 cm ですか。答えを書きましょう。',2,92.7,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_a.pdf#page=9',5,4);
INSERT INTO "question" VALUES (105,2009,'A',6,0,'下の図のような三角形の面積が何 cm2
になるかを求めます。この三角形の面
積を求める式を書きましょう。
ただし，図の 1 目もりは 1 cm とします。また，計算の答えを書く必要はあ
りません。
{image1}',2,67.1,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_a.pdf#page=10',5,3);
INSERT INTO "question" VALUES (106,2009,'A',7,0,'ある会場に小学生が集まりました。
集まった小学生 200 人のうち 80 人が女子でした。
女子の人数の割合は，集まった小学生の人数の何 ％ ですか。下の １ から
４ までの中から 1 つ選んで，その番号を書きましょう。',1,57.1,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_a.pdf#page=11',5,8);
INSERT INTO "question" VALUES (107,2009,'A',8,0,'家でイヌやネコを飼っているかどうかを，13 人に聞いて，下のように記録
しました。
{image1}
上の記録を下の表にまとめます。
下の表のアにあてはまる数を書きましょう。
{image2}',2,69.0,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_a.pdf#page=12',4,8);
INSERT INTO "question" VALUES (108,2009,'B',1,0,'ゆうじさんの学校では，子どもまつりの準備をすることになりました。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (109,2009,'B',1,1,'ゆうじさんの学校には，次の図のような階段があります。下の{image1}の
場所に，子どもまつりのポスターをはろうと思います。
{image2}
上の図のかべの高さを知りたいので，階段を使って調べます。
かべの高さを求めるためには，下のアからエまでのうち，どれが必要です
か。アからエまでの中から必要なものをすべて選んで，その記号を書きま
しょう。また，かべの高さを求める式を書きましょう。
ただし，計算の答えを書く必要はありません。
{image3}',2,51.3,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_b.pdf#page=3',3,1);
INSERT INTO "question" VALUES (110,2009,'B',1,2,'下の図の点オから点クまでのところに，かざりをつけようと思います。
点オから点クまでの{image1}の部分の長さを知りたいのですが，高い場所
なので，長さを直接はかることができません。
{image2}
上の四角形オカキクは，平行四辺形とみることができます。
そこで，ゆうじさんは，点オから点クまでの長さを知るためには，
点カから点キまでの長さをはかればよいと考えました。
このように考えたわけとして正しいものを，下の １ から ５ までの中か
ら 1 つ選んで，その番号を書きましょう。',1,65.3,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_b.pdf#page=4',5,4);
INSERT INTO "question" VALUES (111,2009,'B',1,3,'下の図のように，6 つの円の中に「子どもまつり」と書かれた長方形の紙
があります。
{image1}
紙のたての長さは 80 cm，横の長さは 120 cm で，図のように，紙いっ
ぱいに 6 つの同じ大きさの円がかかれています。
これと同じものを作りたいので，1 つの円の半径の長さが何 cm になるか
を求めます。
ゆうじさんは，紙のたての長さを使って，1 つの円の半径の長さを，次の
ように求めました。
{image2}
ゆうじさんと同じ求め方で，紙の横の長さを使って，1 つの円の半径の長
さを求めると，どのような式と説明になりますか。
下にある求め方の，2 つの式の□の中には数を，[ ]の中には
言葉と式を入れましょう。それぞれ解答用紙に書きましょう。
{image3}',3,30.5,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_b.pdf#page=5',4,4);
INSERT INTO "question" VALUES (112,2009,'B',2,0,'上皿てんびんと分銅を使って，いろいろな物の重さを調べています。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (113,2009,'B',2,1,'たかしさんは，消しゴムの重さをはかっています。
下の図のように，左の皿に消しゴムをのせ，右の皿に 5 g，1 g，0.5 g の
分銅を 1 つずつのせるとつりあいました。
左の皿にのせた消しゴムの重さは何 g ですか。答えを書きましょう。
{image1}',2,90.2,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_b.pdf#page=8',4,1);
INSERT INTO "question" VALUES (114,2009,'B',2,2,'たかしさんは，赤，青，黄，緑，黒の 5 つの球の
重さをはかり，その結果を下のように紙に記録して
おきました。
{image1}
ところが，どの色の球がどの重さなのかわからな
くなってしまいました。そこで，たかしさんは，黒
の球の重さをもう一度調べるために，3 つの実験を
次の順番で行いました。
{image2}
たかしさんは，実験①，実験①と②について，下のように表にまとめました。
{image3}
表の続きをまとめます。
実験①と②と③について，上の表のアとイに入る言葉や重さを書きましょう。',3,45.9,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_b.pdf#page=9',3,3);
INSERT INTO "question" VALUES (115,2009,'B',3,0,'よう子さんたちは，港博物館に行くことにしました。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (116,2009,'B',3,1,'よう子さんたちは，バスに乗って港博物館に行きます。
下の表は，乗車するバス停の時刻表の一部です。
{image1}
このバス停には，午前 9 時 40 分に集合します。
港博物館までは，バスで 20 分かかります。
午前 10 時 20 分までに，港博物館に着くためには，午前何時何分に発車
する予定のバスに乗ればよいですか。その時刻をすべて書きましょう。',2,40.0,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_b.pdf#page=11',3,3);
INSERT INTO "question" VALUES (117,2009,'B',3,2,'よう子さんたちは，港博物館に来て，下のようなグラフを見ています。
{image1}
上のグラフで，2005 年に港に入った船の数は，いちばん多かった年と比
べて約何せき減りましたか。一万の位までの概数で答えを書きましょう。',2,54.9,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_b.pdf#page=12',4,1);
INSERT INTO "question" VALUES (118,2009,'B',3,3,'よう子さんたちは，おみやげ売り場に来ています。
この博物館で売られているハンカチ，ボールペン，ノート，消しゴムの定
価は，次のとおりです。
{image1}
よう子さんは，ハンカチ，ボールペン，ノート，消しゴムの中から 2 種類
の品物を買おうと思っています。使える金額は 500 円です。
よう子さんは，次のことに気がつきました。
{image2}
ハンカチを買うと，もう 1 種類の品物が買えないわけを，式と言葉を使っ
て書きましょう。',3,33.8,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_b.pdf#page=13',3,1);
INSERT INTO "question" VALUES (119,2009,'B',4,0,'下のようなたてが 2 cm，横が 1 cm の長方形のカードがあります。この
カードを，いろいろな大きさの長方形の板に，はみださないように，すきまな
くしきつめます。
{image1}
例えば，たてが 2 cm，横が 4 cm の長方形の板に，カードをすきまなくしき
つめるとき，図アや図イのようなしきつめ方があります。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (120,2009,'B',4,1,'下のようなたてが 4 cm，横が 5 cm の長方形の板に，カードをすきまな
くしきつめます。
{image1}
上の長方形の板にカードをすきまなくしきつめるとき，どのようなしきつ
め方がありますか。解答用紙の図の{image2}をなぞって，2 通りかきましょ
う。また，この長方形の板にカードをすきまなくしきつめるには，カードは
何枚必要ですか。答えを書きましょう。',2,79.2,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_b.pdf#page=16',4,3);
INSERT INTO "question" VALUES (121,2009,'B',4,2,'次に，下のようなたてが 5 cm，横が 7 cm の長方形の板に，カードをすき
まなくしきつめられるかどうかを調べます。
{image1}
上の長方形の板にカードをすきまなくしきつ
められるかどうかについて，あき子さんが次の
ように言いました。
{image2} {image3}
この長方形の板に，カードをすきまなくしきつめることは，できません。
どのように考えれば，実際にカードをおいたり，おいた図をかいたりして
調べなくても，しきつめられないことがわかりますか。その考えを，言葉や
式を使って書きましょう。',3,56.3,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_b.pdf#page=17',5,1);
INSERT INTO "question" VALUES (122,2009,'B',4,3,'今まで調べた長方形の板について，カードをすきまなくしきつめられるか
どうかをまとめると，下の表のようになります。
{image1}
上の表を見て，まことさんは次のように言いました。
{image2}
カードをすきまなくしきつめられない長方形の板のうち，たてが 5 cm よ
り長く，横が 7 cm より長いものを 1 つ考えて，それぞれの辺の長さを書き
ましょう。
ただし，辺の長さは整数とします。',2,49.0,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_b.pdf#page=18',5,1);
INSERT INTO "question" VALUES (123,2009,'B',5,0,'あかねさんの学校では，リサイクル活動を行っています。
あかねさんたちは，4 月，5 月，6 月のリサイクル活動で集めたものの重さ
を，下のようにグラフにまとめました。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (124,2009,'B',5,1,'4 月に集めたペットボトルの重さは，約何 kg ですか。答えを書きましょ
う。',2,82.1,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_b.pdf#page=19',3,8);
INSERT INTO "question" VALUES (125,2009,'B',5,2,'グラフを見ると，4 月から 6 月までの，それぞれの月に集めた空きびんの
重さの変化について，どのようなことがわかりますか。
下の １ から ３ までの中から正しいものを 1 つ選んで，その番号を書き
ましょう。',1,72.9,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_b.pdf#page=20',3,8);
INSERT INTO "question" VALUES (126,2009,'B',5,3,'4 月の全体の重さをもとにしたペットボトルの重さの割合と，6 月の全体
の重さをもとにしたペットボトルの重さの割合を比べると，どのようなこと
が言えますか。
下の １ から ３ までの中から正しいものを 1 つ選んで，その番号を書き
ましょう。また，その番号を選んだわけを，言葉や式を使って書きましょう。',3,17.9,'https://www.nier.go.jp/09chousa/09mondai_shou_sansuu_b.pdf#page=20',5,8);
INSERT INTO "question" VALUES (127,2010,'A',1,0,'次の計算をしましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (128,2010,'A',1,1,'243 − 65',2,87.0,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=3',3,1);
INSERT INTO "question" VALUES (129,2010,'A',1,2,'27 × 3.4',2,84.4,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=3',5,1);
INSERT INTO "question" VALUES (130,2010,'A',1,3,'912 ÷ 4',2,89.7,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=3',4,1);
INSERT INTO "question" VALUES (131,2010,'A',1,4,'8 − 0.5',2,83.4,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=3',4,1);
INSERT INTO "question" VALUES (132,2010,'A',1,5,' 6 ÷ 5（わりきれるまで計算して，商を小数で書きましょう。）',2,86.2,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=3',5,1);
INSERT INTO "question" VALUES (133,2010,'A',1,6,'50 ＋ 150 × 2',2,66.3,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=3',4,8);
INSERT INTO "question" VALUES (134,2010,'A',2,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (135,2010,'A',2,1,'8 m の重さが 4 kg の棒があります。
この棒の 1 m の重さは何 kg ですか。求める式と答えを書きましょう。',2,54.1,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=4',5,1);
INSERT INTO "question" VALUES (136,2010,'A',2,2,' 2 l のジュースを 3 等分すると，1 つ分の量は何 l ですか。答えを分数
で書きましょう。',2,40.6,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=4',5,1);
INSERT INTO "question" VALUES (137,2010,'A',3,0,'この長方形の黒い部分を表す分数を，下の １ から ４ までの中から 1 つ
選んで，その番号を書きましょう。
{image1}',1,69.0,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=5',5,1);
INSERT INTO "question" VALUES (138,2010,'A',4,0,'円を，下の図のようにどんどん細かく分けてならべかえると，長方形にな
ると考えられます。
したがって，円の面積は あ と い の積で求めることができます。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (139,2010,'A',4,1,' あ は円のどの部分にあたりますか。下の １ から ４ までの中から
1 つ選んで，その番号を書きましょう。',1,80.3,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=7',5,3);
INSERT INTO "question" VALUES (140,2010,'A',4,2,'い は円のどの部分にあたりますか。下の １ から ４ までの中から
1 つ選んで，その番号を書きましょう。',1,55.5,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=7',5,3);
INSERT INTO "question" VALUES (141,2010,'A',5,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (142,2010,'A',5,1,'1 組の三角定規を下の図のように置くと，角アの大きさは何度ですか。
答えを書きましょう。
{image1}',2,82.9,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=8',4,3);
INSERT INTO "question" VALUES (143,2010,'A',5,2,'下の台形の面積を求める式と答えを書きましょう。
{image1}',2,70.4,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=9',5,3);
INSERT INTO "question" VALUES (144,2010,'A',6,0,'右の図のような立方体があります。この立方体の展開図をかきます。
{image1}
立方体の面の数は 6 つです。5 つの面を次のようにかきました。
{image2}
立方体の展開図を完成させるには，あと 1 つの面をどこにかけばよいです
か。下の図の ア から オ までの中から 1 つ選んで，その記号を書きましょう。
{image3}',1,88.4,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=10',4,4);
INSERT INTO "question" VALUES (145,2010,'A',7,0,'下の方眼紙に平行四辺形をかいています。
もう 1 つの頂点はどこになりますか。
１ から ６ までの中から 1 つ選んで，その番号を書きましょう。
{image1}',1,76.3,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=11',5,4);
INSERT INTO "question" VALUES (146,2010,'A',8,0,'次の図のような長方形の紙があります。
{image1}
この長方形を，下の図のように 1 本の対角線で 2 つに切って，組み合わせます。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (147,2010,'A',8,1,'組み合わせてできた図形の面積は，もとの長方形の面積と比べると，
どれだけの大きさになりますか。下の １ から ４ までの中から 1 つ選
んで，その番号を書きましょう。',1,82.3,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=13',5,3);
INSERT INTO "question" VALUES (148,2010,'A',8,2,' 組み合わせてできた図形の名前を，下の １ から ５ までの中から
1 つ選んで，その番号を書きましょう。',1,84.9,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=13',4,4);
INSERT INTO "question" VALUES (149,2010,'A',9,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (150,2010,'A',9,1,'下の図は，とし子さんたちの学校の畑を表しています。
{image1}
じゃがいも畑の面積 40 m2
は，学校の畑の面積 50 m2
のどれだけの割合にあたりますか。答えを書きましょう。',2,57.8,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=14',5,8);
INSERT INTO "question" VALUES (151,2010,'A',9,2,'下の折れ線グラフは，ある日の気温の変わり方を表しています。
{image1}
1 時間ごとの気温の上がり方がいちばん大きかったのは，何時と何時
の間ですか。答えを書きましょう。',2,74.0,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_a.pdf#page=15',4,8);
INSERT INTO "question" VALUES (152,2010,'B',1,0,'京子さんたちは，算数の時間に問題をつくって，話し合っています。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (153,2010,'B',1,1,'京子さんは，次の問題をつくりました。
{image1}
次に，京子さんは，この問題を解いて，下のように言いました。
{image2}
京子さんのつくった問題で，おつりの金額を何円に変えれば，えんぴ
つ 1 本の定価が整数になりますか。下の １ から ４ までの中から 1
つ選んで，その番号を書きましょう。',1,56.2,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_b.pdf#page=2',5,1);
INSERT INTO "question" VALUES (154,2010,'B',1,2,'次に，京子さんたちは，下の問題のおつりを求める式を考えています。
{image1}
直美さんは，おつりを求める式を，下のように考えて発表しました。
{image2}
直美さんの考えを聞いて，京子さんは次のように言いました。
{image3}
すると，健太さんは下のように言いました。
{image4}
おつりの 150 円が正しく求められる式になるように，解答用紙の
式に（ ）を書きましょう。',2,42.7,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_b.pdf#page=4',4,8);
INSERT INTO "question" VALUES (155,2010,'B',2,0,'よしおさんたちは，図画工作の時間に本立てを作ることにしました。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (156,2010,'B',2,1,'よしおさんは，次のような本立てを作ろうと考えています。
{image1}
本立てを作るのに使うのは，下のような板です。この板は，たてが
30 cm，横が 50 cm の長方形です。
長方形（あ），（い），（う）は{image2}の部分を，下の図の線のように切って
作ります。板の残りの{image3}の部分はあまりが出ないように切って，合同
な 2 つの長方形（え），（お）を作ります。
{image4}
切り分けた 5 枚の長方形の板は，下のように組み立てます。
{image5}
（え）はどのような長方形ですか。辺の長さと言葉を使って書きましょう。',3,32.0,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_b.pdf#page=6',5,4);
INSERT INTO "question" VALUES (157,2010,'B',2,2,'まなみさんも，よしおさんと同じように，{image1}の部分を切って 3 つの
長方形（あ），（い），（う）を作ります。
また，残りの{image2}の部分は下の図の線のように切って，合同な 2 つの
台形（か），（き）を作ります。
{image3}
左ページの図の線のように板を切ります。この板を組み立てて作ること
ができる本立てはどれですか。下の １ から ６ までの中から 2 つ選んで，
その番号を書きましょう。
{image4}',1,65.9,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_b.pdf#page=8',5,4);
INSERT INTO "question" VALUES (158,2010,'B',3,0,'まことさんは，自分の学校で 1 年間に起こったけがについて調べています。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (159,2010,'B',3,1,'はじめに，下の 3 つの円グラフを見ています。これらは，けがが起こっ
た時間，場所，けがの種類を表しています。
{image1}
けががいちばん多く起こった場所は，学校のどこですか。答えを書きま
しょう。
次に，学校で 1 年間に起こったけがの種類とけがが起こった時間につい
てまとめた，下の表を見ています。
{image2}',2,96.0,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_b.pdf#page=10',5,8);
INSERT INTO "question" VALUES (160,2010,'B',3,2,' この表の{image1}は，何を表していますか。表の中の言葉を使って書
きましょう。',3,61.6,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_b.pdf#page=11',4,8);
INSERT INTO "question" VALUES (161,2010,'B',3,3,'上の表の{image1}の部分の数を使ってかいた円グラフは，左ページの
① から ③ のうちどれですか。下の １ から ４ までの中から 1 つ選んで，
その番号を書きましょう。',1,40.2,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_b.pdf#page=11',5,8);
INSERT INTO "question" VALUES (162,2010,'B',4,0,'たかしさんたちは，次の図のような平行四辺形アイウエに，2本の
対角線をかいてできる三角形①と三角形②の面積について調べています。
{image1}
たかしさんは，三角形①と三角形②の面積が等しいことに気付きました。
{image2}
そして，どのように考えたのかを，下のように説明しました。
{image3}
次に，下の図のような台形カキクケに，2 本の対角線をかいてできる
三角形④と三角形⑤の面積について調べています。
{image4}
あかねさんは，次のように言いました。
{image5}
たかしさんと同じ考え方を使って，三角形④と三角形⑤の面積が等しくな
ることを説明すると，どのようになりますか。
下の {image6}の中に言葉を入れましょう。解答は，すべて解答用紙に書きま
しょう。
{image7}',3,33.5,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_b.pdf#page=12',5,3);
INSERT INTO "question" VALUES (163,2010,'B',5,0,'ひろしさんは，買い物に行きました。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (164,2010,'B',5,1,'下の図のように，定価 1000 円のぼうしには，「定価の 30 ％引き」
という札がついています。
{image1}
定価 1000 円の図に対して，定価の 30 ％引き後の値段を正しく表して
いる図はどれですか。下の １ から ５ までの中から 1 つ選んで，その番号
を書きましょう。
{image2}',1,69.2,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_b.pdf#page=14',5,8);
INSERT INTO "question" VALUES (165,2010,'B',5,2,'ひろしさんは，下のような定価で売られているシャツ，ズボン，くつを
1 品ずつ買います。
{image1}
ひろしさんは，下の図のような割引券を 1 枚持っています。その割引券には，
「1 品に限り，定価の 20 ％引き」と書かれています。
{image2}
シャツ，ズボン，くつのうち，どれに割引券を使うと，値引きされる金額
がいちばん大きくなりますか。
上の ア から ウ までの中から 1 つ選んで，その記号を書きましょう。また，
その記号の商品に割引券を使うと，値引きされる金額がいちばん大きく
なるわけを，言葉や式を使って書きましょう。',3,17.4,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_b.pdf#page=15',5,8);
INSERT INTO "question" VALUES (166,2010,'B',6,0,'次のようなバスのドア（{image1}の部分）について考えます。このドアは，
折りたたんで開け閉めします。
{image2}
幸子さんと洋平さんは，ドアの閉まる様子を観察して，次のことに気付き
ました。
ドアは，2 つの合同な長方形がつながってできています。ドアが完全に
開いているときは，2 つの長方形はぴったり重なります。
また，ドアが閉まる動きを表すと下の図のようになり，ドアの下には三角形
ができます。
{image3}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (167,2010,'B',6,1,'三角形アイウは，ドアが動いているときに，いつもどのような三角形
になりますか。次の １ から ３ までの中から 1 つ選んで，その番号を
書きましょう。
また，その番号の三角形になるわけを，下の あ から お までの中か
ら 1 つ選んで，その記号を書きましょう。',1,65.1,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_b.pdf#page=17',5,4);
INSERT INTO "question" VALUES (168,2010,'B',6,2,'ふたりは，次の図のように，点イと点ウはそれぞれ別の部分を通ることに
気付きました。
{image1}
そこで，ふたりは，次のように考えました。
{image2}
点ウが通る部分の長さと，点イが通る部分の長さを比べます。
辺アイの長さは 50 cm です。
幸子さんは，点ウが通る部分について，次のように考えました。
{image3}
洋平さんは，点イが通る部分について，次のように考えました。
{image4}
点イが通る部分（Ⓑ）の長さと，点ウが通る部分（Ⓐ）の長さ（100 cm）
を比べると，どのようなことが言えますか。
下の １ から ３ までの中から正しいものを 1 つ選んで，その番号を書
きましょう。また，その番号を選んだわけを，Ⓑ の長さを求める式と言葉
を使って書きましょう。
ただし，円周率は 3.14 とします。',3,14.9,'https://www.nier.go.jp/10chousa/10mondai_shou_sansuu_b.pdf#page=18',5,4);
INSERT INTO "question" VALUES (169,2011,'A',1,0,'次の計算をしましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (170,2011,'A',1,1,'806 − 9',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=4',3,1);
INSERT INTO "question" VALUES (171,2011,'A',1,2,'13.9 × 7',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=4',4,1);
INSERT INTO "question" VALUES (172,2011,'A',1,3,'12 ÷ 0.6',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=4',5,1);
INSERT INTO "question" VALUES (173,2011,'A',1,4,'8 × 4 − 2 × 5',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=4',4,8);
INSERT INTO "question" VALUES (174,2011,'A',1,5,'5 ×（ 2 ＋ 3 ）',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=4',4,8);
INSERT INTO "question" VALUES (175,2011,'A',1,6,'1(2/7)-(4/7)',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=4',4,1);
INSERT INTO "question" VALUES (176,2011,'A',1,7,'1/4+2/5',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=4',5,1);
INSERT INTO "question" VALUES (177,2011,'A',2,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (178,2011,'A',2,1,'次の数を数字で書きましょう。
{image1}',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=5',3,1);
INSERT INTO "question" VALUES (179,2011,'A',2,2,'次の式の{image1}のところにあてはまる数を書きましょう。
{image2}',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=5',5,1);
INSERT INTO "question" VALUES (180,2011,'A',2,3,' 次の 4 枚のカードがあります。
 {image1}
これら 4 枚のカードをそれぞれ 1 回ずつ使って，4 けたの整数をつくり
ます。
つくることができる数のうち，5000 にいちばん近い整数を書きましょう。',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=5',2,1);
INSERT INTO "question" VALUES (181,2011,'A',3,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (182,2011,'A',3,1,'りんご 1 個をはかりにのせると，下の図のようになりました。
このりんごの重さは何 g ですか。答えを書きましょう。
{image1}',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=6',3,3);
INSERT INTO "question" VALUES (183,2011,'A',3,2,'さち子さんは，午前 9 時 50 分に家を出発して，同じ日の午前 11 時 15 分
に動物園に着きました。家を出発してから動物園に着くまでに何時間何分
かかりましたか。答えを書きましょう。
{image1}',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=7',3,3);
INSERT INTO "question" VALUES (184,2011,'A',4,0,'下の平行四辺形の面積を求める式と答えを書きましょう。
{image1}',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=8',5,3);
INSERT INTO "question" VALUES (185,2011,'A',5,0,'下の図のような直方体があります。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (186,2011,'A',5,1,'黒くぬってある ア の面は，どのような長方形ですか。下の １ から ３
までの中から 1 つ選んで，その番号を書きましょう。',1,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=9',4,4);
INSERT INTO "question" VALUES (187,2011,'A',5,2,'この直方体の体積を求める式と答えを書きましょう。',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=9',5,3);
INSERT INTO "question" VALUES (188,2011,'A',6,0,'下の方眼紙にかいてある四角形のうち，ひし形はどれですか。
下の １ から ６ までの中から2 つ選んで，その番号を書きましょう。
{image1}',1,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=10',4,4);
INSERT INTO "question" VALUES (189,2011,'A',7,0,'下の 2 つの四角形は，合同です。
左の四角形の Ａ の角に対応する角はどれですか。右の四角形の ア の角
から エ の角までの中から 1 つ選んで，その記号を書きましょう。
{image1}',1,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=11',5,4);
INSERT INTO "question" VALUES (190,2011,'A',8,0,'あつ子さんの市には，5 つの小学校があります。
下の棒グラフは，小学校ごとの子どもの人数を表しています。
{image1}
子どもの人数がいちばん多いのは，どの小学校ですか。答えを書きましょう。',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=12',3,8);
INSERT INTO "question" VALUES (191,2011,'A',9,0,'ある会場に小学生が集まりました。
集まった小学生 100 人のうち 40 ％が女子でした。
女子の人数は何人ですか。答えを書きましょう。
また，求める式も書きましょう。
{image1}',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_a.pdf#page=13',5,8);
INSERT INTO "question" VALUES (192,2011,'B',1,0,'まなみさんとひできさんは，となりの県の友だちに，本を宅配便で送ること
にしました。
となりの県までの宅配便の送料を調べると，下の表のとおりでした。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (193,2011,'B',1,1,'ま な み さ ん は，下 の よ う な 直 方 体 の 箱 を 準 備 し ま し た。下 の 箱 の
｢3 辺の合計」は何 cm ですか。答えを書きましょう。
ま た，こ の と き に「3 辺 の 合 計」だ け で 考 え る と，荷 物 サ イ ズ は
何サイズですか。答えを書きましょう。
{image1}',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_b.pdf#page=4',3,8);
INSERT INTO "question" VALUES (194,2011,'B',1,2,'ひできさんは，下のような箱に本を入れて，荷物を送ります。荷物の
｢3 辺の合計」と「重さ」を調べると，次のようになりました。
{image1}
上の荷物を送るとき，送料は何円になりますか。答えを書きましょう。
また，その送料をどのようにして求めたのか，左ページの表の言葉と数を
使って考えを書きましょう。',3,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_b.pdf#page=5',3,3);
INSERT INTO "question" VALUES (195,2011,'B',2,0,'かずきさんは，音楽の時間に音ぷの長さについて学習しました。
音ぷの長さには，きまりがあります。
2 分音ぷ（{image1}）の長さは，4 分音ぷ（{image2}）の長さの 2 倍です。
8 分音ぷ（{image3}）の長さは，4 分音ぷ（{image2}）の長さの 0.5 倍です。
それぞれの音ぷの長さの関係を図に表すと，下のようになります。
{image4}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (196,2011,'B',2,1,' 2 分音ぷ（{image1}）の長さは，8 分音ぷ（{image2}）の長さの何倍ですか。答えを
書きましょう。',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_b.pdf#page=6',3,1);
INSERT INTO "question" VALUES (197,2011,'B',2,2,'かずきさんは，付点音ぷ（{image1}や{image2}）の長さについて調べました。すると，
次のきまりがあることがわかりました。
{image3}
このきまりをもとに，4 分音ぷ（{image4}）の長さを目もり 2 つ分とみると，
付点 4 分音ぷ（{image1}）の長さは，その 1.5 倍なので目もり 3 つ分とみることが
できます。
このことを図に表すと，2 つの音ぷの長さの関係は，下のようになります。
{image5}
今度は，2 分音ぷ（{image6}）と付点 2 分音ぷ（{image2}）の長さの関係を図に表
します。
2 つの音ぷの長さの関係を正しく表している図を，下の ア と イ から
1 つ選んで，その記号を書きましょう。また，選んだ図が正しいわけを
目もりの数と言葉を使って書きましょう。
{image7}',3,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_b.pdf#page=7',5,1);
INSERT INTO "question" VALUES (198,2011,'B',3,0,'たてが 10 cm，横が 14 cm の長方形の紙があります。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (199,2011,'B',3,1,'よし子さんは，この長方形の紙から，下の図のような作り方で，正方形を
作りました。
{image1}
{image2}
よし子さんの作り方では，四角形オカウエのどの部分とどの部分が同じに
なるように折っていますか。
下の １ から ３ までと， ４ から ６ までの中から，それぞれ 1 つずつ
選んでその番号を書きましょう。
{image3}',1,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_b.pdf#page=8',5,4);
INSERT INTO "question" VALUES (200,2011,'B',3,2,'ひろしさんは，よし子さんの作り方で，長方形の紙から本当に正方形を
作ることができたかどうかを考えています。
ひろしさんは，下の図のように 2 とおりの折り方で折ってぴったり重なれ
ば，(1) で作った四角形オカウエが正方形であることを確かめられると思いま
した。
{image1}
そこで，実際に折ってみると，どちらもぴったり重なりました。
ひろしさんは，四角形オカウエが正方形であるというために，2 とおりの
折り方で何を確かめたことになるのでしょうか。下の １ から ４ までの中
から最もふさわしいものを 1 つ選んで，その番号を書きましょう。',1,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_b.pdf#page=10',5,4);
INSERT INTO "question" VALUES (201,2011,'B',3,3,'ひろしさんは，同じ大きさの長方形の紙を使って，今度は下の図のように
折りました。
{image1}
折った紙を開いて，もとの長方形にもどすと，折り目の線のとこ
ろに，四角形キクウケができていました。
{image2}
四角形キクウケはどのような図形ですか。辺の長さと言葉を使って書きま
しょう。',3,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_b.pdf#page=11',5,4);
INSERT INTO "question" VALUES (202,2011,'B',4,0,'社会科の日本の自動車産業の学習で，下のグラフを見ています。
棒グラフは，日本での自動車の国内生産台数を表し，折れ線グラフは，自動
車の国内生産台数をもとにしたときの輸出した台数の割合を表しています。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (203,2011,'B',4,1,'上のグラフで，5 年前と比べて，国内生産台数は増えているが，輸出した
台数の割合が減っている年は何年ですか。答えを書きましょう。',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_b.pdf#page=12',4,8);
INSERT INTO "question" VALUES (204,2011,'B',4,2,'輸出した台数は，次の式で求められます。
{image1}
下グラフの 1995 年と 2000 年のところを見て考えます。
{image2}
このとき，2000 年の輸出した台数は，1995 年よりも多いことがわかります。
そのわけとして最もふさわしいものを，下の １ から ４ までの中から 1 つ選んで，その番号を書きまし
ょう。',1,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_b.pdf#page=13',5,8);
INSERT INTO "question" VALUES (205,2011,'B',4,3,'国内生産台数は，輸出した台数と輸出しなかった台数に分けることができ
ます。
あき子さんは，下のグラフの{image1}の部分を見て，1980 年と 1985 年
の輸出した台数と輸出しなかった台数について考えています。
{image2}
あき子さんは，次のように言いました。
{image3}
あき子さんが，「1980 年と 1985 年は，どちらの年も輸出した台数が
輸出しなかった台数より多いことがわかります。」と言ったことが正しい
わけを，言葉や数を使って書きましょう。',3,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_b.pdf#page=14',5,8);
INSERT INTO "question" VALUES (206,2011,'B',5,0,'けんたさんは，遊園地に行きました。
遊園地には，下の図のような観覧車がありました。
観覧車のゴンドラは，図の中の矢印（{image1}）の向き
に動いていました。
{image2}
{image3}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (207,2011,'B',5,1,'けんたさんは，観覧車に乗ろうとして，行列の最後に並びました。
そのとき，行列の先頭の 4 人が，12 のゴンドラに乗りました。
まだ，けんたさんの前には，24 人並んでいます。
ゴンドラ 1 台には，4 人まで乗ることができます。
けんたさんは，いちばん早くて， 1 から 12 までのどのゴンドラに乗
ることができますか。答えを書きましょう。',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_b.pdf#page=17',3,1);
INSERT INTO "question" VALUES (208,2011,'B',5,2,'けんたさんは，ゴンドラから降りた後，感じたことを遊園地の係の人に次の
ように話しました。
{image1}
すると，遊園地の係の人が，図や表を使って次のように説明をしてくれました。
{image2}
 けんたさんは，ゴンドラが下がっていくときも，表を使って調べることに
しました。
{image3}
ゴンドラが エ から オ に動くとき，7 m 下がることがわかりました。
ゴンドラが オ から カ に動くとき，また，カ から ア に動くとき，それ
ぞれ何 m 下がりますか。答えを書きましょう。',2,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_b.pdf#page=19',4,8);
INSERT INTO "question" VALUES (209,2011,'B',5,3,'けんたさんは，ゴンドラが エ から ア に下がっていくときも，とちゅう
で急に下がるように感じました。このことを，遊園地の係の人と同じように
説明するとどのようになりますか。
下の{image1}の中に説明の言葉や数を書きましょう。
また，( )の中には ア から カ までの中からそれぞれ選んで，その記号
を書きましょう。
解答は，すべて解答用紙に書きましょう。
{image2}',3,NULL,'https://www.nier.go.jp/11chousa/11mondai_shou_sansuu_b.pdf#page=19',4,8);
INSERT INTO "question" VALUES (210,2012,'A',1,0,'次の計算をしましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (211,2012,'A',1,1,'132 ＋ 459',2,95.8,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=4',3,1);
INSERT INTO "question" VALUES (212,2012,'A',1,2,'148 ÷ 37',2,94.4,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=4',4,1);
INSERT INTO "question" VALUES (213,2012,'A',1,3,'4.6 − 0.21',2,63.5,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=4',4,1);
INSERT INTO "question" VALUES (214,2012,'A',1,4,'90 × 0.7',2,90.8,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=4',5,1);
INSERT INTO "question" VALUES (215,2012,'A',1,5,'6 × 2 ＋ 8 × 3',2,80.3,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=4',4,8);
INSERT INTO "question" VALUES (216,2012,'A',1,6,'3/7-2/5',2,85.9,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=4',5,1);
INSERT INTO "question" VALUES (217,2012,'A',1,1,'4/5 ÷ 8',2,82.6,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=4',5,1);
INSERT INTO "question" VALUES (218,2012,'A',2,0,'次の{image1}にあてはまる数を書きましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (219,2012,'A',2,1,' 47000 は 1000 が{image1}個集まった数です。',2,89.0,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=5',3,1);
INSERT INTO "question" VALUES (220,2012,'A',2,2,'596 の1/100 の大きさを小数で表すと{image1}です。',2,73.9,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=5',5,1);
INSERT INTO "question" VALUES (221,2012,'A',3,0,'赤いテープと白いテープの長さについて，次のことがわかっています。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (222,2012,'A',3,1,'赤いテープと白いテープの長さの関係を正しく表している図はどれですか。
次の １ から ４ までの中から 1 つ選んで，その番号を書きましょう。
{image1}',1,34.3,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=6',5,1);
INSERT INTO "question" VALUES (223,2012,'A',3,2,'白いテープの長さを求める式を書きましょう。
ただし，計算の答えを書く必要はありません。',2,41.3,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=6',5,1);
INSERT INTO "question" VALUES (224,2012,'A',4,0,'下の表は，月曜日から金曜日までの 5 日間に，畑でとれたトマトの数を
調べたものです。
この 5 日間では，1 日に平均何個のトマトがとれたことになりますか。
答えを書きましょう。
{image1}',2,87.1,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=7',5,3);
INSERT INTO "question" VALUES (225,2012,'A',5,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (226,2012,'A',5,1,'下のはがきの面積は約何 cm2
ですか。次の １ から ４ までの中から
1 つ選んで，その番号を書きましょう。
{image1}',1,60.7,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=8',4,3);
INSERT INTO "question" VALUES (227,2012,'A',5,2,'下の三角形アイウの面積の求め方を考えます。
辺アイを底辺とするとき，高さはどこの長さになりますか。
次の １ から ４ までの中から 1 つ選んで，その番号を書きましょう。
{image1}',1,54.9,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=9',5,3);
INSERT INTO "question" VALUES (228,2012,'A',6,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (229,2012,'A',6,1,'下の四角形の ア の角度は何度ですか。答えを書きましょう。
{image1}',2,77.2,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=10',5,4);
INSERT INTO "question" VALUES (230,2012,'A',6,2,'下の直方体には，面 あ に垂直な辺がいくつかあります。
面 あ に垂直な辺を 1 つ選んで，書きましょう。
{image1}',2,65.0,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=11',4,4);
INSERT INTO "question" VALUES (231,2012,'A',7,0,'1 目もりが 1 cm の方眼紙に，コンパスを使って模様をかいています。
{image1}
上の図の{image2}のところに線をかくには，コンパスの針をどこにさせば
よいですか。
コンパスの針をさす場所（　・  ）を，下の図の １ から ４ までの中から
1 つ選んで，その番号を書きましょう。
また，この線をかくときには，コンパスは何 cm に開いていますか。答えを
書きましょう。
{image3}',2,76.3,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=12',3,4);
INSERT INTO "question" VALUES (232,2012,'A',8,0,'下の円グラフは，学級全体の人数をもとにして，家で犬を飼っている人の
割合を表したものです。
{image1}
犬を飼っている人は 8 人です。
この 8 人は，学級全体の人数の 25 ％にあたります。
学級全体の人数は何人ですか。求める式と答えを書きましょう。',2,58.7,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=13',5,8);
INSERT INTO "question" VALUES (233,2012,'A',9,0,'下の図のような直方体があります。
{image1}
この直方体の縦5 cm，横 3 cm の長さは変えずに，高さを 1 cm，2 cm，
3 cm，…… と変えます。このとき，体積がどのように変わるかを調べ，
下の表にまとめました。
{image2}
高さを 2 倍，3 倍，…… にすると，体積はどのように変わりますか。
次の １ から ４ までの中から 1 つ選んで，その番号を書きましょう。',1,85.0,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_a.pdf#page=14',5,3);
INSERT INTO "question" VALUES (234,2012,'B',1,0,'たかしさんは，買い物に行きました。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (235,2012,'B',1,1,'品物の代金は 320 円でした。
たかしさんは，100 円玉 3 枚がなかったので，500 円玉を出して
おつりをもらうことにしました。
すると，店員さんから「あと 20 円ありますか。」とたずねられたので，
たかしさんは，500 円玉に加えて 20 円出しました。
{image1}
たかしさんがもらったおつりは，同じ種類の硬貨が 2 枚でした。
下の 6 種類のうち，たかしさんがもらった硬貨はどれですか。答えを
書きましょう。
{image2}',2,92.7,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_b.pdf#page=4',3,1);
INSERT INTO "question" VALUES (236,2012,'B',1,2,'次の日，たかしさんは，お姉さんと買い物に行きました。
品物の代金は 630 円でした。
たかしさんは，おつりの硬貨の枚数を少なくするために，お金の出し方を
くふうして，1000 円札に 30 円を加えて出そうとしました。
すると，お姉さんが「1030 円に，あと 100 円加えたら，おつりの硬貨の
枚数がもっと少なくなるよ。」と言いました。
{image1}
たかしさんとお姉さんの出し方では，お姉さんのほうがおつりの硬貨の
枚数が少なくなると考えられます。
お姉さんの出し方のほうが少なくなると考えられるわけを，2 人のおつりの
硬貨の種類と枚数を比べて，言葉と数を使って書きましょう。',3,42.8,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_b.pdf#page=5',3,1);
INSERT INTO "question" VALUES (237,2012,'B',2,0,'ゆかりさんの学校には，小型と中型の 2 種類のとび箱があります。
小型のとび箱の1 段ごとの高さは，1 段目が30 cm，2 段目から8 段目までが
それぞれ 10 cm です。
中型のとび箱の1段ごとの高さは，1 段目が35 cm，2 段目から4 段目までが
それぞれ 15 cm，5 段目から 8 段目までがそれぞれ 10 cm です。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (238,2012,'B',2,1,'中型のとび箱を 8 段にしたときの高さを求める式はどれですか。次の
１ から ４ までの中から1つ選んで，その番号を書きましょう。',1,87.2,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_b.pdf#page=6',4,8);
INSERT INTO "question" VALUES (239,2012,'B',2,2,'ゆかりさんたちは先生から，小型と中型のとび箱を，同じ高さにして
準備するようにたのまれました。
まず，みんながよく練習している小型のとび箱を 5 段にしました。
そのときの高さは 70 cm でした。
{image1}
次に，中型のとび箱を小型のとび箱と同じ70 cm の高さにしようと思います。
中型のとび箱を 70 cm の高さにすることはできますか。
下の １ と ２ から正しいほうを選んで，その番号を書きましょう。また，
その番号を選んだわけを，言葉や数を使って書きましょう。',3,27.0,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_b.pdf#page=7',4,8);
INSERT INTO "question" VALUES (240,2012,'B',2,3,'ゆかりさんたちは，それぞれ何段の高さのときに，2 つのとび箱が同じ
高さになるのか，調べることにしました。
すると，小型のとび箱を 3 段にして中型のとび箱を 2 段にしたときに，
同じ高さになりました。また，小型のとび箱を 6 段にして中型のとび箱を
4 段にしたときも，同じ高さになりました。
{image1}
このとき，2 つのとび箱が同じ高さになるのは 50 cm と 80 cm でした。
50 cm から 30 cm 高くすると同じ高さになることがわかります。
なぜ 30 cm 高くすると同じ高さになるのですか。そのわけを，次の
１ から ４ までの中から 1 つ選んで，その番号を書きましょう。',1,56.6,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_b.pdf#page=8',5,1);
INSERT INTO "question" VALUES (241,2012,'B',3,0,'あつこさんは，長方形の中にかかれた四角形の面積について調べています。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (242,2012,'B',3,1,'図アのような，縦6 cm，横 10 cm の長方形の中にかかれたひし形の
面積を求めます。
ひし形に対角線をかくと，長方形は 8 つの直角三角形に分けられます。
{image1}
面積が等しい直角三角形にそれぞれ の印をつけると，図イのように
なります。
{image2}
図イをもとにひし形の面積の求め方を考えると，次のようになります。
{image3}
上の求め方について， 1 に入る式と 2 に入る答えを書きましょう。',2,74.5,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_b.pdf#page=10',5,3);
INSERT INTO "question" VALUES (243,2012,'B',3,2,'次に，長方形の中にいろいろな四角形をかいて，ひし形と同じように，
いつでも長方形の面積の半分になるのかどうかを調べます。
図１から図３のように，四角形の中に直角三角形をつくり，面積が
等しい直角三角形にそれぞれ〇や△などの印をつけます。
{image1}
図１から図３を見ると，長方形の面積は四角形の面積と白い部分の面積を
あわせたものになっています。
そこで，四角形の面積と白い部分の面積を比べ，長方形と四角形の面積の
関係を調べます。
これらのことを下の表にまとめます。
{image2}
上の表の ア，イ，ウ に入る言葉や印をかきましょう。',3,51.5,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_b.pdf#page=12',5,3);
INSERT INTO "question" VALUES (244,2012,'B',4,0,'ひろしさんの学級では，家庭科の調理実習でごはんとポテトサラダを
作ることにしました。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (245,2012,'B',4,1,'ごはんを作るための計画を立てます。
ごはんは，こんろに点火してから 40 分間あればできあがります。
午前 11 時 30 分までにごはんができあがるようにするには，おそくとも，
午前何時何分までに点火すればよいですか。その時刻を書きましょう。
{image1}',2,81.5,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_b.pdf#page=14',3,3);
INSERT INTO "question" VALUES (246,2012,'B',4,2,'ひろしさんの班は，ごはんができあがるまでの 40 分間を使って，
ポテトサラダを作ることができるかどうかを考えています。
そこで先生に時間のめやすをたずねると，次のように教えてくれました。
{image1}
この時間を見て，ひろしさんの班は，ごはんができあがるまでの40 分間で，
ポテトサラダを作ることができると考えました。
次のように考えると，ポテトサラダは 40 分間以内でできることが
わかります。
{image2}
上の 1 ， 2 に入る最もふさわしい数を書きましょう。',2,73.1,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_b.pdf#page=15',4,1);
INSERT INTO "question" VALUES (247,2012,'B',4,3,'調理実習の時間になりました。ごはんを作るときの 1 人分の材料と分量は
次のとおりです。
{image1}
ひろしさんは，班で使う米の重さをはかります。
最初に容器だけをはかりにのせたら，はかりの目もりは図アになりました。
次に米を入れると，はかりの目もりは図イになりました。
{image2}
ひろしさんの班がごはんを作るのに必要な水の重さは，何 g になりますか。
求め方を式や言葉で書きましょう。また，答えも書きましょう。',3,33.2,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_b.pdf#page=16',5,1);
INSERT INTO "question" VALUES (248,2012,'B',5,0,'あやかさんの学級では，一輪車で遊ぶことがはやっています。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (249,2012,'B',5,1,'あやかさんは，一輪車の高さを調節しています。
一輪車のちょうどよい高さは，地面からおへそのところまでと言われて
います。サドルの高さを調節すると，下の図の ア の長さが 20 cm になり
ました。
一輪車のタイヤの半径は 25 cm です。
{image1}
地面からあやかさんのおへそまでの高さは何cm ですか。答えを書き
ましょう。',2,64.8,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_b.pdf#page=18',3,3);
INSERT INTO "question" VALUES (250,2012,'B',5,2,'あやかさんは，タイヤを 1 回転させるごとに，一輪車がどのくらい
進むかを知りたいと思い，一輪車のタイヤの回転数と進んだ長さを調べて，
下の表にまとめました。
{image1}
あやかさんは，この表を見て，進んだ長さはタイヤの回転数に比例する
ことに気づきました。このことを使って，一輪車で運動場のトラック 1 周の
長さを求めることにしました。
トラックを 1 周すると，タイヤはちょうど 120 回転しました。
トラック 1 周の長さを求める式を，次の １ から ４ までの中から 1 つ
選んで，その番号を書きましょう。
{image2}',1,61.3,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_b.pdf#page=19',5,8);
INSERT INTO "question" VALUES (251,2012,'B',5,3,'あやかさんは，学級の男子と女子ではどちらのほうが一輪車に乗れるかを
調べてみようと思い，下のような男女別の表にまとめました。
{image1}
上の表を見て，あやかさんは次のように言いました。
{image2}
すると，この話を聞いて，たろうさんは次のように言いました。
{image3}
男子と女子それぞれで，合計の人数をもとにした乗れる人数の割合を比べ
ます。男子と女子ではどちらのほうの割合が大きいですか。
次の １ から ３ までの中から1 つ選んで，その番号を書きましょう。
また，その番号を選んだわけを，言葉や式を使って書きましょう。',3,23.8,'https://www.nier.go.jp/12chousa/12mondai_shou_sansuu_b.pdf#page=20',5,8);
INSERT INTO "question" VALUES (252,2013,'A',1,0,'次の計算をしましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (253,2013,'A',1,1,'243 − 65',2,88.3,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=4',3,1);
INSERT INTO "question" VALUES (254,2013,'A',1,2,'0.75 ＋ 0.9',2,71.5,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=4',4,1);
INSERT INTO "question" VALUES (255,2013,'A',1,3,'9.3 × 0.8',2,83.8,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=4',5,1);
INSERT INTO "question" VALUES (256,2013,'A',1,4,'6 ÷ 5（わりきれるまで計算して，商を小数で書きましょう。',2,88.4,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=4',4,1);
INSERT INTO "question" VALUES (257,2013,'A',1,5,'16 − ( 6 ＋ 3 )',2,94.4,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=4',4,8);
INSERT INTO "question" VALUES (258,2013,'A',1,6,'2(5/7) ＋1(1/7)',2,88.9,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=4',4,1);
INSERT INTO "question" VALUES (259,2013,'A',1,7,'2/9 × 4',2,89.6,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=4',5,1);
INSERT INTO "question" VALUES (260,2013,'A',2,0,'四捨五入して一万の位までのがい数にしたとき，20000になる整数を，
下の 1 から ５ までの中からすべて選んで，その番号を書きましょう。',1,60.4,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=5',4,1);
INSERT INTO "question" VALUES (261,2013,'A',3,0,'ある数を 3 でわったら，商が 9 であまりが 2 でした。
ある数を求める式を，下の 1 から 4 までの中から 1 つ選んで，その
番号を書きましょう。',1,71.8,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=6',4,1);
INSERT INTO "question" VALUES (262,2013,'A',4,0,'ＡとＢの 2 つのシートがあります。
{image1}
下の表は，シートの上にすわっている人数とシートの面積を表しています。
{image2}
どちらのシートのほうがこんでいるかを調べるために，下の計算をしました。
Ａ 12 ÷ 6 ＝ 2
Ｂ 8 ÷ 5 ＝ 1.6
上の計算からどのようなことがわかりますか。次の 1 から 4 までの
中から 1 つ選んで，その番号を書きましょう。',1,50.2,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=7',5,3);
INSERT INTO "question" VALUES (263,2013,'A',5,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (264,2013,'A',5,1,'木のまわりの長さを測るとき，下の 1 から 4 までの中からどれを
使えばよいですか。1 つ選んで，その番号を書きましょう。
{image1}',1,97.4,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=8',3,3);
INSERT INTO "question" VALUES (265,2013,'A',5,2,'1 a（ 1 アール）と同じ面積になる正方形の 1 辺の長さを，下の 1 から 4
までの中から 1 つ選んで，その番号を書きましょう。',1,52.5,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=8',4,3);
INSERT INTO "question" VALUES (266,2013,'A',5,3,'下の台形の面積を求める式と答えを書きましょう。
{image1}',2,73.5,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=9',5,3);
INSERT INTO "question" VALUES (267,2013,'A',6,0,'下の三角形ＡＢＣと合同な三角形をかくために，三角形ＡＢＣのどの辺の
長さや角の大きさを測ればよいかを考えます。
{image1}
次の 1 から 4 は，辺の長さや角の大きさを測るところに の印をつけた
ものです。三角形ＡＢＣと合同な三角形をかくことができるものを 1 つ選んで，
その番号を書きましょう。
{image2}',1,60.9,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=10',5,4);
INSERT INTO "question" VALUES (268,2013,'A',7,0,'下のような円柱があります。この円柱の展開図を，下のように
側面を長方形にしてかきました。次の問題に答えましょう。
ただし，円周率は 3.14 とします。
{image1}
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (269,2013,'A',7,1,'辺アイの長さを書きましょう。',2,90.6,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=11',5,4);
INSERT INTO "question" VALUES (270,2013,'A',7,2,'辺アエの長さを求める式と答えを書きましょう。',2,66.5,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=11',5,4);
INSERT INTO "question" VALUES (271,2013,'A',8,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (272,2013,'A',8,1,'200 cm の 50 ％の長さは，{image1}cm です。
{image1}にあてはまる数を，下の 1 から 4 までの中から 1 つ選んで，
その番号を書きましょう。',2,76.9,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=12',5,8);
INSERT INTO "question" VALUES (273,2013,'A',8,2,'500 g の 120 ％の重さは，{image1}です。
{image1}にあてはまるものを，下の 1 から 3 までの中から 1 つ選んで，
その番号を書きましょう。',2,77.1,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=12',5,8);
INSERT INTO "question" VALUES (274,2013,'A',9,0,'下の棒グラフは，ある学級の児童が，1 週間に借りた本の冊数を調べたもの
です。
{image1}
いちばん多く本を借りたのは何曜日ですか。また，その曜日に何冊借りて
いますか。それぞれ答えを書きましょう。',1,85.8,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_a.pdf#page=13',3,8);
INSERT INTO "question" VALUES (275,2013,'B',1,0,'ゆりえさんたちは，遊園地に行く計画を立てています。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (276,2013,'B',1,1,'ゆりえさんとひさこさんは，乗り物券を 1 人 8 枚ずつ買う予定です。
この遊園地の乗り物と，乗るために必要な乗り物券の枚数は，次の表の
とおりです。
{image1}
2 人は，それぞれ下の乗り物に乗る計画を立てました。
{image2}
2 人は，まだ乗り物券が残るので，ほかに乗る乗り物を下のように考えました。
{image3}
2 人は，どの乗り物に乗ることができますか。答えを書きましょう。',2,51.2,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_b.pdf#page=4',4,8);
INSERT INTO "question" VALUES (277,2013,'B',1,2,'としおさんは，乗り物に乗る計画を立てたところ，乗り物券が 15 枚
必要になることがわかりました。
乗り物券と乗り放題券（フリーパス）の料金は，下の表のとおりです。
{image1}
次の １ から ３ までの券の買い方のうち，乗り物券 15 枚分の料金が
いちばん安くなるのはどれですか。1 つ選んで，その番号を書きましょう。
また，その番号の買い方がいちばん安くなるわけを，言葉と数を使って書き
ましょう。',3,51.0,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_b.pdf#page=5',3,1);
INSERT INTO "question" VALUES (278,2013,'B',2,0,'ゆきこさんは，ふりこの実験を 3 つします。
実験では，ふれはばは変えないで，ふりこの長さとおもりの重さを変えた
ときに，ふりこが 1 往復する時間がどのようになるのかを調べます。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (279,2013,'B',2,1,'実験 1 では，ふりこの長さを 50 cm，おもりの重さを 40 g にして，
ふりこが 10 往復する時間を 6 回測定し，下の表にまとめました。
{image1}
ゆきこさんは，上の表をもとに，次の 2 つの式で 1 往復する時間の平均
を求めました。
{image2}
① の 14 . 5（秒）は，何を求めていますか。答えを書きましょう。',2,51.9,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_b.pdf#page=7',5,3);
INSERT INTO "question" VALUES (280,2013,'B',2,2,'実験 2 では，おもりの重さだけを 80 g に変えて，ふりこが 10 往復
する時間を 6 回測定し，下の表にまとめました。
すると，2 回目は正しく測定できていないことがわかりました。
{image1}
ゆきこさんは，2 回目の結果をのぞいて，5 回分の結果を使って 1 往復
する時間の平均を求めます。次の １ から ４ までの中の，どの式で
求めることができますか。1 つ選んで，その番号を書きましょう。',1,75.8,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_b.pdf#page=8',5,3);
INSERT INTO "question" VALUES (281,2013,'B',2,3,'実験３では，おもりの重さを 40 g にもどし，ふりこの長さを変えて
10 往復する時間を調べ，下の表にまとめました。
{image1}
この結果から，次のことがわかります。
{image2}
「ふりこの長さを 2 倍に変えたとき，10 往復する時間は 2 倍になって
いない」ことを，上の表の中の数と言葉を使って書きましょう。',3,35.4,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_b.pdf#page=9',5,8);
INSERT INTO "question" VALUES (282,2013,'B',3,0,'長方形の面積を 4 等分する分け方を考えました。
① 縦に線をひき，面積の等しい 2 つの長方形に分けました。
{image1}
 ② ① でできた 2 つの長方形を，さらに 2 等分する分け方を考えたところ，
下の １ から ３ の分け方を見つけました。
{image2}
はるみさん，げんたさん，あきこさんが，それぞれの分け方について，
長方形の面積が 4 等分になる理由を，下のように説明しました。
{image3}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (283,2013,'B',3,1,'上の 3 人は，左の １ ，２ ，３ のどの分け方の説明をしていますか。
あてはまる番号を書きましょう。',1,87.4,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_b.pdf#page=11',5,3);
INSERT INTO "question" VALUES (284,2013,'B',3,2,'たかしさんは，下のような分け方を考えました。
{image1}
たかしさんの分け方を見て，なおみさんが次のように言いました。
{image2}
たかしさんは，なおみさんの説明を聞いて，三角形アとイの面積も
等しくなることに気がつきました。
三角形アとイの面積が等しいことを，言葉と数を使って書きましょう。',3,42.8,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_b.pdf#page=12',5,3);
INSERT INTO "question" VALUES (285,2013,'B',3,3,'たかしさんの分け方は，下の １ から ３ のすべてがあてはまっていました。
だから，4 つの三角形はもとの長方形の面積の 4 等分になることがわかり
ました。
１ ① でできた 2 つの三角形の面積が等しい。
２ ② でできた三角形アと三角形イの面積が等しい。
３ ② でできた三角形ウと三角形エの面積が等しい。
ひろしさんは，たかしさんの分け方を使って，台形を ①， ② のように
4 つの三角形に分けました。
{image1}
すると，面積が 4 等分にならないことがわかりました。
それは，上の １ から ３ までの中のどれがあてはまらないからですか。
あてはまらないものを 1 つ選んで，その番号を書きましょう。',1,56.5,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_b.pdf#page=13',5,3);
INSERT INTO "question" VALUES (286,2013,'B',4,0,'平成 23 年（2011 年）に行われたサッカー女子ワールドカップで，
サッカー日本女子代表のなでしこジャパンが優勝しました。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (287,2013,'B',4,1,'ひろきさんは，ワールドカップ後のなでしこリーグ（日本女子サッカー
リ ー グ）の 試 合 の 観 客 数 が 増 え たのではないかと考えました。
そこで，あるサッカー場で行われた，平成 23 年のなでしこリーグの試合の
観客数を調べ，下の表にまとめました。
{image1}
ワールドカップ後の 1 試合あたりの観客数は，ワールドカップ前の
1 試合あたりの観客数の約何倍になっていますか。求め方を式や言葉を
使って書きましょう。また，答えも書きましょう。',3,43.4,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_b.pdf#page=14',5,3);
INSERT INTO "question" VALUES (288,2013,'B',4,2,'サッカーに興味をもったひろきさんは，試合をみに行きました。
ひろきさんは 2列4番 の席を探しています。
下の図の●の席は 5 列 10 番 でした。 2列4番 はどの席ですか。
解答用紙のあてはまる席に をかきましょう。
{image1}',2,94.2,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_b.pdf#page=15',4,4);
INSERT INTO "question" VALUES (289,2013,'B',4,3,'ひろきさんは，町内のサッカー大会に参加しました。
町内には，東，西，南，北の 4 つのチームがあり，ひろきさんのチームは
北チームです。1 つのチームは，ほかのチームと 2 試合ずつ行い，全部で
6 試合しました。
順位の決め方は下のとおりです。
{image1}
試合結果は次の表のとおりです。
{image2}
北チームの順位は何位ですか。「勝ち点の合計を求める式」をもとに
式を書き，勝ち点の合計と順位を書きましょう。',2,50.9,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_b.pdf#page=16',4,8);
INSERT INTO "question" VALUES (290,2013,'B',5,0,'かずやさんたちは，図書館に見学に来ています。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (291,2013,'B',5,1,'図書館の人が，平成 15 年から平成 23 年までの本の貸出冊数と来館者数
（図書館に来た人の数）のグラフを見せてくれました。棒グラフは本の
貸出冊数を，折れ線グラフは来館者数を表しています。
{image1}
かずやさんは，グラフを見て，下のことに気がつきました。
{image2}
かずやさんが言った期間は，左のグラフの何年から何年までのことですか。
次の １ から ４ までの中から 1 つ選んで，その番号を書きましょう。',1,76.2,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_b.pdf#page=18',4,8);
INSERT INTO "question" VALUES (292,2013,'B',5,2,'次に，図書館の人が，最近ではインターネットを利用して本を貸し
出す割合が増えていることを教えてくれました。
そして，次の帯グラフを見せてくれました。帯グラフは，平成 20 年
から平成 23 年までの貸出冊数の合計とインターネットを利用した割合を
表しています。
{image1}
かずやさんたちは，実際にインターネットの貸出冊数が増えているか
どうかを調べます。
インターネットの貸出冊数は，次の式で求められます。
{image2}
この式を使って，かずやさんとたまきさんは，平成 20 年と平成 21 年を
比べました。
{image3}
平成 22 年と平成 23 年を比べると，インターネットの貸出冊数は
増えていますか。下の １ から ３ までの中から 1 つ選んで，その番号を
書きましょう。また，その番号を選んだわけを，2 人の考えのどちらか
一方をもとにして，言葉と数や式を使って書きましょう。',3,44.7,'https://www.nier.go.jp/13chousa/pdf/13mondai_shou_sansuu_b.pdf#page=20',5,8);
INSERT INTO "question" VALUES (293,2014,'A',1,0,'次の計算をしましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (294,2014,'A',1,1,'46 ＋ 57',2,96.9,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_a.pdf#page=3',2,1);
INSERT INTO "question" VALUES (295,2014,'A',1,2,'903 × 6',2,92.9,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_a.pdf#page=3',3,1);
INSERT INTO "question" VALUES (296,2014,'A',1,3,' 9 − 0.8',2,83.9,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_a.pdf#page=3',3,1);
INSERT INTO "question" VALUES (297,2014,'A',1,4,'2 ÷ 5（わりきれるまで計算して，商を小数で書きましょう。）',2,91.9,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_a.pdf#page=3',4,1);
INSERT INTO "question" VALUES (298,2014,'A',1,5,'100 − 20 × 4',2,81.1,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_a.pdf#page=3',4,8);
INSERT INTO "question" VALUES (299,2014,'A',1,6,'1/3 ＋ 2/5',2,90.7,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_a.pdf#page=3',5,1);
INSERT INTO "question" VALUES (300,2014,'A',2,0,'下の図のように，白いテープの長さをもとにして，赤いテープと青いテープ
の長さを表しました。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (301,2014,'A',2,1,'赤いテープの長さを求める式を，下の 1 から 4 までの中から 1 つ
選んで，その番号を書きましょう。',1,72.1,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_a.pdf#page=4',5,1);
INSERT INTO "question" VALUES (302,2014,'A',2,2,'青いテープの長さを求める式を，下の 1 から 4 までの中から 1 つ
選んで，その番号を書きましょう。',1,54.3,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_a.pdf#page=4',5,1);
INSERT INTO "question" VALUES (303,2014,'A',3,0,'次の分数のうち，1/2 より大きいものは，どれですか。
下の 1 から 4 までの中から選んで，その番号を書きましょう。',1,72.7,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_a.pdf#page=5',5,1);
INSERT INTO "question" VALUES (304,2014,'A',4,0,'Ａの部屋の 1 m2あたりの人数を調べます。
Ａの部屋の面積は 8 m2で，部屋の中には 16 人います。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (305,2014,'A',4,1,'Ａの部屋の様子を表している図はどれですか。下の 1 から 4 まで
の中から 1 つ選んで，その番号を書きましょう。
ただし， は 1 人を表します。
{image1}',1,82.4,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_a.pdf#page=6',5,3);
INSERT INTO "question" VALUES (306,2014,'A',4,2,'Ａの部屋の 1 m2あたりの人数を求める式を書きましょう。
ただし，計算の答えを書く必要はありません。',2,61.0,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_a.pdf#page=6',5,3);
INSERT INTO "question" VALUES (307,2014,'A',5,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (308,2014,'A',5,1,'下の円の，円周の長さを求める式と答えを書きましょう。
ただし，円周率は 3.14 とします。
{image1}',2,84.0,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_a.pdf#page=7',5,4);
INSERT INTO "question" VALUES (309,2014,'A',5,2,'下の図のように，アの立方体を使って，イの直方体を作りました。
イの体積は何 cm3ですか。答えを書きましょう。
{image1}',2,81.3,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_a.pdf#page=7',5,3);
INSERT INTO "question" VALUES (310,2014,'A',6,0,'下の平行四辺形ＡＢＣＤをかきます。
{image1}
まず，辺ＡＢと辺ＢＣをかきました。
{image2}
次に，下のかき方で平行四辺形をかきます。
{image3}
左のコンパスを使ったかき方は，平行四辺形のどの特ちょうを使って
いますか。下の 1 から 4 までの中から 1 つ選んで，その番号を書き
ましょう。


平行四辺形は，',1,52.1,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_a.pdf#page=8',4,4);
INSERT INTO "question" VALUES (311,2014,'A',7,0,'下のような直方体があります。
{image1}
この直方体の面 ア になる四角形を，次の 1 から 4 までの中から 1 つ
選んで，その番号を書きましょう。
{image2}',1,69.6,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_a.pdf#page=10',4,4);
INSERT INTO "question" VALUES (312,2014,'A',8,0,'答えが 100 − 20 × 4 の式で求められる問題を，下の 1 から 4 までの
中から 1 つ選んで，その番号を書きましょう。',1,81.2,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_a.pdf#page=11',4,8);
INSERT INTO "question" VALUES (313,2014,'A',9,0,'正五角形の 1 辺の長さを 1 cm，2 cm，3 cm，…… と 変 え た と き の
まわりの長さを調べて，下の表にまとめました。
{image1}
1 辺の長さを□cm，まわりの長さを△cm として，□と△の関係を正しく
表している式を，次の 1 から 4 までの中から 1 つ選んで，その番号を
書きましょう。',1,82.1,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_a.pdf#page=12',5,4);
INSERT INTO "question" VALUES (314,2014,'B',1,0,'さとしさんたちは，次の問題について考えています。
{image1}
さとしさんは，まず， の中に「 1 」，「 2 」，「 3 」を入れて筆算で計算
しました。
{image2}
次に， の中に「 4 」，「 5 」，「 6 」を入れて計算しました。
{image3}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (315,2014,'B',1,1,'さらに，□の中に「 7 」，「 8 」，「 9 」を入れて計算し，積に同じ数字
が並ぶかどうかを調べます。
積に同じ数字が並ぶ計算を，下の １ から ３ までの中から 1 つ選ん
で，その番号を書きましょう。
{image1}',1,94.6,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_b.pdf#page=5',3,1);
INSERT INTO "question" VALUES (316,2014,'B',1,2,'さとしさんとよし子さんは，37 × □の計算で，積に同じ数字が並ぶ計算
があることに気付きました。そして，なぜ，かける数が 6 のとき，積に同じ
数字が並ぶのかを考えました。
37 × 3 ＝ 111
37 × 6 ＝ 222

2 人は，実際に筆算で計算しなくても，37 × 3 ＝111 をもとにすると，
37 × 6 の積が 222 になることに気付き，次のように説明しました。
{image1}
次に，37 × 24 の積が 888 になることを説明します。
2 人の説明のどちらか一方をもとにして，37 × 24 の積が 888 になる
ことを，式や言葉を使って書きましょう。',3,55.5,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_b.pdf#page=6',4,8);
INSERT INTO "question" VALUES (317,2014,'B',2,0,'あきらさんは，学校の水の使用量について調べるために，事務室で下の
資料をもらいました。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (318,2014,'B',2,1,'あきらさんは，6・7 月の 1500 m3
がどれくらいの量なのかを，家の
近所のプールに入る水の量をもとに考えることにしました。
あきらさんの家の近所のプールには，水が 250 m3
入ります。
6・7 月の水の使用量は，このプールに入る水の量の何倍になりますか。
求める式と答えを書きましょう。',2,82.6,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_b.pdf#page=8',5,3);
INSERT INTO "question" VALUES (319,2014,'B',2,2,'あきらさんは，左の学校の水の使用量の表を棒グラフに表すことにしま
した。そこで，ノートに，下のような縦20 マス，横 15 マスのわくをかき，
縦の 1 目もりを 50 m3にしました。
{image1}
すると，4 ・ 5 月の棒はわくに入りますが，棒がわくに入らない月が
あることに気付きました。
棒がわくに入らない月を，下の １ から ５ までの中から 1 つ選んで，
その番号を書きましょう。また，その月の棒がわくに入らないわけを，
言葉と数を使って書きましょう。',3,69.3,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_b.pdf#page=9',5,3);
INSERT INTO "question" VALUES (320,2014,'B',2,3,'あきらさんは，6・7 月の水の使用量が 1 年間の水の使用量の1/4 より
多いことを説明します。下の １ から ４ までのどのグラフを使うと
最もわかりやすいですか。1 つ選んで，その番号を書きましょう。
{image1}',1,61.7,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_b.pdf#page=10',5,3);
INSERT INTO "question" VALUES (321,2014,'B',3,0,'かつやさんの学級では，宿泊学習の計画を立てています。
かつやさんたちは，昨年の昼食時間について，下の 2 つの問題点があった
ことを先生から聞き，解決方法を話し合うことにしました。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (322,2014,'B',3,1,'まず，下の昨年の昼食時間の図をもとに，①の問題点について話し合いました｡
{image1}
今年も昼食時間は，午後 0 時 10 分から午後 1 時 10 分までです。
かつやさんたちは，昨年より食事の時間を5 分間長く，片付けの時間を
3 分間長くすることにしました。
今年は準備の時間を何分間にすればよいですか。答えを書きましょう。',2,38.8,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_b.pdf#page=12',3,3);
INSERT INTO "question" VALUES (323,2014,'B',3,2,'次に， 2 の問題点について話し合いました。
かつやさんの学級は 40 人です。40 人分のご飯は下のような入れ物に
入ってきます。
{image1}
かつやさんは，ご飯が足りなくなったり，残ったりしない分け方を
考え，下のように言いました。
{image2}
かつやさんの言っているめやすを正しく表している図を，次の １ から ４
までの中からすべて選んで，その番号を書きましょう。
{image3}',1,56.9,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_b.pdf#page=13',2,1);
INSERT INTO "question" VALUES (324,2014,'B',3,3,'かつやさんたちは，宿泊学習に来ています。
ともみさんは，右のような入れ物に入っているスープ
を分ける係になりました。
{image1}
ともみさんは，玉じゃくし 1 ぱいを 1 人分として，
40 人に分け始めました。すると，分ける前と 10 人に
分けた後では，下の図のようになりました。
{image2}
この分け方で，残りの 30 人にスープを分けることができますか。
次の １ から ３ までの中から 1 つ選んで，その番号を書きましょう。
また，その番号を選んだわけを，言葉と数を使って書きましょう。',3,30.8,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_b.pdf#page=14',5,3);
INSERT INTO "question" VALUES (325,2014,'B',4,0,'音楽の時間に，打楽器でリズムの練習をしています。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (326,2014,'B',4,1,'まさるさんは，タンブリンで下の 4 小節のリズムを何回かくり返します。
まさるさんが 1 小節目に演奏するリズムを，ア のリズムとします。
1 小節目の ア のリズムを 2 回目に演奏するのは，5 小節目です。
{image1}
このように考えると，ア のリズムを 3 回目に演奏するのは，何小節目
ですか。答えを書きましょう。',2,62.4,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_b.pdf#page=16',4,8);
INSERT INTO "question" VALUES (327,2014,'B',4,2,'次に，けい子さんも加わって，まさるさんと演奏することにします。
けい子さんは，カスタネットで下の 6 小節のリズムを何回かくり返します。
けい子さんの 6 小節目とまさるさんの 4 小節目は，同じリズムです。
これを，イ のリズムとします。
{image1}
けい子さんとまさるさんは，同時に演奏を始めました。
すると，12 小節目に 2 人の イ のリズムが重なりました。
2 人の イ のリズムが重なる 12 小節目の「12」は，どのような数ですか。
言葉と「 4 」と「 6 」の数を使って書きましょう。',3,60.7,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_b.pdf#page=17',5,1);
INSERT INTO "question" VALUES (328,2014,'B',5,0,'さゆりさんたちは，日本の伝統文化について調べました。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (330,2014,'B',5,1,'さゆりさんは，たたみのしき方について考えています。
さゆりさんの地域のたたみの形は長方形で，たたみの
長い辺は，短い辺の 2 倍の長さです。
{image1}
また，たたみのしき方には下の 3 つの約束があります。
{image2}
さゆりさんは，たたみのしき方を，上の 3 つの約束をもとに，次のような
部屋の図と長方形の板を 6 枚使って考えます。
{image3}
まず，約束 1 と約束 2 をもとに，次のように 2 枚の板を置きました。
{image4}
次に，約束 3 をもとに，残り 4 枚の板をどのように置けばよいか，下の
具体例を参考にして考えます。
{image5}
残り 4 枚の板をどのように置けばよいですか。解答用紙の図の を
なぞって，かきましょう。
{image6}',2,65.8,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_b.pdf#page=18',2,4);
INSERT INTO "question" VALUES (331,2014,'B',5,2,'まことさんは，使いやすいはしの長さのめやすについて発表します。
{image1}
下の １ から ４ までの中から，一あた半の長さを表しているもの
（{image2}）を 1 つ選んで，その番号を書きましょう。
{image3}',1,46.3,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_b.pdf#page=20',5,1);
INSERT INTO "question" VALUES (332,2014,'B',5,3,'まことさんの発表を聞いて，なつきさんは妹のはしを買いに行こうと
思いました。
なつきさんは一あたの長さについてさらに調べ，下のことがわかりました。
{image1}
妹の身長は 140 cm です。
妹の身長と，左の使いやすいはしの長さのめやすをもとに，一あた半の
長さを求めると，はしの長さは約何 cm になりますか。求め方を言葉や式
を使って書きましょう。また，答えも書きましょう。',3,33.3,'https://www.nier.go.jp/14chousa/pdf/14mondai_shou_sansuu_b.pdf#page=21',5,1);
INSERT INTO "question" VALUES (333,2015,'A',1,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (334,2015,'A',1,1,'8.9 - 0.78のおよその答えとしてふさわしいものを，下の1から4
までの中からIつ選んで，その番号を書きましょう。',1,71.3,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_a.pdf#page=4',4,1);
INSERT INTO "question" VALUES (335,2015,'A',1,2,'5.21 + 0.7 を， 0.01 をもとにした式に表します。
5.21 と 0.7 は，それぞれ0.01を何個集めた数になリますか。 
下のア， イに入る数を書きましょう。
{image1}',2,74.5,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_a.pdf#page=4',4,1);
INSERT INTO "question" VALUES (336,2015,'A',1,3,'6.3 + 0.22の答えを6.52と求めました。
この答えが正しいかどうかを，次のように確かめます。 
下のウ，エ，オに入る数を書きましょう。
{image1}',2,82.1,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_a.pdf#page=5',4,1);
INSERT INTO "question" VALUES (337,2015,'A',2,0,'次の計算をしましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (338,2015,'A',2,1,'28 + 72',2,98.2,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_a.pdf#page=6',2,1);
INSERT INTO "question" VALUES (339,2015,'A',2,2,'6.79 - 0.8',2,69.7,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_a.pdf#page=6',4,1);
INSERT INTO "question" VALUES (340,2015,'A',2,3,'5/9 - 1/4',2,81.5,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_a.pdf#page=6',5,1);
INSERT INTO "question" VALUES (341,2015,'A',2,4,'5/6 ÷ 7',2,84.3,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_a.pdf#page=6',5,1);
INSERT INTO "question" VALUES (342,2015,'A',3,0,'としやさんは，家から学校の前を通って図書館へ行きます。
家から学校までは5分，学校から図書館までは20分かかります。 
午後3時10分までに図書館に着くためには，おそくとも，午後何時何分 
までに家を出ればよいですか。その時刻を書きましょう。
{image1}',2,75.0,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_a.pdf#page=7',3,3);
INSERT INTO "question" VALUES (343,2015,'A',4,0,'アの角の大きさをはかります。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (344,2015,'A',4,1,'アの角の大きさについて正しいものを，下の1 から 4までの中から
1つ選んで，その番号を書きましょう。',1,81.4,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_a.pdf#page=8',4,3);
INSERT INTO "question" VALUES (345,2015,'A',4,2,'アの角の大きさは何度ですか。答えを書きましょう。
{image1}',2,58.2,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_a.pdf#page=9',4,3);
INSERT INTO "question" VALUES (346,2015,'A',5,0,'次の図のように，円を使ってかいた三角形ABCは，二等辺三角形に
なります。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (347,2015,'A',5,1,'三角形ABCが二等辺三角形になるのは，円にどのような特ちょうが
あるからですか。
下の1から4までの中から最もふさわしいものを1つ選んで，その
番号を書きましょう。',1,50.9,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_a.pdf#page=11',3,4);
INSERT INTO "question" VALUES (348,2015,'A',5,2,'下の図のアの角の大きさが70°のとき，イは何度ですか。
答えを書きましょう。
{image1}',2,64.7,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_a.pdf#page=11',5,4);
INSERT INTO "question" VALUES (349,2015,'A',6,0,'図1の直方体の展開図をかくために，図2のように，6つの面のうち 
5つの面をかいています。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (350,2015,'A',6,1,'あと1つの面は，どのような大きさの長方形ですか。 
長方形のたてと横の2つの辺の長さを書きましょう。',2,75.6,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_a.pdf#page=13',5,4);
INSERT INTO "question" VALUES (351,2015,'A',6,2,'あと1つの面を，下の1から4までの中の，ある1つの辺に付けて 
かくと展開図は完成します。その辺はどれですか。
下の1から4までの中から1つ選んで，その番号を書きましょう。',1,67.8,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_a.pdf#page=13',4,4);
INSERT INTO "question" VALUES (352,2015,'A',7,0,'全学年の児童について，ハンカチを持ってきた人数を5日間調べ，その 
結果を下の4つのグラフに表しました。
{image1}
上の4つのグラフを見て，あるグラフから，次のことがわかりました。
{image2}
このことがわかるグラフはどれですか。
左の1から4までの中から1つ選んで，その番号を書きましょう。',1,81.9,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_a.pdf#page=14',5,8);
INSERT INTO "question" VALUES (353,2015,'A',8,0,'図1のように並んだ〇の個数の求め方を考えます。
{image1}
図2，図3のように 〇 を囲み，  〇の個数の求め方を式に表しました。
{image2}
図3の式の3はどの〇を表していますか。
解答用紙の図の，あてはまるすべての 〇 の中を黒くぬりましょう。',2,88.2,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_a.pdf#page=16',4,8);
INSERT INTO "question" VALUES (354,2015,'B',1,0,'平行四辺形には，次の特ちょうがあります。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (355,2015,'B',1,1,'平行四辺形になる辺の組み合わせを，下の1から4までの中から
1つ選んで，その番号を書きましょう。
{image1}',1,95.3,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_b.pdf#page=4',4,4);
INSERT INTO "question" VALUES (356,2015,'B',1,2,'次の平行四辺形ABCDをかきます。
{image1}
下の図のように，最初に，角Bが60°になるように辺ABと辺BCを 
かきました。そして，三角定規を使って点Aを通る直線と点Cを通る直線
をかきました。
{image2}
上の三角定規を使ったかき方は，左の平行四辺形の特ちょうの中の， 
どの特ちょうをもとにしていますか。
左の平行四辺形の特ちょうのア，イ，ウの中から1つ選んで，その記号
を書きましょう。',1,54.7,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_b.pdf#page=5',4,4);
INSERT INTO "question" VALUES (357,2015,'B',1,3,'ひろしさんは，下の地図を使って，家からお店まで行くときの近道を
考えています。
{image1}
そこで，交差点Fを曲がる{image2}の道のリと交差点Hを曲がる{image3}の 
道のリを，下のように考えて比べました。
{image4}
ひろしさんの考えにある，E FとH Gの道のリは等しく，FGとEHの 
道のリも等しいことは，左の地図から見つかる図形の特ちょうを使うと
説明できます。
左の地図からどのような図形を見つけたらよいですか。また，図形の 
どのような特ちょうを使えばよいですか。
図形と特ちょうを，言葉と地図にある記号を使って書きましょう。',3,27.8,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_b.pdf#page=6',4,4);
INSERT INTO "question" VALUES (358,2015,'B',2,0,'たか子さんは，おつかいに行きます。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (359,2015,'B',2,1,'まず，トマトを7個買います。お店では，トマトを次のように売ってい
ました。
{image1}
トマト7個の代金が最も安くなる買い方を， 下の1から4までの 
中から1つ選んで，その番号を書きましょう。また， その買い方をした 
ときのトマト7個の代金を書きましょう。',2,64.9,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_b.pdf#page=8',5,3);
INSERT INTO "question" VALUES (360,2015,'B',2,2,'次に，せんざいを買います。家で使っているせんざいが，20 %增量して 
売られていました。增量後のせんざいの量は480 mLです。
増量前のせんざいの量は何mLですか。求める式と答えを書きましょう。
{image1}',2,13.4,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_b.pdf#page=9',5,8);
INSERT INTO "question" VALUES (361,2015,'B',2,3,'最後に，パン屋で300円の食パンを買います。
今月，パン屋では，全品10％引き セールをしています。だから，300円 
の食パンの今月の値段は，270円になります。
店員さんが，「今日は特別に，今月の値段の30 %を，さらに値引きします。」
と言いました。
たか子さんはそれを聞いて，300円 の食パンの値段は180円になるのでは 
ないかと思いました。
しかし，実際の値段は，180円ではなく189円でした。
{image1}{image2}
{image3}{image4}
たか子さんは，おつかいから帰って，値段の求め方を考えました。
{image5}
たか子さんは，上の②の300がまちがっていることに気付きました。 
なみ線部の正しい数は，いくつになりますか。また，その数を使うと， 
②の□の部分はどのようになりますか。
なみ線部の正しい数を書きましょう。また，その数を使った②の求め方と 
答えを，言葉や数を使って書き直しましょう。',3,51.3,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_b.pdf#page=10',5,8);
INSERT INTO "question" VALUES (362,2015,'B',3,0,'あさ子さんたちは，先生といっしょに，次のようにソフトボール投げの
ラインを引きます。
{image1}
まず，円のラインを引きました。
次に，正三角形を下の図のように巻き尺でつくります。
先生は，巻き尺の「0m」のところと「24m」のところを持って，円の
中心に当てました。
そして，あさ子さんとたかしさんに，「まわりの長さが24 mの正三角形 
になるように巻き尺を持ってください。」と言いました。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (363,2015,'B',3,1,'あさ子さんとたかしさんは，それぞれ巻き尺の何mのところを持てば
よいですか。答えを書きましょう。',2,32.8,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_b.pdf#page=13',5,1);
INSERT INTO "question" VALUES (364,2015,'B',3,2,'さらに，30°の角を下の図のようにつくります。
先生は，まなみさんに，あさ子さんとたかしさんが持っているところの 
真ん中に巻き尺をあわせるように言いました。
そして，アのところを指して，「30°の角ができました。」と言いました。
{image1}
家に帰ったあさ子さんは，巻き尺を使った30°の角のつくり方を，正三角形
の紙でためしました。
{image2}
三角形ABCが正三角形であり，切り分けた2つの三角形が合同である
ことをもとに，アの角の大きさが30°になるわけを，言葉と数を使って
書きましょう。
必要ならば，下の図3の中の記号を使ってもかまいません。
{image3}',3,49.4,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_b.pdf#page=15',5,4);
INSERT INTO "question" VALUES (365,2015,'B',4,0,'児童会活動で，ペットボトルのキャップを集めています。4月から7月 
までの間に集める目標は，I〇〇〇〇個でした。7月までの4か月間に集めた 
個数は，下の表のとおりです。
{image1}
次の会話を読んで，あとの問いに答えましょう。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (366,2015,'B',4,1,'四捨五入して計算します。次の①の式に入る数と，②に入る数を書きま
しょう。
{image1}',2,52.8,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_b.pdf#page=17',4,1);
INSERT INTO "question" VALUES (367,2015,'B',4,2,'切り上げて計算します。次の③に入るふさわしい文を，下の1から4
までの中から1つ選んで，その番号を書きましょう。
{image1}',1,62.2,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_b.pdf#page=17',4,1);
INSERT INTO "question" VALUES (368,2015,'B',4,3,'9月から12月までの間に集める目標も，10000個です。11月までの 
3か月間に集めた個数は，下の表のとおりです。
{image1}
はるかさんは，目標に達するには，12月におよそ何個のキャップを
集めればよいかを，次のように考えました。
{image2}
はるかさんのおよその数の計算で，12月に3000個集めればよいこと 
がわかります。実際の数で計算しなくても，12月に3000個集めれば 
よいことがわかるのはなぜですか。
そのわけを，言葉と数を使って書きましょう。',3,22.5,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_b.pdf#page=18',4,1);
INSERT INTO "question" VALUES (369,2015,'B',5,0,'次の図のように，長方形の面積を2等分するために，その長方形に1本 
の直線を引き，2つの合同な図形に分けました。
{image1}
上の図を見て，あかねさんは，次のことに気付きました。
{image2}
あかねさんが気付いたことをもとにすると，長方形の対角線が交わる点 
を見つけ，この点を通る直線を引けば，長方形の面積をいつも2等分できる
ことがわかります。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (370,2015,'B',5,1,'図1のような2つの長方形を組み合わせた図形の面積を2等分します。
まず，図2のように，2つの長方形について対角線が交わる点をそれぞれ
見つけます。
{image1}
次に，図3のように，2つの点を通る直線を引きます。すると，2つの 
長方形を組み合わせた図形は，図4のように，オとカに分けることができ
ます。
{image2}
このようにすると，オとカの面積は等しくなリます。なぜ，オとカの 
面積が等しくなるのですか。
そのわけを，言葉や数，アからカまでの記号を使って書きましょう。',3,12.6,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_b.pdf#page=21',5,3);
INSERT INTO "question" VALUES (371,2015,'B',5,2,'2つの正方形を組み合わせた図形について考えます。
下のように，2つの正方形について対角線が交わる点をそれぞれ見つけ， 
その2つの点を通る直線を引きました。
色がついた部分({image1})の面積は何cm2ですか。答えを書きましょう。
{image2}',2,48.1,'https://www.nier.go.jp/15chousa/pdf/15mondai_shou_sansuu_b.pdf#page=22',5,3);
INSERT INTO "question" VALUES (372,2021,NULL,1,0,'たけるさんたちは，地域の昔のことについて調べるために，博物館と城と 
図書館へ行きます。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (373,2021,NULL,1,1,'たけるさんたちは，駅に集合してから博物館へ行きます。
博物館の後のコースについては，下の 2 つのコースを考えました。
{image1}
たけるさんたちは，道のりがＢコースより短いＡコースで行くことに 
しました。
Ａコースの道のりは，Ｂコースの道のりより何 m 短いですか。
求め方を式や言葉を使って書きましょう。また，答えも書きましょう。',3,62.7,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=3',3,1);
INSERT INTO "question" VALUES (374,2021,NULL,1,2,'たけるさんたちは，駅から 7 分間歩いたところで，「博物館まで 1000 m」 
や「駅まで 500 m」と書いてある看板を見つけました。
{image1}
500 m を 7 分間で歩く速さで歩き続けると， 1000 m を歩くのに何分間 
かかりますか。
答えを書きましょう。',2,86.8,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=4',5,6);
INSERT INTO "question" VALUES (375,2021,NULL,1,3,'たけるさんたちは，博物館の次に城へ行きます。
城へ行く前に，博物館から城までの道のりと時間をインターネットで 
調べました。
{image1}
次の表は，インターネットで調べた道のりと時間と，たけるさんたちが 
歩いた道のりと時間を表しています。
{image2}
どちらのほうが速いかを調べるために，下の計算をしました。
㋐　インターネット 1600 ÷ 20 ＝ 80
㋑　たけるさんたち 500 ÷ 7 ＝ 71.4 …
上の計算からどのようなことがわかりますか。
下の １ から ４ までの中から 1 つ選んで，その番号を書きましょう。',1,56.0,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=5',5,6);
INSERT INTO "question" VALUES (376,2021,NULL,1,4,'たけるさんたちは，城に着きました。
午後 1 時 35 分から見学を始めて， 50 分後に出発することにしました。
出発する時刻は午後何時何分ですか。その時刻を書きましょう。
{image1}',2,89.3,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=7',3,5);
INSERT INTO "question" VALUES (377,2021,NULL,1,5,'たけるさんたちは，図書館から駅にもどるとき，
バスに乗ることにしました。
{image1}
分速 540 m で走るバスが， 2700 m を進むのに何分間かかるかを求め
る式を書きましょう。
ただし，計算の答えを書く必要はありません。',2,85.2,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=8',5,6);
INSERT INTO "question" VALUES (378,2021,NULL,2,0,'図１のような直角三角形があります。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (379,2021,NULL,2,1,'図１の直角三角形の面積は何 cm2 ですか。
求める式と答えを書きましょう。',2,55.4,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=9',5,2);
INSERT INTO "question" VALUES (380,2021,NULL,2,2,'図１の直角三角形が 2 つあります。
{image1}
上の 2 つの直角三角形を使い，同じ長さの辺どうしを合わせると，下の 
①や②の図形をつくることができます。
{image2}
上の①と②の図形の面積について，どのようなことがわかりますか。
下の １ から ４ までの中から 1 つ選んで，その番号を書きましょう。',1,72.7,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=10',5,2);
INSERT INTO "question" VALUES (381,2021,NULL,2,3,'次のような二等辺三角形があります。
{image1}
上の二等辺三角形を 4 つ使い，次のように，同じ長さの辺どうしを 
合わせて，平行四辺形ＡＢＣＤをつくりました。
{image2}
平行四辺形の面積の公式を使って，平行四辺形ＡＢＣＤの面積を求め 
ます。
辺ＢＣを底辺としたときの面積の求め方を，式や言葉を使って書きま 
しょう。そのとき，平行四辺形ＡＢＣＤの高さをどのように求めたのか 
がわかるようにしましょう。
また，平行四辺形ＡＢＣＤの面積が何 cm2 になるのかも書きましょう。',3,46.2,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=11',5,2);
INSERT INTO "question" VALUES (382,2021,NULL,3,0,'ひよりさんたちは， 10 月の図書委員会で，図書室の本の貸し出しの様子 
について話し合っています。
{image1}
そこで， 9 月の貸し出し冊数を調べ，下のグラフに表しました。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (383,2021,NULL,3,1,'左のグラフの，６年生の貸し出し冊数は何冊ですか。
下の ア から エ までの中から，最もふさわしいものを 1 つ選んで， 
その記号を書きましょう。',1,95.8,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=14',3,7);
INSERT INTO "question" VALUES (384,2021,NULL,3,2,'9 月の貸し出し冊数について，左のグラフからどのようなことがわかり
ますか。
下の ア から エ までの中から，最もふさわしいものを 1 つ選んで， 
その記号を書きましょう。',1,90.8,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=14',3,7);
INSERT INTO "question" VALUES (385,2021,NULL,3,3,'ほかの月の貸し出し冊数も調べてみると， 5 年生と 6 年生の貸し出し冊数
は，ほかの学年より少ないことがわかりました。
{image1}
そこで，ひよりさんたちは， 5 年生と 6 年生の 189 人にアンケート調査
をしました。

まず，読書が好きかどうかについてと，図書室で本をよく借りているか 
どうかについて， 2 つの質問の結果に着目しました。
{image2}
2 つの質問の結果について，下の表に整理し直すことにしました。
{image3}
「読書が好きですか」に「はい」と答えていて，「 9 月に図書室で 5 冊
以上借りましたか」に「いいえ」と答えている人は， 114 人いることが 
わかりました。
「114 」は，表のどこにあてはまりますか。① から ⑧ までの中から 
1 つ選んで，その番号を書きましょう。',1,67.7,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=15',4,7);
INSERT INTO "question" VALUES (386,2021,NULL,3,4,'次に，ひよりさんたちは，読書が好きなのに，図書室で本をあまり借り 
なかった 114 人に着目しました。
{image1}
そこで， 114 人分のアンケート調査の結果を， 5 年生と 6 年生に分け 
て，下のグラフに表しました。
{image2}
ひよりさんたちは，左のグラフをもとに，気づいたことについて話し 
合っています。
そうたさんとあやのさんは，左のグラフの中の㋐から㋓までの 4 つの
項目について，「あてはまる」と答えた人の割合に着目しました。
{image3}
左のグラフについて， 5 年生と 6 年生で，「あてはまる」と答えた人の 
割合のちがいが，いちばん大きい項目はどれですか。また，その項目に 
ついて，「あてはまる」と答えた 5 年生と 6 年生の割合はそれぞれ何％で
すか。
項目とそれぞれの割合を，言葉と数を使って書きましょう。',3,52.2,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=17',5,7);
INSERT INTO "question" VALUES (387,2021,NULL,3,5,'ひよりさんたちは，アンケート調査の結果について，話し合っています。
{image1}
そこで， 5 年生と 6 年生の読みたい本と，多くの 5 年生と 6 年生に読ま
れている本を，調べることにしました。
5 年生と 6 年生から，どのようなデータを集めるとよいですか。
下の １ から ５ までの中から，ふさわしいものを２つ選んで，その 
番号を書きましょう。',1,74.1,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=19',5,7);
INSERT INTO "question" VALUES (388,2021,NULL,4,0,'こはるさんたちは，今までに学習してきた，いろいろなわり算の問題につ 
いてふり返っています。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (389,2021,NULL,4,1,'ボールが 23 個あります。 1 箱にボールを 6 個ずつ
入れていきます。
{image1}
全部のボールを箱に入れるには，何箱あればよいかを求めるために， 
下の計算をしました。

23 ÷ 6 ＝ 3 あまり 5

全部のボールを箱に入れるには，少なくとも何箱あればよいかを書きま
しょう。',2,83.1,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=22',3,1);
INSERT INTO "question" VALUES (390,2021,NULL,4,2,'8 人に， 4 L のジュースを等しく分けます。
1 人分は何 L ですか。求める式と答えを書きましょう。',2,55.7,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=22',4,1);
INSERT INTO "question" VALUES (391,2021,NULL,4,3,'14 m のテープと 20 m のテープがあります。
こはるさんたちは， 14 m は 20 m の何倍かについて考えています。
{image1}
れんとさんの話を聞いて，ゆうまさんは， 20 m を 1 としたときに 14 m 
が 0.7 にあたるわけについて， 20 m を 10 等分した 1 つ分の長さが 0.1
にあたることをもとにして考え，下のように図をかいて説明しました。
{image2}
12 m のテープと 30 m のテープもあります。
たくみさんたちは， 12 m は 30 m の何倍かについて考えています。
{image3}
30 m を 1 としたときに 12 m が 0.4 にあたるわけを，【ゆうまさんの説
明】と同じように， 0.1 にあたる長さがわかるようにして，言葉や数を
使って書きましょう。',3,51.6,'https://www.nier.go.jp/21chousa/pdf/21mondai_shou_sansuu.pdf#page=23',4,1);
INSERT INTO "question" VALUES (392,2016,'A',1,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (393,2016,'A',1,1,'□÷0.8の商の大きさについて考えます。□には0でない数が入ります。
下の1から3までの中から，正しいものを1つ選んで，その番号
を書きましょう。',1,65.0,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_a.pdf#page=4',5,1);
INSERT INTO "question" VALUES (394,2016,'A',1,2,'2.1÷0.7を，「わられる数とわる数に同じ数をかけても商は変わらない」
というわリ算の性質を使って，次のように計算します。
{image1}
上の㋐，㋑，㋒に入る数を書きましょう。',2,68.7,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_a.pdf#page=4',5,1);
INSERT INTO "question" VALUES (395,2016,'A',1,3,'48.1 ÷ 1.3の答えを37と求めました。
この答えが正しいかどうかを，次のように確かめます。
{image1}
上の㋓，㋔，㋕には，「48.1」，「1.3」，「37」のいずれかが入リます。 
㋓，㋔，㋕に入る数をそれぞれ書きましょう。',2,88.0,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_a.pdf#page=5',5,1);
INSERT INTO "question" VALUES (396,2016,'A',2,0,'次の計算をしましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (397,2016,'A',2,1,'905 - 8',2,91.0,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_a.pdf#page=6',3,1);
INSERT INTO "question" VALUES (398,2016,'A',2,2,'4.65 + 0.3',2,77.3,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_a.pdf#page=6',4,1);
INSERT INTO "question" VALUES (399,2016,'A',2,3,'18 ÷ 0.9',2,77.9,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_a.pdf#page=6',5,1);
INSERT INTO "question" VALUES (400,2016,'A',2,4,'2/9×3 (答えが約分できるときは，約分しましょう。)',2,87.1,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_a.pdf#page=6',5,1);
INSERT INTO "question" VALUES (401,2016,'A',3,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (402,2016,'A',3,1,'下の①と②について，それぞれの2つの数の大小を比べて，□に入る
不等号を解答用紙に書きましょう。

① 75□25 
② 104□112',2,96.7,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_a.pdf#page=7',3,1);
INSERT INTO "question" VALUES (403,2016,'A',3,2,'下の3つの数の中で，いちばん小さい数と，いちばん大きい数を書きま
しよう。

7.1　　　7　　　7.01',2,74.2,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_a.pdf#page=7',4,1);
INSERT INTO "question" VALUES (404,2016,'A',4,0,'あるシートの1m2あたりの人数を調べます。
このシートの面積は8 m2で，シートの上には14人すわっています。 
次の図はシートの様子を表し，図の中の●は1人を表しています。
{image1}
シート1m2あたりの人数を求める式を考えるために，次のように，シート
の様子を表している図をつくりかえました。
{image2}
シート1m2あたりの人数を求める式を書きましょう。 
ただし，計算の答えを書く必要はありません。',2,72.2,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_a.pdf#page=8',5,3);
INSERT INTO "question" VALUES (405,2016,'A',5,0,'下の三角形アイウの面積の求め方を考えます。
辺アイウを底辺とするとき，三角形アイウの高さはどこの長さになりますか。 
下の1から5までの中から1つ選んで，その番号を書きましょう。
{image1}',1,82.1,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_a.pdf#page=10',5,3);
INSERT INTO "question" VALUES (406,2016,'A',6,0,'次のような，二等辺三角形の三角定規があります。
{image1}
この三角定規を4枚使うと，下のように台形をつくることができます。
{image2}
この三角定規を4枚使うと，ほかにどのような形をつくることができますか。 
下の1から5までの中から3つ選んで，その番号を書きましょう。
{image3}',1,79.8,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_a.pdf#page=12',4,4);
INSERT INTO "question" VALUES (407,2016,'A',7,0,'直方体には，6つの面があります。
下の図の，面㋐を面ABCDと呼びます。ほかの面も同じように呼びます。
{image1}
面㋐に垂直な面はどれですか。
下の1から5までの中からすべて選んで，その番号を書きましょう。
{image2}',1,78.2,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_a.pdf#page=14',4,4);
INSERT INTO "question" VALUES (408,2016,'A',8,0,'次のように，赤い部分があるテープが4本あります。
テープ全体の長さをもとにしたときの，赤い部分の長さの割合がいちばん
大きいテープはどれですか。
下の1から4までの中から1つ選んで，その番号を書きましょう。
{image1}',1,74.5,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_a.pdf#page=16',5,8);
INSERT INTO "question" VALUES (409,2016,'A',9,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (410,2016,'A',9,1,'バスに乗る人が，バス停に一列に並んで待っています。 
さゆりさんの前に10人，後ろに19人います。 
バス停に並んでいる人数は全部で何人ですか。
求める式と答えを書きましょう。
{image1}',2,80.3,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_a.pdf#page=18',1,1);
INSERT INTO "question" VALUES (411,2016,'A',9,2,'バスに乗っている人数は60人です。乘っている人数は，定員よりも
定員の20 %分多いそうです。
定員をもとにしたときの乗っている人数の割合を，百分率を使った
次の図に表します。
{image1}
図の中のアとイには，下の4つの数のいずれかが入ります。 
アとイに入る数をそれぞれ書きましょう。

20　　　80　　　100　　　120',2,51.2,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_a.pdf#page=19',5,8);
INSERT INTO "question" VALUES (412,2016,'B',1,0,'1辺が7 cmの正方形について次のように話しています。
{image1}
よし子さんは，下のように計算しました。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (413,2016,'B',1,1,'よし子さんは，1辺が8 cmや9 cmの正方形の場合でも，縦の長さを 
1cm短くし，横の長さを1cm長くすると，面積が1 cm2小さくなるか 
どうかを，下のように調べました。
下の㋐，㋑，㋒に入る数を書きましょう。
{image1}',2,92.6,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_b.pdf#page=5',4,3);
INSERT INTO "question" VALUES (414,2016,'B',1,2,'よし子さんは，正方形の縦の長さを1cm短くし，横の長さを1cm長く 
すると，面積が1cm2小さくなることを，1辺が7 cmの正方形を使って，
次の図のように考えました。
{image1}
そして，その考えを下のように説明しました。
{image2}
次に，正方形の縦の長さを2 cm短くし，横の長さを2 cm長くする
と，面積はどうなるかを，1辺が7 cmの正方形を使って考えます。
{image3}
【よし子さんの説明】をもとに，面積が4 cm2小さくなることを説明
すると，どのようになりますか。
下の㋓，㋔，㋕に入る説明を，言葉と式を使って書きましょう。
{image4}',3,45.4,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_b.pdf#page=7',4,3);
INSERT INTO "question" VALUES (415,2016,'B',2,0,'体育の時間に，40 mハードル走を行います。
次の図のように，ハードルとハードルの間がそれぞれ，5 m， 5.5 m， 6 m 
になるようにハードルを4台ずつ置いて，40 mのコースにA， B， Cの3つ 
のコースをつくります。
{image1}
こうじさんは，ハードルとハードルの間が5 mであるAコースの，スタート 
地点から4台目のハードルを置きます。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (416,2016,'B',2,1,'Aコースは，スタート地点から1台目のハードルまでが12 mで，ハードル 
とハードルの間が5 mです。
スタート地点に，巻き尺の「0m」のところをあわせると，Aコース 
の4台目のハードルを置くのは，巻き尺の何mのところになリますか。 
求める式と答えを書きましょう。',2,56.5,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_b.pdf#page=9',4,8);
INSERT INTO "question" VALUES (417,2016,'B',2,2,'次に，40 m走のタイ厶をもとに，40 mハードル走の目標のタイ厶を
決めます。
40 mハードル走の目標のタイ厶は，次の式で求めることにします。
{image1}
まなみさんは，40 m走のタイ厶が8.1秒でした。ハードルの数が4台
のとき，まなみさんの目標のタイ厶は何秒になりますか。
求める式とまなみさんの目標のタイ厶を書きましょう。',2,50.7,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_b.pdf#page=10',5,1);
INSERT INTO "question" VALUES (418,2016,'B',2,3,'まなみさんは，目標のタイ厶を達成することができました。そして，その 
ことを，先生に伝えました。
{image1}
式の中の[0.4]や[0.3]は，どのような時間を表している数だと考え
られますか。言葉や数を使って書きましょう。',3,15.8,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_b.pdf#page=11',5,1);
INSERT INTO "question" VALUES (419,2016,'B',3,0,'ともみさんの学校では，小学校に入学する前の子どもたちを招待して学習 
発表会を行います。子どもたちは，24人来る予定です。学習発表会では， 
来る予定の子どもたち全員に，メダルを作ってわたすことになっています。
1人分のメダルの材料は，次のとおりです。
{image1}
先生は2000 cmのリボンと，縦が39 cm，横が54 cmの長方形の厚紙を 
用意しています。ともみさん，はるおさん，あかねさんの3人は，リボンと 
厚紙が足りるかどうかについて考えています。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (420,2016,'B',3,1,'24人分のメダルの材料として，今あるリボン2000 cmで足りるかどう
かを，3人はそれぞれの式で考えています。
{image1}
上の3人の式は，それぞれ何を調べるための式ですか。
下の1から3までの中から1つずつ選んで，それぞれ番号を書きま
しょう。',1,62.7,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_b.pdf#page=13',4,1);
INSERT INTO "question" VALUES (421,2016,'B',3,2,'はるおさんは，縦が39 cm， 横が54 cmの長方形の厚紙1枚 
から，1辺が9 cmの正方形を 24個かいて切り取ることができ
ることに気付きました。
{image1}
はるおさんは，1辺が9 cmの正方形を24個かくことができるわけを，
厚紙の縦と横の長さに着目して説明しようとしています。
{image2}
はるおさんの説明に続くように，  1辺が9 cmの正方形を24個かくこ 
とができるわけを，言葉や式を使って書きましょう。',3,38.7,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_b.pdf#page=14',3,1);
INSERT INTO "question" VALUES (422,2016,'B',3,3,'1辺が9 cmの正方形になるように切リ取った厚紙に，コンパスを使って， 
できるだけ大きな円をかいて切り取り ます。
{image1}
次の厚紙を真上から見た図の，アの場所にコンパスの針をさす場合，下 
の1から4のどこにえんぴつの先があうようにして，コンパスを開け
ばよいですか。
コンパスのえんぴつの先をあわせる場所( • )を，下の1から4ま
での中から1つ選んで，その番号を書きましょう。
{image2}',1,76.6,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_b.pdf#page=15',5,4);
INSERT INTO "question" VALUES (423,2016,'B',4,0,'A小学校とB小学校の図書委員会は， 協力して読書活動をすすめて
います。
{image1}
次の資料は，4月から7月までの4か月間の， 各学校の本の貸出冊数の
様子をまとめたものです。
{image2}
A小学校の図書委員たちは，上の表1の□の部分を見て，次のように
話し合っています。
{image3}
{image4}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (424,2016,'B',4,1,'あさ子さんのように各学校の1人あたりの貸出冊数を求めるためには， 
表1の□の各学校の貸出冊数の合計のほかに，どのような数が必要で
すか。
下の1から4までの中からIつ選んで，その番号を書きましょう。',1,48.4,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_b.pdf#page=17',5,3);
INSERT INTO "question" VALUES (425,2016,'B',4,2,'A小学校の図書委員たちは，4月から7月までの4か月間の貸出冊数に
ついて，下の1から4までのように話しています。
下の1から4までの下線部のことについて，表1，表2だけでは 
わからないものを1つ選んで，その番号を書きましょう。',1,70.8,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_b.pdf#page=17',3,8);
INSERT INTO "question" VALUES (426,2016,'B',4,3,'各学校の図書委員たちは，読書活動をすすめた成果を表すために，4月
から7月までの4か月間の「物語」の貸出冊数の変化の様子を，それぞれ
折れ線グラフにまとめました。
{image1}
けんたさんは，上の2つのグラフの，5月から6月までの「物語」の
貸出冊数の変化の様子を見比べて，次のように言いました。
{image2}
けんたさんが言っている，2重下線部のことは正しくあリません。
そのわけを，グラフから読み取れる貸出冊数に着目して，言葉や数を
使って書きましょう。',3,25.0,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_b.pdf#page=18',4,8);
INSERT INTO "question" VALUES (427,2016,'B',5,0,'下のような，30°，  60°，  90°の角をもつ三角定規が
あります。
{image1}
この三角定規を2枚使って，同じ長さの辺をあわせて，次
の3種類の図形をつくりました。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (428,2016,'B',5,1,'次に，下のように，②の二等辺三角形を選んで形をつくります。
{image1}
360÷120は，どのようなことを計算している式ですか。
言葉と数を使って書きましょう。その際，「360」と「120」が何を
表しているかがわかるようにして書きましょう。',3,7.0,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_b.pdf#page=21',5,4);
INSERT INTO "question" VALUES (429,2016,'B',5,2,'今度は，③の四角形を選んで形をつくります。
{image1}
㋒の角が1つの点のまわりに集まるように，③の四角形を並べていく
と，6つで，ある形ができます。どのような形ができますか。
下の1から4までの中からIつ選んで，その番号を書きましょう。
{image2}',1,25.4,'https://www.nier.go.jp/16chousa/pdf/16mondai_shou_sansuu_b.pdf#page=22',5,4);
INSERT INTO "question" VALUES (430,2017,'A',1,0,'1mあたリの値段が60円のリボンを何mか買います。 
そのときの代金の求め方を考えます。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (431,2017,'A',1,1,'リボンを2m買ったときの代金はいくらですか。また，リボンを3m
買ったときの代金はいくらですか。それぞれ答えを書きましょう。',2,97.0,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_a.pdf#page=4',5,8);
INSERT INTO "question" VALUES (432,2017,'A',1,2,'リボンを0.4 m買います。このときの代金を□円として，リボンの長さ 
と代金の関係を下の図に表します。
「1 mあたリの値段の60」「「買う長さの0.4」「0.4 m分の代金の□」 
のそれぞれの場所は，下の図のどこになリますか。
アからオまでの中から，あてはまるものを1つずつ選んで，その 
記号を書きましょう。
{image1}',1,70.0,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_a.pdf#page=4',5,1);
INSERT INTO "question" VALUES (433,2017,'A',1,3,'0.4 m分の代金を求めるための式を，60 x  0.4としました。
60 x 0.4の答えを求めるために，次のように，60 x 4の答えを
使います。
{image1}
㋕ではどのようなことをしますか。
下の1から3までの中から1つ選んで，その番号を書きましょう。',1,91.1,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_a.pdf#page=5',5,1);
INSERT INTO "question" VALUES (434,2017,'A',2,0,'次の計算をしましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (435,2017,'A',2,1,'123 x 52',2,85.3,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_a.pdf#page=6',3,1);
INSERT INTO "question" VALUES (436,2017,'A',2,2,'10.3 + 4',2,79.9,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_a.pdf#page=6',4,1);
INSERT INTO "question" VALUES (437,2017,'A',2,3,'6 + 0.5 x  2',2,66.8,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_a.pdf#page=6',4,1);
INSERT INTO "question" VALUES (438,2017,'A',2,4,'5 ÷ 9   (商を分数で表しましょう。)',2,69.4,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_a.pdf#page=6',5,1);
INSERT INTO "question" VALUES (439,2017,'A',3,0,'8と12の最小公倍数を書きましょう。',2,86.3,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_a.pdf#page=7',5,1);
INSERT INTO "question" VALUES (440,2017,'A',4,0,'次の2つのびんにいっぱいに入れた水のかさを比べます。
{image1}
2つのびんにいっぱいに入れた水のかさは，同じ大きさのコップに分けて，
それぞれコップ何ばい分かで比べることができます。
{image2}
この比べ方と同じように，ものの重さや長さを同じ大きさのいくつ分かで
比べているものは，右の1から4までの中のどれですか。
2つ選んで，その番号を書きましょう。
{image3}',1,70.8,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_a.pdf#page=8',3,3);
INSERT INTO "question" VALUES (441,2017,'A',5,0,'平行な2本の直線を使って，平行四辺形や三角形をかきました。
下の1から4までの三角形の中で，平行四辺形アの面積の，半分の面積 
であるものはどれですか。すべて選んで，その番号を書きましょう。
{image1}',1,67.2,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_a.pdf#page=10',5,3);
INSERT INTO "question" VALUES (442,2017,'A',6,0,'点Oを中心とする円を使って，図1のような正五角形をかきます。 
図1の点A，点B，点C，点D，点Eは正五角形の頂点です。
{image1}
まず，図2のように半径をかき，円周と交わった点を点Aとします。 
次に，図3のように半径をかいて点Bの位置を決めます。このとき，角㋐
の大きさは何度にすればよいですか。答えを書きましょう。
{image2}',2,75.7,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_a.pdf#page=11',5,4);
INSERT INTO "question" VALUES (443,2017,'A',7,0,'次の図は立方体の展開図です。
{image1}
この展開図を組み立てたときに，色のついた面と平行になる面は，
㋐から㋔までのうちどれですか。
下の1から5までの中から1つ選んで，その番号を書きましょう。',1,86.8,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_a.pdf#page=12',4,4);
INSERT INTO "question" VALUES (444,2017,'A',8,0,'はじめにシールを何枚か持っていて，5人で等しく分けたら，1人10枚
ずつになりました。
このことを，はじめに持っていたシールの枚数を□枚として式に表します。 
下の1 から4までの中から，正しい式を1つ選んで，その番号を書き
ましょう。',1,83.7,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_a.pdf#page=13',3,8);
INSERT INTO "question" VALUES (445,2017,'A',9,0,'家でイヌやネコを飼っているかどうかを，13人に聞いて，下のように記録
しました。
{image1}
上の記録を下の表にまとめます。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (446,2017,'A',9,1,'上の出席番号1番の人は上の表のアから エ までの中のどこに入り
ますか。1つ選んで，その記号を書きましょう。',1,88.2,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_a.pdf#page=15',4,8);
INSERT INTO "question" VALUES (447,2017,'A',9,2,'上の表のオにあてはまる数を書きましょう。',2,63.1,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_a.pdf#page=15',4,8);
INSERT INTO "question" VALUES (448,2017,'B',1,0,'1から9までの数が書かれたカードが1枚ずつあリます。
{image1}
この中から2枚のカードを選んで，次のような2けたのひき算の答えに
ついて考えます。
{image2}
選んだ2枚のカードに書かれた数どうしの差を，「カードの差」と呼ぶ 
ことにします。例えば， 1と9の2枚のカードの差は8です。
あやかさんは，カードの差が1，2 ，3の場合について，すべての選び方 
で2けたのひき算をしました。
{image3}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (449,2017,'B',1,1,'カードの差が4の場合の，2けたのひき算の式を1つ書きましょう。
また，答えも書きましょう。',2,76.1,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_b.pdf#page=5',2,1);
INSERT INTO "question" VALUES (450,2017,'B',1,2,'あやかさんは，カードの差が2や3の場合に，2けたのひき算の答えが
それぞれ18， 27になることを，次のように図を使って考えました。
{image1}
カードの差が1の場合，2けたのひき算の答えが9になることを
【あやかさんの考え】と同じように考えます。
4と5を選んだ54 —  45の場合では，どこが残リますか。 
解答用紙の図に 〇 をかき入れましょう。
{image2}',2,81.9,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_b.pdf#page=7',5,1);
INSERT INTO "question" VALUES (451,2017,'B',1,3,'そうたさんは，カードの差が1， 2 ， 3の場合の2けたのひき算の答え
を下のようにまとめました。
{image1}
そうたさんが言うように，カードの差を使って，2けたのひき算の答えを 
かけ算で簡単に求めることができるきまりがあリます。
このきまリを，言葉と数を使って書きましょう。
そのとき，「カードの差」，「「2けたのひき算の答え」の2つの言葉を
使いましょう。',3,38.8,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_b.pdf#page=7',5,1);
INSERT INTO "question" VALUES (452,2017,'B',2,0,'ゆリえさんたちは，交流会に来てくれた地域の方20人に，お礼の手紙と
記念品をいっしょに封筒に入れて送ろうとしています。
1通送るのにかかる料金は，封筒の大きさと重さによって，次のように
決まっています。
{image1}
手紙と記念品を小さい封筒に入れると，1通の重さは27gになりました。 
また，大きい封筒に入れると，1通の重さは36gになリました。ゆりえさん 
たちは，料金をできるだけ安くするために，小さい封筒に入れて送ること
にしました。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (453,2017,'B',2,1,'紙と記念品を封筒に入れて，20通送るときの料金について考えます。 
小さい封筒に入れて送る場合は，大きい封筒に入れて送る場合と比べて， 
何円安くなリますか。
求め方を言葉や式を使って書きましょう。また，答えも書きましょう。',3,40.7,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_b.pdf#page=9',3,1);
INSERT INTO "question" VALUES (454,2017,'B',2,2,'小さい封筒に入れるためには，長方形の形をした手紙を3つに折る必要
があります。
{image1}
ゆりえさんは，手紙をなるべくきれいに3つに折るために，先生から 
3等分する点を見つける方法を教えてもらいました。
{image2}
手紙の用紙には，同じはばに並んだ13本の平行な直線がひかれています。 
ゆりえさんは，手紙を3つに折るために，もう1枚の手紙の用紙を使おう 
と考えました。そして，下の図のように，1本目と13本目の直線に手紙の 
両はしをあわせて，3等分する点を見つけました。
{image3}
13本の直線のうち，手紙の長い辺と交わった点が，その辺を3等分
する点になるのは，上から何本目と何本目の直線ですか。
答えを書きましょう。',2,27.7,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_b.pdf#page=11',5,1);
INSERT INTO "question" VALUES (455,2017,'B',3,0,'かずやさんたちは，ゴ厶の力で動く車を作りました。
下の図のように車と発射台を輪ゴムでつなざ，車を引いて輪ゴムを 
のばしてから放すと，車が進みます。車の先頭が，図の㋐の位置に来るまで 
輪ゴムをのばした場合と，㋑の位置に来るまで輪ゴムをのばした場合に，
どれだけ車が進むのかを調べます。
{image1}
まず，車の先頭が㋐の位置に来るまで輪ゴムをのばした場合の，車が進んだ 
きよりを5回調べ，表1のようにまとめました。表1をもとに，きょりの
平均を考えます。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (456,2017,'B',3,1,'2回目の記録を除いて，4回分の記録を使って車が進んだきよりの平均 
が何cmになるかを求めます。下の1から4までの中の，どの式で 
求めることができますか。1つ選んで，その番号を書きましょう。',1,68.1,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_b.pdf#page=13',5,3);
INSERT INTO "question" VALUES (457,2017,'B',3,2,'次に，車の先頭が㋑の位置に来るまで輪ゴムをのばした場合の，車が進んだ 
きよりを5回調べ，表2のようにまとめました。表2をもとに，きょりの
平均を考えます。
{image1}
かずやさんは，平均を求める計算を簡単にするために，7mをこえた部分 
に着目し，次のように平均を求めました。
{image2}
【かずやさんの平均の求め方】を聞いたはるなさんは，次のように考え
ました。
{image3}
7m20cmをこえた部分に着目した平均の求め方を，言葉や式を使って
書きましょう。',3,26.3,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_b.pdf#page=15',5,3);
INSERT INTO "question" VALUES (458,2017,'B',4,0,'学校で，4年生以上の学年について，ハンカチとティッシュペーパーを
持ってきているかどうかについて調べました。
ゆうじさんは，調べた結果を次のようにまとめました。
{image1}
さくらさんは，ハンカチとティッシュペーパーを両方持ってきた人数を 
求めるために，表をまとめ直すことにしました。
下の表は，5年生の結果をまとめ直したものです。
{image2}
さくらさんは，表をもとに次の式をつくり，ハンカチとティッシュペーパー 
を両方持ってきた5年生の人数を54人と求めました。
{image3}
【さくらさんの式】の中の，「9」は，ティッシュペーパーを持ってこな 
かった人数の合計を表しています。この「9」は表のオにあてはまります。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (459,2017,'B',4,1,'【さくらさんの式】の中の，「8」はどのような人数を表していますか。
言葉を使って書きましょう。
また，この「8」は，表のどこにあてはまりますか。アからエ まで 
の中からIつ選んで，その記号を書きましょう。',3,40.2,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_b.pdf#page=17',4,8);
INSERT INTO "question" VALUES (460,2017,'B',4,2,'ゆうじさんたちは，調べた結果をグラフに表して発表しようと考えています。
{image1}
それぞれの学年の，「学年の人数」をもとにしたときの「ハンカチと 
ティッシュペーパーの両方を持ってきた人数」の割合を表すのに，最も 
適したグラフは，右の1から4までの中のどれですか。
1つ選んで，その番号を書きましょう。
{image2}',1,29.4,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_b.pdf#page=18',5,8);
INSERT INTO "question" VALUES (461,2017,'B',5,0,'月は，地球のまわりを回りながら，地球に近づいたリ，はなれたりして 
います。月の大きさは実際には変わりませんが，月が地球に最も近づいた 
ときに，最も大きく見え，地球から最もはなれたときに，最も小さく見えます。 
地球から見える満月を円とみて，最も大きく見えるときの見かけの直径を 
「最大の満月の直径丄 最も小さく見えるときの見かけの直径を「最小の
満月の直径」ということにします。
「最大の満月の直径」と「最小の満月の直径」を比べたとき，「最小の 
満月の直径」をもとにすると，「最大の満月の直径」は約14%長いです。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (462,2017,'B',5,1,'「最小の満月の直径」を斜線，「最大の満月の直径」を色付きとして，
図に表します。
「最小の満月の直径」をもとにして「最大の満月の直径」が14 %長い 
ことを表しているものを，下の1から4までの中から1つ選んで，
その番号を書きましょう。
{image1}',1,65.2,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_b.pdf#page=21',5,8);
INSERT INTO "question" VALUES (463,2017,'B',5,2,'月の直径を，硬貨の直怪に置きかえて考えます。
1円玉，100円玉，500円玉の直径は，それぞれ下のとおりです。
{image1}
「最小の満月の直径」を1円玉の直径としたときに，「最小の満月の直径」 
をもとにして14%長くなっている「最大の満月の直径」は，100円玉と 
500円玉のどちらの直径に近いですか。
下の1と2から選んで，その番号を書きましょう。
また，選んだ硬貨のほうが「最大の満月の直径」に近いと考えたわけを， 
言葉や式を使って書きましょう。',3,13.5,'https://www.nier.go.jp/17chousa/pdf/17mondai_shou_sansuu_b.pdf#page=22',5,8);
INSERT INTO "question" VALUES (464,2018,'A',1,0,'0.4 mの重さが60gの針金があります。
{image1}
この針金について，次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (465,2018,'A',1,1,'針金0.2 mの重さは何gですか。また，針金0.1 mの重さは何gですか。
それぞれ答えを書きましょう。',1,63.2,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_a.pdf#page=4',5,1);
INSERT INTO "question" VALUES (466,2018,'A',1,2,'針金1mの重さが何gになるかを考えます。
1 mの重さを□gとして，針金の長さと重さの関係を下の図に表します。
針金0.4 mの「0.4」，0.4 mの重さ60gの「60」.1mの重さ□g
の「□」のそれぞれの場所は，下の図のどこになりますか。
アからオまでの中から，あてはまるものを1つずつ選んで，その記号
を書きましょう。
{image1}',1,66.9,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_a.pdf#page=4',5,1);
INSERT INTO "question" VALUES (467,2018,'A',1,3,'針金1mの重さを求める式を，下の1から4までの中から1つ選んで，
その番号を書きましよう。',1,65.5,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_a.pdf#page=5',5,1);
INSERT INTO "question" VALUES (468,2018,'A',2,0,'答えが12 ÷ 0.8の式で求められる問題を，下の1から4までの中から 
すべて選んで，その番号を書きましょう。',1,40.1,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_a.pdf#page=6',5,1);
INSERT INTO "question" VALUES (469,2018,'A',3,0,'次の3けたの整数の大きさを比べます。
562         5□3
上の3けたの整数5□3の十の位には，まだ数字が入っていません。 
5□3が562よリも大きい数になるとき，□には，どのような数字が
あてはまりますか。
0から9までの中で，あてはまる数字をすべて書きましょう。',1,76.5,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_a.pdf#page=7',2,1);
INSERT INTO "question" VALUES (470,2018,'A',4,0,'こみぐあいについて，次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (471,2018,'A',4,1,'㋐と㋑の2つのシートがあります。㋐と㋑のシートの面積は，同じです。
{image1}
次の表は，シートの上にすわっている人数とシートの面積を表しています。
{image2}
上の表から，こみぐあいについてどのようなことがわかりますか。 
下の1から3までの中から1つ選んで，その番号を書きましょう。',1,87.9,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_a.pdf#page=8',5,3);
INSERT INTO "question" VALUES (472,2018,'A',4,2,'㋒と㋓の2つのシートがあります。㋒と㋓のシートの面積は，ちがいます。
{image1}
次の表は，シートの上にすわっている人数とシートの面積を表しています。
{image2}
どちらのシートのほうがこんでいるかを調べるために，下の計算をしました。
㋒ 16 + 8=2 
㋓ 9-5 = 1.8
上の計算からどのようなことがわかリますか。
下の1から4までの中から1つ選んで，その番号を書きましょう。',1,50.3,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_a.pdf#page=9',5,3);
INSERT INTO "question" VALUES (473,2018,'A',5,0,'図1のように，円の中心である点アと円周の上の点イを直線で結び辺アイ 
とし，点アと円周の上の点ウを直線で結び辺アウとして，これらの辺がつくる 
角を，角あとしました。
{image1}
図2のように，辺アウを矢印の向きに動かして角あの角度を大きくして
いきます。
図3のように，辺アイと辺アウが一直線になったときの角を，角いとします。 
また，図4のときの角を，角うとします。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (474,2018,'A',5,1,'図3のときの角いの角度は何度ですか。下の1から5まで
の中から1つ選んで，その番号を書きましょう。
{image1}',1,94.5,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_a.pdf#page=11',4,3);
INSERT INTO "question" VALUES (475,2018,'A',5,2,'図4のときの角うの角度を，分度器を使ってはかリます。
角うの角度は何度ですか。答えを書きましょう。
{image1}',1,58.7,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_a.pdf#page=11',4,3);
INSERT INTO "question" VALUES (476,2018,'A',6,0,'図1は，1目もりが1cmの方眼紙のマス目にあわせて1辺が1cmの 
立方体を置き，その上に立方体がぴったり重なるように置いている様子を
表しています。
{image1}
図2のように立方体を置いたときの，立方体の位置の表し方を考えます。
{image2}
上の図2のとき，立方体アと立方体イの位置を，次のように表します。
{image3}
このとき，立方体ウの位置は，どのように表すことができますか。 
答えを書きましょう。',1,73.7,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_a.pdf#page=12',4,4);
INSERT INTO "question" VALUES (477,2018,'A',7,0,'次の問題に答えましょう。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (478,2018,'A',7,1,'円周率を求める式を，下の1から4までの中から1つ選んで，その 
番号を書きましょう。',1,41.9,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_a.pdf#page=14',5,4);
INSERT INTO "question" VALUES (479,2018,'A',7,2,'下の文の点線□にあてはまるものを考えます。
{image1}
上の文の点線□にあてはまるものを，下の アから エ までの中から 
1つ選んで，その記号を書きましょう。',1,55.9,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_a.pdf#page=14',5,4);
INSERT INTO "question" VALUES (480,2018,'A',8,0,'ある会場に子どもたちが集まリました。
集まった子どもたち200人のうち80人が小学生でした。
小学生の人数は，集まった子どもたちの人数の何％ですか。
下の1から4までの中から1つ選んで，その番号を書きましょう。',1,53.1,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_a.pdf#page=15',5,8);
INSERT INTO "question" VALUES (481,2018,'A',9,0,'A，   B，   C，   D，    Eの地点について，同じ日の午前9時から午後5時 
までの1時間ごとの気温をそれぞれ調べました。
A地点の気温と，もう一方の地点の気温を比べるために，A地点とB地点， 
A地点とC地点，A地点とD地点，A地点とE地点の気温を，右のように 
4つのグラフに表しました。
右の4つのグラフの中で，下の2つのことが両方あてはまるグラフが
あります。
{image1}
上の2つのことが両方あてはまるグラフを，右の1から4までの 
中から1つ選んで，その番号を書きましょう。
{image2}',1,63.8,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_a.pdf#page=16',4,8);
INSERT INTO "question" VALUES (482,2018,'B',1,0,'身のまわりには，図形の辺どうしがぴったりあっていて，すきまも重なりも 
なくしきつめられている模様があります。はるとさんたちは，これらの模様 
に興味をもちました。
はるとさんたちは，まず，うろこ模様を調べることにしました。
はるとさんたちが調べているうろこ模様は，合同な正三角形でしきつめら
れていました。
{image1}
はるとさんたちは，うろこ模様の中に，いくつかの正三角形でできている
図形を見つけました。
{image2}
{image3}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (483,2018,'B',1,1,'正三角形4つでできている図形を，うろこ模様の中から見つけます。 
どのような図形を見つけることができますか。
見つけることができる図形を，下の1から4までの中から1つ選んで，
その番号を書きましょう。
{image1}',1,71.8,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_b.pdf#page=5',5,4);
INSERT INTO "question" VALUES (484,2018,'B',1,2,'はるとさんたちは，次に，きっこう模様も調べることにしました。 
はるとさんたちが調べているきっこう模様は，合同な正六角形でしきつめ 
られていました。
はるとさんたちは，うろこ模様ときっこう模様について，話し合っています。
{image1}
はるとさんたちは，さらに，かごめ模様も調べることにしました。 
はるとさんたちが調べているかごめ模様は，合同な正三角形と合同な
正六角形でしきつめられていました。
{image2}
点Cのまわリに集まった角の大きさの和が，360°になっていることを， 
着目した図形の「名前」と「角の大きさ」がわかるようにして，言葉や式
を使って書きましょう。',1,48.5,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_b.pdf#page=7',5,4);
INSERT INTO "question" VALUES (485,2018,'B',2,0,'たくみさんたちは，「1年生と仲よくなる会」で玉入れゲー厶をすること 
にし，その計画を立てています。
まず，玉入れゲー厶の説明をまとめました。
{image1}
次に，たくみさんたちは，下のような計画を立てました。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (486,2018,'B',2,1,'【たくみさんたちの計画】の「ルールの説明」に使える時間は，何分
ですか。答えを書きましょう。',1,70.7,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_b.pdf#page=9',3,3);
INSERT INTO "question" VALUES (487,2018,'B',2,2,'1回の玉入れゲー厶には，玉を投げる時間と入った玉を数える時間が必要
です。
1回の玉入れゲー厶の時間を3分に最も近い時間にするために，たくみ 
さんたちは，玉を投げる時間をどのくらいにすればよいのかを考えることに
しました。
{image1}
「玉を投げる時間」を長くすると，入る玉の個数が增えるので，「入った
玉を数える時間」も長くなります。
そこで，たくみさんたちは，ためしに，玉を投げる時間を40秒にして
玉入れゲー厶を行い，下のメモにまとめました。
{image2}
玉を投げる時間が40秒のとき，1回の玉入れゲー厶の時間は142秒に 
なります。玉を投げる時間を50秒，60秒と長くしたところ，入った玉の 
個数は，それぞれ64個と80個でした。
玉を投ける時間を40秒，50秒，60秒にしてためしたことを，表にまとめ
ます。
1回の玉入れゲー厶の時間を3分に最も近い時間にするためには， 
玉を投げる時間を，40秒，50秒，60秒のどれにすればよいですか。 
入った玉を1個あたり2秒で数えることとし，下の表にある4つの太枠
の中にあてはまる数を書きましょう。
そして，［    ］の中には，40 ， 50 ， 60のいずれかの数を書きましょう。 
それぞれ解答用紙に書きましょう。
{image3}',1,48.1,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_b.pdf#page=11',3,1);
INSERT INTO "question" VALUES (488,2018,'B',3,0,'しおリさんたちの学校は，「進んであいさつをする」と「本をよく読む」 
の2つのめあてに取り組んでいます。
しおりさんたちは，7月と12月に，2つのめあてについて全校児童625人 
に対してアンケート調査をし，その結果を下のグラフに表しました。
しおりさんは，グラフからわかることを2つのメモに書きました。
{image1}
えりかさんとまさるさんは，しおリさんが書いたメモについて話し合って
います。
{image2}
しおりさんが言うように，メモ1とメモ2は，それぞれ，グラフについて
ちがうことに着目して書かれています。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (489,2018,'B',3,1,'メモ1とメモ2は，それぞれ，グラフについてどのようなことに着目して
書かれていますか。それぞれ着目していることを，言葉や数を使って書き
ましょう。',1,20.9,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_b.pdf#page=13',3,8);
INSERT INTO "question" VALUES (490,2018,'B',3,2,'しおりさんたちは，「進んであいさつをする」について，12月のアンケート調査
の結果を，1・2年生，3・4年生，5・6年生に分けて調べました。
そして，「進んであいさつをする」に「取り組んだ」と答えた人数を，グラフ1
に表しました。
{image1}
しおりさんたちは，1・2年生，3・4年生，5・6年生それぞれの，学年の 
人数をもとにしたときの「進んであいさつをする」に「取り組んだ」と答えた 
人数の割合を求め，グラフ2に表しました。
{image2}
グラフ1とグラフ2を見て，次のようにまとめます。
{image3}
上の㋐にあてはまるものを，下の1から3までの中から1つ選んで， 
その番号を書きましょう。また，上の㋑にあてはまるものを，下の4と5 
から選んで，その番号を書きましょう。',1,24.0,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_b.pdf#page=15',5,8);
INSERT INTO "question" VALUES (491,2018,'B',4,0,'はるなさんたちは，学習した九九の表についてふり返リました。
まず，九九の表の，2の段と3の段に着目し，縦に並んでいる2つの数
について話し合いました。
{image1}
{image2}
4の段と5の段の縦に並んでいる2つの数の和は，9の段の数になります。 
9の段の数になるわけを考えて式に表します。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (492,2018,'B',4,1,'4の段と5の段の縦に並んでいる2つの数「32， 40」の和が，
9の段の数になるわけを【ひろとさんの考え】と同じように考えて式に
表します。下の㋐，㋑にあてはまる式を書きましょう。
{image1}',1,62.9,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_b.pdf#page=17',4,8);
INSERT INTO "question" VALUES (493,2018,'B',4,2,'次に，九九の表の，横に並んでいる数を選び，選んだ数について話し合い
ました。
{image1}
ゆうかさんたちは，横に並んでいる5つの数「6， 12， 18， 24， 30」
について調べました。
{image2}
ゆうかさんの話を聞いてはるなさんは，次のように説明し直しました。
{image3}
今度は，横に並んでいる数が7つの場合について調べ，【はるなさんの 
説明】と同じように説明します。
2の段の，横に並んでいる7つの数「4， 6， 8， 10， 12， 14， 16J
について【はるなさんの説明】と同じように説明すると，どのように
なりますか。言葉と数を使って書きましょう。',1,59.8,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_b.pdf#page=19',4,1);
INSERT INTO "question" VALUES (494,2018,'B',5,0,'さくらさんたちは，学校の黒板に輪かざりをつけようと思い，先生から
折り紙をもらいました。折り紙の枚数は100枚でした。 
I枚の折り紙からは，折り紙の輪を5個作ることができます。 
折り紙の輪を30個つなげて，輪かざりを1本作ります。
{image1}
さくらさんたちは，図1のように，横の長さが7mの黒板を，50 cmずつ 
に区切って，上の部分に輪かざりを1本ずつたるませながらつけようと計画
しています。
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (495,2018,'B',5,1,'横の長さが7 mの黒板の，はしからはしまで輪かざりをつけるためには，
折り紙の枚数が100枚あれば足ります。
そうたさんは，そのわけを，次のように説明しようとしています。
{image1}
【そうたさんの説明】に続くように，折り紙の枚数が100枚あれば 
足りるわけを，式や言葉を使って書きましょう。',1,43.5,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_b.pdf#page=21',4,1);
INSERT INTO "question" VALUES (496,2018,'B',5,2,'もらった折り紙は，赤，青，黄，緑の4色が，それぞれ同じ枚数ずつ
ありました。
さくらさんは，折り紙の輪を，図2のように，赤，青，黄，緑の順に 
くり返してつなげ，輪かざり1本を作ってみました。
{image1}
上の図2のように，1個目の折り紙の輪の色を赤にして，輪かざり1本 
を作ったとき，30個目の折り紙の輪の色は何色ですか。
下の1から4までの中から1つ選んで，その番号を書きましょう。',1,66.7,'https://www.nier.go.jp/18chousa/pdf/18mondai_shou_sansuu_b.pdf#page=22',5,1);
INSERT INTO "question" VALUES (497,2019,NULL,1,0,'下のような長方形の紙があります。方眼紙は， 1 目もり 1 cm です。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (498,2019,NULL,1,1,'ゆうたさんは，上のような長方形の紙を直線で切って，下の １ から ４
までの図形をつくりました。
下の １ から ４ までの中で，台形はどれですか。
２つ選んで，その番号を書きましょう。
{image1}',1,93.2,'https://www.nier.go.jp/19chousa/pdf/19mondai_shou_sansuu.pdf#page=3',4,4);
INSERT INTO "question" VALUES (499,2019,NULL,1,2,'ちひろさんは，次のように， 2 つの合同な台形をつくりました。
{image1}
上の 2 つの合同な台形を，ずらしたり，回したり，裏返したりして，
同じ長さの辺どうしを合わせ，いろいろな形をつくります。
どのような形をつくることができますか。
下の １ から ４ までの中からすべて選んで，その番号を書きましょう。
{image2}',1,60.5,'https://www.nier.go.jp/19chousa/pdf/19mondai_shou_sansuu.pdf#page=4',5,4);
INSERT INTO "question" VALUES (500,2019,NULL,1,3,'ゆうたさんたちは， 2 つの合同な台形でつくられた図１の形の面積を
求めようとしています。
{image1}
ゆうたさんは，図１の形の面積を，次のように求めました。
{image2}
まさるさんは，【ゆうたさんの求め方】の中の「 8 × 2 」が，どのような
ことを表しているのかを，下のように説明しました。
{image3}
図１の形の面積は， 16 cm2 であることがわかりました。
{image4}
【ちひろさんの求め方】の中の「 20 － 4 」は，どのようなことを表して
いますか。「 20 」と「 4 」がどのような図形の面積を表しているのかが
わかるようにして，言葉や数を使って書きましょう。
{image5}',3,44.1,'https://www.nier.go.jp/19chousa/pdf/19mondai_shou_sansuu.pdf#page=5',5,3);
INSERT INTO "question" VALUES (501,2019,NULL,2,0,'かいとさんたちは，水を大切に使っているのかどうかを知りたいと思い，
まず，自分たちの住んでいる市では，水をどのくらい使っているのかを調べ
ています。かいとさんは，グラフ１を見つけました。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (502,2019,NULL,2,1,'1980年から 2010 年までの， 10 年ごとの市全体の水の使用量につい
て，グラフ１からどのようなことがわかりますか。
下の １ から ４ までの中から 1 つ選んで，その番号を書きましょう。',1,95.2,'https://www.nier.go.jp/19chousa/pdf/19mondai_shou_sansuu.pdf#page=8',3,8);
INSERT INTO "question" VALUES (503,2019,NULL,2,2,'グラフ１の， 2010 年の市全体の水の使用量は，1980年の市全体の水
の使用量の約何倍ですか。
答えを書きましょう。',2,78.8,'https://www.nier.go.jp/19chousa/pdf/19mondai_shou_sansuu.pdf#page=8',4,1);
INSERT INTO "question" VALUES (504,2019,NULL,2,3,'次に，かいとさんたちは，市全体の水の使用量には，人口が関係してい
るのではないかと思い，グラフ２とグラフ３を見つけ， 2 つのグラフを
もとに考えています。
{image1}
あやのさんが言うように，グラフ２とグラフ３を見ることで，  2010年
から 2016年までの1人あたりの水の使用量についてわかることがありま
す。
2010 年から 2016 年までの，3年ごとの1人あたりの水の使用量につ
いて，どのようなことがわかりますか。
下の １ から ４ までの中から 1 つ選んで，その番号を書きましょう。
また，その番号を選んだわけを，グラフ２とグラフ３からわかること
をもとに，言葉や数を使って書きましょう。',3,52.3,'https://www.nier.go.jp/19chousa/pdf/19mondai_shou_sansuu.pdf#page=9',5,3);
INSERT INTO "question" VALUES (505,2019,NULL,2,4,'さらに，かいとさんは，自分が家で水をどのくらい使っているのかが
気になり，洗顔と歯みがきで使う水の量を求めるために，下の式を考え
ました。
{image1}
【かいとさんが考えた式】の，㋐に入る数を書きましょう。',2,60.4,'https://www.nier.go.jp/19chousa/pdf/19mondai_shou_sansuu.pdf#page=11',4,1);
INSERT INTO "question" VALUES (506,2019,NULL,3,0,'ともやさんは， 421 － 298 や 600 － 201 のようなくり下がりのある
ひき算について，次のように計算しやすい式にして考えました。
{image1}
{image2}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (507,2019,NULL,3,1,'【ともやさんの計算の仕方】をもとに， 350 － 97 について，計算し
やすいようにひく数の 97 を 100 にした式で考えます。
{image1}
上の㋐，㋑，㋒に入る数を書きましょう。',2,81.9,'https://www.nier.go.jp/19chousa/pdf/19mondai_shou_sansuu.pdf#page=14',3,1);
INSERT INTO "question" VALUES (508,2019,NULL,3,2,'ゆいなさんは，くり下がりのあるひき算を計算したときにもとにした考え
をふり返って，次のようにまとめました。
{image1}
ことねさんは， 400 ÷ 25 や 90 ÷ 18 のようなわり算についても，計算
しやすい式にすることができると思い，下のように考えました。
{image2}
ひき算について書かれた【ゆいなさんがまとめたこと】と同じように，
わり算についても，【ことねさんの計算の仕方】をもとにまとめると，
どのようになりますか。
下の の中に，「わられる数」，「わる数」，「商」の 2 つの言葉を使って
書きましょう。
{image3}',3,31.3,'https://www.nier.go.jp/19chousa/pdf/19mondai_shou_sansuu.pdf#page=16',4,1);
INSERT INTO "question" VALUES (509,2019,NULL,3,3,'　【ことねさんの計算の仕方】をもとに， 600 ÷ 15 について考えます。
{image1}
上の① にあてはまるものを，下の点線枠の中から 1 つ選び，また，
上の②にあてはまるものを，下の枠線の中から 1 つ選んで，それぞれ
書きましょう。
ただし，それぞれ，どれを選んでもかまいません。
{image2}
さらに，上の㋓，㋔，㋕，㋖に入る数を書きましょう。',2,75.0,'https://www.nier.go.jp/19chousa/pdf/19mondai_shou_sansuu.pdf#page=16',4,1);
INSERT INTO "question" VALUES (510,2019,NULL,3,4,'ゆいなさんは，下の問題について考えています。
{image1}
1 m 分の代金は 180 ÷ 0.6 の式で求めることができます。
ゆいなさんは，次のように，小数のわり算を整数のわり算にして答えを
求めました。
{image2}
1800 ÷ 6 は，何 m 分の代金を求めている式といえますか。
下の あ から え までの中から 1 つ選んで，その記号を書きましょう。',1,47.1,'https://www.nier.go.jp/19chousa/pdf/19mondai_shou_sansuu.pdf#page=17',5,1);
INSERT INTO "question" VALUES (511,2019,NULL,4,0,'はるとさんたちは，遊園地に来ています。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (512,2019,NULL,4,1,'乗り物券を買うために列に並びました。
はるとさんは，だいたい何分後に乗り物券を買う順番がくるのかを
知りたいと思いました。
はるとさんは，前から数えて 20 番目でした。
列に並んでいる人は，同じ進みぐあいで進んでいます。
{image1}
だいたい何分後に乗り物券を買う順番がくるのかを知るためには，何を
調べればよいですか。
下の ア から エ までの中から 1 つ選んで，その記号を書きましょう。',1,82.8,'https://www.nier.go.jp/19chousa/pdf/19mondai_shou_sansuu.pdf#page=19',4,8);
INSERT INTO "question" VALUES (513,2019,NULL,4,2,'次に，はるとさんたちは，観覧車に乗るために列に並んでいます。
観覧車のゴンドラは 36 台で，ゴンドラ 1 台に 1 組ずつ乗ります。
ゴンドラは 1 台来るのに 20 秒かかります。
今の先頭はあかりさんたちです。はるとさんは，あかりさんたちの
10 組後ろにいます。
あかりさんたちがゴンドラに乗ってから，はるとさんが何秒後に
ゴンドラに乗ることができるのかを考えます。
はるとさんがゴンドラに乗ることができるのは何秒後かを求める式
を書きましょう。
ただし，計算の答えを書く必要はありません。
{image1}',2,68.8,'https://www.nier.go.jp/19chousa/pdf/19mondai_shou_sansuu.pdf#page=20',3,1);
INSERT INTO "question" VALUES (514,2019,NULL,4,3,'はるとさんたちは，限定商品を買いたいと思っています。次の予定が
あるので，午後 3 時までにはレジに着きたいと考えています。
列に並ぶと，レジまでは 14 ポール分ありました。ポールとポールの間
の長さはどこも同じです。
{image1}
はるとさんたちが並んでから， 4 ポール分進むのに 8 分間かかり，残り
10 ポール分になりました。午後 3 時までは，残り 33 分間です。そこで，
33 分間以内にレジに着くことができるかどうかを考えてみました。
{image2}
ところが，レジにいる店員さんが減ってしまいました。それからは，
3 ポール分進むのに 9 分間かかり，残り 7 ポール分になりました。午後 3 時
までは，残り 24 分間です。
そこで，はるとさんたちは， 24 分間以内にレジに着くことができるか
どうかを，もう一度考えてみました。
{image3}
3 ポール分進むのに 9 分間かかる進みぐあいで進むとすると，残り
7 ポール分進むのにかかる時間は何分間ですか。
求め方を言葉や式を使って書きましょう。また，答えも書きましょう。
さらに， 24 分間以内にレジに着くことができるかどうかを，下の
１ と ２ から選んで，その番号を書きましょう。',3,62.8,'https://www.nier.go.jp/19chousa/pdf/19mondai_shou_sansuu.pdf#page=21',5,3);
INSERT INTO "question" VALUES (515,2020,NULL,1,0,'まもなく東京 2020 オリンピック・パラリンピックが始まります。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (516,2020,NULL,1,1,'わたるさんたちは，男子走り高とびのオリンピック記録について話し合ってい
ます。
{image1}
{image2}
わたるさんの身長は 150 cm です。
わたるさんの身長の 1.3 倍の高さは，何 cm になりますか。
求める式と答えを書きましょう。',2,NULL,'https://www.nier.go.jp/20chousa/pdf/20mondai_shou_sansuu.pdf#page=3',5,1);
INSERT INTO "question" VALUES (517,2020,NULL,1,2,'わたるさんたちは，オリンピックの長きょり走の種目について話し合って
います。
{image1}
{image2}
10000 m は，何 km ですか。答えを書きましょう。',2,NULL,'https://www.nier.go.jp/20chousa/pdf/20mondai_shou_sansuu.pdf#page=4',3,3);
INSERT INTO "question" VALUES (518,2020,NULL,1,3,'わたるさんたちは，東京 2020オリンピック・パラリンピックの会場 
になっている国立競技場の面積 （国立競技場を上から見たときの 
建物の広さ）について考えています。
{image1}
{image2}
72000 m2 は，何の 72000 個分ですか。
下の ア から エ までの中から 1 つ選んで，その記号を書きましょう。',1,NULL,'https://www.nier.go.jp/20chousa/pdf/20mondai_shou_sansuu.pdf#page=5',4,3);
INSERT INTO "question" VALUES (519,2020,NULL,1,4,'わたるさんたちは，国立競技場の面積を 72000 m2 として，校庭の面積と
比べることにしました。
わたるさんたちの学校の校庭は，縦80 m，横 50 m の長方形です。
{image1}
わたるさんは，次のように，国立競技場の面積が校庭の面積の 18 個分 
であることを求めました。
{image2}
【わたるさんの求め方】に，縦 80 m，横 50 m の長方形の面積を求める式 
も書くことにしました。
{image3}
上の㋐に入る式を書きましょう。',2,NULL,'https://www.nier.go.jp/20chousa/pdf/20mondai_shou_sansuu.pdf#page=6',4,3);
INSERT INTO "question" VALUES (520,2020,NULL,1,5,'わたるさんたちは，国立競技場の面積が校庭の面積の 18 個分である 
ことがわかりました。
{image1}
ゆうなさんは，縦 80 m，横 50 m の長方形 18 個を同じ向きで並べたと
して考えてみると，縦 240 m，横 300 m の長方形になることがわかりま
した。
{image2}
縦 80 m，横 50 m の長方形 18 個を，縦に何個，横に何個並べると， 
縦 240 m，横 300 m の長方形になりますか。
求め方を式や言葉を使って書きましょう。また，答えも書きましょう。',3,NULL,'https://www.nier.go.jp/20chousa/pdf/20mondai_shou_sansuu.pdf#page=7',4,1);
INSERT INTO "question" VALUES (521,2020,NULL,2,0,'あいりさんたちは，角柱や円柱に紙をはろうとしています。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (522,2020,NULL,2,1,'図１の三角柱は，底面が正三角形です。
{image1}
図１の底面には下の正三角形の紙をはり，図１の側面には下の長方形の紙
をはります。
{image2}
図１のすべての面に 1 枚ずつ紙をはるとき，正三角形の紙と長方形の紙は 
それぞれ何枚必要ですか。
答えを書きましょう。',2,NULL,'https://www.nier.go.jp/20chousa/pdf/20mondai_shou_sansuu.pdf#page=10',5,4);
INSERT INTO "question" VALUES (523,2020,NULL,2,2,'あいりさんたちは，底面が正方形の四角柱にも，紙をはろうとしています。
{image1}
下のように， 1 枚の大きな長方形の紙を使って，四角柱のすべての側面
に紙をはっていきます。
{image2}
図２の四角柱は底面が正方形で，図２の四角柱のすべての側面に紙をはる
ためには，図３のような 1 枚の大きな長方形の紙の横の長さを，どのくらい 
の長さにすればよいのかを考えます。
{image3}
図３の横の長さは，次のように求めることができます。
{image4}
図２の四角柱について，求め方の中の「 5 × 4 」は，どのようなことを
表していますか。「 5 」と「 4 」が何を表しているのかがわかるようにし
て，言葉や数を使って書きましょう。',3,NULL,'https://www.nier.go.jp/20chousa/pdf/20mondai_shou_sansuu.pdf#page=11',5,4);
INSERT INTO "question" VALUES (524,2020,NULL,2,3,'あいりさんたちは，円柱にも紙をはろうとしています。
{image1}
下の円柱に紙をはります。
{image2}
まず，底面にはる直径 5 cm の円の紙を 1 枚作り， 1 目もりが 5 cm の
カッターマットの上にのせました。
{image3}
次に，カッターマットの上で紙を切って，側面にはる長方形の紙を作り 
ます。
側面にはる長方形の紙は，横の長さが円柱の底面の円周の長さと等しく 
なるように作ります。
側面にはる長方形の紙の横の長さは，点Ａからどの点までの長さですか。
下の ア から エ までの中から，最もふさわしいものを 1 つ選んで， 
その記号を書きましょう。
{image4}',1,NULL,'https://www.nier.go.jp/20chousa/pdf/20mondai_shou_sansuu.pdf#page=13',5,4);
INSERT INTO "question" VALUES (525,2020,NULL,2,4,'あいりさんたちは，円についての学習をした後，
見本のコイルに使われているストローの切り口が円
であることに気付きました。見本のコイルには， 
エナメル線が，すき間なく，重なりがないように 
巻かれています。
{image1}{image2}
あいりさんたちは，見本のコイルに巻いてあるエナメル線が，だいたい 
どのくらいの長さなのかを考えることにしました。
ストローに巻いてあるエナメル線の 1 巻きの長さは調べました。
見本のコイルのストローに巻いてある部分のエナメル線のおよその 
長さは，ストローに巻いてあるエナメル線の 1 巻きの長さと，あと 1 つ 
何かを調べれば求めることができます。何を調べればよいですか。
下の １ から ４ までの中から 1 つ選んで，その番号を書きましょう。',1,NULL,'https://www.nier.go.jp/20chousa/pdf/20mondai_shou_sansuu.pdf#page=15',5,8);
INSERT INTO "question" VALUES (526,2020,NULL,3,0,'ようたさんたちは，分数のたし算について考えています。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (527,2020,NULL,3,1,'1/3 ＋ 2/5 の計算をしましょう。',2,NULL,'https://www.nier.go.jp/20chousa/pdf/20mondai_shou_sansuu.pdf#page=17',5,1);
INSERT INTO "question" VALUES (528,2020,NULL,3,2,'ようたさんたちは， 1/2 L と 1/4 L を合わせると何 L になるのかを考えて 
います。
式は， 1/2 ＋ 1/4 になることがわかりました。
{image1}
ようたさんたちは， 1/2 ＋ 1/4 について，図をもとに考えました。
{image2}
はなこさんは，【はなこさんの考え】と【ようたさんの考え】を見て， 
【はなこさんの考え】の中の{image3}を，【ようたさんの考え】の中の{image4}の 
ように直す必要があることに気付きました。
{image5}
1 L の大きさを{image6}と表すとき，【はなこさんの考え】の中の{image3}は，
【ようたさんの考え】の中の{image4}のように直さなければいけません。
【はなこさんの考え】の中の{image3}を直さなければいけないわけを，次の 
ようにまとめます。
{image7}
上の文の㋐，㋑に入る数を書きましょう。',2,NULL,'https://www.nier.go.jp/20chousa/pdf/20mondai_shou_sansuu.pdf#page=17',5,1);
INSERT INTO "question" VALUES (529,2020,NULL,3,3,'次に，はなこさんは， 1/2 ＋ 1/4 について，下のように考えています。
{image1}
【はなこさんの計算の仕方】の中の，1つ分の大きさの{image2}は，どれも
同じ大きさで，次のように説明することができます
{image3}
上の文の㋒に入る数を書きましょう。',2,NULL,'https://www.nier.go.jp/20chousa/pdf/20mondai_shou_sansuu.pdf#page=19',5,1);
INSERT INTO "question" VALUES (530,2020,NULL,3,4,'さらに，ようたさんたちは，分数のたし算で考えたことをもとに， 
小数のたし算でも同じように考えたことについてふり返っています。
{image1}
はなこさんは， 2.51 ＋ 0.36 について，次のように説明しています。
{image2}
0.75 ＋ 0.9 について，【はなこさんの説明】と同じように，ある数の 
いくつ分かを考え，整数のたし算に表して説明すると，どのようになりま 
すか。言葉と式を使って書きましょう。',3,NULL,'https://www.nier.go.jp/20chousa/pdf/20mondai_shou_sansuu.pdf#page=20',4,1);
INSERT INTO "question" VALUES (531,2020,NULL,4,0,'たくまさんの学級では，夏をすずしく過ごすために，ヘチマを育てて， 
緑のカーテンを作ることにしました。緑のカーテンとは，窓の外に植えた 
ヘチマなどの植物で，日ざしをさえぎるようにしたものです。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (532,2020,NULL,4,1,'たくまさんたちは，種を何個まくかを考えています。
去年は，種を 50 個まきました。そのうちの 40 個から芽が出ました。
まいた種 50 個の斜線部分に対して，芽が出た種 40 個を表している図
はどれですか。下の ア から エ までの中から 1 つ選んで，その記号を 
書きましょう。
また，芽が出た種 40 個は，まいた種 50 個の何％ですか。答えを書き 
ましょう。
{image1}',2,NULL,'https://www.nier.go.jp/20chousa/pdf/20mondai_shou_sansuu.pdf#page=22',5,8);
INSERT INTO "question" VALUES (533,2020,NULL,4,2,'たくまさんたちは，ヘチマの成長の様子について知りたいと思い，次の 
ように，ヘチマのくきの長さをグラフに表し，話し合っています。
{image1}
あやねさんは，上のグラフを見て，まず， 6 月 1 日から 7 月 1 日までに
のびたくきの長さを，下のように求めました。
{image2}
あやねさんは，右のように，1 か月間にのびたくきの長さ
をグラフに表しています。
{image3}
【あやねさんの考え】をもとに， 7 月 1 日から 8 月 1 日までと ， 
8 月 1 日から 9 月 1 日までにのびたくきの長さも求めて，上のグラフを 
完成させると，どのようなグラフになりますか。
下の １ から ３ までの中から 1 つ選んで，その番号を書きましょう。
また，その番号を選んだわけを，言葉や式を使って書きましょう。
{image4}',3,NULL,'https://www.nier.go.jp/20chousa/pdf/20mondai_shou_sansuu.pdf#page=23',3,8);
INSERT INTO "question" VALUES (534,2020,NULL,4,3,'ヘチマが育ち，たくまさんの教室が緑のカーテンにおおわれてから， 
たくまさんは，すずしいと感じるようになりました。
そこで，たくまさんの教室と，緑のカーテンがないとなりの教室につい 
て，同じ日の午前 10 時から午後 4 時までの 2 時間ごとの気温を調べ， 
右のグラフに表しました。
{image1}
{image2}
午前 10 時から午後 4 時までの 2 時間ごとに調べた気温について， 
上のグラフからどのようなことがわかりますか。
下の ア から エ までの中から 1 つ選んで，その記号を書きましょう。',1,NULL,'https://www.nier.go.jp/20chousa/pdf/20mondai_shou_sansuu.pdf#page=25',4,8);
INSERT INTO "question" VALUES (555,2022,NULL,1,0,'カップケーキが，下のように売られています。1箱14個入りで1050円
のＡセットと，1箱21個入りで1470円のＢセットがあります。
{image1}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (556,2022,NULL,1,1,'ゆうとさんは，Ａセットを4箱買うことにしました。
Ａセット4箱分の代金を求める式は，1050×4です。
1050×4を計算しましょう。',2,92.4,'https://www.nier.go.jp/22chousa/pdf/22mondai_shou_sansuu.pdf#page=4',4,1);
INSERT INTO "question" VALUES (557,2022,NULL,1,2,'あいりさんたちは，ＡセットとＢセットのカップケーキを同じ個数にそろ
えたとき，どちらのほうが安くなるのかについて考えています。

まず，あいりさんは，ＡセットとＢセットをそれぞれ何箱か買ったとし
て，考えることにしました。
{image1}
14と21の最小公倍数を書きましょう。',2,72.4,'https://www.nier.go.jp/22chousa/pdf/22mondai_shou_sansuu.pdf#page=5',5,1);
INSERT INTO "question" VALUES (558,2022,NULL,1,3,'次に，くるみさんは，カップケーキの個数を7個にそろえて考えること
にしました。
{image1}
ゆうとさんは，Ａセットのカップケーキ7個分の値段を，【くるみさん
の考え】の中の「1050÷2」で求めることができるわけについて，下の
ように説明しました。
{image2}
Ｂセットのカップケーキ7個分の値段を，【くるみさんの考え】の中の
「1470÷3」で求めることができるわけについて考えます。そのわけを
【ゆうとさんの説明】と同じように，言葉と数を使って書きましょう。
{image3}',3,76.1,'https://www.nier.go.jp/22chousa/pdf/22mondai_shou_sansuu.pdf#page=6',4,1);
INSERT INTO "question" VALUES (559,2022,NULL,1,4,'カップケーキが1個入り85円でも売られています。
くるみさんは，1個入り85円のカップケーキ21個分の値段と，Ｂセット
1箱分の値段である1470円を比べることにしました。
{image1}
1個入り85円のカップケーキ21個分の値段は，85×21で求めること
ができます。
{image2}
85×21の答えが，1470より必ず大きくなることがわかるためには，
「85」と「21」をどのようにがい数にして計算するとよいですか。
下の ア から エ までの中から1つ選んで，その記号を書きましょう。',1,34.9,'https://www.nier.go.jp/22chousa/pdf/22mondai_shou_sansuu.pdf#page=8',4,1);
INSERT INTO "question" VALUES (560,2022,NULL,2,0,'果汁入りの飲み物について考えます。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (561,2022,NULL,2,1,'オレンジの果汁が25％ふくまれている飲み物があります。
{image1}
飲み物の量をもとにしたときの，果汁の量の割合を分数で
表しましょう。
{image2}',2,71.3,'https://www.nier.go.jp/22chousa/pdf/22mondai_shou_sansuu.pdf#page=10',5,6);
INSERT INTO "question" VALUES (562,2022,NULL,2,2,'オレンジの果汁が40％ふくまれている飲み物があります。
{image1}
この飲み物1000mL には，果汁が何 mL 入っていますか。
答えを書きましょう。
{image2}',2,64.8,'https://www.nier.go.jp/22chousa/pdf/22mondai_shou_sansuu.pdf#page=10',5,6);
INSERT INTO "question" VALUES (563,2022,NULL,2,3,'りんごの果汁が20％ふくまれている飲み物が500mL あります。
この飲み物を2人で等しく分けると，1人分は250mL になります。
{image1}
250mL の飲み物にふくまれている果汁の割合について，次のようにまと
めます。
{image2}
上の㋐にあてはまる文を，下の １ から ３ までの中から1つ選んで，
その番号を書きましょう。',1,21.6,'https://www.nier.go.jp/22chousa/pdf/22mondai_shou_sansuu.pdf#page=11',5,6);
INSERT INTO "question" VALUES (564,2022,NULL,2,4,'かいとさんたちは，果汁の割合と果汁の量がわかっているとき，飲み物の
量を求めることができるかどうかを考えています。そこで，りんごの果汁
の割合が30％で，果汁の量が180mL のときの飲み物の量を求めることに
しました。
{image1}
上の表を見て，かいとさんは，次のことに気づきました。
{image2}
ゆうかさんは，かいとさんが気づいたことをもとに，次のように考えま
した。
{image3}
果汁の量が180mL のときの飲み物の量は，何 mL になりますか。
180mL が30mL の何倍かをどのように求めたのかがわかるようにし
て，飲み物の量の求め方を式や言葉を使って書きましょう。また，答えも
書きましょう。',3,48.3,'https://www.nier.go.jp/22chousa/pdf/22mondai_shou_sansuu.pdf#page=12',5,6);
INSERT INTO "question" VALUES (565,2022,NULL,3,0,'6年生のまなみさんの学級では，みんながもっと仲良くなるために，お楽
しみ会をすることにしました。',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (566,2022,NULL,3,1,'まなみさんたちは学級で話し合い，お楽しみ会の遊びを，次の4つの中
から2つ決めることにしました。
{image1}
そこで，24人の学級全員にアンケート調査をし，希望する遊びを1人に
2つずつ選んでもらい，その結果を下の表にまとめています。
{image2}
表の中の ア に入る数を求めます。
表の中の数を使って，求める式を書きましょう。また，答えも書きま
しょう。',2,75.5,'https://www.nier.go.jp/22chousa/pdf/22mondai_shou_sansuu.pdf#page=15',4,1);
INSERT INTO "question" VALUES (567,2022,NULL,3,2,'お楽しみ会のアンケート調査の結果から，2つの遊びを決めます。
{image1}
今回のアンケート調査の結果では，24人全員の希望が1つは通るよう
に，2つの遊びを決めることができます。
その2つの遊びは，どれとどれですか。下の一人一人が選んだ遊びを見
て，下の １ から ４ までの中から２つ選んで，その番号を書きましょう。
{image2}',1,64.1,'https://www.nier.go.jp/22chousa/pdf/22mondai_shou_sansuu.pdf#page=16',3,7);
INSERT INTO "question" VALUES (568,2022,NULL,3,3,'お楽しみ会が終わり，今度は，1年生と交流会をすることにしました。
まなみさんたちは，交流会の遊びを1つ決めるために話し合っています。
{image1}
まなみさんたちは，まず，1年生といっしょにできる5つの遊びを考え
ました。次に，1年生と6年生にアンケート調査を行い，5つの遊びの中
から希望する遊びを，1人に1つずつ選んでもらいました。
アンケート調査の結果は，下のようなグラフになりました。
{image2}
まなみさんは，交流会の遊びを次のように決めようと考えました。
{image3}
まなみさんの考え】をもとにすると，どのグラフを見ればよいですか。
また，どの遊びに決まりますか。
グラフを上の ア から ウ までの中から1つ選んで，その記号を書きま
しょう。また，遊びを下の5つの中から1つ選んで，書きましょう。
{image4}',1,66.9,'https://www.nier.go.jp/22chousa/pdf/22mondai_shou_sansuu.pdf#page=18',5,7);
INSERT INTO "question" VALUES (569,2022,NULL,3,4,'交流会の遊びの決め方として，別の意見が出ました。
{image1}
あかりさんたちは，1年生の希望を1人につき10ポイント，6年生の
希望を1人につき5ポイントとして計算し，1年生と6年生のポイント数
の合計で遊びを決めることにしました。そこで，下の表を見直しました。
{image2}
あかりさんは，輪投げのポイント数を次のように求めました。
{image3}
【あかりさんの求め方】をもとにして，かくれんぼのポイント数を求め
ると，何ポイントになりますか。
1年生と6年生のそれぞれのポイント数の求め方がわかるようにして，
かくれんぼのポイント数の求め方を式や言葉を使って書きましょう。また，
答えも書きましょう。',3,67.9,'https://www.nier.go.jp/22chousa/pdf/22mondai_shou_sansuu.pdf#page=20',4,1);
INSERT INTO "question" VALUES (570,2022,NULL,4,0,'コンピュータは，いろいろな命令を順序よく組み合わせて動かすことがで
きます。この命令の組み合わせを「プログラム」といいます。
{image1}
はなこさんたちは，プログラムをつくり，いろいろな図形を
かこうとしています。
{image2}
1辺が5cm の正方形をかくために，正方形のプログラムをつくりました。
このプログラムを実行すると，右のように，スタート位置（・）から命令
ごとに，{image3}が{image4}の方向に進みながら直線を引いたり，矢印( {image5} )の向き
に回転したりして，正方形をかくことができます。
{image6}
{image7}',4,NULL,NULL,NULL,NULL);
INSERT INTO "question" VALUES (571,2022,NULL,4,1,'はなこさんたちは，1辺が5cm の正三角形をかこうとしています。
{image1}
はなこさんは，正方形のプログラムをもとにして，正三角形をかくため
のプログラムをつくり，実行しました。
{image2}
はなこさんは，下のかこうとした正三角形をかくことができませんでした。
{image3}
そこで，つくったプログラムを見直すことにしました。
{image4}
かこうとした正三角形をかくには，どちらの命令を直すとよいですか。
下の ア と イ から選んで，その記号を書きましょう。また，その選ん
だ命令を，言葉と数を使って，正しい命令に書き直しましょう。',3,49.1,'https://www.nier.go.jp/22chousa/pdf/22mondai_shou_sansuu.pdf#page=24',4,2);
INSERT INTO "question" VALUES (572,2022,NULL,4,2,'次に，ひろとさんは，正方形のプログラムの一部を変えて，縦3cm，
横5cm の長方形をかくために，下のプログラムをつくりました。
{image1}
長方形のプログラムを実行すると，次のように長方形をかくことができ
ました。
{image2}
左の長方形のプログラムの㋐，㋑に入る数を書きましょう。',2,83.3,'https://www.nier.go.jp/22chousa/pdf/22mondai_shou_sansuu.pdf#page=26',2,2);
INSERT INTO "question" VALUES (573,2022,NULL,4,3,'次に，はなこさんは，正方形のプログラムの一部を変えて，下のような
ひし形をかくためのプログラムをつくりました。
{image1}
プログラムを実行すると，次のようにひし形をかくことができました。
{image2}
ひし形をかくことができるプログラムはどれですか。
下の ア から エ までの中から1つ選んで，その記号を書きましょう。
{image3}',1,66.7,'https://www.nier.go.jp/22chousa/pdf/22mondai_shou_sansuu.pdf#page=28',4,2);
INSERT INTO "question" VALUES (574,2022,NULL,4,4,'次に，ひろとさんは，下のプログラムをつくりました。
{image1}
【ひろとさんがつくったプログラム】を実行すると，どのような図形を
かくことができますか。
下の １ から ５ までの中から1つ選んで，その番号を書きましょう。',1,57.7,'https://www.nier.go.jp/22chousa/pdf/22mondai_shou_sansuu.pdf#page=30',4,2);
COMMIT;
