
 /*============================== JOIN �SLEMLER� ===============================
    
    Set Operatorleri (Union,Intersect,Minus) farkl� tablolardaki sutunlari 
    birlestirmek kullanilir.
    
    Join islemleri ise farkl� Tablolari birlestirmek icin kullanilir. Diger 
    bir ifade ile farkli tablolardaki secilen sutunlar ile yeni bir tablo 
    olusturmak icin kullanilabilir.
    
    JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. �unku
    Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
    icin JOIN islemleri kullanilabilir.
    
    ORACLE SQL'de 4 Cesit Join isemi kullanilabilmektedir.
    1) FULL JOIN:  Tablodaki tum sonuclari gosterir
    2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
    3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
    4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir
   
==============================================================================*/   
    CREATE TABLE sirketler 
    (
        sirket_id NUMBER(9), 
        sirket_isim VARCHAR2(20)
    );
    
    INSERT INTO sirketler VALUES(100, 'Toyota');
    INSERT INTO sirketler VALUES(101, 'Honda');
    INSERT INTO sirketler VALUES(102, 'Ford');
    INSERT INTO sirketler VALUES(103, 'Hyundai');
    
    CREATE TABLE siparisler
    (
        siparis_id NUMBER(9),
        sirket_id NUMBER(9), 
        siparis_tarihi DATE
    );
    
    INSERT INTO siparisler VALUES(11, 101, '17-04-2020');
    INSERT INTO siparisler VALUES(22, 102, '18-04-2020');
    INSERT INTO siparisler VALUES(33, 103, '19-04-2020');
    INSERT INTO siparisler VALUES(44, 104, '20-04-2020');
    INSERT INTO siparisler VALUES(55, 105, '21-04-2020');
?
    SELECT * FROM siparisler;
    SELECT * FROM sirketler;

    DROP TABLE sirketler;
    
    
    
*=============================== FULL JOIN  ==================================
    FULL JOIN, Her iki tablo icin secilen sutunlara ait olan tum satirlari
    getirmek icin kullanilir.
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1
    FULL JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/
    
* -----------------------------------------------------------------------------
  ORNEK1: sirketler ve siparisler ad�ndaki tablolarda yer alan sirket_isim,
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/ 
    SELECT s.sirket_isim,sp.siparis_id,sp.siparis_tarihi,sp.sirket_id --s. = sirket_isim
    FROM sirketler s                                      --sp = siparis
    FULL JOIN siparisler sp
    ON s.sirket_id = sp.sirket_id;
    
    -- FULL JOIN de iki tabloda var olan tum satirlar gosterilir.
    -- Bir olupda digerlerinde olmayan alanlar bos birakilir.
    -- Join isleminde genelede iki tablodaki ortak olarak bulunan sutun, ON
    -- cumleciginde kosul yapisi kullanilir.


*=============================== INNER JOIN  ==================================
   
    Iki tablonun kesisim kumesi ile yeni bir tablo olusturmak icin kullanilir.
   
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1
    INNER JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/ 
   
 
/* -----------------------------------------------------------------------------
  ORNEK2: Iki Tabloda sirket_id�si ayni olanlarin sirket_ismi, siparis_id ve
  siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/    
    --INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
    
    SELECT s.sirket_isim,sp.siparis_id,sp.siparis_tarihi,sp.sirket_id 
    FROM sirketler s                                      
    INNER JOIN siparisler sp 
    ON s.sirket_id = sp.sirket_id;
    
    -- INNER JOIN ile sadece iki tablodaki ortak olan satirlar secilir
    -- Diger ifadeyle iki tablodaki ortak olan sirket_id degerleri icin ilgili 
    -- sutunlar listelenir
    
    -- INNER anahtar kelimesi opsiyoneldir. JOIN yazsa da ayni sonucu verir. 
    -- Sadece INNER icin gecerlidir. En cok kullanilan JOIN budur.
    
/*=============================== LEFT JOIN  ==================================
   
    LEFT JOIN, 1. tablodan (sol tablo) SELECT ile ifade edilen sutunlara ait tum
    satirlari getirir.
    Ancak, diger tablodan sadece ON ile belirtilen kosula uyan satirlari getirir.
       
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1
    LEFT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/

/* -----------------------------------------------------------------------------
  ORNEK3: sirketler tablosundaki tum sirketleri ve bu sirketlere ait olan
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/

    SELECT s.sirket_isim,sp.siparis_id,sp.siparis_tarihi,sp.sirket_id,s.sirket_id 
    FROM sirketler s                                      
    LEFT JOIN siparisler sp 
    ON s.sirket_id = sp.sirket_id;

/*=============================== RIGHT JOIN  ==================================
   
    RIGHT JOIN, 2. tablodan (sag tablo) SELECT ile ifade edilen sutunlara ait tum
    satirlari getirir.
    Ancak, diger tablodan sadece ON ile belirtilen kosula uyan satirlari getirir.
       
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1
    RIGHT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/

/* -----------------------------------------------------------------------------
  ORNEK4: siparisler tablosundaki tum siparis_id ve siparis_tarihleri ile
  bunlara kar��l�k gelen sirket_isimlerini listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/
    SELECT s.sirket_isim,sp.siparis_id,sp.siparis_tarihi,sp.sirket_id
    FROM sirketler s                                      
    RIGHT JOIN siparisler sp 
    ON s.sirket_id = sp.sirket_id;
    
    -- Right Join'de 2. tablodaki tum satirlar gosterilir. 
    -- 2 tablodaki satirlara 1. tablodan ko�ula uyan ortak satirlar go�teriLir 
    -- ancak ortak olmayan ki�imlar bos kalirir. 
  
    
    
    
    
    
    
    
    
    
    
    
    