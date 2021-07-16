/* Merhaba. Ben Misli ÇELİK.
Sizlerle Microsoft SQL server için hazırladığım kodlarımı paylaşacağım
Umarım beğenirsiniz...
*/

/* ÖĞRETİCİ 1: CREATE komutu ile database oluşturma */

CREATE DATABASE MisliCelik

/* ÖĞRETİCİ 2: CREATE komutu ile tablo oluşturma */

CREATE TABLE MisliTable (
	id INT NOT NULL PRIMARY KEY IDENTITY,
	fname VARCHAR(50) NOT NULL,
	lname VARCHAR(50) NOT NULL
)

/* ÖĞRETİCİ 3: ALTER komutu */

ALTER TABLE MisliTable ADD email varchar(50), telno varchar(15), salary int --kolon ekledi
ALTER TABLE MisliTable DROP COLUMN telno --Kolonu sildi

/* ÖĞRETİCİ 4: DROP komutu */

DROP TABLE MisliTable

/* ÖĞRETİCİ 5: TRUNCATE tablo içerisindeki verileri siler */

TRUNCATE TABLE MisliTable

/* ÖĞRETİCİ 6:WHERE, OR, AND, İN, LİKE */

SELECT * FROM MisliTable
WHERE salary>=3000 and fname='Misli'

SELECT * FROM MisliTable
WHERE salary>=3000 or fname='Misli'

SELECT * FROM MisliTable
WHERE salary IN (2000, 3000, 4000) --Salary kolonunda 2000, 3000, 4000 değerlere sahip olanları getir

SELECT * FROM MisliTable
WHERE fname LIKE '%A%' -- içerisinde A harfi bulunan

/* ÖĞRETİCİ 7: INSERT INTO */

INSERT INTO MisliTable VALUES('Misli', 'Çelik', 'celikmisli@gmail.com', '00000000000', 7000)
INSERT INTO MisliTable(fname, lname,salary) VALUES('Misli','Çelik' , 7000)

/* ÖĞRETİCİ 8: UPDATE Komutu */

UPDATE MisliTable SET email='mislicelik@gmail.com'
Where id=5

/* ÖĞRETİCİ 9: DELETE Komutu */

DELETE FROM MisliTable WHERE id=5

/* ÖĞRETİCİ 10: DISTINCT (FARKLI) */

SELECT DISTINCT fname FROM MisliTable

/* ÖĞRETİCİ 11: ORDER BY Komutu */

SELECT * FROM MisliTable
ORDER BY salary --Sıralama komutudur. ASC küçükten büyüğe ve DESC büyükten küçüğe

/* ÖĞREETİCİ 12: AS (gibi, olarak) Komutu */

SELECT fname AS Ad FROM MisliTable


/* ÖĞRETİCİ 13: BETWEEN komutu */

SELECT CustomerID, SalesOrderID, OrderDate, DueDate, ShipDate, AccountNumber
FROM Sales.SalesOrderHeader 
WHERE OrderDate BETWEEN '2005-07-04' AND '2005-07-31' -- Bu iki tarih arasında
--Between deyimi Select ve Where deyimleri ile birlikte kullanılan bir deyimdir. 
--Between deyimi bir veri listesindeki bir alana ait verilerin belli bir alan aralığında, 
--belli bir değer aralığında olanlarının gösterilmesi için kullanabiliriz.


/* ÖĞRETİCİ 13: LIKE Komutu */

SELECT * FROM ogrenciler WHERE ogrenci_adi LIKE "A%" -- A harfi ile başlayanları getir %A A ile bitenleri getir ...

/* ÖĞRETİCİ 14: Aritmetik Operatörler & Fonksiyonlar */

SELECT 16+6 AS 'TOPLAM', 16-6 AS 'FARK', 16*6 AS 'ÇARPIM', 16/6 AS 'BÖLÜM'
-- Bir tabloymuş gibi getirir.

-- BİRLEŞTİRME FONKSİYONU

SELECT fname + ' ' + lname AS 'AD SOYAD'  FROM MisliTable
-- Sonuçta MİSLİ ÇELİK gibi bir sonuç elde edilir.

--SUBSTRİNG 

SELECT SUBSTRING('MİSLİ ÇELİK', 1, 5) --MİSLİ

--LEFT

SELECT LEFT('MİSLİ ÇELİK',5) --MİSLİ

-- RİGHT

SELECT RIGHT('MİSLİ ÇELİK',5) --ÇELİK

