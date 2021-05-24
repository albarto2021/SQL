/*  -------------- SELECT - WHERE KULLANIMI ------------------------
� Verileri SELECT komutu ile veritaban�ndan �ekerken filtreleme 
yapmak i�in SELECT ile birlikte WHERE komutu kullan�labilir. 
FORMAT 
SELECT sut�nl, sut�n2 
FROM tablo ad� 
WHERE ko�ul;   
  */


CREATE TABLE ogrenciler(
id NUMBER(9),
isim VARCHAR2(50),
adres VARCHAR2(100),
sinav_notu NUMBER(3)
);

INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul',85);

DROP TABLE ogrenciler;

SELECT * FROM ogrenciler;
-- Notu 80'den buyuk olanlar
SELECT * FROM ogrenciler
WHERE sinav_notu>80;

--notu 80 den buyuk olanlarin sadece isim ve not bilgilerini listeleme
SELECT isim, sinav_notu
FROM ogrenciler
WHERE sinav_notu>80;

SELECT * FROM ogrenciler
WHERE adres = 'Ankara';

SELECT * FROM ogrenciler
WHERE id = 124;


/*

-------------------- KO�UL OPERAT�RLER� ----------------------
    =       ==> E�it mi? 
    >       ==> B�y�k m�?
    <       ==> K���k m�?
    >=      ==> B�y�k E�it mi? 
    <=      ==> K���k E�it mi?
    <>      ==> E�it De�il mi?
    AND     ==> VE operat�r� 
    OR      ==> VEYA operat�r� 
    BETWEEN ==> Belirtilen de�erler aras�ndaki veriler i�in 
    IN      ==> Bir s�tun i�in bir �ok uygun ko�ul secmek icin
    L�KE    ==> Belirli pattern'i aramak icin
*/


CREATE TABLE personel
(   
     id CHAR(5),
     isim VARCHAR2(50),
     maas NUMBER(5)
 );

INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
INSERT INTO personel VALUES( '10002', 'Mehmet Y�lmaz' ,12000);
INSERT INTO personel VALUES('10003', 'Meryem', 7215);
INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
INSERT INTO personel VALUES('10005', 'Ay�e Can', 4000);

SELECT * FROM personel;


/*========================== BETWEEN ===================================*/
-- id si 10002 ile 10005 arasindaki personelin tum bilgilerini goster

SELECT * FROM personel
WHERE id>='10002' AND id <='10005';

SELECT id, isim,maas
FROM personel
WHERE id BETWEEN '10002' AND '10005'; -- alt ve ust limitler dahildir

-- Mehmet Yilmaz ile Veli Han arasindaki Personel bilgilerini listeleyiniz
SELECT * FROM personel
WHERE isim BETWEEN 'Mehmet Y�lmaz' AND 'Veli Han'; -- alt ve ust limitler dahildir

-- id si 10002 ile 10005 arasinda olmayanlari listeleyiniz
SELECT * FROM personel
WHERE id NOT BETWEEN '10002' AND '10004'; --Arasinda olmayanlari listele


/*============================= IN ========================================*/
-- id si 10001, 10002 ve 10004 olanlari listeleyiniz

--OR yontemi ile
SELECT * FROM personel
WHERE id = '10001' OR 
      id = '10002' OR 
      id = '10004';

--IN yontemi ile      
SELECT * FROM personel
WHERE id IN ('10001','10002','10004');

-- maasi sadece 7000 ve 12000 olan personelin bilgilerini listeleyin

SELECT * FROM personel
WHERE maas IN (7000,12000);


/*============================= LIKE ========================================*/

SELECT * FROM personel
WHERE isim LIKE '_eh%';

SELECT * FROM personel
WHERE isim LIKE '_______';

SELECT * FROM personel
WHERE isim LIKE '_e%';

SELECT * FROM personel
WHERE isim LIKE 'A_%';

SELECT * FROM personel
WHERE isim LIKE '__%a%';

SELECT * FROM personel
WHERE maas NOT LIKE 5000;

SELECT * FROM personel
WHERE maas LIKE '_____';

SELECT * FROM personel
WHERE maas NOT LIKE '____';

-- maasinin son iki hanesi 00 olan personeli listeleyin
SELECT * FROM personel
WHERE maas LIKE '%00';

--1. harfi A ve 7. harfi A olan personel
SELECT * FROM personel
WHERE isim LIKE 'A_____a%';

SELECT * FROM personel
WHERE isim LIKE '%an%';

SELECT * FROM personel
WHERE maas NOT LIKE '____';

SELECT * FROM personel
WHERE maas LIKE '____';

/* ======================= SELECT - REGEXP_LIKE ================================
    Daha karma��k pattern ile sorgulama i�lemi i�in REGEXP_LIKE kullan�labilir.  
?
    Syntax:
    --------
    REGEXP_LIKE(sutun_ad�, �pattern[] �, �c� ] ) 
    
/* ========================================================================== */
    
    CREATE TABLE kelimeler
    (
        id NUMBER(10) UNIQUE,
        kelime VARCHAR2(50) NOT NULL,
        harf_sayisi NUMBER(6)
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    
   SELECT * FROM kelimeler;
    
    -- i�erisinde 'hi' harfleri ge�en kelimeleri sorgulayn�z.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'hi');
    
    -- i�erisinde herhangi bir yerde h veya i bulunan kelimeler
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[hi]');
    
    --i�erisinde ot veya at harfleri olan kelimeleri sorgulay�n�z.
    -- veya ilemi | karakteri ile yap�l�r. 
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at');
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at', 'i');
    
    -- hi veya ho ile ba�layan kelimeleri sorgulay�n�z.
    -- Ba�lama i�in ^ karakteri kullan�l�r.
    SELECT * FROM  kelimeler
    WHERE REGEXP_LIKE(kelime, '^hi|^ho','i');
    
    -- t veya m ile biten kelimeleri B�y�k-K���k harf duyars�z �ekilde listeyeniz.
    --biti� i�in $ ilareti kullan�l�r.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'t$|m$','i');
    
    -- h ile ba�lay�p t ile biten 3 harfli kelimeleri b�y�k-k���k harfe 
    -- dikkat etmeksizin listeleyeniz.
    -- tire(-) karakteri bir aral�k verir.
    -- k��eli parantez tek bir karakter g�sterir.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'h[a-z0-9]t','i');
    
    -- ilk harfi h, son harfi t olup 2. harfi a veya i olan 3 harfli
    -- kelimlerin tum bilgilerini sorgulayalim
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'h[ai]t','i');
    
    -- icinde m veya i veya e olan kelimelerin tum bilgilerini listeleyiniz
    -- * m veya i veya e olan kelimler baska ne olursa olsun
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'[mie](*)');
    
    -- basinda h olan sonda t olan icinde m veya i veya e icerenleri goster
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'h[mie]t');
    
    -- i�erisinde en az 2 adet oo bar�d�ran kelimelerin t�m bilgilerini 
    -- listeleyiniz.
    
    -- {2}
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime, '[o]{2}','i');
    
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime, '[a]{2}','i');
    
    
    
