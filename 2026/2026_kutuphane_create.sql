use Hastane
--  
/*
SQL 
 1 - DML
 2 - DDL 
*/
-- DDL - data definition language
--create database library
--drop database library

use library

/*
kutuphane=(k_no,ismi,adres_no)
adresler=(adres_no,mahelle,şehri,ilce)
uyeler=(uye_no,ad,soyad,tel,adres_no)
kitap_kutuphane=(kbk_no,k_no,ISBN,adet)
kitaplar=(ISBN,ad,yayin_tarihi)
emanet=(emanet_no,ISBN,uye_no,amenet_tarihi,teslim_tarihi,k_no)
yazar_kitap=(yk_no,,ISBN,yazar_no)
yazar=(yazar_no,ad,soyad)
kitap_kategori=(kk_no,kategori_no,ISBN)
kategori=(kategori_no,kategori_ad)
*/

create table adres (
adres_no int identity(1,1) primary key,
mahalle varchar(50) not null,
cadde varchar(50),
il varchar(20) not null,
ilce varchar(20) not null
)

--uyeler=(uye_no,ad,soyad,tel,adres_no)
create table uyeler(
uye_no int primary key identity(1,1),
ad varchar(30) not null,
soyad varchar(30) not null,
tel char(10),
adres_no int foreign key references adres(adres_no)
)
--kutuphane=(k_no,ismi,adres_no)
create table kutuphane(
k_no int primary key identity(1,1),
ad varchar(50),
adres_id int,
constraint FK_adres_kutuphane foreign key (adres_id) references adres(adres_no) 
)
--kitaplar=(ISBN,ad,yayin_tarihi)
create table kitablar(
ISBN char(13),
ad varchar(50),
tarih date,
constraint PK_kitablar primary key (ISBN)--bana primary keye isim vememi sağladı
)
--emanet=(emanet_no,ISBN,uye_no,emanet_tarihi,teslim_tarihi,k_no)
create table emanet(
emanet_no int identity(1,1) primary key,
ISBN char(13) foreign key references kitablar(ISBN),
uye_no int,
kutuphane_no int,
emanet_tarihi datetime not null,
teslim_tarihi datetime,
constraint FK_uyeler_emanet foreign key (uye_no) references uyeler(uye_no),
constraint FK_kutuphane_emanet foreign key (kutuphane_no) references kutuphane(k_no)

)

--kitap_kutuphane=(kbk_no,k_no,ISBN,adet)
create table kitap_kutuphane(
kbk_no int primary key identity(1,1),
k_no int foreign key references kutuphane(k_no),
ISBN char(13) foreign key references kitablar(ISBN),
adet int default 0
)

--yazar=(yazar_no,ad,soyad)
create table yazar(
yazar_no int primary key identity(1,1),
ad varchar(20) not null,
soyad varchar(20) not null
)

--yazar_kitap=(yk_no,,ISBN,yazar_no)
--elle oluşturduk...

--kategori=(kategori_no,kategori_ad)
create table kategori(
kategori_no int primary key identity(1,1),
kategori_ad varchar(20)
)

--kitap_kategori=(kk_no,kategori_no,ISBN)
--kitap_kategori=(kategori_no,ISBN) varyasyon
create table kitap_kategori(
--kk_no int primary key identity(1,1),
kategori_no int  foreign key references kategori(kategori_no) ,
ISBN char(13)  foreign key references kitablar(ISBN) ,
constraint kitap_kategori_birincil_anahtar primary key (kategori_no,ISBN)

)

create table kitap_yazar(
--kk_no int primary key identity(1,1),
yazar_no int  foreign key references yazar(yazar_no) ,
ISBN char(13)  foreign key references kitablar(ISBN) ,
constraint kitap_yazar_birincil_anahtar primary key (yazar_no,ISBN)

)



