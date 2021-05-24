/* ============================== UPDATE SET ===================================    
    
   �lk olarak a�a��daki gibi tedarikciler ad�nda bir tablo olu�turunu ve 
   vergi_no sutununu primary key yap�n�z.Ayr�ca a�a��daki verileri tabloya giriniz.
?
    vergi_no NUMBER(3),
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50),
        
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
	INSERT INTO tedarikciler VALUES (102, 'Huawei', '�in Li');
	INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
        
    Sonras�nda a�a��daki gibi urunler ad�nda bir ba�ka tablo olu�turunuz ve bu
    tablonun ted_vergino sutunu ile tedarikciler tablosunun vergi_no sutunu
    ili�kilendiriniz. Verileri giriniz.
?
    ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ay�e Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan �z');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Y�lmaz');
    
==============================================================================*/  
    CREATE TABLE tedarikciler
    (
        vergi_no NUMBER(3),
        firma_ismi VARCHAR2(50),
        irtibat_ismi VARCHAR2(50),
        CONSTRAINT pk_ted PRIMARY KEY (vergi_no)
    ); 
    
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', '�in Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
    
    
    CREATE TABLE urunler1
    (
        ted_vergino NUMBER(3), 
        urun_id NUMBER(11), 
        urun_isim VARCHAR2(50), 
        musteri_isim VARCHAR2(50),
        CONSTRAINT fk_urunler1 FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no) 
    );    
    
    INSERT INTO urunler1 VALUES(101, 1001,'Laptop', 'Ay�e Can');
    INSERT INTO urunler1 VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler1 VALUES(102, 1003,'TV', 'Ramazan �z');
    INSERT INTO urunler1 VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler1 VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler1 VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler1 VALUES(104, 1007,'Phone', 'Aslan Y�lmaz');
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler1;
    
    DROP TABLE urunler;
    
    /*=========================== UPDATE ==================================
    -- SYNTAX
    ----------
    -- UPDATE tablo_adi
    -- SET sutun_adi = yeni_deger
    -- WHERE sutun_adi ;
    
/*----------------------------------------------------------------------------
  ORNEK1: vergi_no�su 101 olan tedarikcinin ismini �LG� ve irtibat_ismi�ni
  �Ali Veli� olarak g�ncelleyeniz.
----------------------------------------------------------------------------*/
    UPDATE tedarikciler
    SET firma_ismi = 'LG'
    WHERE vergi_no = 101;
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler1;
    
/*----------------------------------------------------------------------------
  ORNEK2: Tedarikciler tablosundaki tum firma isimlerini 'SAMSUNG' olarak degistir
----------------------------------------------------------------------------*/
    UPDATE tedarikciler
    SET firma_ismi = 'SAMSUNG'; 
    
    -- Tablonun icerigini siler.
    DELETE FROM tedarikciler; -- DROP TABLE tabloyu siler.
    
/*----------------------------------------------------------------------------
  ORNEK3: vergi_no'su 102 olan tedarikciler ismini 'Samsung' ve irtibat_ismi'ni 
  'Ali Veli' olarak guncelleyiniz
----------------------------------------------------------------------------*/    
    UPDATE tedarikciler
    SET firma_ismi = 'Samsung', irtibat_ismi = 'Ali Veli'
    WHERE vergi_no = 102;
    
/* -----------------------------------------------------------------------------
  ORNEK4: firma_ismi Samsung olan tedarikcinin irtibat_ismini �Ay�e Y�lmaz� olarak
  g�ncelleyiniz.
 -----------------------------------------------------------------------------*/    
    UPDATE tedarikciler
    SET irtibat_ismi = 'Ayse Yilmaz'
    WHERE firma_ismi='Samsung';

    SELECT * FROM tedarikciler;
    SELECT * FROM urunler1;
    
/*----------------------------------------------------------------------
   ORNEK 5: Urunler tablosundaki 'Phone' degerlerini 'Telefon' olarak guncelleyelim
 -----------------------------------------------------------------------------*/
    UPDATE urunler1
    SET urun_isim='Telefon'
    WHERE urun_isim='Phone';

/*-----------------------------------------------------------------------------
  ORNEK6: urunler tablosundaki urun_id de�eri 1004'ten b�y�k olanlar�n urun_id
  de�erlerini bir artt�r�n�z
 -----------------------------------------------------------------------------*/
    UPDATE urunler1
    SET urun_id = urun_id + 1
    WHERE urun_id > 1004;    

/* -----------------------------------------------------------------------------
  ORNEK7: urunler tablosundaki t�m �r�nlerin urun_id de�erini ted_vergino
  sutun de�erleri ile toplayarak g�ncelleyiniz.
-----------------------------------------------------------------------------*/    
    UPDATE urunler1
    SET urun_id = urun_id + ted_vergino;
    
/*============================================================================
   ORNEK6: urunler tablosundan Ali Bak�in aldigi urunun ismini, tedarikci
   tablosunda irtibat_ismi �Adam Eve� olan firman�n ismi (firma_ismi) ile
   degistiriniz.    
==============================================================================*/    
    UPDATE urunler1 
    SET urun_isim = (SELECT firma_ismi FROM tedarikciler
                    WHERE irtibat_ismi = 'Adam Eve')
    WHERE musteri_isim = 'Ali Bak';
    

/*==============================================================================
   ORNEK8: Laptop satin alan musterilerin ismini, Apple�in irtibat_isim�i ile
   degistirin
==============================================================================*/
 
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler1;
    
--    
    
    
    
    