--LOWER

SELECT LOWER('MİSLİ ÇELİK') --Hepsini küçük harfe çevirdi

--UPPER

SELECT UPPER('misli çelik') -- Hepsini büyük yaptı

--LENGTH yani LEN

SELECT LEN('Misli Çelik') -- Kaç karakter olduğunu (karekter sayısını) bize verir

--REPLACE

SELECT REPLACE('Misli Çelik', 'Misli', 'Mismis') --Mismis Çelik
--REPLACE('değiştirelecek alan', 'alandaki değiştirelecek yer', 'ne olarak değiştirilecekse')

--REVERSE

SELECT REVERSE('Misli') --ilsiM, tersine çevirir

/* ÖĞRETİCİ 15: Sayısal Fonksiyonlar */

-- ABS Mutlak değer

SELECT ABS(-5)

-- CELLİNG sayıyı üste yuvarlar

SELECT CEILING(45.868) --46
SELECT CEILING(45.868) AS 'Tutar'

-- FLOOR Aşağıya yuvarlar

SELECT FLOOR(45.868) --45
SELECT FLOOR(45.868) AS 'Tutar'

-- ROUND En yakın tam sayıya yuvarlama

SELECT ROUND(45.868, 1) --45,9
SELECT ROUND(45.868, 2) --45,87
SELECT ROUND(45.868, 1,2) --45,8

--POWER Üs almak için kullanılır

SELECT POWER(2,4) --2 üzeri 4 yani 16

--SQRT Karekök alma komutu

SELECT SQRT(25) --5

-- SUM Toplam komutu

SELECT SUM(salary) FROM MisliTable

-- AVG Ortalama

SELECT AVG(salary) FROM MisliTable

--Max

SELECT MAX(salary) FROM MisliTable  --group by ile

--Min

SELECT MIN(salary) FROM MisliTable --group by ile

--COUNT Sayaç yani kaç değer varsa döndürür

SELECT COUNT(salary) FROM MisliTable

/* ÖĞRETİCİ 16: Tarih Fonksiyonları */

--GETDATE anlık tarih ve saat

SELECT GETDATE()

-- DATE PART verilen tarih için gün, ay, yıl, hafta ve çeyrek bilgilerini getirir

SELECT DATEPART(YEAR, GETDATE()) AS 'YIL' -- ANLIK YIL
SELECT DATEPART(MONTH, GETDATE()) AS 'AY' -- ANLIK AY
SELECT DATEPART(DAY, GETDATE()) AS 'GÜN'  --ANLIK GÜN
SELECT DATEPART(WEEK, GETDATE()) AS 'HAFTA' -- KAÇINCI HAFTA
SELECT DATEPART(QUARTER, GETDATE()) AS 'ÇEYREK' --3. ÇEYREK

SELECT DATEPART(YEAR, '1998-06-20') AS 'YIL' -- YIL
SELECT DATEPART(MONTH, '1998-06-20') AS 'AY' --  AY
SELECT DATEPART(DAY, '1998-06-20') AS 'GÜN'  --GÜN
SELECT DATEPART(WEEK, '1998-06-20') AS 'HAFTA' -- HAFTA
SELECT DATEPART(QUARTER, '1998-06-20') AS 'ÇEYREK' --ÇEYREK

--DATEDİFF Tarihler arası fark işlemleri yapılır

SELECT DATEDIFF(YEAR, '1998-06-20', GETDATE()) AS 'YIL' -- KAÇ YIL
SELECT DATEDIFF(MONTH, '1998-06-20', GETDATE()) AS 'AY' -- KAÇ AY
SELECT DATEDIFF(DAY, '1998-06-20', GETDATE()) AS 'GÜN'  --KAÇ GÜN
SELECT DATEDIFF(WEEK, '1998-06-20', GETDATE()) AS 'HAFTA' -- KAÇ HAFTA
SELECT DATEDIFF(QUARTER, '1998-06-20', GETDATE()) AS 'ÇEYREK'-- KAÇ ÇEYREK

--DATEADD Verilen tarihe verilen miktarda gün, ay, yıl.. eklemesi yapar

SELECT DATEADD(DAY, 40, GETDATE())
SELECT DATEADD(MONTH, 40, GETDATE())
SELECT DATEADD(YEAR, 40, GETDATE())
SELECT DATEADD(WEEK, 40, GETDATE())

/* ÖĞRETİCİ 17: GROUP BY */

