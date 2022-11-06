/* Tac Gia*/
create table TacGia(
 idTG nvarchar(255) primary key,
 tenTG nvarchar(255)
 )
 
 /* Nhan Vien*/
 create table NhanVien(
 idNV nvarchar(255) primary key,
 tenNV nvarchar(255),
 ngaysinh Date check (ngaysinh<getdate()),
 sdtNV int 
 )

 /* The Thanh Vien*/
 create table TheThuVien(
 idThe nvarchar(255) primary key,
 tenDG nvarchar(255),
 diachiDG nvarchar(255),
 sdtDG int CONSTRAINT sdtDG_check check(sdtDG like ('%[^0-9]%')),
 NgayBatDau Date check (NgayBatDau<=getdate()) not null,
 NgayHetHan Date, CONSTRAINT han_check check (NgayHetHan>=NgayBatDau)
 )


 /* Nha xuat ban*/
 create table NhaXuatBan(
 idNXB nvarchar(255) primary key,
 tenNXB nvarchar(255),
 diachiNXB nvarchar(255),
 EmailNXB nvarchar(255) CONSTRAINT Email_check check(EmailNXB like '%[A-Z0-9][@][A-Z0-9]%[.][A-Z0-9]%'),
 sdtNXB int 
 )
 /*The loai sach*/
 create table TheLoai(
 idLoai nvarchar(255) primary key,
 tenLoai nvarchar(255)
 )

 
 /*Sach*/
 create table Sach(
 idSach nvarchar(255) primary key,
 tenSach nvarchar(255),
 idTG nvarchar(255) not null,
			CONSTRAINT fk_sach_tacgia
			 FOREIGN KEY (idTG)
			 REFERENCES TacGia (idTG),
 idLoai nvarchar(255) not null,
		  CONSTRAINT fk_sach_loai
		  FOREIGN KEY (idLoai)
		  REFERENCES TheLoai (idLoai),
 idNXB nvarchar(255) not null,
		  CONSTRAINT fk_sach_NXB
		  FOREIGN KEY (idNXB)
		  REFERENCES NhaXuatBan (idNXB),
 namxuatban date check (namxuatban<=getdate())
 )
 /*Phieu muon*/
 create table PhieuMuon(
 idPM nvarchar(255) primary key,
 idSach nvarchar(255) not null,
		  CONSTRAINT fk_PM_Sach
		  FOREIGN KEY (idSach)
		  REFERENCES Sach (idSach),
 idThe nvarchar(255) not null,
		  CONSTRAINT fk_PM_The
		  FOREIGN KEY (idThe)
		  REFERENCES TheThuVien (idThe),
 idNV nvarchar(255) not null,
		  CONSTRAINT fk_PM_NV
		  FOREIGN KEY (idNV)
		  REFERENCES NhanVien (idNV),
 ngaymuon date check (ngaymuon <= getdate())
 )
 /*Phieu tra*/
 create table PhieuTra(
 idPT nvarchar(255) primary key,
 idSach nvarchar(255) not null,
		  CONSTRAINT fk_PT_Sach
		  FOREIGN KEY (idSach)
		  REFERENCES Sach (idSach),
 idThe nvarchar(255) not null,
		  CONSTRAINT fk_PT_The
		  FOREIGN KEY (idThe)
		  REFERENCES TheThuVien (idThe),
 idNV nvarchar(255) not null,
		  CONSTRAINT fk_PT_NV
		  FOREIGN KEY (idNV)
		  REFERENCES NhanVien (idNV),
 ngaytra date check (ngaytra <= getdate()) 
 )

 
insert into TacGia(idTG,tenTG)
values ('A1561','SunSunSun'),
       ('A1724','Dekiru'),
	   ('A2001',N'Rosie Nguyễn'),
	   ('A1999','Charles Perrault'),
	   ('A818','Neil Gaiman'),
	   ('A251','Mario Puzo'),
	   ('A2021','PGS. TS. Mach Quang Thang ')
