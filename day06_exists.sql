/*=========================== EXISTS, NOT EXIST ================================
    EXISTS operatorü bir Boolean operatördür ve true - false deðer döndürür. 
    EXISTS operatorü sýklýkla Subquery'lerde satýrlarýn doðruluðunu test etmek 
    için kullanýlýr.
    
    Eðer bir subquery (altsorgu) bir satýrý döndürürse EXIST operatörü de TRUE 
    deðer döndürür. Aksi takdirde, FALSE deðer döndürecektir.
    
    Özellikle altsorgularda hýzlý kontrol iþlemi gerçekleþtirmek için kullanýlýr
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
  ORNEK1: MART VE NÝSAN aylarýnda ayný URUN_ID ile satýlan ürünlerin
  URUN_ID’lerini listeleyen ve ayný zamanda bu ürünleri MART ayýnda alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yazýnýz. 
 -----------------------------------------------------------------------------*/       
    -- tablolara kýsa isim vermek mümkündür. Böylece sorgularýmýzýn daha kýsa 
    -- gözükmesini saðlabiliriz.
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
  ORNEK2: Her iki ayda da satýlan ürünlerin URUN_ISIM'lerini ve bu ürünleri
  NÝSAN ayýnda satýn alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazýnýz. 
 -----------------------------------------------------------------------------*/
 
 
 /* ----------------------------------------------------------------------------
  ORNEK3: Her iki ayda da ortak olarak satýlmayan ürünlerin URUN_ISIM'lerini 
  ve bu ürünleri NÝSAN ayýnda satýn alan MUSTERI_ISIM'lerini listeleyiniz. 
 -----------------------------------------------------------------------------*/
    
    
    
?
    SELECT * FROM mart_satislar;
    SELECT * FROM nisan_satislar;
    
    DELETE FROM nisan_satislar;
    