SELECT departman, COUNT(maas) 
FROM calisanlar
GROUP BY departman

SELECT salary, COUNT(*) from employees
GROUP BY salary
HAVING salary>3500

/* ÖĞRETİCİ 18: GROUP BY VE HAVİNG */

SELECT departman, COUNT(maas) 
FROM calisanlar
GROUP BY departman
HAVING COUNT(maas)>5000

SELECT manager_id, COUNT(*) from employees
GROUP BY manager_id
HAVING manager_id IS NOT NULL

/* ÖĞRETİCİ 19: WHERE ile birleştirme */

SELECT COUNTRY_NAME, COUNTRY_CODE, COUNTRY_ID
FROM COUNTRIES, REGIONS 
WHERE COUNTRİES.ID=REGİONS.COUNTRY_ID

/* ÖĞRETİCİ 20: INNER JOIN */

SELECT COUNTRY_NAME, COUNTRY_CODE, COUNTRY_ID
FROM COUNTRIES C 
INNER JOIN REGIONS R ON C.ID=R.COUNTRY_ID
-- İnner Join kesişen bilgileri birleştirir

/* ÖĞRETİCİ 21: JOİN Kullanımları */

--INNER JOİN TÜM EŞLEŞMELERİ GETİRİR
SELECT c.country_name, c.region_id, r.region_name FROM countries c 
INNER JOIN regions r ON r.region_id=c.region_id

--LEFT JOİN HEM KESİŞİMLERİ HEM DE SOL TARAFTAKİ TÜM TABLO VERİLERİNİ GETİRİR
SELECT c.country_name, c.region_id, r.region_name FROM countries c 
LEFT JOIN regions r ON c.region_id=r.region_id

--Eğer kesişen verileri istemiyorsak
SELECT c.country_name, c.region_id, r.region_name FROM countries c 
LEFT JOIN regions r ON c.region_id=r.region_id
WHERE r.region_id=IS NULL

--RİGHT JOİN HEM KESİŞİMLERİ HEM DE SAĞ TARAFTAKİ TÜM TABLO VERİLERİNİ GETİRİR
SELECT c.country_name, c.region_id, r.region_name FROM countries c 
RIGHT JOIN regions r ON c.region_id=r.region_id

--Eğer kesişen verileri istemiyorsak
SELECT c.country_name, c.region_id, r.region_name FROM countries c 
RIGHT JOIN regions r ON c.region_id=r.region_id
WHERE c.region_id=IS NULL

/* ÖĞRETİCİ 22: UNION VE UNION ALL */

--UNİON kesişen tablo verilerini getirir
SELECT * FROM countries
UNION
SELECT * FROM regions

--UNİON ALL ttüm tablo verilerini getirir
SELECT * FROM countries
UNION ALL
SELECT * FROM regions

/* ÖĞRETİCİ 23: INTERSECT (Kesişim) */

SELECT * FROM derslerfenfakultesi
INTERSECT
SELECT * FROM derslermuhendislik

/* ÖĞRETİCİ 24: ALT SORGU-SUBQUERY */

-- Alt sorgu bazı join işlemlerinin yetersiz kaldığı 
-- hatta fonksiyonların bile yetersiz kaldığı durumlarda 
-- bir tane daha sorgu oluşturmaktır.

SELECT * FROM calisan
WHERE maas=(SELECT MAX(maas) FROM calisan) 
-- Burada sadece en yüksek maaşı değil en yüksek maaşın kime ait olduğunu göstermiş olduk

SELECT * FROM calisan
WHERE maas=(SELECT departman, MAX(maas) FROM calisan WHERE departman='İstatistik') 
-- İstatistikçi olan çalışanlar içerisinden hangisinin maaşının en yüksek olduğunu bulduk

/* ÖĞRETİCİ 25: UPDATE Komutu */

UPDATE USERS --UPDATE GÜNCELLEME İŞLEMİ YAPAR
SET name='Misli'  --(SET komutu değişken atamak için kullanılır)
WHERE id=5

/* ÖĞRETİCİ 26: EXCEPT */

SELECT * FROM derslerfenfakultesi
EXCEPT
SELECT * FROM derslerlermuhendislik
-- ÜSTE YAZDIĞIMIZDA VAR OLAN AMA ALTA YAZDIĞIMIZDA OLMAYAN VERİLERİ GETİRİR

/* ÖĞRETİCİ 27: BEGIN TRANSACTION işlem başlangıcı */