insert into TheLoai(idLoai,tenLoai)
values ('RC','Romcom'),
       ('SH','Self-help'),
	   ('Mth','Mythologycal'),
	   ('SN',N'Siêu Nhiên'),
	   ('TT',N'Trinh Thám'),
	   ('HD',N'Hành Động'),
	   ('VH',N'Văn Học'),
	   ('GD',N'Giáo Dục'),
	   ('CT',N'Cổ tích')
insert into NhaXuatBan(idNXB,tenNXB)
values (N'VH',N'Nhà Xuất Bản Văn Học'),
       (N'WBs-KĐ',N'Nhà Xuất Bản Kim Đồng'),
	   (N'HNV',N'Nhà Xuất Bản Hội Nhà Văn'),
	   (N'HN',N'Nhà Xuất Bản Hà Nội'),
	   (N'GD',N'Nhà Xuất Bản Giáo Dục'),
	   (N'CTQG',N'Nhà Xuất Bản Chính Trị Quốc Gia Sự Thật')
insert into Sach(idSach,tenSach,idTG,idLoai,idNXB,namxuatban)
values ('S62',N'The GodFather','A251','VH',N'VH','2021'),
       ('S51',N'Tôi bị ám ảnh bởi nhỏ người Nga bàn bên','A1561','RC',N'WBs-KĐ','2022'),
       ('S52',N'Dekiru Nihongo','A1724','GD',N'GD','2021'),
	   ('S54',N'Giáo trình tư tưởng Hồ Chí Minh','A2021','GD',N'CTQG','2021'),
	   ('S60',N'Tuổi trẻ đáng giá bao nhiêu?','A2001','SH',N'HNV','2016'),
	   ('S92',N'Cô bé quàng khăn đỏ','A1999','CT',N'WBs-KĐ','2016'),
	   ('S66',N'Norse Mythology','A818','Mth',N'VH','2018')
insert into TheThuVien(idThe,tenDG,diachiDG,NgayBatDau,NgayHetHan)
values ('ST1512',N'Nguyễn Văn A',N'Đà Nẵng','2022-09-20','2023-9-20'),
       ('ST1617',N'Nguyễn Văn B',N'Quảng Nam','2021-02-10','2022-2-10'),
       ('ST1226',N'Lê Thị C',N'Quãng Ngãi','2022-05-28','2023-5-28'),
       ('ST7722',N'Trần Văn D',N'Quãng Bình','2021-09-23','2022-09-23')
insert into NhanVien(idNV,tenNV,ngaysinh,sdtNV)
values ('NV251',N'Trần Thị Thu A','1999-10-10','0273852185'),
       ('NV2563',N'Nguyễn Đại N','1994-11-22','0273851354'),
	   ('NV215',N'Trương Thị H','1996-02-10','0273861715')
insert into PhieuMuon(idPM,idSach,idThe,idNV,ngaymuon)
values ('MT216','S66','ST1512','NV251','2022-10-22'),
       ('MT222','S51','ST1512','NV251','2022-10-22'),
       ('MT277','S60','ST1617','NV2563','2021-06-12'),
       ('MT112','S52','ST1226','NV215','2022-05-30'),
       ('MT561','S54','ST7722','NV215','2022-02-15')
insert into PhieuTra(idPT,idSach,idThe,idNV,ngaytra)
values ('MT216','S66','ST1512','NV251','2022-10-25'),
       ('MT222','S51','ST1512','NV251','2022-10-27'),
       ('MT277','S60','ST1617','NV2563','2021-06-19'),
       ('MT112','S52','ST1226','NV215','2022-06-5'),
       ('MT561','S54','ST7722','NV215','2022-03-1')
CREATE TRIGGER trg_ngaysinh
on NhanVien
for insert,update
as
begin
declare @ngaysinh datetime
select @ngaysinh=ngaysinh
from inserted
if (@ngaysinh<getdate())
begin
	print'ngay sinh phai nho hon ngay hien tai'
end
else
begin
	print'successful'
end
end



