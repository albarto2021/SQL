 
/*===========================================================
                        DAY01                  
============================================================*/

Kullanici olusturma

ALTER SESSION SET "_ORACLE_SCRIPT"=true; 
CREATE USER murat_cakir IDENTIFIED BY "1234";
GRANT CONNECT TO murat_cakir;
GRANT ALL PRIVILEGES TO murat_cakir; 








--1.Veritabanýmýzda ÜRÜNLER adýnda bir Tablo oluþturalým.
--•ürün_id => NUMBER
--•ürün_adý => VARCHAR2(50)
--•fiyat => NUMBER(5,2)
--•TETT => DATE,   
--•stok_adedi => NUMBER(10) 
--•
--2.Bu tabloya, belirlediðimiz veri tiplerine uygun olacak þekilde Ürün giriþi yapalým.
--•Örneðin CÝPS, KOLA, AYRAN, BÝSKÜVÝ, 
--•(100, ‘CÝPS’, 5.50, ‘01-05-2022’, 500)
--3.Veri giriþinden sonra SELECT komutu ile verilerimizi çekelim.



CREATE TABLE urunler
(
    urun_id NUMBER,
    urun_adi VARCHAR(50),
    fiyat NUMBER(5,2),
    TETT DATE,
    stok_adedi NUMBER
);

INSERT INTO urunler VALUES(100,'CIPS',5.50,'01.05.2022',500);
INSERT INTO urunler VALUES(101,'KOLA',10.50,'01.05.2022',100);
INSERT INTO urunler VALUES(102,'AYRAN',7.50,'01.05.2022',1500);
INSERT INTO urunler VALUES(103,'BISKUVI',3.50,'01.05.2022',300);
INSERT INTO urunler VALUES(104,'DONER',25.50,'01.05.2022',700);

SELECT *FROM urunler;