--BEGIN TRAN[SACTION] [transaction_ismi | @transaction_degiskeni]

BEGIN TRANSACTION -- BAŞLANGIÇ
UPDATE calisan SET salary=10000
UPDATE calisan SET departman='İstatistik'
SELECT * FROM calisan
ROLLBACK -- işlemleri iptal et
SELECT * FROM calisan
--Burada karşımıza 2 tane tablo gelecektir. biri işlemleri yaparak gelen tablo diğeri işlemleri yapmadan normal hali ile gelen tablodur
--ROOLBACK Ddediğimiz için işlemleri iptal etti ve tablonun normal halini bize getirdi. İlk Tabloda tüm salary değerleri 1000 ve
--tüm departman değerleri de İstatistik oldu. İkinci tabloda ise ROLLBACK komutu sayesinde hiçbir işlem uygulanmadı.

BEGIN TRANSACTION
UPDATE misli SET isim = 'isim5'
WHERE id = 15
UPDATE misli SET isim = 'isim6'
WHERE sehir = 'Konya'

/* ÖĞRETİCİ 28: SQL'de işlem komutları */

--DECLARE değişken tanımlama,

DECLARE @sehir VARCHAR(20)
SET @sehir='Konya'
SELECT @sehir -- dersek tablo şeklinde gelir
PRINT @sehir -- normal yazı şeklinde yazdırır


DECLARE @sehir VARCHAR(20)
DECLARE @ulke VARCHAR(20)
SET @sehir='Konya'
SET @ulke='türkiye'
PRINT @sehir + ' ' + @ulke

--DECLARE dört İşlem

DECLARE @sayi1 int,
		@sayi2 int,
		@toplam int
SET @sayi1=5
SET @sayi2=12
SET @toplam=@sayi1+@sayi2
PRINT @toplam

--

DECLARE @sayi1 int,
		@sayi2 int,
		@toplam int
SET @sayi1=5
SET @sayi2=12
SET @toplam=@sayi1+@sayi2
PRINT 'Toplam: ' + CAST(@toplam AS VARCHAR(5)) --Değişkene veritipi ataması yaptık. bu sayede sonuç 'Toplam: 17' şeklinde gelmiş oldu.

--

DECLARE @sayi1 int,
		@sayi2 int,
		@carpim int
SET @sayi1=5
SET @sayi2=12
SET @carpim=@sayi1*@sayi2
PRINT 'Çarpım: ' + CAST(@carpim AS VARCHAR(5)) --Çarpım: 60

--

DECLARE @sayi1 int,
		@sayi2 int,
		@fark int
SET @sayi1=5
SET @sayi2=12
SET @fark=@sayi2-@sayi1
PRINT 'Fark: ' + CAST(@fark AS VARCHAR(5)) --Fark: 7

--

DECLARE @sayi1 int,
		@sayi2 int,
		@bolum int
SET @sayi1=5
SET @sayi2=12
SET @bolum=@sayi2/@sayi1
PRINT 'Bölüm: ' + CAST(@bolum AS VARCHAR(5)) -- Bölüm: 2

--

DECLARE @sayi1 int,
		@sayi2 int,
		@toplam int,
		@carpim int,
		@fark int,
		@bolum int

SET @sayi1=50
SET @sayi2=15

SET @toplam=@sayi1+@sayi2
SET @carpim=@sayi1*@sayi2
SET @fark=@sayi1-@sayi2
SET @bolum=@sayi1/@sayi2

PRINT 'Toplam: ' + CAST(@toplam AS VARCHAR(5))
PRINT 'Çarpım: ' + CAST(@carpim AS VARCHAR(5))
PRINT 'Fark: ' + CAST(@fark AS VARCHAR(5))
PRINT 'Bölüm: ' + CAST(@bolum AS VARCHAR(5))
--Toplam: 65
--Çarpım: 750
--fark: 35
--Bölüm: 3

--Tablo ile declare işlemleri (Sanal Tablo)

DECLARE @calisan TABLE(
			id INT,
			calisan_no VARCHAR(5),
			calisan_ad VARCHAR(20),
			calisan_soyad VARCHAR(20),
			calisan_departman VARCHAR(20)
)
INSERT INTO @calisan VALUES('1', '123', 'Misli', 'Çelik', 'Açık kaynak kodlu')
INSERT INTO @calisan VALUES('2', '124', 'Kaan', 'Çelik', 'Finans')
INSERT INTO @calisan VALUES('3', '125', 'Nalan', 'Çelik', 'İnsan Kaynakları')

