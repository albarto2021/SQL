 
/*===========================================================
������������������������DAY01������������������
============================================================*/

Kullanici olusturma

ALTER�SESSION�SET�"_ORACLE_SCRIPT"=true;�
CREATE�USER�murat_cakir�IDENTIFIED�BY�"1234";
GRANT�CONNECT�TO�murat_cakir;
GRANT�ALL�PRIVILEGES�TO�murat_cakir;�








--1.Veritaban�m�zda �R�NLER ad�nda bir Tablo olu�tural�m.
--��r�n_id => NUMBER
--��r�n_ad� => VARCHAR2(50)
--�fiyat => NUMBER(5,2)
--�TETT => DATE,   
--�stok_adedi => NUMBER(10) 
--�
--2.Bu tabloya, belirledi�imiz veri tiplerine uygun olacak �ekilde �r�n giri�i yapal�m.
--��rne�in C�PS, KOLA, AYRAN, B�SK�V�, 
--�(100, �C�PS�, 5.50, �01-05-2022�, 500)
--3.Veri giri�inden sonra SELECT komutu ile verilerimizi �ekelim.



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