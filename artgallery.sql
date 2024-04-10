show databases;
create database artgallery;
use artgallery;
show tables;
create table artist(artist_no int(5) primary key,
artist_name varchar(30) not null,
artist_dob date not null,
artist_type varchar(15)  not null
);
desc artist;
create table artwork(artwork_no varchar(5) primary key,
artwork_date date not null,
artist_no int(5) not null,
foreign key(artist_no) references artist(artist_no)
);
desc artwork;
create table gallery(gal_code varchar(5) primary key,
gal_location varchar(20) not null,
artist_no int(5) not null,
foreign key(artist_no) references artist(artist_no)
);
desc gallery;
create table customer(customer_no int(5) primary key,
customer_name varchar(15) not null,
customer_dob date not null,
artwork_no varchar(5) not null,
foreign key(artwork_no) references artwork(artwork_no)
);
desc customer;
create table manager(manager_no int(5) primary key,
manager_name varchar(10) not null,
manager_dob date not null,
gal_code varchar(5) not null,
foreign key(gal_code) references gallery(gal_code)
);
desc manager;
create table if not exists auction(base_price int(5) primary key,
auction_price int(5),
auction_desc varchar(10) not null,
artwork_no varchar(5) not null,
foreign key(artwork_no) references artwork(artwork_no)
);
desc auction;
insert into artist values ("1","Smith","1998-10-23","Landscape");
insert into artist values ("2","John","1995-12-13","Landscape");
insert into artist values ("3","Harry","1990-03-22","Potrait");
insert into artist values ("4","Justin","1999-12-03","Potrait");
insert into artist values ("5","James","1985-05-09","Oil painting");
select *from artist;
insert into artwork values ("150","2016-11-30","3");
insert into artwork values ("102","2018-02-21","2");
insert into artwork values ("250","2015-03-12","5");
insert into artwork values ("202","2012-08-13","1");
insert into artwork values ("350","2010-03-01","4");
select *from artwork;
alter table artwork drop column artwork_name;
desc artwork;
insert into customer values ("11","Jasmine","1987-06-12","102");
insert into customer values ("12","Riyan","1997-08-22","150");
insert into customer values ("13","Ajay","1982-06-02","350");
insert into customer values ("14","Virat","1990-12-19","102");
insert into customer values ("15","Rachana","1998-05-14","250");
select *from customer;
insert into gallery values ("111","Vishal","1");
insert into gallery values ("121","Kavya","2");
insert into gallery values ("131","Keerthi","3");
insert into gallery values ("141","Vamshi","4");
insert into gallery values ("151","Akash","5");
select *from gallery;
insert into manager values ("501","Kalyan","1996-12-06","111");
insert into manager values ("502","Vijay","1990-09-12","111");
insert into manager values ("503","Mahesh","1992-08-22","121");
insert into manager values ("504","Varun","1989-12-01","131");
insert into manager values ("505","Trisha","1999-03-03","151");
select *from manager;
insert into auction values ("2300","2160","SOLD","102");
insert into auction values ("4500","4960","SOLD","150");
insert into auction values ("1380",null,"NOTSOLD","350");
insert into auction values ("2100","2100","SOLD","202");
insert into auction values ("2200",null,"NOTSOLD","250");
select* from auction;

select A.artist_name,A.artist_type,B.artwork_no from artist AS A,artwork AS B where A.artist_no=B.artist_no;
select a.artist_name,B.artwork_no,C.customer_name from artist as a,artwork AS B,customer AS C where a.artist_no=B.artist_no and B.artwork_no=C.artwork_no;
select a.artist_name,d.gal_location,d.gal_code,e.manager_name from artist as a,gallery as d,manager as e where a.artist_no=d.artist_no and d.gal_code=e.gal_code;
select a.artwork_no,b.base_price,b.auction_price,b.auction_desc,c.customer_name from ((artwork as a join auction as b on a.artwork_no=b.artwork_no)join customer as c on a.artwork_no=c.artwork_no ) where c.artwork_no="150";
select a.artist_name,b.gal_location,c.manager_name from ((artist as a left outer join gallery as b on a.artist_no=b.artist_no) left outer join manager as c on b.gal_code=c.gal_code) where c.manager_name="Varun";
select a.artwork_no,b.base_price,b.auction_price,b.auction_desc,c.customer_name from(artwork as a join auction as b on a.artwork_no=b.artwork_no) join customer as c on a.artwork_no=c.artwork_no) where c.artwork_no="150";