SELECT * FROM @calisan --SANAL BİR TABLO OLUŞTURARAK ÇALIŞMA YAPTIK. WHERE, ORDER BY, GROUP BY GİBİ KOMUTLAR DA KULLANILABİLİR.

/* ÖĞRETİCİ 29: OUTPUT İşlemler */

-- OUTPUT Bir tabloda etkilenen kayıtları listelemek için kullanılan bir yapıdır.

-- Return ile arasındaki fark, RETURN bir değer döndürüyor fakat OUTPUT birden çok değer döndürebiliyor.

DECLARE @ogrenciler TABLE(
		vize varchar(10),
		final varchar(20),
		FİNAL2 int
)
INSERT INTO ogrencibilgiler
OUTPUT INSERTED.ogencivize, INSERTED.ogrencifinal, INSERTED.ogrencifinal2
INTO @ogrenciler
VALUES(60,80,65)

SELECT * FROM @ogrenciler
--Sadece son etkilenen verileri getirdi 80 80 65		

--

DECLARE @ogrencilersil TABLE(
		vize varchar(10),
		final varchar(20),
		final2 int
)
DELETE ogrencibilgiler
OUTPUT DELETED.ogencivize, DELETED.ogrencifinal, DELETED.ogrencifinal2
INTO @ogrencilersil
WHERE ogrencifinal2=65

SELECT * FROM @ogrencilersil

/* ÖĞRETİCİ 30: IF ELSE */

DECLARE @sayi int,
		@ciftsayi int
SET @sayi=45
SET @ciftsayi=@sayi%2
IF @ciftsayi=0
BEGIN
PRINT 'Sayımız Çift Sayıdır'
END
ELSE
BEGIN
PRINT 'Sayımız tek sayıdır'
END

/* ÖĞRETİCİ 31: CASE Yapısı */

--SELECT CASE
 --WHEN [koşul] THEN [yapılacak işlem]
 --WHEN [koşul] THEN [yapılacak işlem]
 --else [koşullar sağlanmadığında yapılacak işlem]
 --end

DECLARE @misli int
SET @misli=55
 
SELECT CASE
  WHEN @misli = 45 THEN 'tutar 1'
  WHEN @misli = 55 THEN 'tutar 2'
  WHEN @misli = 70 THEN 'tutar 3'
  WHEN @misli = 90 THEN 'tutar 4'
  ELSE'tutar 5'
  END

/* ÖĞRETİCİ 32: WHİLE DÖNGÜSÜ */

DECLARE @sayi int
SET @sayi=1
WHILE (@sayi<=10)
BEGIN
PRINT @sayi
SET @sayi=@sayi+1
END
--1 2 3 4 5 6 7 8 9 10

DECLARE @Sayı int
SET @Sayı = 0
WHILE (@Sayı<=20)
BEGIN
PRINT CAST(@Sayı AS varchar(20)) + ' . sayının küpü =' + CAST(@Sayı*@Sayı*@Sayı AS varchar(10))
SET @Sayı = @Sayı+2
END

/* ÖĞRETİCİ 33: Continue & Goto Kullanımı */

DECLARE @misli int
SET @misli = 1
WHILE (@misli<=20)
BEGIN
IF (@misli=15)
BEGIN
SET @misli = @misli+1
CONTINUE
END
PRINT CAST(@misli AS varchar(20)) + ' KARESİ =' + CAST(@misli*@misli AS varchar(10))
SET @misli = @misli+1
END

--

DECLARE @say int
SET @say=1
TEKRARLA:
PRINT @say
SET @say=@say+1
WHILE (@say<=40)
GOTO TEKRARLA

--

DECLARE @misli int
SET @misli=1
TEKRARLA:
PRINT cast(@misli as varchar(2)) + 'tane sayac'
SET @misli=@misli+1
WHILE (@misli<=20)
BEGIN
IF (@misli=5)
BEGIN
SET @misli=@misli+1
CONTINUE
END
GOTO TEKRARLA
END


/* ÖĞRETİCİ 34: WAİTFOR */

--Kod bloğunun belli bir zamanda çalışmasını istemiyorsa ya da belli bir zaman sonra çalışmasını istiyorsak 
--bu ve bu gibi durumlarda kullanılır.

WAITFOR DELAY '00:00:30'
SELECT * FROM MisliTable

WAITFOR time '17:33:00'
SELECT * FROM MisliTable
