/*
kutuphane=(k_no,ismi,adres_no)X
adresler=(adres_no,mahelle,şehri,ilce)X
uyeler=(uye_no,ad,soyad,tel,adres_no)X
kitap_kutuphane=(kbk_no,k_no,ISBN,adet)X
kitaplar=(ISBN,ad,yayin_tarihi)X
emanet=(emanet_no,ISBN,uye_no,amenet_tarihi,teslim_tarihi,k_no)X
yazar_kitap=(yk_no,,ISBN,yazar_no)
yazar=(yazar_no,ad,soyad)
kitap_kategori=(kk_no,kategori_no,ISBN)
kategori=(kategori_no,kategori_ad)
*/
--DDL (data Definition Language-SQL)
--create
--drop
--alter
--truncate

--create database OUR_library
--drop database library

USE OUR_LIBRARY
create table ADRESLER(
ADRES_NO INT IDENTITY(1,1) PRIMARY KEY,
MAHALLE VARCHAR(20) NOT NULL,
CADDE CHAR(20) NOT NULL,
KAPI_NO INT
)

--DROP TABLE ADRESLER
--kutuphane=(k_no,ismi,adres_no)
CREATE TABLE KUTUBHANE(
KUTUBHANE_ID INT IDENTITY(1,1) PRIMARY KEY,
AD VARCHAR(50) NOT NULL,
ADRES_NO INT FOREIGN KEY REFERENCES ADRESLER(ADRES_NO)
)

--uyeler=(uye_no,ad,soyad,tel,adres_no)
CREATE TABLE UYELER (
UYE_ID INT IDENTITY(1,1) PRIMARY KEY,
AD VARCHAR(20) NOT NULL,
SOYAD VARCHAR(20),
TEL CHAR(11),
ADRES_NO INT,
CONSTRAINT FK_UYELER_ADRESLER FOREIGN KEY (ADRES_NO) REFERENCES ADRESLER(ADRES_NO)
)
--emanet=(emanet_no,ISBN,uye_no,amenet_tarihi,teslim_tarihi,k_no)
CREATE TABLE EMANET(
EMANET_ID INT IDENTITY(1,1) PRIMARY KEY,
ISBN INT FOREIGN KEY REFERENCES KITABLAR(ISBN),
UYE_ID INT FOREIGN KEY REFERENCES UYELER(UYE_ID),
KUTUPHANE_ID INT FOREIGN KEY REFERENCES KUTUBHANE(KUTUBHANE_ID),
EMANET_TARIHI DATETIME NOT NULL,
TESLIM_TARIHI DATETIME
)


--yazar=(yazar_no,ad,soyad)
CREATE TABLE YAZARLAR(
YAZAR_ID INT IDENTITY(1,1),
AD VARCHAR(20) NOT NULL,
SOYAD VARCHAR(20) NOT NULL,
CONSTRAINT PK_YAZARLAR PRIMARY KEY (YAZAR_ID)
)
--kategori=(kategori_no,kategori_ad)
CREATE TABLE KATEGORI(
KATEGORI_ID INT IDENTITY(1,1) PRIMARY KEY,
AD VARCHAR(20)
)
--kitap_kategori=(kk_no,kategori_no,ISBN)
CREATE TABLE KITAB_KATEGORI(
KITAB_KATEGORI_ID INT IDENTITY(1,1) PRIMARY KEY,
KATEGORI_ID INT ,
ISBN INT ,
CONSTRAINT HEDE FOREIGN KEY (KATEGORI_ID) REFERENCES KATEGORI(KATEGORI_ID),
CONSTRAINT HODO FOREIGN KEY (ISBN) REFERENCES KITABLAR(ISBN)
)
--yazar_kitap=(ISBN,yazar_no)
CREATE TABLE KITAB_YAZAR(
YAZAR_ID INT FOREIGN KEY REFERENCES YAZARLAR(YAZAR_ID),
ISBN INT FOREIGN KEY REFERENCES KITABLAR(ISBN),
CONSTRAINT PK_KITAB_YAZAR PRIMARY KEY (YAZAR_ID,ISBN)
)




/*
use library
if not exists (select * from sys.tables where name like 'ders')
select 'emre'
else 
select 'BENDES'
*/