/*=========================== EXISTS, NOT EXIST ================================
    EXISTS operator� bir Boolean operat�rd�r ve true - false de�er d�nd�r�r. 
    EXISTS operator� s�kl�kla Subquery'lerde sat�rlar�n do�rulu�unu test etmek 
    i�in kullan�l�r.
    
    E�er bir subquery (altsorgu) bir sat�r� d�nd�r�rse EXIST operat�r� de TRUE 
    de�er d�nd�r�r. Aksi takdirde, FALSE de�er d�nd�recektir.
    
    �zellikle altsorgularda h�zl� kontrol i�lemi ger�ekle�tirmek i�in kullan�l�r
==============================================================================*/

CREATE TABLE mart_satislar 
    (
        urun_id number(10),
        musteri_isim varchar2(50), 
        urun_isim varchar2(50)
    );
    
    CREATE TABLE nisan_satislar 
    (
        urun_id number(10),
        musteri_isim varchar2(50), 
        urun_isim varchar2(50)
    );
    
    INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
    INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
    INSERT INTO mart_satislar VALUES (20, 'John', 'Toyota');
    INSERT INTO mart_satislar VALUES (30, 'Amy', 'Ford');
    INSERT INTO mart_satislar VALUES (20, 'Mark', 'Toyota');
    INSERT INTO mart_satislar VALUES (10, 'Adem', 'Honda');
    INSERT INTO mart_satislar VALUES (40, 'John', 'Hyundai');
    INSERT INTO mart_satislar VALUES (20, 'Eddie', 'Toyota');
    
    
    INSERT INTO nisan_satislar VALUES (10, 'Hasan', 'Honda');
    INSERT INTO nisan_satislar VALUES (10, 'Kemal', 'Honda');
    INSERT INTO nisan_satislar VALUES (20, 'Ayse', 'Toyota');
    INSERT INTO nisan_satislar VALUES (50, 'Yasar', 'Volvo');
    INSERT INTO nisan_satislar VALUES (20, 'Mine', 'Toyota');
    
      
/* -----------------------------------------------------------------------------
  ORNEK1: MART VE N�SAN aylar�nda ayn� URUN_ID ile sat�lan �r�nlerin
  URUN_ID�lerini listeleyen ve ayn� zamanda bu �r�nleri MART ay�nda alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yaz�n�z. 
 -----------------------------------------------------------------------------*/       
    -- tablolara k�sa isim vermek m�mk�nd�r. B�ylece sorgular�m�z�n daha k�sa 
    -- g�z�kmesini sa�labiliriz.
    -- AS -> bir sutuna kisa isim veriliyor
    -- Bir sorgu iceresinde tabloyuda kisa ismi vermek mumkun
    -- tablo_adi kisa_isim
    
    SELECT musteri_isim FROM mart_satislar
    
    WHERE EXISTS (SELECT urun_id FROM nisan_satislar
                  WHERE mart_satislar.urun_id = nisan_satislar.urun_id);
                    
    -- WHERE urun_id IN(SELECT urun_id FROM nisan_satislar
    --                WHERE mart_satislar.urun_id = nisan_satislar.urun_id)
    
    -- IN ile de calisir fakata yavas calisir, exists daha hizli calisir.
    
    
    -- Bir sorgu iceresinde tabloyuda kisa ismi vermek mumkun
    -- tablo_adi kisa_isim
    
    SELECT musteri_isim FROM mart_satislar
    
    WHERE EXISTS (SELECT urun_id FROM nisan_satislar
                  WHERE m.urun_id = n.urun_id);
    
 
      
/* -----------------------------------------------------------------------------
  ORNEK2: Her iki ayda da sat�lan �r�nlerin URUN_ISIM'lerini ve bu �r�nleri
  N�SAN ay�nda sat�n alan MUSTERI_ISIM'lerini listeleyen bir sorgu yaz�n�z. 
 -----------------------------------------------------------------------------*/
 
 
 /* ----------------------------------------------------------------------------
  ORNEK3: Her iki ayda da ortak olarak sat�lmayan �r�nlerin URUN_ISIM'lerini 
  ve bu �r�nleri N�SAN ay�nda sat�n alan MUSTERI_ISIM'lerini listeleyiniz. 
 -----------------------------------------------------------------------------*/

    SELECT * FROM mart_satislar;
    SELECT * FROM nisan_satislar;
    
    DELETE FROM nisan_satislar;
    
     CREATE TABLE calisanlar
    (
        id CHAR(4),
        isim VARCHAR2(50),
        maas NUMBER(5),
        CONSTRAINT id_pk PRIMARY KEY (id)
    );
?
    INSERT INTO calisanlar VALUES('1001', 'Ahmet Aslan', 7000);
    INSERT INTO calisanlar VALUES( '1002', 'Mehmet Y�lmaz' ,12000);
    INSERT INTO calisanlar VALUES('1003', 'Meryem ', 7215);
    INSERT INTO calisanlar VALUES('1004', 'Veli Han', 5000);
 
    CREATE TABLE aileler
    (
        id CHAR(4),
        cocuk_sayisi VARCHAR2(50),
        ek_gelir NUMBER(5),
        CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar(id)
    );
    
    INSERT INTO aileler VALUES('1001', 4, 2000);
    INSERT INTO aileler VALUES('1002', 2, 1500);
    INSERT INTO aileler VALUES('1003', 1, 2200);
    INSERT INTO aileler VALUES('1004', 3, 2400);
    
    -- Veli Han'�n maa��na %20 zam yap�n�z.
    UPDATE calisanlar
    SET maas = maas * 1.2
    WHERE isim = 'Veli Han';
    
    -- Maa�� ortalaman�n alt�nda olanlara %20 zam yap�n�z.
    UPDATE calisanlar
    SET maas = maas * 1.2
    WHERE maas <  (SELECT AVG(maas) 
                   FROM calisanlar); 
                
    SELECT * FROM calisanlar;
    
    -- calisanlar�n isim ve cocuk_sayisi'ni listeyen sorguyu yaz�n�z.
    SELECT isim, (SELECT cocuk_sayisi FROM aileler
                 WHERE calisanlar.id = aileler.id) as cocuk_sayisi
    FROM calisanlar;
    
    -- calisanlar' �n  id, isim ve toplam_gelir'lerini g�steren bir sorgu yaz�n�z. 
    -- toplam_gelir = calisanlar.maas + aileler.ek_gelir 
    
    SELECT id, isim, (SELECT maas + ek_gelir FROM aileler
                      WHERE calisanlar.id = aileler.id) as toplam_gelir
    FROM calisanlar;
    
     
    -- e�er bir ailenin ki�i ba�� geliri 2000 TL den daha az ise o �al��an�n
    -- maa��na ek %10 aile yard�m zamm� yap�n�z. 
    -- kisi_basi_gelir = toplam_gelir / cocuk_sayisi + 2 (anne ve baba)
    
    UPDATE calisanlar 
    SET maas = maas * 1.1    
    WHERE (SELECT (maas + ek_gelir)/(cocuk_sayisi + 2) FROM aileler
          WHERE calisanlar.id = aileler.id) < 2000;  


    
    


