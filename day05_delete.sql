/*========================== DELETE ====================================*/
    -- DELETE FROM tablo_adi; Tablonun tum icerigini siler.
    -- Bu komut bir DML komutudu. Dolayisiyla deaminda WHERE gibi cumlecikleri 
    -- kullanilabilir (sartli silme)
    
    -- DELETE FROM tablo_adi
    -- WHERE sutun_adi = veri;
    
    
     
    CREATE TABLE ogrenciler
    (
        id CHAR(3),
        isim VARCHAR2(50),
        veli_isim VARCHAR2(50),
        yazili_notu NUMBER(3)       
    );
    
    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
	INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
?
/* =============================================================================
         Se�erek silmek i�in WHERE Anahtar kelimesi kullan�labilir.
===============================================================================*/

    DELETE FROM ogrenciler
    WHERE id = 124;
    
    SELECT * FROM ogrenciler;
    
    -- adi Kemal Yasa olan kaydi silelim
    DELETE FROM ogrenciler
    WHERE isim = 'Kemal Yasa';
    
    -- adi Nesibe Y�lmaz ve Mustafa Bak olan kayitlari silelim.
    DELETE FROM ogrenciler
    WHERE isim = 'Nesibe Yilmaz' OR isim= 'Mustafa Bak';     
    
    -- adi Ali Can olan ve id 123 olan kayitlari silelim.
    DELETE FROM ogrenciler
    WHERE isim = 'Ali Can' AND id= 123; 
    
    -- id'si 126'dan buyuk olan kayitlarin silin    
    DELETE FROM ogrenciler
    WHERE id < 126; 
    
    -- id' 123, 125 ve 126 olanlari silelim
    DELETE FROM ogrenciler
    WHERE id = 123 OR id=125 OR id=126; 
    
    -- Tablodaki tum verileri silelim
    DELETE FROM ogrenciler;
    
     ROLLBACK;
     
    --  DROP TABLE ogrenciler; -- Tabloyu siler ve Veri tabanini Cop kutusuna 
                                -- gonderir. (DDL komuttur.)
    
    FLASHBACK TABLE ogrenciler TO BEFORE DROP; --Cop kutusunda olan tabloyu geri getirir
    
    DROP TABLE ogrenciler PURGE; -- COP KUTUSUNA ATMADAN S�LER. shift+delete gibi
    
    DROP TABLE ogrenciler; 
    
    SELECT * FROM ogrenciler;
    
/*========================== TRUNCATE ====================================   
    -- DELETE gibi tum verileri siler. Secmeli silme yapamaz. (DDL komutudur)
    -- TRUNCATE ile simle yapidiginda ROLLBACK ile geri alma yapmaz
    -- Hassas silme islemi yapar.
    
    -- DROP - TRUNCATE - DELETE 
    
======================== DELETE - TRUCATE - DROP ============================  
   
    1-) TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamam�n� siler.
    Ancak, se�meli silme yapamaz. ��nk� Truncate komutu DML de�il DDL komutudur.
   
    2-) DELETE komutu beraberinde WHERE c�mleci�i kullan�labilir. TRUNCATE ile
    kullan�lmaz.
   
    3-) Delete komutu ile silinen veriler ROLLBACK Komutu ile kolayl�kla geri
    al�nabilir.
   
    4-) Truncate ile silinen veriler geri al�nmas� daha zordur. Ancak
    Transaction y�ntemi ile geri al�nmas� m�mk�n olabilir.
   
    5-) DROP komutu da bir DDL komutudur. Ancak DROP veriler ile tabloyu da
    siler. Silinen tablo Veritaban�n�n geri d�n���m kutusuna gider. Silinen
    tablo a�a��daki komut ile geri al�nabilir. Veya SQL GUI�den geri al�nabilir.
       
     FLASHBACK TABLE tablo_ad� TO BEFORE DROP;  -> tabloyu geri al�r.
    
     PURGE TABLE tablo_ad�;        -> Geri d�n���mdeki tabloyu siler.
           
     DROP TABLE tablo_ad� PURGE;  -> Tabloyu tamamen siler
==============================================================================*/
    
     CREATE TABLE talebeler
    (
        id CHAR(3),
        isim VARCHAR2(50),
        veli_isim VARCHAR2(50),
        yazili_notu NUMBER(3),
        CONSTRAINT talebe_pk PRIMARY KEY (id)
    );
    
    INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO talebeler VALUES(126, 'Nesibe Y�lmaz', 'Ayse',95);
	INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);
?
     CREATE TABLE notlar 
    ( 
        talebe_id char(3), 
        ders_adi varchar2(30), 
        yazili_notu number (3), 
        CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) 
        REFERENCES talebeler(id) ON DELETE CASCADE
    );
?
    INSERT INTO notlar VALUES ('123','kimya',75);
    INSERT INTO notlar VALUES ('124', 'fizik',65);
    INSERT INTO notlar VALUES ('124', 'fizik',75);
    INSERT INTO notlar VALUES ('125', 'tarih',90);
	INSERT INTO notlar VALUES ('126', 'Matematik',90);

    SELECT FROM talebeler;
    SELECT FROM notlar;
    
    DELETE FROM notlar
    WHERE talebe_id = 124;
    
    DELETE FROM talebeler 
    WHERE id = 124;
    
    
/*============================== ON DELETE CASCADE =============================
?
  Her defas�nda �nce child tablodaki verileri silmek yerine ON DELETE CASCADE
  silme �zelli�ini aktif hale getirebiliriz.
  
  Bunun i�in FK olan sat�r�n en sonuna ON DELETE CASCADE komutunu yazmak yeterli
  
==============================================================================*/ 
    
    
   