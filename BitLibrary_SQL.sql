--------------------------------------------------------
--  파일이 생성됨 - 목요일-5월-06-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOOK
--------------------------------------------------------

  CREATE TABLE "BLIBRARY"."BOOK" 
   (	"SERIALNUMBER" NUMBER(38,0), 
	"CALLNUMBER" VARCHAR2(30 BYTE), 
	"LOCATION" VARCHAR2(100 BYTE), 
	"BOOKNAME" VARCHAR2(200 BYTE), 
	"AUTHOR" VARCHAR2(200 BYTE), 
	"PUBLISHER" VARCHAR2(30 BYTE), 
	"YEAR" NUMBER(5,0), 
	"RATING" NUMBER(2,1), 
	"CHECKCOUNT" NUMBER(3,0), 
	"STOCK" NUMBER(1,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "BLIBRARY"."BOOK"."SERIALNUMBER" IS '연번';
   COMMENT ON COLUMN "BLIBRARY"."BOOK"."CALLNUMBER" IS '청구기호';
   COMMENT ON COLUMN "BLIBRARY"."BOOK"."LOCATION" IS '자료실위치';
   COMMENT ON COLUMN "BLIBRARY"."BOOK"."BOOKNAME" IS '서명';
   COMMENT ON COLUMN "BLIBRARY"."BOOK"."AUTHOR" IS '저자명';
   COMMENT ON COLUMN "BLIBRARY"."BOOK"."PUBLISHER" IS '출판사';
   COMMENT ON COLUMN "BLIBRARY"."BOOK"."YEAR" IS '발행연';
   COMMENT ON COLUMN "BLIBRARY"."BOOK"."RATING" IS '평점';
   COMMENT ON COLUMN "BLIBRARY"."BOOK"."CHECKCOUNT" IS '대출횟수';
   COMMENT ON COLUMN "BLIBRARY"."BOOK"."STOCK" IS '재고';
--------------------------------------------------------
--  DDL for Table BOOKED_BOOK
--------------------------------------------------------

  CREATE TABLE "BLIBRARY"."BOOKED_BOOK" 
   (	"ID" VARCHAR2(20 BYTE), 
	"SERIALNUMBER" NUMBER(3,0), 
	"BOOKNAME" VARCHAR2(200 BYTE), 
	"REGDATE" DATE DEFAULT SYSDATE, 
	"EXPIREDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "BLIBRARY"."BOOKED_BOOK"."ID" IS '아이디';
   COMMENT ON COLUMN "BLIBRARY"."BOOKED_BOOK"."SERIALNUMBER" IS '시리얼넘버';
   COMMENT ON COLUMN "BLIBRARY"."BOOKED_BOOK"."BOOKNAME" IS '책이름';
   COMMENT ON COLUMN "BLIBRARY"."BOOKED_BOOK"."REGDATE" IS '대출일';
   COMMENT ON COLUMN "BLIBRARY"."BOOKED_BOOK"."EXPIREDATE" IS '반납일';
--------------------------------------------------------
--  DDL for Table MANAGERINFO
--------------------------------------------------------

  CREATE TABLE "BLIBRARY"."MANAGERINFO" 
   (	"MANAGERID" VARCHAR2(20 BYTE), 
	"MANAGERPW" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "BLIBRARY"."MEMBER" 
   (	"ID" VARCHAR2(20 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"ADDRESS" VARCHAR2(20 BYTE), 
	"PHONE" VARCHAR2(20 BYTE), 
	"HINT" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "BLIBRARY"."MEMBER"."HINT" IS '찾기힌트';
--------------------------------------------------------
--  DDL for Table ROOMS
--------------------------------------------------------

  CREATE TABLE "BLIBRARY"."ROOMS" 
   (	"ROOMID" NUMBER, 
	"ROOMNAME" VARCHAR2(30 BYTE), 
	"ROWCOUNT" NUMBER(3,0), 
	"COLCOUNT" NUMBER(3,0), 
	"SEATCOUNT" NUMBER(6,0), 
	"USETIME" NUMBER(2,0) DEFAULT 3
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "BLIBRARY"."ROOMS"."ROOMID" IS '열람실번호';
   COMMENT ON COLUMN "BLIBRARY"."ROOMS"."ROOMNAME" IS '열람실이름';
   COMMENT ON COLUMN "BLIBRARY"."ROOMS"."ROWCOUNT" IS '열 수';
   COMMENT ON COLUMN "BLIBRARY"."ROOMS"."COLCOUNT" IS '행 수';
   COMMENT ON COLUMN "BLIBRARY"."ROOMS"."SEATCOUNT" IS '좌석 개수';
   COMMENT ON COLUMN "BLIBRARY"."ROOMS"."USETIME" IS '이용시간';
--------------------------------------------------------
--  DDL for Table SEATS
--------------------------------------------------------

  CREATE TABLE "BLIBRARY"."SEATS" 
   (	"ROOMID" NUMBER, 
	"SEATCODE" VARCHAR2(20 BYTE), 
	"RV_OR_NOT" VARCHAR2(10 BYTE) DEFAULT 0, 
	"USETIME" NUMBER(1,0), 
	"SEATID" VARCHAR2(20 BYTE), 
	"USERID" VARCHAR2(20 BYTE), 
	"EXPTIME" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "BLIBRARY"."SEATS"."ROOMID" IS '열람실번호';
--------------------------------------------------------
--  DDL for View VW_BOOK
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLIBRARY"."VW_BOOK" ("CHECKCOUNT", "REGDATE", "BOOKNAME", "SERIALNUMBER") AS 
  SELECT B.CHECKCOUNT, BB.REGDATE, B.BOOKNAME, B.SERIALNUMBER
FROM BOOK B, BOOKED_BOOK BB
WHERE B.SERIALNUMBER = BB.SERIALNUMBER
;
REM INSERTING into BLIBRARY.BOOK
SET DEFINE OFF;
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (31,'747.5-ㅂ574ㅇ','본관_종합자료실(3층 신간도서 코너)','엄마표 세마디 생활영어 : 그림과 챈트로 영어 말문트기','박현영 지음','길벗스쿨',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (32,'744-ㄹ764ㅈ','본관_종합자료실(3층 신간도서 코너)','지적 리딩을 위한 워드 파워 30일 : 30일 만에 완성하는 워드 파워 메이드 이지','노먼 루이스, 윌프레드 펑크 [공] 지음 ; 강주헌 옮김','월북',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (33,'813.6-ㄱ251ㅊ','본관_종합자료실(3층 신간도서 코너)','1932 상하이 : 강신덕 김성숙 장편소설','강신덕, 김성숙 [공] 지음','신북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (34,'813.6-ㅂ586ㅇ','본관_종합자료실(3층 신간도서 코너)','5월 18일, 잠수함 토끼 드림 : 5·18 40주년 기념 소설집','박효명...[등]지음','우리학교',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (35,'873-ㅅ384ㄱ=2','본관_종합자료실(3층 신간도서 코너)','갈매기에게 나는 법을 가르쳐준 고양이 : 8세부터 88세까지 읽는 동화','루이스 세뿔베다 지음 ; 이억배 그림 ; 유왕무 옮김','바다',2015,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (36,'873-ㅅ384ㄱ=3','본관_종합자료실(3층 신간도서 코너)','갈매기에게 나는 법을 가르쳐준 고양이 : 8세부터 88세까지 읽는 동화','루이스 세뿔베다 지음 ; 이억배 그림 ; 유왕무 옮김','바다',2015,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (37,'844-ㅇ554ㄱ','본관_종합자료실(3층 신간도서 코너)','거의 떠나온 상태에서 떠나오기','데이비드 포스터 월리스 지음 ; 이다희 옮김','바다',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (38,'688.04-ㄱ271ㅂ','본관_종합자료실(3층 신간도서 코너)','(거의없다의)방구석 영화관 : 영화를, 고상함 따위 1도 없이 세상을, 적당히 삐딱하게 바라보는','거의없다 지음','왼쪽주머니',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (39,'340-ㅇ759ㄷ','본관_종합자료실(3층 신간도서 코너)','단단한 개인 : 누구의 편도 아닌 자리에서','이선옥 지음','필로소픽',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (40,'802.5-ㅂ518ㄷ','본관_종합자료실(3층 신간도서 코너)','(긴장해서 횡설수설하는)당신의 말투를 정리해드립니다','박지훈 지음','이너북',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (41,'337.1-ㅈ428ㄷ','본관_종합자료실(3층 신간도서 코너)','당신이 집에서 논다는 거짓말 : 남성들의 언어 속에 감춰진 가사 노동의 사회 역사 경제적 비밀을 파헤치다','정아은 지음','천년의상상',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (42,'029.4-ㅂ224ㄷ','본관_종합자료실(3층 신간도서 코너)','대치동 독서법 : 초중고로 이어지는 입시독서의 모든 것','박노성, 여성오 [공] 지음','일상과이상',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (43,'331.18-ㅋ128ㄷ','본관_종합자료실(3층 신간도서 코너)','데일 카네기 인간관계론 : 공감을 이끄는 성공학 바이블, 책 읽어드립니다','데일 카네기 지음 ; 강윤철 옮','스타북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (44,'325.1-ㅈ532ㄷ','본관_종합자료실(3층 신간도서 코너)','돈 없고 평범한 당신을 위한 창업전략서 : 가볍게 시작하는 창업이 성공한다','정효평 지음','휴앤스토리',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (45,'802.56-ㄱ934ㅂ','본관_종합자료실(3층 신간도서 코너)','(돈과 사람을 끌어당기는)부자의 말센스 : 한 달 만에 매출 30배 올린 주하효과의 비밀!','김주하 지음','위즈덤하우스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (46,'327.2-ㅇ975돈','본관_종합자료실(3층 신간도서 코너)','돈의 철학 : 진정한 경제적 자유를 위한 궁극의 물음','임석민 지음','다산북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (47,'325.1-ㅇ175ㄷ=2','본관_종합자료실(3층 신간도서 코너)','디즈니만이 하는 것, CEO 밥 아이거가 직접 쓴 디즈니 제국의 비밀','로버트 아이거 지음 ; 안진환 옮김','쌤앤파커스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (48,'325.04-ㅇ489ㄷ','본관_종합자료실(3층 신간도서 코너)','(작지만 강력한)디테일의 힘 = Power of detail','왕중추 지음 ; 허유영 옮김','올림',2013,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (49,'342.3-ㅈ568ㄷ','본관_종합자료실(3층 신간도서 코너)','딸에게 들려주는 인종차별 이야기 : 혐오와 차별을 밀어내는 가장 따뜻한 대화','타하르 벤 젤룬, 오찬호 해제 ; 홍세화 옮김','롤러코스터',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (50,'325.3-ㄱ925ㅁ','본관_종합자료실(3층 신간도서 코너)','마스터코치의 코칭 레시피','김종명, 최선영 [공] 지음','에디터',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (51,'325.04-ㅂ216ㅁ','본관_종합자료실(3층 신간도서 코너)','마흔 이후는, 사람공부 돈 공부 : 주변과 소통하며 세상과 친해지는 연습','박길상 지음','리텍콘텐츠',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (52,'199.1-ㄱ738ㅁ','본관_종합자료실(3층 신간도서 코너)','말투의 편집','김범준 지음','홍익출판사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (53,'300-ㅎ199ㅁ','본관_종합자료실(3층 신간도서 코너)','무례한 시대를 품위 있게 건너는 법 : 차별과 배제, 혐오의 시대를 살아내기 위하여','악셀 하케 지음 ; 장윤경 옮김','쌤앤파커스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (54,'338.181-ㅋ218ㅁ','본관_종합자료실(3층 신간도서 코너)','무조건 기본소득 : 모두의 자유를 위한 공동의 재산','다비드 카사사스 지음 ; 구유 옮김','리얼부커스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (55,'325.04-ㅎ191ㅁ','본관_종합자료실(3층 신간도서 코너)','미라클 액션 : 기회를 성공으로 이끄는 행동력 훈련 37 = Miracle action','하재준 지음','라온북',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (56,'321.97-ㄱ664ㅁ','본관_종합자료실(3층 신간도서 코너)','미래 시나리오 2021 : IMF, OECD, 세계은행, UN 등 세계 국제기구가 예측한 한국 대전망','김광석, 김상윤, 박정호, 이재호 [공] 지음','더퀘스트',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (57,'378.9-ㅇ989ㅂ','본관_종합자료실(3층 신간도서 코너)','부모라면 놓쳐서는 안 될 유대인 교육법','임지은 지음','미디어숲',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (58,'982.02-ㅈ414ㄱ','본관_종합자료실(3층 신간도서 코너)','건축가의 여행의 기억 : 런던 엄마, 파리 딸, 베네치아 아빠','정성우 지음','앨리스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (59,'591.8-ㅇ344ㄱ','본관_종합자료실(3층 신간도서 코너)','결혼 뒤에 오는 것들 : 행복한 결혼을 위한 지극히 현실적인 조언들','영주 지음','푸른숲',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (60,'811.6-ㅊ412ㄱ','본관_종합자료실(3층 신간도서 코너)','고백 : 최명숙 시집','최명숙 시·그림','지식과감성',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (61,'853-ㅍ82ㄱ','본관_종합자료실(3층 신간도서 코너)','고양이라서 행복해 : 내가 나 자신의 대장이야','미리암 프레슬러 지음 ; 로트라우트 수잔네 베르너 그림 ; 고영아 옮김','책담',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (62,'813.6-ㅂ334ㄱ','본관_종합자료실(3층 신간도서 코너)','고요함 동물 : 박솔뫼 소설','박솔뫼 지음','창비',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (63,'863-ㅂ624ㄱ','본관_종합자료실(3층 신간도서 코너)','곱세크 : 오노레 드 발자크 소설','오노레 드 발자크 지음 ; 김인경 옮김','꿈꾼문고',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (64,'859.31-ㄷ52ㄱ','본관_종합자료실(3층 신간도서 코너)','공화국','요스트 더프리스 지음 ; 금경숙 옮김','현대문학',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (65,'813.6-ㅈ494ㄱ-1','본관_종합자료실(3층 신간도서 코너)','광주 아리랑. 1 : 정찬주 장편소설','정찬주 지음','다연',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (74,'810.9-ㅈ628ㄱ','본관_종합자료실(3층 신간도서 코너)','(우리가 사랑했던)그리운 그 작가','조성일 지음','지식여행',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (75,'863-ㅂ774ㄱ-1','본관_종합자료실(3층 신간도서 코너)','기억. 1 : 베르나르 베르베르 장편소설','베르나르 베르베르 지음 ; 전미연 옮김','열린책들',2020,3.5,1,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (76,'863-ㅂ774ㄱ-2','본관_종합자료실(3층 신간도서 코너)','기억. 2 : 베르나르 베르베르 장편소설','베르나르 베르베르 지음 ; 전미연 옮김','열린책들',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (77,'320.04-ㅇ994ㅂ','본관_종합자료실(3층 신간도서 코너)','부자는 매일 아침 경제기사를 읽는다 : 부자의 언어 ''경제''를 배우는 가장 빠르고 확실한 방법 300','임현우 지음','책들의정원',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (78,'327.87-ㅂ294ㅂ','본관_종합자료실(3층 신간도서 코너)','빅데이터로 부동산 투자했다는 박 대리, 그래서 얼마 벌었대','박상용 지음','잇콘',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (79,'181.4-ㅎ561ㅅ','본관_종합자료실(3층 신간도서 코너)','사람은 어떻게 생각하고 배우고 기억하는가 : 하버드 최고의 뇌과학 강의','제레드 쿠니 호바스 지음 ; 김나연 옮김','토네이도',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (80,'329.4-ㅊ566ㅅ','본관_종합자료실(3층 신간도서 코너)','사장님! 세금신고? 어렵지 않아요 : 프리랜서, 면세사업자의 세금신고와 절세법','최용규 지음','가나북스',2020,0,1,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (81,'325.04-ㄴ21ㅅ','본관_종합자료실(3층 신간도서 코너)','사장을 위한 MBA 필독서 50 : 세계 엘리트들이 읽는 MBA 필독서 50권을 한 권에','나가이 다카히사 지음 ; 김정환 옮김','센시오',2020,3.7,1,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (82,'802.56-ㅎ161ㅅ','본관_종합자료실(3층 신간도서 코너)','상처 주지 않고 할 말 다하는 말솜씨 : 똑같은 말이라도 이렇게 해야 마음이 다치지 않지','허야거 지음 ; 김경숙 옮김','센시오',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (83,'802.56-ㅂ794ㅅ','본관_종합자료실(3층 신간도서 코너)','생산적 의견 대립 : 막말, 독설, 억지에 지친 당신에게 꼭 필요한 대화의 기술','버스터 벤슨 지음 ; 노승영 옮김','학고재',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (84,'199.6-ㄱ985ㅅ','본관_종합자료실(3층 신간도서 코너)','서른 넘어 찾아온 다섯 가지 기회 : 30대를 통과하는 사람들을 위한 지침서','김현중 지음','웨일북',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (85,'199.1-ㄹ428ㅅ','본관_종합자료실(3층 신간도서 코너)','성공하는 리더들의 철학 공부','앨리슨 레이놀즈, 도미닉 훌더, 줄스 고더드, 데이비드 루이스 [공] 지음 ; 김미란 옮김','토네이도',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (86,'331.5-ㅇ882ㅅ','본관_종합자료실(3층 신간도서 코너)','세계문화의 이해 = Understanding of global culture','이종원...[등]저','Seromi',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (87,'340.911-ㄱ263ㅅ','본관_종합자료실(3층 신간도서 코너)','쇼핑은 투표보다 중요하다 : 정치적 소비자 운동을 위하여','강준만 지음','인물과사상사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (88,'325.2-ㄱ774ㅅ','본관_종합자료실(3층 신간도서 코너)','수평 조직의 구조 : 일을 바꾸는 조직 혁신 전략','김성남 지음','스리체어스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (89,'325.1-ㅇ213ㅅ','본관_종합자료실(3층 신간도서 코너)','숨은 혁신 찾기 : 작고 가까운 것에서 큰 변화의 힘을 읽어내는 법 = Fine Hidden Innavation','안병민 지음','토마토출판사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (90,'325.1-ㅊ652ㅅ','본관_종합자료실(3층 신간도서 코너)','스타트업은 어떻게 유니콘이 되는가 : 극사실주의 스타트업 흥망성쇠의 기록','최정우 지음','쌤앤파커스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (91,'326.16-ㅁ392ㅅ','본관_종합자료실(3층 신간도서 코너)','스토리노믹스 : 유튜브 시대, 스토리 마케팅으로 수익을 창출하라','로버트 맥키, 토머스 제라스 [공] 지음 ; 이승민 옮김','민음인',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (92,'199.1-ㅇ891ㅍ','본관_종합자료실(3층 신간도서 코너)','프로 일잘러를 위한 슬기로운 아이패드 생활 : 자기계발부터 목표관리, 취미생활까지 아이패드 100% 활용법','이지은 지음','천그루숲',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (93,'325.1-ㅋ486ㅅ','본관_종합자료실(3층 신간도서 코너)','승려와 수수께끼','랜디 코미사 지음 ; 신철호 옮김','이콘',2013,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (94,'325.04-ㅈ786ㅅ','본관_종합자료실(3층 신간도서 코너)','승리하는 습관 : 승률을 높이는 15가지 도구들','앨런 스테인 주니어, 존 스턴펠드 [공] 지음 ; 엄성수 옮김','갤리온',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (95,'325.04-ㅇ629ㅅ','본관_종합자료실(3층 신간도서 코너)','시간관리 시크릿 : 시간을 관리하는 습관 프로젝트 4단계 = Timekeeping secrets','윤슬 지음','담다',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (96,'843-ㅈ714ㄱ','본관_종합자료실(3층 신간도서 코너)','기차의 꿈 : 데니스 존슨 장편소설','데니스 존슨 지음 ; 김승욱 옮김','문학동네',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (97,'813.6-ㅇ754ㄱ','본관_종합자료실(3층 신간도서 코너)','김의 나라 : 이상훈 장편소설','이상훈 지음','파람북',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (98,'843-ㅇ343ㄱ','본관_종합자료실(3층 신간도서 코너)','깨어난 장미 인형들','수잔 영 지음 ; 이재영 옮김','꿈의지도',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (99,'813.6-ㅈ366ㄱ','본관_종합자료실(3층 신간도서 코너)','꽃잎처럼 : 정도상 장편소설','정도상 지음','다산책방',2020,4,3,0);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (100,'811.6-ㅎ811ㄱ','제2자료실','꽃처럼 너를 사랑한다 : 황태옥 시집','황태옥 지음','꿈공장플러스',2020,4.1,2,2);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (101,'189.1-ㅍ88ㄴ','본관_종합자료실(3층 신간도서 코너)','나는 나 : 내 인생의 셀프 심리학','캐럴 피어슨 지음 ; 류시화 옮김','연금술사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (102,'811.6-ㅊ738ㄴ','본관_종합자료실(3층 신간도서 코너)','나는 나무가 되고 구름 되어 : 최하림 시선집','최하림 지음 ; 장석남...[등]엮음','문학과지성사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (103,'513.8525-ㄱ382ㄴ','본관_종합자료실(3층 신간도서 코너)','나는 내가 왜 살아야 하는지 몰랐습니다','고요 지음','인디고',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (104,'813.6-ㅂ326ㄴ','본관_종합자료실(3층 신간도서 코너)','나는 보헤미안을 사랑한다, 박성일 장편소설','박성일 지음','좋은땅',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (105,'981.59902-ㄱ356ㄴ','본관_종합자료실(3층 신간도서 코너)','나는 스리랑카주의자입니다 : 다른 여행은 시시해져버렸거든요','고선정 지음','김영사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (106,'238.9-ㄱ712ㄴ','본관_종합자료실(3층 신간도서 코너)','나는 신천지에서 20대, 5년을 보냈다','김동규, 박형민 [공] 지음','밥북',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (107,'189-ㅆ998ㄴ','본관_종합자료실(3층 신간도서 코너)','나는 왜 엄마가 힘들까 : 나르시시스트 엄마에게 고통받는 딸을 위한 정서적 독립 프로젝트','썸머 지음','책과이음',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (108,'843-ㅍ53ㄴ','본관_종합자료실(3층 신간도서 코너)','나를 팔로우 하지 마세요','올리버 폼마반 지음 ; 김인경 옮김','뜨인돌',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (109,'818-ㅇ378ㄴ','본관_종합자료실(3층 신간도서 코너)','나에게 시간을 주기로 했다 : 매일 흔들리지만 그래도','오리여인 지음','수오서재',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (110,'811.6-ㄱ495ㄴ','본관_종합자료실(3층 신간도서 코너)','나의 9월은 너의 3월 : 구현우 시집','구현우 지음','문학동네',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (111,'653.11099-ㅂ448ㄴ','본관_종합자료실(3층 신간도서 코너)','내 아버지 박수근','박인숙 지음','삼인',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (112,'843-ㅁ554ㄴ','본관_종합자료실(3층 신간도서 코너)','내 휴식과 이완의 해','오테사 모시페그 지음 ; 민은영 옮김','문학동네',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (113,'811.6-ㄱ883ㄴ','본관_종합자료실(3층 신간도서 코너)','너라는 의미 너라는 위로 : 김인혁 두번째 시집','김인혁 지음','바른북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (114,'843-ㄹ716ㄴ','본관_종합자료실(3층 신간도서 코너)','노멀 피플','샐리 루니 지음 ; 김희용 옮김','아르테',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (115,'327-ㅇ933ㅅ','본관_종합자료실(3층 신간도서 코너)','시장의 기억 : 한국의 자본시장은 어떻게 반복되는가','이태호 지음','어바웃어북',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (116,'331.235-ㅈ688ㅅ','본관_종합자료실(3층 신간도서 코너)','신중년이 온다 : 100만 세대를 위한 인생 2모작 가이드','조창완 지음','창해',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (117,'325.19-ㅅ138ㅇ','본관_종합자료실(3층 신간도서 코너)','아이디어 불패의 법칙 : 구글 최고의 혁신 전문가가 찾아낸 비즈니스 설계와 검증의 방법론','알베르토 사보이아 지음 ; 이지연 옮김','인플루엔셜',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (118,'001.3-ㅊ168-3','본관_종합자료실(3층 신간도서 코너)','아카이브 취향','아를레트 파르주 지음 ; 김정아 옮김','문학과지성사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (119,'327.83-ㅊ588ㅇ','본관_종합자료실(3층 신간도서 코너)','앞으로 3년, 대담한 투자 : 100년의 금융역사가 증명한 불변의 법칙','최윤식 지음','지식노마드',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (120,'325.19-ㅎ599ㅇ','본관_종합자료실(3층 신간도서 코너)','애자일 조직 : 빠르고 복잡하게 변화하는 시대|조직 생존의 비밀','린다 홀비치 지음 ; 구기욱, 박연수 [공] 옮김','쿠퍼북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (121,'336-ㅇ569ㅇ','본관_종합자료실(3층 신간도서 코너)','어느 돌멩이의 외침','유동우 지음','철수와영희',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (122,'189.1-ㄱ786ㅇ','본관_종합자료실(3층 신간도서 코너)','엄마의 오묘한 심리학 : 그 누구에게도 말할 수 없고, 그 누구도 말해주지 않는','김소희 지음','센세이션',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (123,'321.58-ㅎ959ㅇ','본관_종합자료실(3층 신간도서 코너)','여기, 우리, 함께 : 오래도록 싸우고 곁을 지키는 사람들, 그 투쟁과 연대의 기록','희정 지음','갈마바람',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (124,'326.392-ㄱ691ㅇ','본관_종합자료실(3층 신간도서 코너)','여행의 미래 : 밀레니얼의 여행은 어떻게 달라질 것인가?','김다영 지음','미래의창',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (126,'325.04-ㅇ655ㅇ','본관_종합자료실(3층 신간도서 코너)','연봉 4천의 신입사원 되는 법 : 취업 기간 2년은 단축시켜 주는 참고서','이강준 지음','바른북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (127,'321.57-ㅇ828ㅇ','본관_종합자료실(3층 신간도서 코너)','우리가 옳다! : 세상을 뒤흔든 톨게이트 노동자들의 7개월','이용덕 글','숨쉬는책공장',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (128,'325.04-ㅇ483ㅇ','본관_종합자료실(3층 신간도서 코너)','우리는 달에 가기로 했다 : 불가능을 가능하게 한 NASA의 8가지 마인드셋','리처드 와이즈먼 지음 ; 박선령 옮김','리더스북',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (129,'321.542-ㅇ746ㅇ','본관_종합자료실(3층 신간도서 코너)','우리들은 정당하다 : 중국 여성노동자 삶, 노동, 투쟁의 기록','뤼투 지음 ; 고재원, 고윤실 [공] 옮김','나름북스',2010,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (130,'342.1-ㅂ246ㅇ','본관_종합자료실(3층 신간도서 코너)','우리에겐 기억할 것이 있다 : 인권운동가 박래군의 한국현대사 인권기행','박래군 지음','클',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (131,'337.2-ㅇ471ㅇ','본관_종합자료실(3층 신간도서 코너)','원본 없는 판타지 : 페미니스트 시각으로 읽는 한국 현대문화사','오혜진...[등]지음','후마니타스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (132,'802.5-ㅎ487ㅇ','본관_종합자료실(3층 신간도서 코너)','위대한 명연설 : 역사의 순간마다 대중의 마음을 울린 목소리의 향연','에드워드 험프리 지음 ; 홍선영 옮김','베이직북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (133,'327.04-ㄱ919ㅇ','본관_종합자료실(3층 신간도서 코너)','유대인 1퍼센트 부의 지름길 : 가난하더라도 부자의 줄에 서는 유대인의 부자 습관','김정한 지음','레몬북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (134,'813.6-ㅈ488ㄴ','본관_종합자료실(3층 신간도서 코너)','농담을 싫어하는 사람들 : 정지돈 짧은 소설','정지돈 지음 ; 윤예지 그림','마음산책',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (135,'813.6-ㅅ364ㄴ','본관_종합자료실(3층 신간도서 코너)','눈 밖에 난 자들 : 성은영 장편소설','성은영 지음','아마존의나비',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (136,'813.6-ㅁ728ㄴ','본관_종합자료실(3층 신간도서 코너)','눈물은 어떻게 존재하는가 : 문서정 소설집','문서정 지음','강',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (137,'811.6-ㅇ642ㄷ','본관_종합자료실(3층 신간도서 코너)','달달한 시집 : 윤지환 시인의 필사시집','윤지환 [지음]','보민',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (138,'811.6-ㄱ727ㄷ','본관_종합자료실(3층 신간도서 코너)','달의 뒤편 : 근대 여성시인 필사시집','김명순...[등]지음','제우미디어',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (139,'811.6082-ㅁ748ㅁ-538','본관_종합자료실(3층 신간도서 코너)','당신의 아름다움 : 조용미 시집','조용미 지음','문학과지성사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (140,'813.6-ㅇ531ㄷ','본관_종합자료실(3층 신간도서 코너)','당인리 : 대정전 후 두 시간','우석훈 지음','해피북스투유',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (141,'802-ㅇ331ㄷ','본관_종합자료실(3층 신간도서 코너)','대중을 사로잡는 장르별 플롯 : 드라마에서 영화, 소설, 웹툰, 게임까지 스토리텔링의 감각을 키우는 글쓰기 워크북','마루야마 무쿠 지음 ; 송경원 옮김','지금이책',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (142,'332.22-ㅈ372ㄷ','본관_종합자료실(3층 신간도서 코너)','더 사랑하면 결혼하고, 덜 사랑하면 동거하나요? : 기혼도 미혼도 아닌 괄호 바깥의 사랑','정만춘 지음','웨일북',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (143,'843-ㄹ278ㄷ','본관_종합자료실(3층 신간도서 코너)','더 월','존 란체스터 지음 ; 서현정 옮김','서울문화사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (144,'813.6-ㅇ389ㄷ','본관_종합자료실(3층 신간도서 코너)','도서관을 떠나는 책들을 위하여 : 오수완 장편소설','오수완 지음','나무옆의자',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (145,'843-ㄷ99ㄷ','본관_종합자료실(3층 신간도서 코너)','두 도시 이야기','찰스 디킨스 지음 ; 권민정 옮김','시공사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (146,'843-ㅁ384ㄷ','본관_종합자료실(3층 신간도서 코너)','두 사람의 비밀 : 캐런 M. 맥매너스 장편소설','캐런 M. 맥매너스 지음 ; 이영아 옮김','현암사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (147,'843-ㅇ246ㄷ','본관_종합자료실(3층 신간도서 코너)','디미트리오스의 가면 : 애릭 앰블러 장편소설','에릭 앰블러 지음 ; 최용준 옮김','열린책들',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (148,'811.6-ㅈ962ㄷ','본관_종합자료실(3층 신간도서 코너)','디테일의 반전','직장시인 지음','스토어하우스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (149,'813.6082-ㅇ367-17','본관_종합자료실(3층 신간도서 코너)','딸에 대하여 : 김혜진 장편소설','김혜진 지음','민음사',2017,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (150,'818-ㅅ564ㄷ','본관_종합자료실(3층 신간도서 코너)','땀 흘리는 글 : 내일도 일터로 나아갈 당신을 위하여','송승훈, 양수정, 유이분, 하명희 [공] 지음','창비교육',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (151,'813.6-ㄱ799ㄷ','본관_종합자료실(3층 신간도서 코너)','떠도는 땅 : 김숨 장편소설','김숨 지음','은행나무',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (152,'863-ㅍ85ㄹ','본관_종합자료실(3층 신간도서 코너)','라 트라비아타','알렉상드르 뒤마 피스 지음 ; 진형준 옮김','살림',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (153,'326.79-ㅇ793ㅇ','본관_종합자료실(3층 신간도서 코너)','유튜브 지금 시작하시나요? : 시한책방 이시한과 함께하는 유튜브 첫걸음','이시한 지음','미래의창',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (154,'005.1-ㅌ89ㅇ','본관_종합자료실(3층 신간도서 코너)','은밀한 설계자들 : 세상을 변화시키는 새로운 종족','클라이브 톰슨 지음 ; 김의석 옮김','한빛비즈',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (155,'334-ㅍ84ㅇ','본관_종합자료실(3층 신간도서 코너)','이것은 성교육 책이 아니다 : 모든 은밀한 것에 관한 무삭제판 메뉴얼','추시타 패션 피버 글 ; 마리아 일로벳 그림 ; 김부민 옮김','내인생의책',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (156,'331.5412-ㄴ23ㅇ','본관_종합자료실(3층 신간도서 코너)','인공지능의 현재와 미래 : 인공지능의 미래를 이끄는 21가지 혁신 기술','<나는 미래다> 방송제작팀 지음 ; 권용중 옮김','보아스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (157,'325.3-ㄱ433ㅇ','본관_종합자료실(3층 신간도서 코너)','인맥이 그렇게 중요해? : 1을 투자하고 100을 얻는 인(人)테크 전략','공준식 지음','라온아시아',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (158,'802.56-ㅂ334ㅇ','본관_종합자료실(3층 신간도서 코너)','일 잘하는 사람은 단순하게 말합니다','박소연 지음','더퀘스트',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (159,'325.05-ㅍ36ㅇ','본관_종합자료실(3층 신간도서 코너)','일과 사랑의 기술 : 일하는 커플이 성공하는 법','제니퍼 페트리글리에리 지음 ; 곽성혜 옮김','동녘라이프',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (160,'321.5-ㅈ678ㅇ','본관_종합자료실(3층 신간도서 코너)','임계장 이야기 : 63세 임시 계약직 노인장의 노동 일지','조정진 지음','후마니타스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (161,'320.17-ㄱ351ㅇ','본관_종합자료실(3층 신간도서 코너)','임금에 관한 온갖 헛소리','고병권 지음','천년의상상',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (162,'325.24-ㄱ988ㅇ','본관_종합자료실(3층 신간도서 코너)','임원이 된다는 것 : 대기업 임원 500명을 만나면서 얻은 인사이트','김혜영 지음','페이퍼로드',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (163,'326.16-ㅈ298ㅈ','본관_종합자료실(3층 신간도서 코너)','작아도 이기는 마케팅 : 100개의 성공 사례보다 나만의 스위치 1개를 찾아라!','전원태 지음','베가북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (164,'325.2-ㅍ32ㅈ','본관_종합자료실(3층 신간도서 코너)','장사의 신을 넘어 비즈니스의 신으로 : 그는 어떻게 슈퍼리치가 되었을까','틸만 페르티타 지음 ; 엄성수 옮김','북로그컴퍼니',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (165,'884-ㅈ598ㅈ','본관_종합자료실(3층 신간도서 코너)','전염의 시대를 생각한다','파올로 조르다노 지음 ; 김희정 옮김','은행나무',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (166,'363-ㅈ334ㅈ','본관_종합자료실(3층 신간도서 코너)','(전효진 변호사의)재미있는 사례로 쉽게 정복하는 행정법','전효진 지음 ; 유성연 그림','연승',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (167,'326.78-ㄹ326ㅈ','본관_종합자료실(3층 신간도서 코너)','절대 성공하지 못할 거야 : 공동 창업자 마크 랜돌프가 최초 공개하는 넷플릭스 창업 이야기','마크 랜돌프 지음 ; 이선주 옮김','덴스토리',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (168,'349-ㅊ776ㅈ','본관_종합자료실(3층 신간도서 코너)','정치적 부족주의 : 집단 본능은 어떻게 국가의 운명을 좌우하는가','에이미 추아 지음 ; 김승진 옮김','부키',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (169,'001.3-ㅊ168-2','본관_종합자료실(3층 신간도서 코너)','정크스페이스|미래 도시','렘 콜하스, 프레드릭 제임슨 지음 ; 임경규 옮김','문학과지성사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (170,'325.2-ㅊ684ㅈ','본관_종합자료실(3층 신간도서 코너)','조직문화 재구성 : 개인주의 공동체를 꿈꾸다','최지훈 지음','플랜비디자인',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (171,'340.4-ㅎ899ㅈ','본관_종합자료실(3층 신간도서 코너)','존중받지 못하는 자들을 위한 정치학, 존엄에 대한 요구와 분노의 정치에 대하여','프랜시스 후쿠야마 지음 ; 이수경 옮김','한국경제신문',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (172,'843-ㅁ414ㄹ','본관_종합자료실(3층 신간도서 코너)','런어웨이','앨리스 먼로 지음 ; 황금진 옮김','웅진지식하우스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (173,'843-ㅂ774ㄹ','본관_종합자료실(3층 신간도서 코너)','레이첼의 죽음으로부터','플린 베리 지음 ; 황금진 옮김','작가정신',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (174,'813.6-ㅎ345ㄹ','본관_종합자료실(3층 신간도서 코너)','로드바이크 : 자전거 도둑','한유지 지음','베스트하우스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (175,'813.6-ㅇ959ㄹ-1','본관_종합자료실(3층 신간도서 코너)','로봇 교사. 1 : 이희준 장편소설','이희준 지음','별숲',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (176,'813.6-ㅇ959ㄹ-2','본관_종합자료실(3층 신간도서 코너)','로봇 교사. 2 : 이희준 장편소설','이희준 지음','별숲',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (177,'820.81-ㄹ754ㄹ','본관_종합자료실(3층 신간도서 코너)','루쉰 독본 : 〈아Q정전〉부터 〈희망〉까지, 루쉰 소설·산문집','루쉰 지음 ; 이욱연 옮김','휴머니스트',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (178,'843-ㅍ33ㄹ','본관_종합자료실(3층 신간도서 코너)','리스크 : 사라진 소녀들','플러 페리스 지음 ; 김지선 옮김','블랙홀',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (179,'892.83-ㅇ476ㄹ','본관_종합자료실(3층 신간도서 코너)','리옴빠 : 유리 올레샤 단편집','유리 올레샤 지음 ; 김성일 옮김','미행',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (180,'813.6-ㄱ857ㄹ','본관_종합자료실(3층 신간도서 코너)','릴리 그녀의 집은 어디인가 : 김우남 장편소설','김우남 지음','문예',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (181,'813.6-ㅌ72ㅁ','본관_종합자료실(3층 신간도서 코너)','마녀 카페 : 오늘의 차를 마시면 고통이 사라진다','토미 지음','클북',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (182,'853-ㅋ796ㅁ','본관_종합자료실(3층 신간도서 코너)','망자들','크리스티안 크라흐트 지음 ; 김태환 옮김','을유문화사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (183,'843-ㄴ65ㅁ','본관_종합자료실(3층 신간도서 코너)','맥티그','프랭크 노리스 지음 ; 김욱동, 홍정아 [공] 옮김','을유문화사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (184,'808-ㅅ374-366','본관_종합자료실(3층 신간도서 코너)','맨스필드 파크','제인 오스틴 지음 ; 김영희 옮김','민음사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (185,'853-ㅎ589ㅁ','본관_종합자료실(3층 신간도서 코너)','모래 사나이','E. T. A. 호프만 지음 ; 권혁준 옮김','문학과지성사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (186,'843-ㅌ82ㅁ=2','본관_종합자료실(3층 신간도서 코너)','모스크바의 신사 : 에이모 토울스 장편소설','에이모 토울스 지음 ; 서창렬 옮김','현대문학',2018,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (187,'853-ㅂ774ㅁ','본관_종합자료실(3층 신간도서 코너)','모자','토마스 베른하르트 지음 ; 김현성 옮김','문학과지성사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (188,'863-ㄱ412ㅁ','본관_종합자료실(3층 신간도서 코너)','모팽 양','테오필 고티에 지음 ; 권유현 옮김','열림원',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (1,'325.1-ㅁ164ㄱ','본관_종합자료실(3층 신간도서 코너)','경영 전략의 역사, 손자병법부터 AI전략까지 전략의 핵심을 한 권에!','고토사카 마사히로 지음 ; 김정환 옮김','센시오',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (2,'593.2-ㅈ788ㄱ','본관_종합자료실(3층 신간도서 코너)','고잉 그레이 : 나는 흰머리 염색을 하지 않기로 했다','주부의 벗 지음 ; 박햇님 옮김','블루무스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (3,'325.1-ㅎ951ㄱ','본관_종합자료실(3층 신간도서 코너)','골리앗의 복수 : 디지털 파괴자들로부터 시장을 탈환하는 6가지 전략','토드 휴린, 스콧 스나이더 [공] 지음 ; 박슬라 옮김','인플루엔셜',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (4,'370.4-ㅇ963ㄱ','본관_종합자료실(3층 신간도서 코너)','공부는 정의로 나아가는 문이다 : 코로나 시대, 새로운 교육을 위하여','인디고 서원 엮음','궁리',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (5,'370.4-ㅈ498ㄱ','본관_종합자료실(3층 신간도서 코너)','교사의 독서 : 바쁨과 순응 사이, 길을 찾는 교사들에게','정철희 지음','휴머니스트',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (6,'373-ㅋ276ㄱ','본관_종합자료실(3층 신간도서 코너)','교실이 없는 시대가 온다 : 디지털 시대, 어떻게 가르치고 배워야 하는가','존 카우치, 제이슨 타운 [공] 지음 ; 김영선 옮김','어크로스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (7,'325.36-ㅇ737ㄱ','본관_종합자료실(3층 신간도서 코너)','균형 일터 : 노사협력보다 ''각자균형''이 먼저다!','이병민 지음','플랜비디자인',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (8,'802.56-ㅂ266ㄱ','본관_종합자료실(3층 신간도서 코너)','그때 그렇게 말해서 미안해 : 말하고 돌아서서 후회하는 사람들을 위한 대화법','박민영 지음','책들의정원',2020,0,1,0);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (9,'325.04-ㅇ785ㄱ','본관_종합자료실(3층 신간도서 코너)','기록의 쓸모, 마케터의 영감노트','이승희 지음','북스톤',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (10,'331.63-ㅇ332ㄱ','본관_종합자료실(3층 신간도서 코너)','기죽지 않고 흥분하지 않고 끝까지 할 말 다 하는 법','제니퍼 엘리슨 지음 ; 윤동준 옮김','다른상상',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (11,'370.4-ㅅ582ㄴ','본관_종합자료실(3층 신간도서 코너)','나는 87년생 초등교사입니다 : 열정과 타협 사이에서 흔들리는 밀레니얼 교사들의 이야기','송은주 지음','김영사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (12,'325.1-ㄱ736ㄴ','본관_종합자료실(3층 신간도서 코너)','나는 디지털노마드맘으로 살기로 했다 : 돈.여행.육아 세 마리 토끼를 잡는 엄마가 디지털노마드로사는 진짜 노하우','김민선 지음','파이프라인',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (13,'340.912-ㅇ555ㄴ','본관_종합자료실(3층 신간도서 코너)','나는 좁은 길이 아니다 : 홍콩 민주화 운동과 나의 18세','조슈아 웡 지음 ; 함성준 옮김','프시케의숲',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (14,'325.1-ㅊ346ㅇ','본관_종합자료실(3층 신간도서 코너)','(나는 투자금없이)아이디어만으로 돈을 번다 : 이젠 아이디어 셀러 시대!','최규철 지음','비전코리아',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (15,'334-ㄱ939ㄴ','본관_종합자료실(3층 신간도서 코너)','내 권리는 희생당하고 싶지 않습니다 : 절대 외면할 수 없는 권리를 찾기 위한 안내서','김지윤 지음','알에이치케이코리아',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (16,'325.9-ㅇ582ㄴ','본관_종합자료실(3층 신간도서 코너)','내 생애 첫 회계 공부 : 기초부터 실무까지 회계지식 씹어먹기','유양훈 지음','원앤원북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (17,'191.5-ㅁ388ㄴ','본관_종합자료실(3층 신간도서 코너)','냉정한 이타주의자 : 세상을 바꾸는 건 열정이 아닌 냉정이다','윌리엄 맥어스킬 지음 ; 전미영 옮김','부키',2017,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (18,'374.3215-ㅇ285ㄴ','본관_종합자료실(3층 신간도서 코너)','노동인권수업을 시작합니다 : 전태일 50주기 공동 출판 프로젝트','양설...[등]지음','다른',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (19,'189-ㄱ556ㄴ','본관_종합자료실(3층 신간도서 코너)','눈을 맞추자 인생이 달라졌다 : 일, 관계, 삶을 바꾸는 간단하지만 놀라운 소통의 기술','브라이언 그레이저 지음 ; 박선령 옮김','토네이도',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (20,'668-ㅈ532ㅍ','본관_종합자료실(3층 신간도서 코너)','포스트모던 이후의 사진풍경','정훈 지음','눈빛',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (21,'652.52-ㅇ586ㅍ','본관_종합자료실(3층 신간도서 코너)','(식물이 있는)풍경 수채화 수업','호시노 유우 지음 ; 이유민 옮김','EJONG',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (22,'609.11-ㅎ599ㅎ','본관_종합자료실(3층 신간도서 코너)','한국 미술 : 19세기부터 현재까지','샬롯 홀릭 지음 ; 이연식 옮김','재승출판',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (23,'685.103-ㅊ184ㅎ','본관_종합자료실(3층 신간도서 코너)','한국무용사전 = Korean dance dictionary','[책에반하다 편집부] 편저','책에반하다',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (24,'737.5-ㄱ993ㅇ','본관_종합자료실(3층 신간도서 코너)','(13일 완성)입문 일본어 회화','김화영, 김종완 [공] 지음','어문학사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (25,'792.8-ㄱ821ㄱ','본관_종합자료실(3층 신간도서 코너)','GO! 독학 러시아어 첫걸음 : 러시아어 왕초보를 위한 말하기 중심의 체계적인 학습 커리큘럼!','김애리 지음','시원스쿨닷컴',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (26,'747.2-ㅅ194ㄴ','본관_종합자료실(3층 신간도서 코너)','나도 이제 영어로 읽는다 : 어린왕자','앙투안 마리 로제 드 생텍쥐페리 지음 ; 스티브 오 영어번역','동행',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (27,'731.44-ㅎ743ㄴ','본관_종합자료실(3층 신간도서 코너)','나혼자 끝내는 일본어 기초한자','황미진 지음','넥서스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (28,'737-ㄱ246ㄷ','본관_종합자료실(3층 신간도서 코너)','(모든것이 새롭다)독학 일본어 첫걸음 뉴뉴','강석기 지음','씨앤톡',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (29,'727.5-ㅅ784ㅅ','본관_종합자료실(3층 신간도서 코너)','(申京淑 박사의)쇼핑중국어','신경숙 지음','삼인행',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (30,'742-ㅅ762어','본관_종합자료실(3층 신간도서 코너)','어원 덕분에 영어 공부가 쉬워졌습니다 : 플러스 편','시미즈 켄지, 스즈키 히로시 [공] 지음 ; 키편집부 옮김','키',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (248,'813.6-ㅈ626ㅅ-2','본관_종합자료실(3층 신간도서 코너)','세 여자. 2, 20세기의 봄 : 조선희 장편소설','조선희 지음','한겨레출판사',2017,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (249,'813.6-ㅈ626ㅅ-2=2','본관_종합자료실(3층 신간도서 코너)','세 여자. 2, 20세기의 봄 : 조선희 장편소설','조선희 지음','한겨레출판사',2017,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (250,'843-ㅅ732ㅅ','본관_종합자료실(3층 신간도서 코너)','소년의 블록','키스 스튜어트 지음 ; 권가비 옮김','달의시간',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (251,'818-ㅎ681ㅅ','본관_종합자료실(3층 신간도서 코너)','소란하지 않은 날 : 홍중규 단상집','홍중규 지음','딥앤와이드',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (252,'814.6-ㅇ784ㅅ','본관_종합자료실(3층 신간도서 코너)','소설가의 귓속말','이승우 지음','은행나무',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (253,'833.6-ㅇ517ㅅ','본관_종합자료실(3층 신간도서 코너)','스마일 메이커','요코제키 다이 지음 ; 최재호 옮김','북플라자',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (254,'843-ㄹ868ㅅ','본관_종합자료실(3층 신간도서 코너)','스파이의 유산 : 존 르카레 장편소설','존 르카레 지음 ; 김승욱 옮김','열린책들',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (255,'833.6-ㅎ917ㅅ','본관_종합자료실(3층 신간도서 코너)','시간 : 홋타 요시에 장편소설','홋타 요시에 지음 ; 박현덕 옮김','글항아리',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (256,'413.8-ㅋ392ㅅ','본관_종합자료실(3층 신간도서 코너)','숫자가 만만해지는 책 : 한 번 배우고 평생 써먹는 숫자 감각 기르기','브라이언 W. 커니핸 지음 ; 양병찬 옮김','어크로스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (257,'420.13-ㄱ565ㅅ','본관_종합자료실(3층 신간도서 코너)','슈뢰딩거의 고양이를 찾아서 : 살아있으면서 죽은 고양이를 이해하기 위한 양자역학의 고전','존 그리빈 지음 ; 박병철 옮김','휴머니스트',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (258,'481.508-ㅈ418ㅅ','본관_종합자료실(3층 신간도서 코너)','식물의 이름이 알려주는 것 : 학명, 보통명, 별명으로 내 방 식물들이 하는 말','정수진 지음','다른',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (259,'481.5-ㄱ943ㅅ','본관_종합자료실(3층 신간도서 코너)','식물이 좋아지는 식물책 : 씨앗부터 나무까지, 식물과 친해지고 싶을 때 필요한 72가지 질문','김진옥 지음','궁리',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (260,'410-ㅇ342ㅅ','본관_종합자료실(3층 신간도서 코너)','십대를 위한 영화 속 수학 인문학 여행 : 영화로 보는 생생한 삶의 이야기, 그 속에 담긴 흥미진진한 수학','염지현 지음','팜파스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (261,'400-ㅍ82ㅅ','본관_종합자료실(3층 신간도서 코너)','쓸모없는 지식의 쓸모 : 세상을 바꾼 과학자들의 순수학문 예찬','에이브러햄 플렉스너, 로버르트 데이크흐라프 [공] 지음 ; 김아림 옮김','책세상',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (262,'539.92-ㅅ684ㅇ','본관_종합자료실(3층 신간도서 코너)','에어 쇼크 : 생존을 위협하는 대기오염을 멈추기 위해 바꿔야 할 것들','팀 스메들리 지음 ; 남명성 옮김','예문아카이브',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (263,'511.7-ㄹ982ㅇ','본관_종합자료실(3층 신간도서 코너)','우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀','맷 릭텔 지음 ; 홍경탁 옮김','북라이프',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (264,'511.1813-ㅋ838ㅇ','본관_종합자료실(3층 신간도서 코너)','운명의 과학 : 운명과 자유의지에 관한 뇌 과학','한나 크리츨로우 지음 ; 김성훈 옮김','브론스테인',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (265,'476.01-ㅁ396ㅇ','본관_종합자료실(3층 신간도서 코너)','이기적 유인원','니컬러스 머니 지음 ; 김주희 옮김','한빛비즈',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (266,'476.1-ㄱ657ㅇ','본관_종합자료실(3층 신간도서 코너)','인류의 미래를 바꿀 유전자 이야기 : 누구나 손쉽게 할 수 있는 개인 맞춤 유전체 검사가 여는 새로운 세상','김경철 지음','세종서적',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (267,'472.88-ㄷ46ㅈ','본관_종합자료실(3층 신간도서 코너)','정신과 물질 : 생명의 수수께끼와 분자생물학, 그리고 노벨상','다치바나 다카시, 도네가와 스스무 [공] 지음 ; 한승동 옮김','곰',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (268,'813.6-ㅈ288ㅅ','본관_종합자료실(3층 신간도서 코너)','신은 말하지 않는다 : 전수일 중편소설','전수일 [지음]','청어',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (269,'833.6-ㅎ213ㅅ','본관_종합자료실(3층 신간도서 코너)','신을 기다리고 있어','하타노 도모미 지음 ; 김영주 옮김','문학동네',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (270,'859.7-ㅇ278ㅅ','본관_종합자료실(3층 신간도서 코너)','실버로드 : 사라진 소녀들','스티나 약손 지음 ; 노진선 옮김','마음서재',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (271,'818-ㅈ272ㅅ','본관_종합자료실(3층 신간도서 코너)','실컷 울고나니 배고파졌어요 : 사는 게 버거운 당신에게 보내는 말','전대진 지음','넥서스Books',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (272,'843-ㅎ589ㅅ','본관_종합자료실(3층 신간도서 코너)','씨씨 허니컷 구하기 : 베스 호프먼 장편소설','베스 호프먼 지음 ; 윤미나 옮김','문학동네',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (273,'813.6082-ㅇ367-26','본관_종합자료실(3층 신간도서 코너)','아는 사람만 아는 배우 공상표의 필모그래피 : 김병운 장편소설','김병운 지음','민음사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (274,'833.6-ㅎ961ㅇ','본관_종합자료실(3층 신간도서 코너)','아들 도키오','히가시노 게이고 지음 ; 문승준 옮김','비채',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (275,'813.6-ㅂ254ㅇ','본관_종합자료실(3층 신간도서 코너)','아버지의 나라는 없었다 : 박명아 소설','박명아 지음','다락방',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (276,'813.6-ㄱ686ㅇ','본관_종합자료실(3층 신간도서 코너)','아이젠 : 김남숙 소설','김남숙 지음','문학동네',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (277,'818-ㄱ965ㅇ','본관_종합자료실(3층 신간도서 코너)','아이캔두! 김칠두! : 시니어 모델 김칠두의 마이웨이 스토리','김칠두, 이헌건 [공] 지음','은빛',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (278,'813.6-ㅎ683ㅇ','본관_종합자료실(3층 신간도서 코너)','악의와 공포의 용은 익히 아는 자여라','홍지운 지음','알마',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (279,'808-ㅊ158-95','본관_종합자료실(3층 신간도서 코너)','알로하, 나의 엄마들 : 이금이 장편소설','이금이 지음','창비',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (280,'843-ㅋ772ㅇ','본관_종합자료실(3층 신간도서 코너)','어둠의 눈 : 딘 쿤츠 장편소설','딘 쿤츠 글 ; 심연희 옮김','다산책방',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (281,'818-ㅅ514ㅇ','본관_종합자료실(3층 신간도서 코너)','어른의 일 : 출근, 독립, 취향 그리고 연애','손혜진 지음','가나',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (282,'558.3-ㅈ464ㅇ','본관_종합자료실(3층 신간도서 코너)','어쩌다 파일럿 : B777 캡틴 제이의 하늘 공부','정인웅 지음','루아크',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (283,'843-ㅈ568ㅇ','본관_종합자료실(3층 신간도서 코너)','얼굴이 사라진 밤','루이즈 젠슨 지음 ; 정영은 옮김','마카롱',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (284,'818-ㅇ772ㅇ','본관_종합자료실(3층 신간도서 코너)','얼어 죽어도 아이스 아메리카노 : 미련하게 고집스러운 나를 위한 위로|이솜 에세이','이솜 지음','필름',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (285,'813.6-ㅎ199ㅇ','본관_종합자료실(3층 신간도서 코너)','얼음나무 숲','하지은 지음','황금가지',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (286,'808.3-ㅂ616-31=2','본관_종합자료실(3층 신간도서 코너)','얼음 붕대 스타킹','김하은 지음','바람의아이들',2014,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (287,'818-ㄱ711ㅇ','본관_종합자료실(3층 신간도서 코너)','엄마는 괜찮아 : 엄마를 잃고서야 진짜 엄마가 보였다','김도윤 지음','아르테',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (288,'813.6-ㅇ899ㅈ','본관_종합자료실(3층 신간도서 코너)','조선의 수학자 홍정하 : 이창숙 소설','이창숙 지음','궁리',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (289,'004.73-ㅅ414ㅈ','본관_종합자료실(3층 신간도서 코너)','좀 이상하지만 재미있는 녀석들 : 인공지능에 대한 아주 쉽고 친절한 안내서','저넬 셰인 지음 ; 이지연 옮김','알에이치코리아',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (290,'400-ㅁ454ㅈ','본관_종합자료실(3층 신간도서 코너)','(NASA 연구원에게 배우는)중학 과학 개념 65','케이티 메키시크 지음 ; 서효령 옮김','매직사이언스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (291,'404-ㄹ758ㅈ','본관_종합자료실(3층 신간도서 코너)','지금 만나는 과학, 호기심을 자극하는 요즘 과학계의 이슈들','다비드 루아프르 지음 ; 김아애 옮김','클',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (292,'472.5-ㄷ52ㅈ','본관_종합자료실(3층 신간도서 코너)','집은 결코 혼자가 아니다 : 생물학자의 집 안 탐사기','롭 던 지음 ; 홍주연 옮김','까치',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (293,'440-ㅂ792ㅊ','본관_종합자료실(3층 신간도서 코너)','천문학 아는 척하기 : 알아두면 사는 데 도움되는 천문학 기초 지식','제프 베컨 지음 ; 사라 베컨 그림 ; 김다정 옮김','팬덤북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (294,'331.5-ㄷ42ㅊ','본관_종합자료실(3층 신간도서 코너)','총, 균, 쇠','재레드 다이아몬드 지음 ; 김진준 옮김','문학사상',2013,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (295,'331.5-ㄷ42ㅊ=2','본관_종합자료실(3층 신간도서 코너)','총, 균, 쇠','재레드 다이아몬드 지음 ; 김진준 옮김','문학사상',2013,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (296,'512.49-ㅁ468ㅊ','본관_종합자료실(3층 신간도서 코너)','치유하는 나무 위로하는 숲 : 우리를 회복시키는 녹색공간의 힘','마르코 멘칼리, 마르코 니에리 [공] 지음 ; 박준식 옮김','목수책방',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (297,'420.13-ㅋ392ㅋ','본관_종합자료실(3층 신간도서 코너)','코스믹 홀로그램 : 정보로부터 창조된 우주','쥬드 커리반 지음 ; 이균형 옮김','정신세계사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (298,'410-ㅎ499ㅎ','본관_종합자료실(3층 신간도서 코너)','하버드 수학 박사의 슬기로운 수학 생활, 보는 즉시 문제가 풀리는‘3초 수학’의 힘','크리스티안 헤세 지음 ; 장윤경 옮김','추수밭',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (299,'409-ㅁ886ㅎ','본관_종합자료실(3층 신간도서 코너)','흐르는 것들의 과학 : 물질에 집착하는 한 남자의 일상 여행','마크 미오도닉 지음 ; 변정현 옮김','엠아이디',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (301,'592.3-ㄱ126ㄱ','본관_종합자료실(3층 신간도서 코너)','강아지 옷 : 내 손으로 만드는 우리 댕댕이 꼬까옷','가네코 토시오 지음 ; 박문희 옮김','에스티유니타스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (302,'527.4186-ㄱ741ㄱ','본관_종합자료실(3층 신간도서 코너)','강아지는 산책하고 달리고 놀아야 한다','김병석 지음','하움',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (303,'517.32-ㅇ497ㄱ','본관_종합자료실(3층 신간도서 코너)','그 증상, 등 스트레칭이 해결해드립니다 : 두통 어깨 결림 만성피로 수족냉증 미운 등살','요시다 가요 지음 ; 최서희 옮김','비타북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (304,'517.32-ㅅ172ㄱ','본관_종합자료실(3층 신간도서 코너)','근육에 힘 좀 빼고 삽시다 : 평생 통증 없는 몸을 만드는 하루 5분 근육 풀기','사토 세이지 지음 ; 최말숙 옮김','포레스트북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (305,'517.52-ㅇ891ㄴ','본관_종합자료실(3층 신간도서 코너)','나는 한 달에 1kg만 빼기로 했다 : 지니의 365일 탈 다이어트','이지은 지음','북스고',2020,3.5,1,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (306,'818-ㅅ854ㅇ','본관_종합자료실(3층 신간도서 코너)','엄마는 죽을 때 무슨 색 옷을 입고 싶어?','신소린 지음','해의시간',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (307,'818-ㅈ218ㅇ','본관_종합자료실(3층 신간도서 코너)','엄마도 엄마를 사랑했으면 좋겠어 : 누군가의 딸, 아내, 엄마이기 이전에 나 자신이었던 당신에게','장해주 지음','허밍버드',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (308,'808.3-ㅁ46ㅇ-4','본관_종합자료실(3층 신간도서 코너)','엄청나게 시끄럽고 믿을 수 없게 가까운','조너선 사프란 포어 지음 ; 송은주 옮김','민음사',2010,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (309,'853-ㅂ624ㅇ','본관_종합자료실(3층 신간도서 코너)','에냐도르의 전설','미라 발렌틴 지음 ; 한윤진 옮김','사일런스북',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (310,'980.24-ㅇ989ㅇ','본관_종합자료실(3층 신간도서 코너)','여행 후, 오늘','임지혜 지음','하모니북',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (311,'816.6-ㄱ691ㅇ','본관_종합자료실(3층 신간도서 코너)','여행사 직원은 무슨 일을 할까 : 여행사 직원 훔쳐보기','김다은 지음','프로방스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (312,'818-ㅈ488ㅇ','본관_종합자료실(3층 신간도서 코너)','영화와 시 = Film and poetry','정지돈 지음','시간의흐름',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (313,'818-ㄱ769ㅇ','본관_종합자료실(3층 신간도서 코너)','오늘 서강대교가 무너지면 좋겠다 : 14년 차 방송작가의 좌충우돌 생존기','김선영 지음','유노북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (314,'818-ㅅ194ㅇ','본관_종합자료실(3층 신간도서 코너)','오늘 이 슬픔이 언젠가 우릴 빛내줄 거야 : 유튜버 새벽의 용기 충전 에세이','새벽 지음','위즈덤하우스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (315,'813.6082-ㅇ367-25','본관_종합자료실(3층 신간도서 코너)','오늘의 엄마 : 강진아 장편소설','강진아 지음','민음사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (316,'816.6-ㄱ841ㅇ=2','본관_종합자료실(3층 신간도서 코너)','오래 준비해온 대답 : 김영하의 시칠리아','김영하 지음','복복서가',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (317,'838-ㅇ513ㅇ','본관_종합자료실(3층 신간도서 코너)','오십부터는 우아하게 살아야 한다 : 말투, 태도, 마음에서 드러나는 진정한 아름다움','요시토모 유미 지음 ; 김한나 옮김','유노북스',2020,4.5,1,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (318,'811.6082-ㅁ748ㅁ-539','본관_종합자료실(3층 신간도서 코너)','오트 쿠튀르 : 이지아 시집','이지아 지음','문학과지성사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (319,'813.6-ㅊ558ㅇ','본관_종합자료실(3층 신간도서 코너)','왜 자꾸 나만 따라와','최영희...[등]지음','자음과모음',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (320,'863-ㄷ99ㅇ','본관_종합자료실(3층 신간도서 코너)','우리 아버지들의 마지막 나날 : 조엘 디케르 장편소설','조엘 디케르 지음 ; 윤진 옮김','문학동네',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (321,'813.6-ㄱ647ㅇ','본관_종합자료실(3층 신간도서 코너)','우리 언젠가 화성에 가겠지만 : 김강 소설집','김강 지음','아시아',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (322,'813.6-ㅇ646ㅇ','본관_종합자료실(3층 신간도서 코너)','우리는 자라고 있다 : 윤해연 소설집','윤해연 지음','낮은산',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (66,'813.6-ㅈ494ㄱ-2','본관_종합자료실(3층 신간도서 코너)','광주 아리랑. 2 : 정찬주 장편소설','정찬주 지음','다연',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (67,'883-ㅅ734ㄱ-1','본관_종합자료실(3층 신간도서 코너)','권력의 가문 메디치. 1, 피렌체의 새로운 통치자','마테오 스트루쿨 지음 ; 이현경 옮김','메디치미디어',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (68,'883-ㅅ734ㄱ-2','본관_종합자료실(3층 신간도서 코너)','권력의 가문 메디치. 2, 피렌체를 사로잡은 남자','마테오 스트루쿨 지음 ; 이현경 옮김','메디치미디어',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (69,'883-ㅅ734ㄱ-3','본관_종합자료실(3층 신간도서 코너)','권력의 가문 메디치. 3, 프랑스를 지배한 여인','마테오 스트루쿨 지음 ; 이현경 옮김','메디치미디어',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (70,'813.6-ㅈ588ㄱ','본관_종합자료실(3층 신간도서 코너)','귤의 맛 : 조남주 장편소설','조남주 지음','문학동네',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (71,'843-ㅇ546ㄱ','본관_종합자료실(3층 신간도서 코너)','그녀들의 이야기 : 영미 여성 작가 단편 모음집','버지니아 울프 [외 지음] ; 구원 옮김','코호북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (72,'811.6-ㅊ248ㄱ','본관_종합자료실(3층 신간도서 코너)','그녀의 푸른 날들을 위한 시','천양희...[등]지음','북카라반',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (341,'594.71-ㄱ384ㅂ','본관_종합자료실(3층 신간도서 코너)','비건 베이킹 클래스 : 아토피, 알레르기, 식이요법을 위한 착한 빵 레시피','고은별 지음','북핀',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (342,'598.16-ㅇ782ㅅ','본관_종합자료실(3층 신간도서 코너)','산만한 아이의 특별한 잠재력 : 뇌과학이 알려주는 ADHD 아이 크게 키우는 법 = (The)Potential of an easily distracted child','이슬기 지음','길벗',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (343,'813.6-ㅇ623ㅈ','본관_종합자료실(3층 신간도서 코너)','진실 혹은 광인 : 윤마리 소설','윤마리 지음','어문학사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (344,'224.3-ㅂ164ㅊ','본관_종합자료실(3층 신간도서 코너)','참선 매뉴얼 : 언제 어디서나, 건강한 마음과 행복한 삶을 위한 매일의 트레이닝','테오도르 준 박 지음 ; 키미앤일이 그림 ; 구미화 옮김','나무의마음',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (345,'863-ㄱ229ㅊ-1','본관_종합자료실(3층 신간도서 코너)','천일야화. 1','앙투안 갈랑 엮음 ; 임호경 옮김','열린책들',2010,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (346,'813.6-ㅈ986ㅊ','본관_종합자료실(3층 신간도서 코너)','천재들의 고양이 : 진주현 장편소설','진주현 지음','꿈공장플러스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (347,'813.5-ㄹ822ㅊ','본관_종합자료실(3층 신간도서 코너)','청소년을 위한 고전 소설 에세이 : 류수열 교수와 함께하는 재미있고 유익한 우리 고전 소설 읽기','류수열 지음','해냄출판사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (348,'823.7-ㅇ551ㅋ','본관_종합자료실(3층 신간도서 코너)','카구야 프로젝트 : 원샨 장편소설','원샨 지음 ; 정세경 옮김','아작',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (349,'813.6-ㄱ866ㅌ','본관_종합자료실(3층 신간도서 코너)','탬버린 : 김유담 소설집','김유담 지음','창비',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (350,'818-ㄱ474ㅌ','본관_종합자료실(3층 신간도서 코너)','퇴근 후, 동네 책방','구선아 지음','리얼북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (351,'892.83-ㅌ83ㅌ','본관_종합자료실(3층 신간도서 코너)','티끌 같은 나','빅토리아 토카레바 지음 ; 승주연 옮김','잔',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (352,'892.83-ㅂ868ㅍ','본관_종합자료실(3층 신간도서 코너)','파리의 동쪽','니콜라 보코브 지음 ; 마뉴엘 페낭, 김윤정 [공] 옮김 ; 윤풍경 [그림]','스틸로그라프',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (353,'808-ㅅ374-267=2','본관_종합자료실(3층 신간도서 코너)','페스트','알베르 카뮈 지음 ; 김화영 옮김','민음사',2011,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (354,'808-ㅅ374-267=3','본관_종합자료실(3층 신간도서 코너)','페스트','알베르 카뮈 지음 ; 김화영 옮김','민음사',2011,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (355,'818-ㄱ819ㅍ','본관_종합자료실(3층 신간도서 코너)','평일도 인생이니까 : 주말만 기다리지 않는 삶을 위해|김신지 에세이','김신지 지음','알에이치코리아',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (356,'842-ㅅ414ㅍ','본관_종합자료실(3층 신간도서 코너)','폭풍우 : 윌리엄 셰익스피어 희곡','윌리엄 셰익스피어 지음 ; 박우수 옮김','열린책들',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (357,'833.6-ㄴ41ㅍ=2','본관_종합자료실(3층 신간도서 코너)','표정 없는 검사 : 나카야마 시치리 장편소설','나카야마 시치리 지음 ; 이연승 옮김','블루홀식스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (358,'813.7-ㅅ612ㅍ','본관_종합자료실(3층 신간도서 코너)','푸른 고양이 : 송지은 소설집','송지은 지음','푸른사상',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (359,'843-ㄱ562ㅍ','본관_종합자료실(3층 신간도서 코너)','플로리다 : 로런 그로프 소설','로런 그로프 지음 ; 정연희 옮김','문학동네',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (360,'843-ㄷ99ㅍ','본관_종합자료실(3층 신간도서 코너)','픽윅 클럽 여행기 : 찰스 디킨스 선집','찰스 디킨스 지음 ; 허진 옮김','시공사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (361,'802-ㅈ224ㅎ','본관_종합자료실(3층 신간도서 코너)','하루 한 문장 : 대통령 연설비서관의 글쓰기','장훈 지음','젤리판다',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (362,'517.52-ㄱ615ㅅ','본관_종합자료실(3층 신간도서 코너)','살이 찌기만 하고 빠지지 않을 때 읽는 책, 나잇살, 만성피로, 통증 잡는 최고의 체질 개선법','기무라 요코, 니시자와 미카 [공] 지음 ; 장은주 옮김','현대지성',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (363,'630-ㅎ975ㅅ','본관_종합자료실(3층 신간도서 코너)','석고 방향제 : 향기를 품은 아름다운 석고 조각','히라야마 리에 지음 ; 이은미 옮김','Conects',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (364,'592.27-ㅂ944ㅅ','본관_종합자료실(3층 신간도서 코너)','세상 쉬운 마스크 만들기 : 똥손도 곰손도 재봉틀이 없어도 OK!','부티크사 편집부 지음 ; 남궁가윤 옮김','즐거운상상',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (365,'594.51-ㅅ334ㅅ','본관_종합자료실(3층 신간도서 코너)','손으로 빚는 마음, 떡 : 기품의 맛있는 떡 레시피 101','선명숙 지음','미호',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (366,'594.58-ㅇ775ㅅ','본관_종합자료실(3층 신간도서 코너)','스텐 냄비 요리의 여왕 = Stainless steel pot cooking','이수진 글 ; 황진규 사진','북퍼브',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (367,'594.7-ㅂ518ㅅ','본관_종합자료실(3층 신간도서 코너)','시그니처 디저트 : 다쿠아즈부터 케이크까지 감성 베이킹 레시피','박지영 지음','만개의레시피',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (368,'513.8-ㅅ194ㅇ=3','본관_종합자료실(3층 신간도서 코너)','아내를 모자로 착각한 남자','올리버 색스 지음 ; 조석현 옮김 ; 이정호 그림','알마',2016,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (369,'513.8-ㅅ194ㅇ=4','본관_종합자료실(3층 신간도서 코너)','아내를 모자로 착각한 남자','올리버 색스 지음 ; 조석현 옮김 ; 이정호 그림','알마',2016,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (370,'513.8-ㅅ194ㅇ=5','본관_종합자료실(3층 신간도서 코너)','아내를 모자로 착각한 남자','올리버 색스 지음 ; 조석현 옮김 ; 이정호 그림','알마',2016,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (371,'598.132-ㅈ666ㅇ','본관_종합자료실(3층 신간도서 코너)','(욱하지 않고 화내지 않고)아들을 행복하게 통제하는 법','조은정 지음','예문',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (372,'591-ㅇ571ㅇ','본관_종합자료실(3층 신간도서 코너)','아무것도 없는 집에 사는 법 : 심플하게 사는 7가지 방법','유루리 마이 지음 ; 노경아 옮김','미우',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (373,'183.2-ㅇ815ㅇ','본관_종합자료실(3층 신간도서 코너)','아이의 마음을 이해하기 시작했습니다 : 뉴베리 수상작으로 읽는‘아이 마음속 숨겨진 심리’','이영옥 글 ; 유영애 그림','시소',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (374,'598.1-ㅅ746ㅇ','본관_종합자료실(3층 신간도서 코너)','아직도 내 아이를 모른다 : 툭하면 상처 주는 부모에게 ‘아이의 뇌’가 하고 싶은 말','대니얼 J. 시겔, 티나 페인 브라이슨 [공] 지음 ; 김아영 옮김','알에이치코리아',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (375,'594.5-ㄷ89ㅇ','본관_종합자료실(3층 신간도서 코너)','알랭 뒤카스의 선택, 그린 다이닝, 채소, 과일, 곡물, 씨앗 비로소 식탁의 주인공이 되다','알랭 뒤카스, 로맹 메데, 앙젤 페레 마그 [공] 지음 ; 정혜승 옮김','PAN n PEN',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (376,'517.5-ㅇ497ㅇ','본관_종합자료실(3층 신간도서 코너)','약 없이 혈당 낮추는 양배추 식사요법 : 최고의 당뇨병 전문의가 알려주는 혈당 관리 비법','요시다 도시히데 지음 ; 최서희 옮김','루미너스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (377,'594.5-ㄱ462ㅇ','본관_종합자료실(3층 신간도서 코너)','언제나, 나의 집밥 인기베스트 104','구리하라 하루미 지음 ; 용동희 옮김','그린쿡',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (378,'186.5-ㅈ452ㅇ','본관_종합자료실(3층 신간도서 코너)','엄마니까 느끼는 감정 : 감정적으로 아이를 대하고 자책하는 엄마들을 위한 심리 치유서','정우열 지음','서랍의날씨',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (379,'598.1-ㅈ928ㅇ','본관_종합자료실(3층 신간도서 코너)','엄마표 책 육아 : 그림책에서 이야기책까지','지에스더 지음','미디어숲',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (380,'814.6-ㄱ778ㅎ','본관_종합자료실(3층 신간도서 코너)','한 뼘만 같이 걸을까요? : 김성은 에세이','김성은 지음','서아책방',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (381,'811.6-ㄱ681ㅎ','본관_종합자료실(3층 신간도서 코너)','할매들은 시방','김기순...[등]지음, 황희영 기획','정한책방',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (382,'823.7-ㅍ25ㅎ','본관_종합자료실(3층 신간도서 코너)','할아버지의 달콤한 유산','펑수화 지음 ; 천왕링 그림 ; 조윤진 옮김','뜨인돌',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (383,'843-ㅁ414ㅎ','본관_종합자료실(3층 신간도서 코너)','행복한 그림자의 춤','앨리스 먼로 지음 ; 곽명단 옮김','웅진지식하우스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (384,'843-ㄹ326ㅎ','본관_종합자료실(3층 신간도서 코너)','행잉 가든, 존 리버스 컬렉션','이언 랜킨 지음 ; 정세윤 옮김','오픈하우스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (385,'818-ㅅ286ㅎ','본관_종합자료실(3층 신간도서 코너)','혼자 사니 좋다','서정희 지음','몽스북',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (386,'833.6-ㅇ366ㅎ','본관_종합자료실(3층 신간도서 코너)','혼자라는 건','오노데라 후미노리 지음 ; 김난주 옮김','왼쪽주머니',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (387,'833.6-ㅇ746ㅎ','본관_종합자료실(3층 신간도서 코너)','후가는 유가','이사카 고타로 지음 ; 김은모 옮김','문학동네',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (388,'816.6-ㄱ271ㅎ','본관_종합자료실(3층 신간도서 코너)','히말라야를 걷는 여자','거칠부 지음','더숲',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (389,'909-ㅎ319ㄱ','본관_종합자료실(3층 신간도서 코너)','결정적 한마디가 삶의 철학이 된다 : 세계사에 담긴 스토리텔링','한수운 엮음','아이템하우스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (390,'981.16-ㅊ676ㅅ-5','본관_종합자료실(3층 신간도서 코너)','경복궁 이야기','최준식 지음','주류성',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (391,'549.1-ㅎ543ㄷ-1','본관_종합자료실(3층 신간도서 코너)','경복궁 현판으로 읽다','최동군 지음','담디',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (392,'981.502-ㅇ388ㄱ','본관_종합자료실(3층 신간도서 코너)','그냥 한번쯤은 인도 : 유럽보다 더쉬운 북인도 자유 여행 에세이','오석근 지음','글로벌마인드',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (393,'911.0745-ㄴ69ㄱ','본관_종합자료실(3층 신간도서 코너)','그들의 5·18 : 정치군인들은 어떻게 움직였나','노영기 지음','푸른역사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (394,'982.02-ㅇ662ㄴ','본관_종합자료실(3층 신간도서 코너)','남부 유럽 도시 기행 : 낭만과 여유가 살아 숨 쉬는 지중해 연안의 도시 이야기','이경한 [지음]','푸른길',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (395,'986.302-ㅈ496ㄴ=2','본관_종합자료실(3층 신간도서 코너)','내 청춘의 첫 프로젝트, 뉴질랜드 워킹홀리데이','정채리 지음','시대인',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (396,'982.4802-ㅈ496ㄴ','본관_종합자료실(3층 신간도서 코너)','(New)내 청춘의 첫 프로젝트, 아일랜드 워킹홀리데이','정채리 지음','시대인',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (398,'454-ㄱ345ㄷ','본관_종합자료실(3층 신간도서 코너)','당신만 몰랐던 매혹적인 바다이야기 27 : 알고 보면 신기하고 재미있는 Sea Story','고명석 지음','청미디어',2020,3.5,1,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (399,'365.91-ㅇ393ㄷ','본관_종합자료실(3층 신간도서 코너)','된다! 유튜브·SNS·콘텐츠 저작권 문제 해결 : 25년간 저작권을 다뤄온 판사 출신 변호사의 실무 답변 108가지','오승종 지음','이지스퍼블리싱',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (400,'029.8-ㄱ818ㄹ','본관_종합자료실(3층 신간도서 코너)','리딩 프라이데이 : 나를 발견하는 시간 우리를 알아가는 시간','김신애 엮음','책방',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (401,'600.1-ㅊ152ㅇ','본관_종합자료실(3층 신간도서 코너)','(그림속으로 들어간)욕망과 탐욕의 인문학 : 인간의 욕망과 탐욕을 관음하는 예술가의 시선','차홍규 지음','아이템하우스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (402,'005.567-ㄱ871ㅇ','본관_종합자료실(3층 신간도서 코너)','유튜브 영상 편집+자막 무작정 따라하기 : with 프리미어 프로','김은서 지음','길벗',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (403,'013.32-ㅇ948ㅈ','본관_종합자료실(3층 신간도서 코너)','작은 출판사 차리는 법 : 선수 편집자에서 초짜 대표로','이현화 지음','유유',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (404,'005.56-ㅈ99ㅇ','본관_종합자료실(3층 신간도서 코너)','(좐느의)SNS 마케팅을 위한 포토샵 디자인 : 블로그, 인스타그램, 페이스북, 유튜브 운영을 위한 필수 디자인 콘텐츠!','좐느 지음','제이펍',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (405,'326.165-ㄱ263ㅊ','본관_종합자료실(3층 신간도서 코너)','창업부터 운영까지 단계별로 실천하는 SNS 마케팅 : #블로그 #유튜브 #인스타그램 #페이스북 #구글 #모든 도구를 활용하라!','강진영, 유영진 [공] 지음','제이펍',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (406,'004.61-ㅁ214ㄱ','본관_종합자료실(3층 신간도서 코너)','그림으로 배우는 보안 구조 Security','마스이 토시카츠 지음 ; 양성건 옮김','영진닷컴',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (407,'026.9-ㄴ81ㄴ','본관_종합자료실(3층 신간도서 코너)','뉴욕도서관으로 온 엉뚱한 질문들','뉴욕공공도서관 지음 ; 배리 블리트 그림 ; 이승민 옮김','정은문고',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (408,'001.2-ㄱ762ㄴ','본관_종합자료실(3층 신간도서 코너)','뉴턴의 아틀리에 : 과학과 예술, 두 시선의 다양한 관계 맺기','김상욱, 유지원 [공] 지음','민음사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (409,'026.3-ㅇ286ㄷ','본관_종합자료실(3층 신간도서 코너)','도서관 생태마을에 삽니다 : 사람 중심의 공공도서관 이야기','양시모, 김용안 [공] 지음 ; 김세진 그림','학교도서관저널',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (411,'029.8-ㄱ256ㅊ','본관_종합자료실(3층 신간도서 코너)','책 읽기의 끝과 시작 : 책읽기가 지식이 되기까지','강유원 지음','라티오',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (412,'029-ㅇ861ㅊ=2','본관_종합자료실(3층 신간도서 코너)','책으로 변한 내 인생 : 책 속에 모든 답이 있다','이재범 지음','책수레',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (413,'029.8-ㅂ298ㅎ','본관_종합자료실(3층 신간도서 코너)','한 학기 한 권 무엇을 읽을까 : 사서교사가 뽑은 초등 한 학기 한 권 읽기 추천도서 100','북토크 톡 지음','학교도서관저널',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (414,'594.62-ㅅ684ㅇ','본관_종합자료실(3층 신간도서 코너)','안 먹는 아이도 바쁜 엄마도 반한 엘리네 미국 유아식 : 국 반찬 차리지 않아도 아이가 잘 먹는 아이주도 레시피','스마일 엘리 지음','세종서적',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (415,'598.1-ㄱ833ㅇ','본관_종합자료실(3층 신간도서 코너)','(부모와 아이가 함께 자라는)오늘 육아 : 자존감, 창의력, 좋은 습관을 길러주는 매일매일 일상 교육법','김영숙 지음','북하우스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (416,'598.1-ㅂ432ㅇ','본관_종합자료실(3층 신간도서 코너)','오늘도 화내고 말았습니다 : 툭하면 떼쓰는 아이, 순간적으로 욱하는 부모를 위한 현실 육아 코칭','박윤미 지음','한빛라이프',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (418,'592.21-ㄱ216ㅇ','본관_종합자료실(3층 신간도서 코너)','오버록 재봉틀로 만드는 옷','가타야마 유코 지음 ; 남궁가윤 옮김','즐거운상상',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (419,'594.6-ㅎ291ㅇ','본관_종합자료실(3층 신간도서 코너)','(면역력 키워주는)우리 가족 건강식 : 매일 밥상에서 챙길 수 있는 건강식 83가지','한복선 지음','리스컴',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (420,'598.10212-ㄱ821ㅇ','본관_종합자료실(3층 신간도서 코너)','우리가 곧 부모가 됩니다 : 임신 준비부터 산후조리까지 ‘엄마 아빠 되기’의 모든 것','김아연, 박현규 [공] 지음','지식너머',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (421,'598.1-ㅅ954ㅅ','본관_종합자료실(3층 신간도서 코너)','소리지르지 않는 엄마의 우아한 육아 : 엄마와 아이의 자존감을 살리는 육아 코칭','린다 실라바, 다니엘라 가이그 [공] 지음 ; 김현희 옮김','메가스터디북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (422,'590-ㄱ887ㅇ','본관_종합자료실(3층 신간도서 코너)','월간 생활 도구 : 좋은 물건을 위한 사려 깊은 안내서','김자영, 이진주 [공] 지음','지콜론북',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (423,'598.1-ㅂ992ㅇ','본관_종합자료실(3층 신간도서 코너)','유리로 된 아이 : 시련을 가르치지 않는 부모 혼자서 아무것도 못하는 아이','미하엘 빈터호프 지음 ; 한윤진 옮김','쌤앤파커스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (424,'517.3-ㅇ717ㅇ','본관_종합자료실(3층 신간도서 코너)','이기는 몸 : 몸을 알아야 몸을 살린다','이동환 지음','쌤앤파커스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (425,'518-ㅈ426ㅇ=2','본관_종합자료실(3층 신간도서 코너)','인류를 구한 12가지 약 이야기','정승규 지음','반니',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (426,'518-ㅈ426ㅇ=3','본관_종합자료실(3층 신간도서 코너)','인류를 구한 12가지 약 이야기','정승규 지음','반니',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (427,'518-ㅈ426ㅇ=4','본관_종합자료실(3층 신간도서 코너)','인류를 구한 12가지 약 이야기','정승규 지음','반니',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (428,'593.5-ㄱ348ㅇ','본관_종합자료실(3층 신간도서 코너)','일단 21일만 운동해보기로 했습니다 : 체력과 습관을 바로잡는 21일 루틴의 힘','고민수 지음','위즈덤하우스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (429,'594.5541-ㅅ464ㅈ','본관_종합자료실(3층 신간도서 코너)','자연으로 차린 사계절 저장식 : 제철 재료로 만든 피클·장아찌·병조림 60','손성희 지음','리스컴',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (430,'517.31-ㅁ688ㅈ','본관_종합자료실(3층 신간도서 코너)','(잠 못 자는 우리 아이를 위한)좋은 잠 처방전','샤론 무어 지음 ; 함현주 옮김','유월사일',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (431,'513.993-ㅈ714ㅈ','본관_종합자료실(3층 신간도서 코너)','주 2회 1일 1시간, 죽을 때까지 건강하게 살고 싶어서 : 87세 최고령 대법관 긴즈버그의 20년 암 극복 근력 운동 매뉴얼','브라이언트 존슨 지음 ; 정미화 옮김','부키',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (432,'598.1-ㄱ768ㅂ','본관_종합자료실(3층 신간도서 코너)','(지랄발랄 하은맘의)불량육아 : 전설의 바이블이 돌아왔다','김선미 지음','RHK',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (433,'230.912-ㅅ614ㄷ','본관_종합자료실(3층 신간도서 코너)','대륙의 십자가 : 중국 5대 제국과 흥망성쇠를 함께한 그리스도교 역사','송철규, 민경중 [공] 지음','메디치',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (434,'549.1-ㅎ543ㄷ-3','본관_종합자료실(3층 신간도서 코너)','덕수궁·경희궁·행궁 : 현판으로 읽다','최동군 지음','담디',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (435,'911.03-ㄱ384ㅁ','본관_종합자료실(3층 신간도서 코너)','모든 책 위의 책 : 삼국유사로 오늘을 읽는다','고운기 지음','현암사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (436,'912.6-ㅇ885ㅁ','본관_종합자료실(3층 신간도서 코너)','몽골제국의 후예들 : 티무르제국부터 러시아까지, 몽골제국 이후의 중앙유라시아사','이주엽 지음','책과함께',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (437,'388.1-ㅅ822ㅁ','본관_종합자료실(3층 신간도서 코너)','민담형 인간 : 캐릭터 탐구로 동서양 민담 새로 읽기','신동흔 지음','한겨레출판사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (438,'982.02-ㅇ621-3','본관_종합자료실(3층 신간도서 코너)','바 인 유럽 = Bar !n Europe','이연실...[등]지음','이지앤북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (439,'981.102-ㅅ136ㅂ','본관_종합자료실(3층 신간도서 코너)','바이칼에서 몽골까지 열흘 : 시인ㆍ소설가 12인의 오지기행','사막의형제들 지음','책만드는집',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (440,'981.1502-ㅈ954ㅂ','본관_종합자료실(3층 신간도서 코너)','반차 여행 : 노잼 일상, 무기력증에 빠진 이들을 위한 작지만 알찬 여행','지콜론북 편집부 지음','지콜론북',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (441,'991.1-ㄱ738ㅅ','본관_종합자료실(3층 신간도서 코너)','사람과 그의 글 : 사료와 함께 읽는 평전','김범 지음','테오리아',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (442,'909-ㅇ627ㅅ','본관_종합자료실(3층 신간도서 코너)','세계를 움직인 돌','윤성원 지음','모요사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (443,'909-ㅇ455ㅅ','본관_종합자료실(3층 신간도서 코너)','세계사를 바꾼 37가지 물고기 이야기','오치 도시유키 지음 ; 서수지 옮김','사람과나무사이',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (444,'001.3-ㄱ142ㅅ','본관_종합자료실(3층 신간도서 코너)','세상의 모든 시간 : 느리게 사는 지혜에 관하여','토마스 기르스트 지음 ; 이덕임 옮김','을유문화사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (445,'322.952-ㅊ534ㅅ','본관_종합자료실(3층 신간도서 코너)','셀레나의 이민 스토리, 유럽편 : 유럽에서 미래를 그리다 = The story of Selena''s life on immigration','최여경 지음','바른북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (446,'982.02-ㅇ621-2','본관_종합자료실(3층 신간도서 코너)','숍 인 유럽 = Shop !n Europe','안미영...[등]지음','이지앤북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (447,'982.702-ㅎ371ㅅ','본관_종합자료실(3층 신간도서 코너)','스페인의 빨간 맛 : 발렌시아에서 보낸 꿈결 같은 한 해의 기록','한지은 지음','바이북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (448,'912.08-ㅅ588ㅅ','본관_종합자료실(3층 신간도서 코너)','슬픈 중국 : 인민민주독재 1948-1964','송재윤 지음','까치글방',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (449,'981.15402-ㅈ372ㅅ','본관_종합자료실(3층 신간도서 코너)','시니어, 길을 걷다, 양평기행, 그리고 남양주 인천·동두천·춘천편','정만성 지음','다차원북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (450,'981.19802-ㄱ262ㅅ','본관_종합자료실(3층 신간도서 코너)','신안 : 한국의 땅과 사람에 관한 이야기','강제윤 지음','21세기북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (451,'349.11013-ㅎ563ㅅ','본관_종합자료실(3층 신간도서 코너)','신친일파 : 『반일 종족주의』의 거짓을 파헤친다','호사카 유지 지음','봄이아트북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (452,'005.4-ㅇ954ㅍ','본관_종합자료실(3층 신간도서 코너)','(회사에서 바로 통하는)파워포인트 for starters : 왕초보가 시작하는 파워포인트 입문서','이화진 지음','한빛미디어',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (453,'189-ㅅ652ㄱ','본관_종합자료실(3층 신간도서 코너)','공간의 심리학 : 인간의 행동을 결정하는 공간의 비밀','발터 슈미트 지음 ; 문항심 옮김','반니',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (454,'189.1-ㄱ384ㄴ','본관_종합자료실(3층 신간도서 코너)','나는 왜 내가 제일 힘들까 : 항상 같은 곳에서 넘어지는 당신을 위한 감정 사용 설명서','마크 고울스톤, 필립 골드버그 [공] 지음 ; 김윤재 옮김','마인드빌딩',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (455,'186.5-ㅅ898ㄴ','본관_종합자료실(3층 신간도서 코너)','나를 살피는 기술','신재현 지음','부크럼',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (456,'189.1-ㅂ394ㄴ','본관_종합자료실(3층 신간도서 코너)','나를 인정하지 않는 나에게','박예진 지음','인플루엔셜',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (457,'189-ㄱ676ㄴ','본관_종합자료실(3층 신간도서 코너)','내 마음은 충전중 : 일상에 지친 당신을 위한 행복 에너지 채우기','김근하 지음','서사원',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (458,'182.1-ㅅ382ㄴ','본관_종합자료실(3층 신간도서 코너)','내 문제가 아닌데 내가 죽겠습니다 : 가족만 떠올리면 가슴이 답답한 당신을 위한 생존 심리학','유드 세메리아 지음 ; 이선민 옮김','아름다운사람들',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (459,'185.5-ㅇ793ㄴ','본관_종합자료실(3층 신간도서 코너)','내 삶의 의미는 무엇인가 : 『죽음의 수용소에서』빅터 프랭클과의 대화 = Logotherapy','이시형, 박상미 [공] 지음','특별한서재',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (460,'337.04-ㄱ799ㄷ','본관_종합자료실(3층 신간도서 코너)','딸에게 들려주는 여자 이야기 : 배우고, 사랑하고, 살아 내야 할 딸에게 건네는 27가지 담대한 말들','김슬기 지음','Whale books',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (461,'194.8-ㅇ675ㅁ','본관_종합자료실(3층 신간도서 코너)','마음대로 안 되는 게 인생이라면 : 살면서 누구나 고민하는 인생 질문에 대한 명쾌한 대답','이근후, 이서원 [공] 지음','샘터',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (462,'225.84-ㅋ628ㅁ','본관_종합자료실(3층 신간도서 코너)','마음이 아플 땐 불교심리학','잭 콘필드 지음 ; 이재석 옮김','불광',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (463,'183.633-ㅈ714ㅁ','본관_종합자료실(3층 신간도서 코너)','먹을 때마다 나는 우울해진다 : 식욕 뒤에 감춰진 여성의 상처와 욕망','애니타 존스턴 지음 ; 노진선 옮김','심플라이프',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (464,'223.53-ㅇ256ㅂ','본관_종합자료실(3층 신간도서 코너)','(인문학을 좋아하는 사람들을 위한)반야심경','야마나 테츠시 지음 ; 최성현 옮김','불광출판사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (465,'189-ㅇ127ㅅ','본관_종합자료실(3층 신간도서 코너)','사랑받을 권리 : 이유 없이 상처받지 않는 삶','일레인 N. 아론 지음 ; 고빛샘 옮김','웅진지식하우스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (466,'188.5-ㅊ658ㅅ','본관_종합자료실(3층 신간도서 코너)','사주 음양오행을 디자인하다 : 사주와 한의학을 접목시킨 건강 지침서','최제현, 김동은 공저','지식과감성#',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (467,'325.04-ㄹ822ㅅ','본관_종합자료실(3층 신간도서 코너)','성숙한 어른이 갖춰야 할 좋은 심리 습관','류쉬안 지음 ; 원녕경 옮김','다연',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (468,'182.3-ㄷ52ㅅ','본관_종합자료실(3층 신간도서 코너)','슬픔의 위로 : 자신과 타인을 위로하는 진정한 방법','메건 더바인 지음 ; 김난령 옮김','반니',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (469,'304-ㅂ454ㅅ','본관_종합자료실(3층 신간도서 코너)','신문 읽는 소크라테스 : 질문이 다르면 대학이 바뀐다','박인호 지음','이락',2018,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (470,'304-ㅂ454ㅅ-2','본관_종합자료실(3층 신간도서 코너)','신문 읽는 소크라테스. 2 : 질문이 다르면 대학이 바뀐다','박인호 지음','이락',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (471,'512.54-ㅈ986ㅎ','본관_종합자료실(3층 신간도서 코너)','(진주의)해피 키토 키친 = Happy KETO KITCHEN','진주 지음','북드림',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (472,'594.51-ㅇ951ㅁ','본관_종합자료실(3층 신간도서 코너)','(집밥이 편해지는)명랑쌤 비법 밑반찬 : 한 번에 넉넉히 만들어 일주일 편하게 먹기','이혜원 지음','레시피팩토리',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (473,'592.21-ㅍ82ㅊ','본관_종합자료실(3층 신간도서 코너)','처음 만드는 선캐처 : 당신의 매일이 반짝이길','프롬루 지음','황금시간',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (474,'598.1-ㄱ437ㅊ','본관_종합자료실(3층 신간도서 코너)','처음 부모 육아 멘붕 탈출법 : 신생아부터 72개월까지 SOS 육아 고민 해결서','곽재혁 지음','소울하우스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (475,'598.1-ㅇ842ㅊ','본관_종합자료실(3층 신간도서 코너)','초등 매일 습관의 힘 : 학년이 올라갈수록 자기주도 학습력, 창의력, 자존감이 높아지는','이은경...[등]지음','황금부엉이',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (476,'594.5-ㅎ665ㅊ','본관_종합자료실(3층 신간도서 코너)','총각네 반찬 가게','홍은찬 지음','싸이프레스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (477,'591-ㅈ532ㅊ','본관_종합자료실(3층 신간도서 코너)','최고의 인테리어는 정리입니다 : 2000개의 집을 바꾼 정희숙의 정리 노하우북','정희숙 지음','가나',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (478,'594.3994-ㅇ749ㅋ','본관_종합자료실(3층 신간도서 코너)','카페 Milk Tea 메뉴 101 : 어디에도 없는 밀크티 백과사전','이상민 지음','수작걸다',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (480,'594.5-ㅇ637ㅍ','본관_종합자료실(3층 신간도서 코너)','포스트 서울 쿡 북 = Post Seoul cook book','윤은경 지음','뉴프레스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (481,'594.54678-ㅇ521ㅍ','본관_종합자료실(3층 신간도서 코너)','포케 : 쉽고 맛있어서 더 특별한 하와이안 레시피 55 = Poke','용동희 지음','미호',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (482,'381.75-ㅁ742ㅍ','본관_종합자료실(3층 신간도서 코너)','푸드 로드 : 음식 트렌드를 찾는 서울대 푸드비즈랩의 좌충우돌 미각 탐험기','문정훈, 서울대학교 푸드비즈랩 지음','플루토',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (483,'670.7-ㅂ222ㅎ','본관_종합자료실(3층 신간도서 코너)','(아이의 감수성과 창의력부터 공부머리까지 함께 키우는)하루 10분 음악의 힘','박남예 지음','청림',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (484,'594.5535-ㅇ796ㅎ','본관_종합자료실(3층 신간도서 코너)','하루 한 가지 채소요리 : 제철 채소로 만드는 세상에서 가장 건강한 한 끼','이양지 지음','비타북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (485,'594.6-ㄴ88ㅅ=2','본관_종합자료실(3층 신간도서 코너)','(헬렌 니어링의)소박한 밥상','헬렌 니어링 지음 ; 공경희 옮김','디자인하우스',2018,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (486,'511.119-ㄱ715ㅁ','본관_종합자료실(3층 신간도서 코너)','몸이 되살아나는 혈관 건강 비법 : 혈관 명의가 전하는 혈관 건강의 모든 것','김동익 지음','매일경제신문사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (487,'594.5-ㅇ885ㅎ','본관_종합자료실(3층 신간도서 코너)','홈메이드 중국요리 50','이주환 지음','알에이치코리아',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (488,'695.4-ㄱ986ㅋ','본관_종합자료실(3층 신간도서 코너)','K리그를 읽는 시간','김형준, 이승엽 [공] 지음','북콤마',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (489,'695.804-ㅇ387ㄱ','본관_종합자료실(3층 신간도서 코너)','골프로 인생을 설계할 수 있다면 : 오상준의 인생역전 골프 에세이','오상준 지음','시간여행',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (490,'662-ㅈ368ㄴ','본관_종합자료실(3층 신간도서 코너)','내 사진으로 쏠쏠한 세컨잡 : 꽤 돈 되는 ''스톡사진작가 되기'' 매뉴얼북','정동주 지음','브레인스토어',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (491,'920.3-ㅍ82ㅅ','본관_종합자료실(3층 신간도서 코너)','십자가와 초승달, 천년의 공존 : 그리스도교와 이슬람의 극적인 초기 교류사','리처드 플레처 지음 ; 박흥식, 구자섭 [공] 옮김','21세기북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (492,'911.058-ㅂ478ㅇ','본관_종합자료실(3층 신간도서 코너)','아버지의 특별한 딸 : 『한중록』으로 본 혜경궁 홍씨','박정애 지음 ; 손은경 그림','메멘토',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (189,'851-ㅌ93ㅁ','본관_종합자료실(3층 신간도서 코너)','몽상과 착란','게오르크 트라클 지음 ; 박술 옮김','ITTA',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (190,'843-ㄹ988ㅁ','본관_종합자료실(3층 신간도서 코너)','뮬란 : 새로운 여정','엘리자베스 림 지음 ; 성세희 옮김','라곰',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (191,'327.04-ㅅ116ㅈ','본관_종합자료실(3층 신간도서 코너)','진짜 부자 가짜 부자 : 사경인 회계사의 부자 되는 돈 공부','사경인 지음','더클래스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (192,'331.15-ㅋ282ㅌ','본관_종합자료실(3층 신간도서 코너)','타겟티드 : 당신이 누른 ‘좋아요’는 어떻게 당신을 조종하는가','브리태니 카이저 지음 ; 고영태 옮김','한빛비즈',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (193,'321.54-ㄱ247ㅌ','본관_종합자료실(3층 신간도서 코너)','태일과 함께 그늘을 걷다 : 청년들과 함께하는 노동 인문학','강성규 지음','한티재',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (194,'326.16-ㅂ214ㅌ','본관_종합자료실(3층 신간도서 코너)','트렌드를 넘는 마케팅이 온다 : 급변하는 세상에서 흔들리지 않는 마케팅 10','박기완 지음','21세기북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (195,'325.1-ㅅ646ㅍ','본관_종합자료실(3층 신간도서 코너)','파타고니아 파도가 칠 때는 서핑을 : 지구가 목적, 사업은 수단 인사이드 파타고니아','이본 쉬나드 지음 ; 이영래 옮김','라이팅하우스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (196,'326.162-ㅈ644ㅍ','본관_종합자료실(3층 신간도서 코너)','퍼스널 브랜딩에도 공식이 있다 : 주목받는 사람들의 자기표현법','조연심 지음','힘찬북',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (197,'325.1-ㄱ782ㅈ','본관_종합자료실(3층 신간도서 코너)','조직을 성공으로 이끄는 프로덕트 오너 : 쿠팡의 PO가 말하는 애자일 혁신 전략','김성한 지음','세종서적',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (198,'373.4-ㄱ928ㅎ','본관_종합자료실(3층 신간도서 코너)','하루 한마디 인문학 질문의 기적 : 문해력, 창의력, 자기주도력을 깨우는 기적의 1일 1질문 수업','김종원 지음','다산북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (199,'370.8-ㄱ654ㅎ','본관_종합자료실(3층 신간도서 코너)','학교, 민주시민교육을 실천하다! : 선거, 혐오, 미디어… 학교가 실천해야 할 시민교육의 거의 모든 것','교육정책디자인연구소 시민모임 지음','맘에드림',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (200,'325.1-ㅇ379ㅎ','본관_종합자료실(3층 신간도서 코너)','협상이 이렇게 유용할 줄이야 : 일잘러를 위한 10가지 협상의 기술|설득하지 말고 협상하라','오명호 지음','애드앤미디어',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (201,'334.3-ㅇ531ㅎ','본관_종합자료실(3층 신간도서 코너)','홈, 프라이드 홈 : 청소년 성소수자 위기지원센터 띵동','우승연 지음','아모르문디',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (202,'513.9732-ㅈ714ㄱ','본관_종합자료실(3층 신간도서 코너)','감염도시 : 대규모 전염병의 도전과 도시 문명의 미래','스티븐 존슨 지음 ; 김명남 옮김','김영사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (203,'400-ㅂ956거','본관_종합자료실(3층 신간도서 코너)','거의 모든 것의 역사','빌 브라이슨 지음 ; 이덕환 옮김','까치',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (204,'457.279-ㅇ562ㄱ','본관_종합자료실(3층 신간도서 코너)','공룡 사냥꾼 : 집착과 욕망 그리고 지구 최고의 전리품을 얻기 위한 모험','페이지 윌리엄스 지음 ; 전행선 옮김','흐름',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (205,'181.43-ㅍ25ㄱ','본관_종합자료실(3층 신간도서 코너)','기억의 과학 : 뇌과학이 말하는 기억의 비밀','찰스 퍼니휴 지음 ; 장호연 옮김','에이도스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (206,'511.4-ㄱ191ㄴ','본관_종합자료실(3층 신간도서 코너)','내 몸의 지도를 그리자 : 구글맵도 찾지 못하는 우리 몸 구조','가이도 다케루 지음 ; 요시타케 신스케 그림 ; 서혜영 옮김','니케북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (207,'194-ㅂ466ㄷ','본관_종합자료실(3층 신간도서 코너)','동물과 인간','박재학, 안나 [공] 지음','토일렛프레스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (208,'475-ㅅ136ㅁ','본관_종합자료실(3층 신간도서 코너)','(머릿속에 쏙쏙!)미생물 노트 : 곰팡이 세균 바이러스부터 식중독 감기 전염병까지','사마키 다케오 지음 ; 김정환 옮김','시그마북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (209,'476.0162-ㄹ218ㅁ','본관_종합자료실(3층 신간도서 코너)','믹스처 : 우리는 누구인가에 대한 고대 DNA의 대답','데이비드 라이크 지음 ; 김명주 옮김','동녘사이언스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (210,'843-ㅁ414ㅁ','본관_종합자료실(3층 신간도서 코너)','미움, 우정, 구애, 사랑, 결혼','앨리스 먼로 지음 ; 서정은 옮김','웅진지식하우스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (211,'811.6-ㄱ846ㅁ','본관_종합자료실(3층 신간도서 코너)','민어의 노래 : 김옥종 시집','김옥종 지음','휴먼앤북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (212,'813.6-ㅅ866ㅁ','본관_종합자료실(3층 신간도서 코너)','민주를 지켜라! : 4·19혁명 60주년 기념 소설집','신여랑...[등]지음','서해문집',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (213,'833.6-ㅅ756ㅂ','본관_종합자료실(3층 신간도서 코너)','바다로 향하는 물고기들 : 시마모토 리오 장편소설','시마모토 리오 지음 ; 김난주 옮김','해냄',2020,0,1,0);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (214,'813.6-ㅂ572ㅂ','본관_종합자료실(3층 신간도서 코너)','발칙한 수학여행 : 박현숙 장편 소설','박현숙 지음','다림',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (215,'863-ㅆ998ㅂ','본관_종합자료실(3층 신간도서 코너)','밤 끝으로의 여행 : 루이-훼르디낭 쎌린느 소설','루이 훼르디낭 쎌린느 지음 ; 이형식 옮김','최측의농간',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (216,'863-ㅈ542ㅂ','본관_종합자료실(3층 신간도서 코너)','밤의 책 : 실비 제르맹 장편소설','실비 제르맹 지음 ; 김화영 옮김','문학동네',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (217,'843-ㅁ994ㅋ','본관_종합자료실(3층 신간도서 코너)','키르케 : 매들린 밀러 장편소설','매들린 밀러 지음 ; 이은선 옮김','이봄',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (218,'843-ㅇ546ㅂ','본관_종합자료실(3층 신간도서 코너)','버지니아 울프 단편소설 전집','버지니아 울프 지음 ; 한국 버지니아 울프 학회 옮김','솔',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (219,'859.81-ㅇ277ㅂ','본관_종합자료실(3층 신간도서 코너)','베르가모의 페스트 외 : 옌스 페테르 야콥센 중단편 전집','옌스 페테르 야콥센 지음 ; 박종대 옮김','열린책들',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (220,'818-ㅈ456ㅂ','본관_종합자료실(3층 신간도서 코너)','별 하나에 어머니','정윤주 지음 ; 민트홀릭 그림','허밍버드',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (221,'833.6-ㅇ722ㅂ','본관_종합자료실(3층 신간도서 코너)','보라색 치마를 입은 여자','이마무라 나쓰코 지음 ; 홍은주 옮김','문학동네',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (222,'833.6-ㄱ351ㅂ','본관_종합자료실(3층 신간도서 코너)','분리된 기억의 세계','고바야시 야스미 지음 ; 민경욱 옮김','하빌리스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (223,'843-ㅇ245ㅂ','본관_종합자료실(3층 신간도서 코너)','브로맨스 북클럽','리사 케이 애덤스 지음 ; 최설희 옮김','황금시간',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (224,'811.6-ㅈ524ㅂ','본관_종합자료실(3층 신간도서 코너)','비스듬히 : 시인의 사물이 있는 정현종 시선집','정현종 지음','문학판',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (225,'848-ㅂ956ㅂ=2','본관_종합자료실(3층 신간도서 코너)','빌 브라이슨 발칙한 유럽산책 : 발칙한 글쟁이의 의외로 훈훈한 여행기','빌 브라이슨 지음 ; 권상미 옮김','21세기북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (226,'813.6-ㄱ841ㅂ','본관_종합자료실(3층 신간도서 코너)','빛의 제국 : 김영하 장편소설','김영하 지음','문학동네',2010,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (227,'813.6-ㅇ731ㅅ','본관_종합자료실(3층 신간도서 코너)','사람의 아들 : 이문열 장편소설','이문열 지음','RHK',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (228,'814.6-ㄱ678ㅅ','본관_종합자료실(3층 신간도서 코너)','사랑 밖의 모든 말들','김금희 지음','문학동네',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (229,'511.18099-ㅂ118ㅂ','본관_종합자료실(3층 신간도서 코너)','벤 바레스 : 어느 트랜스젠더 과학자의 자서전','벤 바레스 지음 ; 조은영 옮김','해나무',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (230,'475-ㅇ863ㅂ','본관_종합자료실(3층 신간도서 코너)','보이지 않는 권력자 : 미생물과 인간에 관하여','이재열 지음','사이언스북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (231,'443.1-ㅇ993ㅂ','본관_종합자료실(3층 신간도서 코너)','비욘드 : 인류가 다다른 세상의 한계를 넘어서다','크리스 임피 지음 ; 곽영직 옮김','시공사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (232,'331.4-ㄹ764ㅅ','본관_종합자료실(3층 신간도서 코너)','사피엔스가 장악한 행성 : 인류세가 빚어낸 인간의 역사 그리고 남은 선택','사이먼 L. 루이스, 마크 A. 매슬린 [공] 지음 ; 김아림 옮김','세종서적',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (233,'472.19-ㅎ899ㅅ=2','본관_종합자료실(3층 신간도서 코너)','생물과 무생물 사이','후쿠오카 신이치 지음 ; 김소연 옮김','은행나무',2011,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (234,'475.3-ㅇ311ㅅ','본관_종합자료실(3층 신간도서 코너)','세균, 두 얼굴의 룸메이트 : 치즈에서 코로나 바이러스까지 아이러니한 미생물의 세계','마르쿠스 에거트, 프랑크 타데우스 [공] 지음 ; 이덕임 옮김','책밥',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (235,'472-ㅇ556ㅅ','본관_종합자료실(3층 신간도서 코너)','세상에서 가장 재미있는 생물학','데이브 웨스너 글김, 래리 고닉 그림 ; 김소정 옮김','궁리',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (236,'410.9-ㄹ352ㅅ','본관_종합자료실(3층 신간도서 코너)','세상의 모든 수학 : 세상에서 가장 매혹적인 수학 강의','에르베 레닝 지음 ; 이정은 옮김','다산사이언스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (237,'410-ㅍ53ㅅ','본관_종합자료실(3층 신간도서 코너)','수학의 쓸모 : 불확실한 미래에서 보통 사람들도 답을 얻는 방법','닉 폴슨, 제임스 스콧 벨 [공] 지음 ; 노태복 옮김','더퀘스트',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (238,'813.6-ㅈ648ㅅ','본관_종합자료실(3층 신간도서 코너)','사랑하는 나의 도시','조영지, 김정규, 이삼열 [공] 지음','바른북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (239,'818-ㄱ692ㅅ','본관_종합자료실(3층 신간도서 코너)','사랑한다고 상처를 허락하지 말 것 : 나를 잃지 않고 관계를 단단하게 지켜나가기 위해','김달 지음','비에이블',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (240,'813.6-ㄱ933ㅅ','본관_종합자료실(3층 신간도서 코너)','산매리 저수지 : 아무도 몰라야 했던 16년 전의 암수살인','김주앙 지음','비티비북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (241,'843-ㅅ396ㅅ','본관_종합자료실(3층 신간도서 코너)','생사의 게임 : 시드니 셀던 장편 미스터리 소설','시드니 셀던 지음 ; 홍석연 옮김','문지사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (242,'813.6-ㄱ268ㅅ','본관_종합자료실(3층 신간도서 코너)','서른다섯, 다시 시작해 : 강혁모 장편소설','강혁모 지음','마음세상',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (243,'012.96-ㅇ627ㅅ','본관_종합자료실(3층 신간도서 코너)','서점의 말들 : 내가 정말 알아야 할 모든 것은 서점에서 배웠다','윤성근 지음','유유',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (244,'813.6-ㅂ754ㅅ','본관_종합자료실(3층 신간도서 코너)','선샤인의 완벽한 죽음 : 범유진 장편소설','범유진 지음','안전가옥',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (245,'853-ㅁ692ㅅ','본관_종합자료실(3층 신간도서 코너)','세 여인','로베르트 무질 지음 ; 강명구 옮김','민음사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (246,'813.6-ㅈ626ㅅ-1','본관_종합자료실(3층 신간도서 코너)','세 여자. 1, 20세기의 봄 : 조선희 장편소설','조선희 지음','한겨레출판사',2017,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (247,'813.6-ㅈ626ㅅ-1=2','본관_종합자료실(3층 신간도서 코너)','세 여자. 1, 20세기의 봄 : 조선희 장편소설','조선희 지음','한겨레출판사',2017,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (535,'600.13-ㅂ274ㅁ','본관_종합자료실(3층 신간도서 코너)','미술로 읽는 지식재산 : 일상생활에 깊이 스며있는 미술 작품을 통해 쉽게 풀어 쓴 지식재산 이야기','박병욱 지음','굿플러스북',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (536,'650.4-ㅅ474ㅁ','본관_종합자료실(3층 신간도서 코너)','미술시장의 탄생 : 광통교 서화사에서 백화점 갤러리까지','손영옥 지음','푸른역사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (537,'685.5-ㅇ642ㅂ','본관_종합자료실(3층 신간도서 코너)','바른 발레 생활 : 발레홀릭의 치열한 재활기','윤지영 지음','플로어웍스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (538,'653.269-ㄹ192ㅂ','본관_종합자료실(3층 신간도서 코너)','반 고흐, 꿈을 그리다 : 반 고흐의 예술과 영성','라영환 지음','피톤치드',2020,4.5,1,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (539,'991.1-ㄴ54ㅂ','본관_종합자료실(3층 신간도서 코너)','백남준 : 동서양을 호령한 예술의 칭기즈칸','남정호 지음','아르테',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (540,'670.99-ㅎ997ㅂ','본관_종합자료실(3층 신간도서 코너)','베토벤 : 삶과 철학, 작품, 수용','Sven Hiemke, 주대창, 우혜언, 이정환 [공] 지음 ; 한독음악학회 옮김','태림스코어',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (541,'654.482-ㅎ249ㅅ','본관_종합자료실(3층 신간도서 코너)','사실은 어렵지 않았어, 보태니컬아트 : 색연필 초급편','한국보태니컬아트협동조합 지음','니케',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (542,'653.11-ㅌ53ㅅ','본관_종합자료실(3층 신간도서 코너)','삶의 쉼표가 되는, 옛 그림 한 수저 : 조선의 3대 천재 화가들과 함께하는','탁현규 지음','이와우',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (543,'656.6-ㄱ934ㅅ','본관_종합자료실(3층 신간도서 코너)','소보루 카페의 달콤한 색연필 수업 : 포근포근 색연필로 그리는 따뜻하고 맛있는 행복','김주현 지음','심야책방',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (544,'670.4-ㅇ913ㅅ','본관_종합자료실(3층 신간도서 코너)','소설처럼 아름다운 클래식 이야기 : 모든 언어가 멈췄을 때 음악 한 줄기가 남았다','이채훈 지음','혜다',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (545,'695.7-ㄹ474ㅅ','본관_종합자료실(3층 신간도서 코너)','스마트 베이스볼 : 현대 야구를 지배하는 새로운 데이터','키스 로 지음 ; 김현성 옮김','두리반',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (547,'981.102-ㅇ599ㅈ','본관_종합자료실(3층 신간도서 코너)','전국일주 가이드북 : 대한민국 전국일주 여행 백과사전','유철상...[등]지음','상상',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (548,'924.03-ㅈ828ㅈ','본관_종합자료실(3층 신간도서 코너)','정복왕 윌리엄 : 노르망디 공작에서 잉글랜드 왕으로','폴 쥠토르 지음 ; 김동섭 옮김','글항아리',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (549,'911.072-ㄱ393ㅊ','본관_종합자료실(3층 신간도서 코너)','(청소년을 위한)제주 4·3','고진숙 글 ; 이해정 그림','한겨레',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (550,'598.1-ㄱ243ㅈ','본관_종합자료실(3층 신간도서 코너)','제주에서 방목육아 : 주에서 책 육아, 방목 육아하며 아이를 키운 행복한 시간','강모모 지음','좋은땅',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (551,'381.75-ㅈ374ㅈ','본관_종합자료실(3층 신간도서 코너)','조기의 한국사 : 바다에서 밥상까지 조기로드에 얽힌 맛있는 역사','정명섭 지음','들녘',2020,0,1,0);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (552,'912.072-ㅁ972ㅈ','본관_종합자료실(3층 신간도서 코너)','중일전쟁 : 역사가 망각한 그들 1937~1945','래너 미터 지음 ; 기세찬, 권성욱 [공] 옮김','글항아리',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (553,'001.07-ㅇ487ㅈ','본관_종합자료실(3층 신간도서 코너)','지성사란 무엇인가? : 역사가가 텍스트를 읽는 방법','리처드 왓모어 지음 ; 이우창 옮김','오월의봄',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (554,'549.1-ㅎ543ㄷ-2','본관_종합자료실(3층 신간도서 코너)','창덕궁, 창경궁 현판으로 읽다','최동군 지음','담디',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (555,'309.113-ㅊ496ㅊ','본관_종합자료실(3층 신간도서 코너)','책과 여행으로 만난 일본 문화 이야기','최수진 지음','세나북스',2020,4.2,1,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (556,'981.147-ㅈ284ㅊ','본관_종합자료실(3층 신간도서 코너)','춘천 : 한국의 땅과 사람에 관한 이야기','전석순 지음','21세기북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (557,'982.02-ㅇ621-1','본관_종합자료실(3층 신간도서 코너)','카페 인 유럽 = Cafe !n Europe','윤다혜...[등]지음','이지앤북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (558,'980-ㅅ294ㅍ','본관_종합자료실(3층 신간도서 코너)','(지리 덕후가 떠먹여주는)풀코스 세계지리','서지선 지음','이담북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (559,'931.1-ㅍ82ㅍ','본관_종합자료실(3층 신간도서 코너)','품위 있고 매혹적인 고대 이집트 : 전 세계의 박물관 소장품에서 선정한 유물로 읽는 문명 이야기','캠벨 프라이스 지음 ; 김지선 옮김','성안북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (560,'911.07-ㅇ951ㅎ','본관_종합자료실(3층 신간도서 코너)','한국 민중항쟁 답사기 : 광주·전남 편','이혜영 지음','내일을여는책',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (561,'911-ㅎ549ㅎ','본관_종합자료실(3층 신간도서 코너)','한중록 : 최신 언어로 읽기 쉽게 옮김한 뉴에디트 완역판, 책 읽어드립니다','혜경궁 홍씨 지음 ; 신동운 옮김','스타북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (562,'308-ㅅ174-1','본관_종합자료실(3층 신간도서 코너)','최저임금 쫌 아는 10대 : 까칠한 백수 삼촌의 최저임금 명강의','하승우 글 ; 방상호 그림','풀빛',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (563,'308-ㅅ174-2','본관_종합자료실(3층 신간도서 코너)','시장과 가격 쫌 아는 10대 : 드디어 만난, 보이지 않는 손','석혜원 지음 ; 신병근 그림','풀빛',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (564,'308-ㅅ174-3','본관_종합자료실(3층 신간도서 코너)','국제거래와 환율 쫌 아는 10대 : 하나 된 세계 시장 속 우리','석혜원 글 ; 신병근 그림','풀빛',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (565,'308-ㅅ174-4','본관_종합자료실(3층 신간도서 코너)','유튜브 쫌 아는 10대 : 즐기는 사용자 + 의로운 감시자 되기','금준경 글 ; 하루치 그림','풀빛',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (566,'219-ㄱ766ㅅ','본관_종합자료실(3층 신간도서 코너)','신화 콘서트 : 통으로 읽는 세계 7대 신화 = (The)Concert of Mythology','김상훈 지음 ; 조금희 그림','행복한작업실',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (567,'220.4-ㄱ382ㅇ','본관_종합자료실(3층 신간도서 코너)','(태백산 선지식의)영원한 행복 : 고우 스님 법문','고우 지음 ; 박희승 정리','어의운하',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (568,'234.8-ㅈ676ㅇ','본관_종합자료실(3층 신간도서 코너)','왜 낙심하는가? : 어떤 상황에도 은혜는 가까이 있다','조정민 지음','두란노서원',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (569,'234.8-ㄱ425ㅇ','본관_종합자료실(3층 신간도서 코너)','인피니트 웨이 : ^걸림없는 삶^을 위한 필요충분조건','조엘 골드스미스 지음 ; 유영일, 이순임 [공] 옮김','올리브나무',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (570,'200-ㄱ753ㅈ','본관_종합자료실(3층 신간도서 코너)','종교가 나에게 말을 걸어올 때 : 죽음, 삶에 답하다','김봉현 지음','넥서스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (571,'231.1-ㄱ717ㅎ','본관_종합자료실(3층 신간도서 코너)','하나님은 반드시 있다 : 하나님과 인간의 만남 편','김동환 지음','하임',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (572,'220.911-ㅈ384ㅎ','본관_종합자료실(3층 신간도서 코너)','한국 불교사','정병삼 지음','푸른역사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (573,'001.3-ㅊ168-1','본관_종합자료실(3층 신간도서 코너)','<자본>에 대한 노트','세르게이 에이젠슈테인, 알렉산더 클루게 [공] 지음 ; 김수환, 유운성 [공] 옮김','문학과지성사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (574,'372.68-ㄱ873ㅅ','본관_종합자료실(3층 신간도서 코너)','10대, 인생을 바꾸는 진로 수업','김은희 지음','미다스북스',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (575,'199.5-ㅅ154ㄱ','본관_종합자료실(3층 신간도서 코너)','(10대를 위한)그릿 : 청소년을 위한 꿈과 자신감의 비결','매슈 사이드 지음 ; 장혜진 옮김 ; 토비 트라이엄프 그림','다산에듀',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (576,'331.4-ㅇ554ㅇ','본관_종합자료실(3층 신간도서 코너)','2050 거주불능 지구 : 한계치를 넘어 종말로 치닫는 21세기 기후재난 시나리오','데이비드 월러스 웰즈 지음 ; 김재경 옮김','추수밭',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (577,'911.0745-ㅋ588ㅇ=2','본관_종합자료실(3층 신간도서 코너)','5.18 푸른 눈의 증인 : 폴 코트라이트 회고록','폴 코트라이트 글 ; 최용주 역','한림',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (578,'199.7-ㅅ724ㅇ','본관_종합자료실(3층 신간도서 코너)','50 이후, 인생을 결정하는 열 가지 힘 : 하버드 심리학 거장의 마지막 강의','B. F. 스키너, 마거릿 E. 본 [공] 지음 ; 이시형 옮김','더퀘스트',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (579,'325.21-ㅂ464ㅇ','본관_종합자료실(3층 신간도서 코너)','5060 스타트업으로 날다 : 생생한 know-how를 담은 스타트업 성공지침서','박재승 지음','바른북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (580,'325.04-ㄱ738ㅍ','본관_종합자료실(3층 신간도서 코너)','80년생 김 팀장과 90년생 이 대리가 웃으며 일하는 법 : 자꾸 눈치 보게 되는 90년생과 일로 행복해지는 비결','김범준 지음','한빛비즈',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (581,'325.04-ㅂ478ㅎ','본관_종합자료실(3층 신간도서 코너)','휴탈리티 : AI시대 사람의 조건 = Hutality','박정열 지음','한국경제신문',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (582,'321.89-ㅁ378ㄱ','본관_종합자료실(3층 신간도서 코너)','가난 사파리 : 하층계급은 왜 분노하는가?','대런 맥가비 지음 ; 김영선 옮김','돌베개',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (583,'330.4-ㅈ294ㄱ','본관_종합자료실(3층 신간도서 코너)','각자도생 사회 : 어설픈 책임 대신 내 행복 채우는 저성장 시대의 대표 생존 키워드','전영수 지음','블랙피쉬',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (584,'325.1-ㅅ942ㄱ','본관_종합자료실(3층 신간도서 코너)','게으르지만 콘텐츠로 돈은 잘 법니다 : 자본 없이 콘텐츠로 10억 번 게으른 고수의 성공 비결','신태순 지음','나비의활주로',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (585,'666-ㅇ646ㅇ','본관_종합자료실(3층 신간도서 코너)','어떻게 하면 사진을 잘 찍을 수 있나요? : 누구가 쉽게 좋은 사진 찍는 9가지 기술','윤한혁 지음','미다스북스',2020,3.4,1,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (586,'671.57-ㅇ655ㅇ','본관_종합자료실(3층 신간도서 코너)','어쩌다 보니 재즈를 듣게 되었습니다 : 인문쟁이의 재즈 수업','이강휘 지음','42미디어콘텐츠',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (587,'653-ㅂ126ㅇ','본관_종합자료실(3층 신간도서 코너)','엄마와 함께하는 세계명화수업 : 우리 아이 창의력 높여주는 미술 이야기','프랑수아즈 바르브 갈 지음 ; 이상해 옮김','미디어샘',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (588,'656.6-ㄱ271ㅇ','본관_종합자료실(3층 신간도서 코너)','연필 스케치 마스터 컬렉션','아서 L. 겁틸 지음 ; 수전 E. 메이어 엮음 ; 권루시안 옮김','진선아트북',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (589,'600.1-ㅇ452ㅇ','본관_종합자료실(3층 신간도서 코너)','예술적 상상력','오종우 지음','어크로스',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (590,'650.4-ㅊ754ㅇ','본관_종합자료실(3층 신간도서 코너)','우리 각자의 미술관 : 지식 없이 즐기는 그림 감상 연습 = (A)Museum of one''s own','최혜진 지음','휴머니스트',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (591,'601-ㄴ37ㅇ','본관_종합자료실(3층 신간도서 코너)','운명의 그림 : 명화로 풀어내는 삶의 불가사의한 이야기','나카노 교코 지음 ; 최재혁 옮김','세미콜론',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (592,'650.8-ㅌ96ㅇ','본관_종합자료실(3층 신간도서 코너)','웨인 티보 달콤한 풍경 : 웨인 티보가 그린 디저트와 도시','웨인 티보 지음 ; 강수정 옮김','에이치비 프레스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (593,'657.3-ㅈ596ㅇ','본관_종합자료실(3층 신간도서 코너)','웹툰 콘티 연출 : 웹툰 시나리오 콘티 연출 완성을 위한 테크닉 총서','조득필 지음','한국경제신문i',2020,2.5,1,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (594,'657.3-ㅎ623ㅇ','본관_종합자료실(3층 신간도서 코너)','웹툰스쿨 : 웹툰 창작과 스토리 작법에 관한 모든 것','홍난지, 이종범 [공] 지음','시공아트',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (595,'001.3-ㅋ796ㅇ','본관_종합자료실(3층 신간도서 코너)','의자의 배신 : 편리함은 어떻게 인류를 망가뜨리는가','바이바 크레건리드 지음 ; 고현석 옮김','아르테',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (596,'695.7099-ㅈ382ㅇ','본관_종합자료실(3층 신간도서 코너)','이광환 야구 이야기 : 한국야구의 교육자 이광환 평전','정범준 지음','기파랑',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (597,'688.04-ㅇ716ㅇ','본관_종합자료실(3층 신간도서 코너)','이동진이 말하는 봉준호의 세계 : ''기생충''부터 ''플란다스의 개''까지 봉준호의 모든 순간','이동진 지음','위즈덤하우스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (598,'653.11-ㅇ763ㅈ','본관_종합자료실(3층 신간도서 코너)','전통미술의 감상과 교육','이성도, 전성수, 신영호, 이인숙, 김향미, 장지성, 박소영, 모인순, 류재만, 고홍규, 손명선, 심영옥 지음','교육과학사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (599,'650.9-ㅇ643ㅈ','본관_종합자료실(3층 신간도서 코너)','조선 그림과 서양명화, 같은 시대 다른 예술','윤철규 지음','마로니에북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (600,'654.35-ㅈ384ㅊ','본관_종합자료실(3층 신간도서 코너)','(세계를 담은 조선의 정물화)책거리','정병모 지음','다할미디어',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (601,'609-ㄱ318ㅌ','본관_종합자료실(3층 신간도서 코너)','타자들의 삶 : 큐레이터 고경옥의 미술 읽기','지은이: 고경옥','글누림',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (602,'517.89-ㅂ738ㅌ','본관_종합자료실(3층 신간도서 코너)','트레이너가 알아야 할 모든것','백형진 지음','예방의학사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (603,'308-ㅅ174-5','본관_종합자료실(3층 신간도서 코너)','젠트리피케이션 쫌 아는 10대 : 도시야, 내쫓기는 사람들의 둥지가 되어 줄래?','장성익 글 ; 신병근 그림','풀빛',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (323,'843-ㄹ246ㅇ','본관_종합자료실(3층 신간도서 코너)','우린 괜찮아','니나 라쿠르 지음 ; 이진 옮김','든',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (324,'813.6-ㄱ736ㅈ','본관_종합자료실(3층 신간도서 코너)','지구 행성에서 너와 내가, 김민경 장편소설','김민경 지음','사계절',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (325,'813.6-ㄱ918ㅅ','본관_종합자료실(3층 신간도서 코너)','세계 최고령 기업의 비밀 : 직원 평균 나이 75살','김정진 지음','행복에너지',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (326,'594.5547-ㅅ794ㄴ','본관_종합자료실(3층 신간도서 코너)','나의 첫 와인 공부','신규영 지음','한국경제신문i',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (327,'517.3-ㅇ225ㄴ','본관_종합자료실(3층 신간도서 코너)','나이 들지 않는 절대 원칙 : 상위 1퍼센트 항노화 시크릿','안지현 지음','비타북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (328,'516.98-ㅅ626ㄴ','본관_종합자료실(3층 신간도서 코너)','남자의 인생은 갱년기에 뒤바뀐다 : 세계 최고의 남성의학 전문가가 알려주는 남성갱년기 탈출처방전','클로드 쇼샤르, 클로드 달 [공] 지음 ; 양진성 옮김','마음서재',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (329,'598.1-ㅇ798ㄴ','본관_종합자료실(3층 신간도서 코너)','내향 육아 : 어느 조용하고 강한 내향적인 엄마의 육아 이야기','이연진 지음','위즈덤하우스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (330,'818-ㅇ755ㄴ','본관_종합자료실(3층 신간도서 코너)','너의 목소리가 보일 때까지 : 이샛별 감성·육아 에세이','이샛별 지음','생각나눔',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (331,'598.4-ㅇ746ㄴ','본관_종합자료실(3층 신간도서 코너)','(내 아이의 잠재력을 폭발적으로 성장시키는)놀이의 힘','EBS 놀이의 힘 제작진 지음','성안당',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (332,'598.132-ㄱ217ㄷ','본관_종합자료실(3층 신간도서 코너)','도대체 우리 아들은 왜 저럴까? : 엄마는 편하고 아들은 똑똑해지는 몬테소리 홈스쿨링','간나리 미키 지음 ; 이혜윤 옮김','미스터제이',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (333,'594.5546-ㅎ665ㄷ','본관_종합자료실(3층 신간도서 코너)','디저트 데이즈 : 블렌디가 소개하는 파리의 베이킹','홍은경 지음','책밥',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (334,'491.59-ㅎ573ㅁ','본관_종합자료실(3층 신간도서 코너)','말하지 않고 동물과 대화하는 법 : 동물과 마음을 나누고 싶은 당신을 위한 실질적인 가이드','피 호슬리 지음 ; 정지인 옮김','김영사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (335,'511.5-ㄱ785ㅁ','본관_종합자료실(3층 신간도서 코너)','면역력 키우는 장내 미생물 : 바이러스 공포 이겨내는 방법','김세현 지음','지식과감성#',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (336,'594.5-ㅂ224ㅁ','본관_종합자료실(3층 신간도서 코너)','모두의 고수','박누리 지음','맛있는책방',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (337,'594.5-ㅇ616ㅁ','본관_종합자료실(3층 신간도서 코너)','미수타육의 집밥, 나도 한 번 따라 해보고 싶은 한 그릇 요리','육인식 지음','나무수',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (338,'525.4-ㅇ298ㅂ','본관_종합자료실(3층 신간도서 코너)','봉다리 텃밭 : 100원짜리 무공해 무농약','엄지원 지음','청출판',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (339,'378.9-ㄱ995ㅂ','본관_종합자료실(3층 신간도서 코너)','부모가 되어 가는 중입니다 : 성장하는 엄마 아빠를 위한 발도르프 공부','김훈태 지음','유유',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (340,'593.2-ㅇ842ㅂ','본관_종합자료실(3층 신간도서 코너)','(건강한 피부와 숨 쉬는 모공을 만드는)블랙헤드 홈케어 : 국내 최초 블랙헤드 전문가 이은미의 관리 노하우','이은미 지음','북스고',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (493,'840.9-ㅋ862ㅇ','본관_종합자료실(3층 신간도서 코너)','알코올과 작가들 : 위대한 작가들의 영혼을 사로잡은 음주 열전','그렉 클라크, 몬티 보챔프 지음 ; 이재욱 옮김','을유문화사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (494,'985.02-ㅎ787ㅇ','본관_종합자료실(3층 신간도서 코너)','에콰도르 : 풍성한 삶(Sumak Kawsay)으로 가는 길','황정한 지음','공터',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (495,'981.102-ㅎ239ㅇ-2','본관_종합자료실(3층 신간도서 코너)','여행자의 방. 2 : 머물고 싶은 그 곳','한국관광공사 지음','두사람',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (496,'919.1-ㅋ812ㅇ','본관_종합자료실(3층 신간도서 코너)','역사는 수메르에서 시작되었다 : 인류 역사상 ''최초'' 39가지','새뮤얼 노아 크레이머 지음 ; 박성식 옮김','가람기획',2018,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (497,'919.1-ㅋ812ㅇ=2','본관_종합자료실(3층 신간도서 코너)','역사는 수메르에서 시작되었다 : 인류 역사상 ''최초'' 39가지','새뮤얼 노아 크레이머 지음 ; 박성식 옮김','가람기획',2018,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (498,'919.1-ㅋ812ㅇ=3','본관_종합자료실(3층 신간도서 코너)','역사는 수메르에서 시작되었다 : 인류 역사상 ''최초'' 39가지','새뮤얼 노아 크레이머 지음 ; 박성식 옮김','가람기획',2018,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (499,'982.02-ㅇ757ㅇ','본관_종합자료실(3층 신간도서 코너)','예술과 함께 유럽의 도시를 걷다','이석원 지음','책밥',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (500,'653.11-ㅊ538ㅇ','본관_종합자료실(3층 신간도서 코너)','옛 그림으로 본 서울 : 서울을 그린 거의 모든 그림','최열 지음','혜화1117',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (501,'409-ㅇ561ㅇ','본관_종합자료실(3층 신간도서 코너)','완벽주의자들 : 허용오차 제로를 향한 집요하고 위대한 도전','사이먼 윈체스터 지음 ; 공경희 옮김','북라이프',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (502,'818-ㅈ632ㅇ','본관_종합자료실(3층 신간도서 코너)','우당탕탕 엄마의 캠핑카 : 미대륙 9,000킬로미터 세 남매 성장기','조송이 지음','가디언',2020,3.2,1,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (503,'922-ㅋ386ㅇ','본관_종합자료실(3층 신간도서 코너)','위대하고 찬란한 고대 로마','버지니아 L. 캠벨 지음 ; 김지선 옮김','성안북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (504,'001.3-ㅇ639ㅇ','본관_종합자료실(3층 신간도서 코너)','유럽 인문 산책 : 느리게 걷고 깊게 사유하는 길','윤재웅 지음','은행나무',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (505,'982.802-ㅇ542ㅇ','본관_종합자료실(3층 신간도서 코너)','이탈리아를 만나면 세상은 이야기가 된다 : 밀라노에서 몰타까지 아내와 함께 떠난 21일간의 여행','우태영 글','선',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (506,'921-ㅅ688ㅇ','본관_종합자료실(3층 신간도서 코너)','인류 문명의 보물 고대 그리스 : 전 세계의 박물관 소장품에서 선정한 유물로 읽는 문명 이야기','데이비드 마이클 스미스 지음 ; 김지선 옮김','성안북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (507,'518-ㅈ426ㅇ','본관_종합자료실(3층 신간도서 코너)','인류에게 필요한 11가지 약 이야기 : 항바이러스제에서 신경안정제까지,인류에게 희망과 미래를 열어준 치료약의 역사','정승규 지음','반니',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (508,'350.83-ㅈ714ㅈ','본관_종합자료실(3층 신간도서 코너)','재난의 세계사 : 미래의 자연재해에 맞서기 위한 과거로부터의 교훈','루시 존스 지음 ; 권예리 옮김','눌와',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (509,'813.6-ㅈ374ㅈ','본관_종합자료실(3층 신간도서 코너)','저수지의 아이들','정명섭 지음','생각학교',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (510,'104-ㅋ384ㅅ','본관_종합자료실(3층 신간도서 코너)','심연호텔의 철학자들','존 캐그 지음 ; 전대호 옮김','필로소픽',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (511,'186-ㄱ873ㅅ','본관_종합자료실(3층 신간도서 코너)','(십 대를 위한)쓰담쓰담 마음 카페 : 따뜻하게 위로하고 시원하게 코칭해 주는 상담 카페','김은재 지음','사계절',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (512,'199.1-ㄴ55ㅇ','본관_종합자료실(3층 신간도서 코너)','아빠가 딸에게 전하는 삶의 지혜, 현명한 부자의 자본주의 수업','낯선 곳에서의 아침 지음','연필',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (513,'189.1-ㅅ746ㅇ','본관_종합자료실(3층 신간도서 코너)','알아차림 : 현존의 과학 · 현존의 수행, 명상 수행의 혁명','대니얼 J. 시겔 지음 ; 윤승서, 이지안 [공] 옮김','불광출판사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (514,'818-ㅇ955ㅇ','본관_종합자료실(3층 신간도서 코너)','우리는 비 온 뒤를 걷는다 : 눅눅한 마음을 대하는 정신과 의사의 시선','이효근 지음','알에이치코리아',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (515,'181.71-ㅂ794ㅇ','본관_종합자료실(3층 신간도서 코너)','우리는 왜 이별했을까? : 사랑과 이별을 읽어주는 감정철학','아론 벤지이브 지음 ; 김현주 옮김','파우제',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (516,'001.3-ㄱ928ㅇ','본관_종합자료실(3층 신간도서 코너)','인문학적 성장을 위한 8개의 질문 : 창조적 일상으로 이끄는 김종원의 사색 에세이','김종원 지음','나무생각',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (517,'818-ㄱ782ㅇ','본관_종합자료실(3층 신간도서 코너)','있는 모습 그대로 내가 좋아','김성희 지음','박영story',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (518,'199.1-ㅂ958ㅈ','본관_종합자료실(3층 신간도서 코너)','절제의 기술 : 유혹의 시대를 이기는 5가지 삶의 원칙 = The Joy of Missing Out: The Art of Self-Restraint in an Age of Excess','스벤 브링크만 지음 ; 강경이 옮김','다산북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (519,'181.53-ㅇ957ㅈ','본관_종합자료실(3층 신간도서 코너)','지금 시작하는 생각 인문학','이화선 지음','비즈니스북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (520,'189.2-ㅍ82ㅊ','본관_종합자료실(3층 신간도서 코너)','친밀한 타인들 : 소중한 사람과 더 가까워지는 관계심리학','조반니 프라체토 지음 ; 이수경 옮김','프런티어',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (521,'199.1-ㅇ533ㅎ','본관_종합자료실(3층 신간도서 코너)','혼자가 되어야만 얻을 수 있는 것 : 내가 아닌 것을 덜어내는 56가지 선택과 집중','우에니시 아키라 지음 ; 김지윤 옮김','포레스트북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (522,'201-ㄹ348ㄱ','본관_종합자료실(3층 신간도서 코너)','과학은 모든 것을 설명할 수 있을까?','존 레녹스 지음 ; 홍병룡 옮김','아바서원',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (523,'181.71-ㅁ742ㄴ','본관_종합자료실(3층 신간도서 코너)','나는 오늘 자유로워지기로 했다 : 죄책감 새롭게 보기','문종원 지음','성바오로',2020,0,1,0);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (524,'233-ㅇ318ㄷ','본관_종합자료실(3층 신간도서 코너)','다시, 성경으로','레이첼 헬드 에반스 지음 ; 칸앤메리 옮김','바람이불어오는곳',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (525,'818-ㅂ178ㄷ','본관_종합자료실(3층 신간도서 코너)','돌이 듣는다','박경전 지음 ; 박은명 그림','지식과감성',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (526,'234.8-ㅇ828ㅂ','본관_종합자료실(3층 신간도서 코너)','부활, 죽음의 두려움이 영원한 소망으로 바뀌는 시간','이용규, 김상철 [공] 지음','규장',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (527,'231.1-ㅅ698ㅅ','본관_종합자료실(3층 신간도서 코너)','신은 존재하는가 : 세계와 우리, 존재의 기원과 과정과 목적을 논증하다','리처드 스윈번 지음 ; 강영안, 신주영 [공] 옮김','복있는사람',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (528,'662-ㅎ271ㄴ','본관_종합자료실(3층 신간도서 코너)','내 손에 인생사진 : 스마트폰 사진의 기술','한다솜 지음','42미디어콘텐츠',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (529,'610.4-ㅇ618ㄴ','본관_종합자료실(3층 신간도서 코너)','내가 사랑한 공간들','윤광준 지음','을유문화사',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (604,'408-ㄱ433-1','본관_종합자료실(3층 신간도서 코너)','인공지능 쫌 아는 10대 : 인공지능, 네 정체를 밝혀라','오승현 글 ; 방상호 그림','풀빛',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (605,'408-ㄱ433-2','본관_종합자료실(3층 신간도서 코너)','물질 좀 아는 10대 : 물질씨, 어떻게 세상을 이루었나요?','장홍제 글 ; 방상호 그림','풀빛',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (606,'408-ㄱ433-3','본관_종합자료실(3층 신간도서 코너)','환경과 생태 쫌 아는 10대','최원형 글 ; 방상호 그림','풀빛',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (607,'408-ㄱ433-4','본관_종합자료실(3층 신간도서 코너)','빅뱅 쫌 아는 10대 : 우주론 카페 빅뱅에 온 걸 환영합니다','이지유 지음','풀빛',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (608,'408-ㄱ433-5','본관_종합자료실(3층 신간도서 코너)','빛 쫌 아는 10대 : 우리는 모두 빛의 후예','고재현 글 ; 방상호 그림','풀빛',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (609,'863-ㅂ774ㅁ','본관_종합자료실(3층 신간도서 코너)','마녀, 요정 그리고 공주 : 다 알지만 잘 모르는 이야기','조제프 베르노 지음 ; 이정주 옮김','지학사 아르볼',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (610,'863-ㅂ774ㅇ','본관_종합자료실(3층 신간도서 코너)','영웅, 왕자 그리고 기사 : 다 알지만 잘 모르는 이야기','조제프 베르노 지음 ; 최정수 옮김','아르볼',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (611,'331.47-ㅇ614ㄷ=3','본관_종합자료실(3층 신간도서 코너)','도시는 무엇으로 사는가 : 도시를 보는 열다섯 가지 인문적 시선','유현준 지음','을유문화사',2018,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (612,'331.47-ㅇ614ㄷ=2','본관_종합자료실(3층 신간도서 코너)','도시는 무엇으로 사는가 : 도시를 보는 열다섯 가지 인문적 시선','유현준 지음','을유문화사',2018,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (613,'499.9-ㅁ538ㅌ','본관_종합자료실(3층 신간도서 코너)','털 없는 원숭이 : 동물학적 인간론','데즈먼드 모리스 지음 ; 김석희 옮김','문예춘추사',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (73,'843-ㅇ385ㄱ','본관_종합자료실(3층 신간도서 코너)','그들이 가지고 다닌 것들 : 장편소설','팀 오브라이언 지음 ; 이승학 옮김','섬과 달',2020,3.4,2,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (530,'653.42-ㄱ836ㄴ','본관_종합자료실(3층 신간도서 코너)','내가 열어본 조지아 오키프의 옷장 : No.2 조지아 오키프를 찾아가는 길','김영일 지음','UB＆co',2019,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (531,'592.01-ㅎ115ㄷ','본관_종합자료실(3층 신간도서 코너)','Daily look 365 : 아침에 따라 입기만 하면 끝!','Hana 지음 ; 김현영 옮김','티나',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (532,'699.7-ㅅ248ㄹ','본관_종합자료실(3층 신간도서 코너)','루어낚시의 맛 : 한 번도 낚시를 해보지 않은 분들을 위한 루어낚시 안내서 = Lure fisfing','서성모 지음 ; 탁영호 그림','황금시간',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (533,'688.04-ㅅ782ㅁ','본관_종합자료실(3층 신간도서 코너)','명장면으로 한국영화 읽기','신강호 지음','커뮤니케이션북스',2020,0,0,1);
Insert into BLIBRARY.BOOK (SERIALNUMBER,CALLNUMBER,LOCATION,BOOKNAME,AUTHOR,PUBLISHER,YEAR,RATING,CHECKCOUNT,STOCK) values (534,'698.2-ㅇ285ㅁ','본관_종합자료실(3층 신간도서 코너)','무예도 = The way of discipline art','양성오 지음','북랩',2020,0,0,1);
REM INSERTING into BLIBRARY.BOOKED_BOOK
SET DEFINE OFF;
Insert into BLIBRARY.BOOKED_BOOK (ID,SERIALNUMBER,BOOKNAME,REGDATE,EXPIREDATE) values ('111',8,'그때 그렇게 말해서 미안해 : 말하고 돌아서서 후회하는 사람들을 위한 대화법',to_date('21/05/06','RR/MM/DD'),to_date('21/05/11','RR/MM/DD'));
Insert into BLIBRARY.BOOKED_BOOK (ID,SERIALNUMBER,BOOKNAME,REGDATE,EXPIREDATE) values ('111',551,'조기의 한국사 : 바다에서 밥상까지 조기로드에 얽힌 맛있는 역사',to_date('21/05/06','RR/MM/DD'),to_date('21/05/11','RR/MM/DD'));
Insert into BLIBRARY.BOOKED_BOOK (ID,SERIALNUMBER,BOOKNAME,REGDATE,EXPIREDATE) values ('111',213,'바다로 향하는 물고기들 : 시마모토 리오 장편소설',to_date('21/05/06','RR/MM/DD'),to_date('21/05/11','RR/MM/DD'));
Insert into BLIBRARY.BOOKED_BOOK (ID,SERIALNUMBER,BOOKNAME,REGDATE,EXPIREDATE) values ('hhm0415',523,'나는 오늘 자유로워지기로 했다 : 죄책감 새롭게 보기',to_date('21/05/04','RR/MM/DD'),to_date('21/05/09','RR/MM/DD'));
Insert into BLIBRARY.BOOKED_BOOK (ID,SERIALNUMBER,BOOKNAME,REGDATE,EXPIREDATE) values ('소해',99,'꽃잎처럼 : 정도상 장편소설',to_date('21/04/30','RR/MM/DD'),to_date('21/05/04','RR/MM/DD'));
REM INSERTING into BLIBRARY.MANAGERINFO
SET DEFINE OFF;
Insert into BLIBRARY.MANAGERINFO (MANAGERID,MANAGERPW) values ('manager','manager');
REM INSERTING into BLIBRARY.MEMBER
SET DEFINE OFF;
Insert into BLIBRARY.MEMBER (ID,PASSWORD,NAME,ADDRESS,PHONE,HINT) values ('비트','112','김비트','홍대','010-9999-9999','신촌');
Insert into BLIBRARY.MEMBER (ID,PASSWORD,NAME,ADDRESS,PHONE,HINT) values ('혜민','1234','홍혜민','화곡','010-1111-1111','제주도');
Insert into BLIBRARY.MEMBER (ID,PASSWORD,NAME,ADDRESS,PHONE,HINT) values ('소해','123','김소해','신촌','010-1234-5678','부산');
REM INSERTING into BLIBRARY.ROOMS
SET DEFINE OFF;
Insert into BLIBRARY.ROOMS (ROOMID,ROOMNAME,ROWCOUNT,COLCOUNT,SEATCOUNT,USETIME) values (1,'바다',8,8,64,3);
Insert into BLIBRARY.ROOMS (ROOMID,ROOMNAME,ROWCOUNT,COLCOUNT,SEATCOUNT,USETIME) values (2,'하늘',3,3,9,3);
Insert into BLIBRARY.ROOMS (ROOMID,ROOMNAME,ROWCOUNT,COLCOUNT,SEATCOUNT,USETIME) values (3,'구름',3,3,9,3);
REM INSERTING into BLIBRARY.SEATS
SET DEFINE OFF;
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (3,'A1','0',3,'3A1',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (3,'A2','0',3,'3A2',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (3,'A3','0',3,'3A3',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (3,'B1','0',3,'3B1',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (3,'B2','0',3,'3B2',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (3,'B3','0',3,'3B3',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (3,'C1','0',3,'3C1',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (3,'C2','0',3,'3C2',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (3,'C3','0',3,'3C3',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (2,'A2','0',3,'2A2',null,to_timestamp('21/05/06 18:06:45.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (2,'A3','0',3,'2A3',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (2,'B1','0',3,'2B1',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (2,'B2','0',3,'2B2',null,to_timestamp('21/05/06 23:17:08.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (2,'B3','0',3,'2B3',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (2,'C1','0',3,'2C1',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (2,'C2','0',3,'2C2',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (2,'C3','0',3,'2C3',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'A1','0',3,'1A1',null,to_timestamp('21/05/06 17:57:40.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'A2','1',3,'1A2',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'A3','0',3,'1A3',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'A4','1',3,'1A4',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'A5','0',3,'1A5',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'A6','1',3,'1A6','111',to_timestamp('21/05/06 21:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'A7','0',3,'1A7',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'A8','1',3,'1A8',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'B1','0',3,'1B1',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'B2','1',3,'1B2',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'B3','0',3,'1B3',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'B4','1',3,'1B4',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'B5','0',3,'1B5',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'B6','1',3,'1B6',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'B7','0',3,'1B7',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'B8','1',3,'1B8',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'C1','0',3,'1C1',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'C2','1',3,'1C2',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'C3','0',3,'1C3',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'C4','1',3,'1C4',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'C5','0',3,'1C5',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'C6','1',3,'1C6',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'C7','0',3,'1C7',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'C8','1',3,'1C8',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'D1','0',3,'1D1',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'D2','1',3,'1D2',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'D3','0',3,'1D3',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'D4','1',3,'1D4',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'D5','0',3,'1D5',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'D6','1',3,'1D6',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'D7','0',3,'1D7',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'D8','1',3,'1D8',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'E1','0',3,'1E1',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'E2','1',3,'1E2',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'E3','0',3,'1E3',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'E4','1',3,'1E4',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'E5','0',3,'1E5',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'E6','1',3,'1E6',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'E7','0',3,'1E7',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'E8','1',3,'1E8',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'F1','0',3,'1F1',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'F2','1',3,'1F2',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'F3','0',3,'1F3',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'F4','1',3,'1F4',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'F5','0',3,'1F5',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'F6','1',3,'1F6',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'F7','0',3,'1F7',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'F8','1',3,'1F8',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'G1','0',3,'1G1',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'G2','1',3,'1G2',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'G3','0',3,'1G3',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'G4','1',3,'1G4',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'G5','0',3,'1G5',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'G6','1',3,'1G6',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'G7','0',3,'1G7',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'G8','1',3,'1G8',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'H1','0',3,'1H1',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'H2','1',3,'1H2',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'H3','0',3,'1H3',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'H4','1',3,'1H4',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'H5','0',3,'1H5',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'H6','1',3,'1H6',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'H7','0',3,'1H7',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (1,'H8','1',3,'1H8',null,null);
Insert into BLIBRARY.SEATS (ROOMID,SEATCODE,RV_OR_NOT,USETIME,SEATID,USERID,EXPTIME) values (2,'A1','0',3,'2A1',null,null);
REM INSERTING into BLIBRARY.VW_BOOK
SET DEFINE OFF;
Insert into BLIBRARY.VW_BOOK (CHECKCOUNT,REGDATE,BOOKNAME,SERIALNUMBER) values (1,to_date('21/05/06','RR/MM/DD'),'그때 그렇게 말해서 미안해 : 말하고 돌아서서 후회하는 사람들을 위한 대화법',8);
Insert into BLIBRARY.VW_BOOK (CHECKCOUNT,REGDATE,BOOKNAME,SERIALNUMBER) values (1,to_date('21/05/06','RR/MM/DD'),'조기의 한국사 : 바다에서 밥상까지 조기로드에 얽힌 맛있는 역사',551);
Insert into BLIBRARY.VW_BOOK (CHECKCOUNT,REGDATE,BOOKNAME,SERIALNUMBER) values (1,to_date('21/05/06','RR/MM/DD'),'바다로 향하는 물고기들 : 시마모토 리오 장편소설',213);
Insert into BLIBRARY.VW_BOOK (CHECKCOUNT,REGDATE,BOOKNAME,SERIALNUMBER) values (1,to_date('21/05/04','RR/MM/DD'),'나는 오늘 자유로워지기로 했다 : 죄책감 새롭게 보기',523);
Insert into BLIBRARY.VW_BOOK (CHECKCOUNT,REGDATE,BOOKNAME,SERIALNUMBER) values (3,to_date('21/04/30','RR/MM/DD'),'꽃잎처럼 : 정도상 장편소설',99);
--------------------------------------------------------
--  DDL for Index BOOKED_BOOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLIBRARY"."BOOKED_BOOK_PK" ON "BLIBRARY"."BOOKED_BOOK" ("SERIALNUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BOOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLIBRARY"."BOOK_PK" ON "BLIBRARY"."BOOK" ("SERIALNUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLIBRARY"."MEMBER_PK" ON "BLIBRARY"."MEMBER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index READINGROOM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLIBRARY"."READINGROOM_PK" ON "BLIBRARY"."ROOMS" ("ROOMID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SEATS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLIBRARY"."SEATS_PK" ON "BLIBRARY"."SEATS" ("SEATID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BOOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLIBRARY"."BOOK_PK" ON "BLIBRARY"."BOOK" ("SERIALNUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BOOKED_BOOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLIBRARY"."BOOKED_BOOK_PK" ON "BLIBRARY"."BOOKED_BOOK" ("SERIALNUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLIBRARY"."MEMBER_PK" ON "BLIBRARY"."MEMBER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index READINGROOM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLIBRARY"."READINGROOM_PK" ON "BLIBRARY"."ROOMS" ("ROOMID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SEATS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLIBRARY"."SEATS_PK" ON "BLIBRARY"."SEATS" ("SEATID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger CREATE_SEAT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "BLIBRARY"."CREATE_SEAT" 
AFTER INSERT ON ROOMS 
FOR EACH ROW


BEGIN
  FOR I IN 1.. :NEW.ROWCOUNT LOOP
    FOR J IN 1.. :NEW.COLCOUNT LOOP
        INSERT INTO SEATS (ROOMID, SEATCODE, SEATID, USERID, EXPTIME,USETIME)
        VALUES (:NEW.ROOMID, CHR(64+I)||J, :NEW.ROOMID||CHR(64+I)||J, NULL, NULL,3);
        END LOOP;
  END LOOP;
END;
/
ALTER TRIGGER "BLIBRARY"."CREATE_SEAT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DELETROOMANDSEATS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "BLIBRARY"."DELETROOMANDSEATS" 
AFTER DELETE ON ROOMS
FOR EACH ROW
BEGIN
  DELETE FROM SEATS
  WHERE ROOMID = :OLD.ROOMID;
END;
/
ALTER TRIGGER "BLIBRARY"."DELETROOMANDSEATS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INSERT_USETIME
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "BLIBRARY"."INSERT_USETIME" 
AFTER INSERT ON ROOMS 
FOR EACH ROW
BEGIN
    UPDATE SEATS SET USETIME = :NEW.USETIME ;
END;

/
ALTER TRIGGER "BLIBRARY"."INSERT_USETIME" DISABLE;
--------------------------------------------------------
--  DDL for Trigger UPDATE_USETIME
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "BLIBRARY"."UPDATE_USETIME" 
AFTER UPDATE OF USETIME ON ROOMS 
FOR EACH ROW
BEGIN
      UPDATE SEATS SET USETIME = :NEW.USETIME
      WHERE ROOMID = :OLD.ROOMID;
END;
/
ALTER TRIGGER "BLIBRARY"."UPDATE_USETIME" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DELETROOMANDSEATS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "BLIBRARY"."DELETROOMANDSEATS" 
AFTER DELETE ON ROOMS
FOR EACH ROW
BEGIN
  DELETE FROM SEATS
  WHERE ROOMID = :OLD.ROOMID;
END;
/
ALTER TRIGGER "BLIBRARY"."DELETROOMANDSEATS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPDATE_USETIME
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "BLIBRARY"."UPDATE_USETIME" 
AFTER UPDATE OF USETIME ON ROOMS 
FOR EACH ROW
BEGIN
      UPDATE SEATS SET USETIME = :NEW.USETIME
      WHERE ROOMID = :OLD.ROOMID;
END;
/
ALTER TRIGGER "BLIBRARY"."UPDATE_USETIME" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CREATE_SEAT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "BLIBRARY"."CREATE_SEAT" 
AFTER INSERT ON ROOMS 
FOR EACH ROW


BEGIN
  FOR I IN 1.. :NEW.ROWCOUNT LOOP
    FOR J IN 1.. :NEW.COLCOUNT LOOP
        INSERT INTO SEATS (ROOMID, SEATCODE, SEATID, USERID, EXPTIME,USETIME)
        VALUES (:NEW.ROOMID, CHR(64+I)||J, :NEW.ROOMID||CHR(64+I)||J, NULL, NULL,3);
        END LOOP;
  END LOOP;
END;
/
ALTER TRIGGER "BLIBRARY"."CREATE_SEAT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INSERT_USETIME
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "BLIBRARY"."INSERT_USETIME" 
AFTER INSERT ON ROOMS 
FOR EACH ROW
BEGIN
    UPDATE SEATS SET USETIME = :NEW.USETIME ;
END;

/
ALTER TRIGGER "BLIBRARY"."INSERT_USETIME" DISABLE;
--------------------------------------------------------
--  DDL for Function COUNTSEAT
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "BLIBRARY"."COUNTSEAT" 
(
  IN_ROW IN NUMBER 
, IN_COL IN NUMBER 
) RETURN NUMBER AS 
  V_SEATCOUNT rooms.seatcount%TYPE;
BEGIN
  V_SEATCOUNT := IN_ROW * IN_COL;
  DBMS_OUTPUT.put_line(V_SEATCOUNT);
  DBMS_OUTPUT.put_line(CHR(64+IN_ROW));
  RETURN V_SEATCOUNT;
END COUNTSEAT;


/
--------------------------------------------------------
--  DDL for Function GET_BOOKLIST
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "BLIBRARY"."GET_BOOKLIST" (
    IN_BOOKNAME IN VARCHAR2
    ) RETURN VARCHAR2
AS
    V_BOOKNAME BOOK.BOOKNAME%TYPE;
BEGIN
    SELECT BOOKNAME INTO V_BOOKNAME
    FROM BOOK 
    WHERE BOOKNAME LIKE '%IN_BOOKNAME%';

    RETURN V_BOOKNAME;
END GET_BOOKLIST;


/
--------------------------------------------------------
--  Constraints for Table BOOK
--------------------------------------------------------

  ALTER TABLE "BLIBRARY"."BOOK" ADD CONSTRAINT "BOOK_PK" PRIMARY KEY ("SERIALNUMBER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BLIBRARY"."BOOK" MODIFY ("SERIALNUMBER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOOKED_BOOK
--------------------------------------------------------

  ALTER TABLE "BLIBRARY"."BOOKED_BOOK" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "BLIBRARY"."BOOKED_BOOK" MODIFY ("SERIALNUMBER" NOT NULL ENABLE);
  ALTER TABLE "BLIBRARY"."BOOKED_BOOK" MODIFY ("BOOKNAME" NOT NULL ENABLE);
  ALTER TABLE "BLIBRARY"."BOOKED_BOOK" ADD CONSTRAINT "BOOKED_BOOK_PK" PRIMARY KEY ("SERIALNUMBER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MANAGERINFO
--------------------------------------------------------

  ALTER TABLE "BLIBRARY"."MANAGERINFO" MODIFY ("MANAGERID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "BLIBRARY"."MEMBER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "BLIBRARY"."MEMBER" ADD CONSTRAINT "MEMBER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ROOMS
--------------------------------------------------------

  ALTER TABLE "BLIBRARY"."ROOMS" MODIFY ("ROOMID" NOT NULL ENABLE);
  ALTER TABLE "BLIBRARY"."ROOMS" ADD CONSTRAINT "READINGROOM_PK" PRIMARY KEY ("ROOMID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BLIBRARY"."ROOMS" MODIFY ("ROOMNAME" NOT NULL ENABLE);
  ALTER TABLE "BLIBRARY"."ROOMS" MODIFY ("ROWCOUNT" NOT NULL ENABLE);
  ALTER TABLE "BLIBRARY"."ROOMS" MODIFY ("COLCOUNT" NOT NULL ENABLE);
  ALTER TABLE "BLIBRARY"."ROOMS" MODIFY ("SEATCOUNT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SEATS
--------------------------------------------------------

  ALTER TABLE "BLIBRARY"."SEATS" MODIFY ("ROOMID" NOT NULL ENABLE);
  ALTER TABLE "BLIBRARY"."SEATS" MODIFY ("RV_OR_NOT" NOT NULL ENABLE);
  ALTER TABLE "BLIBRARY"."SEATS" MODIFY ("SEATCODE" NOT NULL ENABLE);
  ALTER TABLE "BLIBRARY"."SEATS" MODIFY ("SEATID" NOT NULL ENABLE);
  ALTER TABLE "BLIBRARY"."SEATS" ADD CONSTRAINT "SEATS_PK" PRIMARY KEY ("SEATID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;