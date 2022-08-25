-- create db

CREATE DATABASE IF NOT EXISTS jira_project;

-- use db

USE jira_project;

-- create table khach_hang

CREATE TABLE
    IF NOT EXISTS khach_hang(
        id INT NOT NULL AUTO_INCREMENT,
        thu_dien_tu NVARCHAR(50) NOT NULL,
        mat_khau NVARCHAR(255) NOT NULL,
        ho_ten NVARCHAR(50),
        hinh_anh NVARCHAR(10) NOT NULL,
        so_dien_thoai NVARCHAR(20),
        dia_chi NVARCHAR(100),
        xa_phuong NVARCHAR(50),
        huyen_quan NVARCHAR(50),
        tinh_thanh NVARCHAR(50),
        vai_tro NVARCHAR(10),
        PRIMARY KEY (id)
    );

-- create table san_pham

CREATE TABLE
    IF NOT EXISTS san_pham(
        id INT NOT NULL AUTO_INCREMENT,
        ten NVARCHAR(100) NOT NULL,
        album NVARCHAR(10) NOT NULL,
        mo_ta TEXT,
        gia_goc INT NOT NULL,
        giam_gia INT,
        so_luong INT NOT NULL,
        ngay_nhap DATE NOT NULL,
        ton_kho INT NOT NULL,
        danh_gia INT NOT NULL,
        phan_loai NVARCHAR(50) NOT NULL,
        thuong_hieu NVARCHAR(20) NOT NULL,
        PRIMARY KEY (id)
    );

-- create table nguoi_nhan

CREATE TABLE
    IF NOT EXISTS nguoi_nhan(
        id INT NOT NULL AUTO_INCREMENT,
        ho_ten NVARCHAR(50) NOT NULL,
        so_dien_thoai NVARCHAR(20) NOT NULL,
        dia_chi NVARCHAR(100) NOT NULL,
        xa_phuong NVARCHAR(50) NOT NULL,
        huyen_quan NVARCHAR(50) NOT NULL,
        tinh_thanh NVARCHAR(50) NOT NULL,
        ghi_chu TEXT,
        PRIMARY KEY (id)
    );

-- create table don_hang

CREATE TABLE
    IF NOT EXISTS don_hang(
        id INT NOT NULL AUTO_INCREMENT,
        ngay_dat DATE NOT NULL,
        ngay_giao DATE,
        tong_gio_hang INT NOT NULL,
        chi_phi_van_chuyen INT NOT NULL,
        tong_don_hang INT NOT NULL,
        phuong_thuc_thanh_toan NVARCHAR(50) NOT NULL,
        trang_thai NVARCHAR(20) NOT NULL,
        id_khach_hang INT NOT NULL,
        id_nguoi_nhan INT NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id),
        FOREIGN KEY (id_nguoi_nhan) REFERENCES nguoi_nhan(id)
    );

-- create table chi_tiet_don_hang

CREATE TABLE
    IF NOT EXISTS chi_tiet_don_hang(
        id_don_hang INT NOT NULL,
        id_san_pham INT NOT NULL,
        so_luong_san_pham INT NOT NULL,
        gia_ban INT NOT NULL,
        PRIMARY KEY (id_don_hang, id_san_pham),
        FOREIGN KEY (id_don_hang) REFERENCES don_hang(id),
        FOREIGN KEY (id_san_pham) REFERENCES san_pham(id)
    );

-- create table phi_van_chuyen

CREATE TABLE
    IF NOT EXISTS phi_van_chuyen(
        id INT NOT NULL AUTO_INCREMENT,
        tinh_thanh NVARCHAR(50) NOT NULL,
        chi_phi_van_chuyen INT NOT NULL,
        PRIMARY KEY (id)
    );

-- create table thu_phan_hoi

CREATE TABLE
    IF NOT EXISTS thu_phan_hoi(
        id INT NOT NULL AUTO_INCREMENT,
        ho_ten NVARCHAR(50) NOT NULL,
        email NVARCHAR(50) NOT NULL,
        chu_de NVARCHAR(20),
        noi_dung TEXT,
        PRIMARY KEY (id)
    );

-- create table nhan_xet

CREATE TABLE
    IF NOT EXISTS nhan_xet(
        id INT NOT NULL AUTO_INCREMENT,
        danh_gia INT NOT NULL,
        binh_luan TEXT,
        id_san_pham INT NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (id_san_pham) REFERENCES san_pham(id)
    );

-- add data to khach_hang

INSERT INTO
    khach_hang (
        thu_dien_tu,
        mat_khau,
        ho_ten,
        hinh_anh,
        so_dien_thoai,
        dia_chi,
        xa_phuong,
        huyen_quan,
        tinh_thanh,
        vai_tro
    )
VALUES (
        'nguyenvana@gmail.com',
        '$2a$12$bIlMeYu4wYSQBQY/IDYfeODaLw47qaoJRMcNukFjV0nqFppUSd9Ue',
        'Nguyễn Văn A',
        '1.jpg',
        '0987654321',
        '112 đường Cao Thắng',
        'P.4',
        'Q.3',
        'Hồ Chí Minh',
        'client'
    );

-- add data to san_pham

INSERT INTO
    san_pham(
        ten,
        album,
        mo_ta,
        gia_goc,
        giam_gia,
        so_luong,
        ngay_nhap,
        ton_kho,
        danh_gia,
        phan_loai,
        thuong_hieu
    )
VALUES (
        'Máy tính xách tay Apple MacBook Pro MR9R2',
        '1808315',
        '- CPU: Core i5 (2.3 GHz)
- Màn hình: 13.3"" (2560 x 1600), không cảm ứng
- RAM: 8GB LPDDR3 2133MHz
- Đồ họa: Intel Iris Plus Graphics 650
- Lưu trữ: 512GB SSD
- Hệ điều hành: macOS
- Pin: Pin liền',
        49890000,
        2100000,
        10,
        '2022-01-01',
        1,
        5,
        'Máy tính xách tay',
        'APPLE'
    ), (
        'Máy in laser trắng đen HP M607N',
        '19010091',
        '- Máy in Laser trắng đen
- Tạo các văn bản sắc nét, chữ in màu đen đậm nét
- Khởi động và in nhanh, tiết kiệm năng lượng',
        26724000,
        2480000,
        10,
        '2022-01-01',
        1,
        5,
        'Thiết bị ngoại vi',
        'HP'
    ), (
        'Chuột gaming không dây Logitech G903 Hero',
        '191004344',
        '- Chuột chơi game không dây Lightspeed G903 
- Kết nối không dây Lightspeed  
- Cảm biến HERO 16K DPI tối đa lên đến 16.000 
- Thiết kế đối xứng, nút bấm có thể lập trình lên đến 11 nút',
        3790000,
        801000,
        10,
        '2022-01-01',
        2,
        5,
        'Thiết bị ngoại vi',
        'LOGITECH'
    ), (
        'Bàn phím cơ Logitech Gaming G813',
        '191005936',
        '- Bàn phím cơ
- Kết nối: USB
- Switch: GL Tactile
- Phím chức năng: Có',
        4699000,
        1410000,
        10,
        '2022-01-01',
        1,
        5,
        'Thiết bị ngoại vi',
        'LOGITECH'
    ), (
        'Máy tính bảng Apple iPad Pro MHR83ZA/A',
        '210403621',
        '- Chính hãng, mới 100%, nguyên seal
- Màn hình: 12.9"(diagonal) mini-LED backlit Multi‑Touch display with IPS
- Camera sau: 12MP, 10MP
- Camera trước: 12MP
- CPU: Apple M1
- Bộ nhớ: 512GB
- RAM: 8GB
- Hệ điều hành: IOS',
        42990000,
        3840000,
        10,
        '2022-01-01',
        1,
        5,
        'Máy tính bảng',
        'APPLE'
    ), (
        'Máy tính để bàn Lenovo IdeaCentre AIO 3 22ITL6 F0G500AGVN',
        '211110867',
        '- CPU: Intel Core i5-1135G7 (2.40 GHz - 4.20 GHz / 8MB / 4 nhân, 8 luồng)
- RAM: 2 x 4GB DDR4 3200MHz (2 Khe cắm, hỗ trợ tối đa 16GB)
- Đồ họa: Intel Iris Xe Graphics
- Lưu trữ: 256GB M.2 NVMe SSD
- Bàn phím + Chuột không dây',
        21390000,
        5400000,
        10,
        '2022-01-01',
        2,
        5,
        'Máy tính để bàn',
        'LENOVO'
    ), (
        'Máy tính xách tay HP OMEN 16-b0123TX 4Y0W6PA',
        '211205928',
        '- CPU: Intel Core i7-11800H
- Màn hình: 16.1" IPS (2560 x 1440), 165Hz
- RAM: 2 x 16GB DDR4 3200MHz
- Đồ họa: NVIDIA GeForce RTX 3070 8GB GDDR6 / Intel UHD Graphics
- Lưu trữ: 2 x 512GB SSD M.2 NVMe
- Hệ điều hành: Windows 11 Home
- Pin: 6 cell 83 Wh Pin liền
- Khối lượng: 2.3 kg',
        61990000,
        4400000,
        10,
        '2022-01-01',
        3,
        5,
        'Máy tính xách tay',
        'HP'
    ), (
        'Tay cầm gamepad không dây MSI GC30 V2',
        '220200134',
        '- Pin 600 mAh Li-ion, kéo dài 8 giờ
- Hệ điều hành tương thích Windows 10 / Android 4.1 trở lên
- Động cơ rung kép bên trong
- Công tắc bền bỉ với cảm giác tuyệt vời',
        1090000,
        91000,
        10,
        '2022-01-01',
        2,
        5,
        'Thiết bị ngoại vi',
        'MSI'
    ), (
        'Máy tính xách tay MSI Vector GP76 12UGS',
        '220202046',
        '- CPU: Intel Core i7-12700H
- Màn hình: 17.3" IPS (1920 x 1080), 360Hz
- RAM: 2 x 8GB DDR4 3200MHz
- Đồ họa: NVIDIA GeForce RTX 3070Ti 6GB GDDR6 / Intel Iris Xe Graphics
- Lưu trữ: 1TB SSD M.2 NVMe /
- Hệ điều hành: Windows 11 Home
- Pin: 4 cell 65 Wh Pin liền
- Khối lượng: 2.9 kg',
        57990000,
        3790000,
        10,
        '2022-01-01',
        1,
        5,
        'Máy tính xách tay',
        'MSI'
    ), (
        'Máy tính xách tay Dell Alienware M15 R6 P109F001CBL',
        '220202631',
        '- CPU: Intel Core i7-11800H
- Màn hình: 15.6" WVA (2560 x 1440), 240Hz
- RAM: 2 x 16GB DDR4 3200MHz
- Đồ họa: NVIDIA GeForce RTX 3060 6GB GDDR6 / Intel UHD Graphics
- Lưu trữ: 1TB SSD M.2 NVMe
- Hệ điều hành: Windows 11 Home SL
- Pin: 6 cell 86 Wh Pin liền
- Khối lượng: 2.7 kg',
        64990000,
        4600000,
        10,
        '2022-01-01',
        1,
        5,
        'Máy tính xách tay',
        'DELL'
    ), (
        'Màn hình LCD MSI PRO MP271QP',
        '220303296',
        '- Kích thước: 27" (2560 x 1440), Tỷ lệ 16:9
- Tấm nền IPS, Góc nhìn: 178 (H) / 178 (V)
- Tần số quét: 60Hz , Thời gian phản hồi 5 ms
- HIển thị màu sắc: 16.7 triệu màu
- Cổng hình ảnh: 1 x DisplayPort 1.2, 2 x HDMI 1.4',
        6690000,
        400000,
        10,
        '2022-01-01',
        4,
        5,
        'Thiết bị ngoại vi',
        'MSI'
    ), (
        'Máy tính xách tay ACER Predator Triton 500 SE PT516-52s-75E3 NH.QFQSV.001',
        '220401032',
        '- CPU: Intel Core i7-12700H
- Màn hình: 16" IPS (2560 x 1600), 240Hz
- RAM: 16GB LPDDR5
- Đồ họa: NVIDIA GeForce RTX 3070Ti 8GB GDDR6 / Intel Iris Xe Graphics
- Lưu trữ: 1TB SSD M.2 NVMe
- Hệ điều hành: Windows 11 Home SL
- Pin: 4 cell 99 Wh Pin liền
- Khối lượng: 2.4 kg',
        69990000,
        6000000,
        10,
        '2022-01-01',
        2,
        5,
        'Máy tính xách tay',
        'ACER'
    ), (
        'Điện thoại ASUS ROG Phone 5S ZS676KS-1A111WW',
        '220402991',
        '- Chính hãng, mới 100%, nguyên seal
- Màn hình: 6.78 inch
- Camera sau: 64MP, 13MP, 5MP
- Camera trước: 24MP
- CPU: Snapdragon 888 Plus
- Bộ nhớ: 128GB
- RAM: 8GB
- Hệ điều hành: Android',
        16990000,
        700000,
        10,
        '2022-01-01',
        1,
        5,
        'Điện thoại di động',
        'ASUS'
    ), (
        'Tai nghe Over-ear Asus ROG Delta S Animate',
        '220403053',
        '- Kiểu Over-ear
- Kết nối USB 2.0, USB Type-C
- Kiểu kết nối: Tai nghe có dây
- Đèn LED Có
- Microphone Có
- Kích thước driver 50 mm
- Trở kháng 32 ohms
- Tần số phản hồi 20 ~ 40000 Hz',
        5790000,
        591000,
        10,
        '2022-01-01',
        1,
        5,
        'Thiết bị ngoại vi',
        'ASUS'
    ), (
        'Máy tính xách tay Lenovo Legion 7 16ACHg6 82N600NSVN',
        '220503223',
        '- CPU: AMD Ryzen 9 5900HX
- Màn hình: 16" IPS (2560 x 1600), 165Hz
- RAM: 2 x 16GB DDR4 3200MHz
- Đồ họa: NVIDIA GeForce RTX 3080 16GB GDDR6 / AMD Radeon Graphics
- Lưu trữ: 1TB SSD M.2 NVMe
- Hệ điều hành: Windows 11 Home
- Pin: 4 cell Pin liền
- Khối lượng: 2.5 kg',
        79990000,
        1000000,
        10,
        '2022-01-01',
        1,
        5,
        'Máy tính xách tay',
        'LENOVO'
    ), (
        'Máy tính xách tay ASUS ROG Zephyrus G15 GA503RW-LN100W',
        '220503385',
        '- CPU: AMD Ryzen 7 6800HS
- Màn hình: 15.6" IPS (2560 x 1440), 240Hz
- RAM: 1 x 16GB, 16GB Onboard DDR5 4800MHz
- Đồ họa: NVIDIA GeForce RTX 3070Ti 8GB GDDR6 / AMD Radeon 680M
- Lưu trữ: 1TB SSD M.2 NVMe
- Hệ điều hành: Windows 11 Home
- Pin: 4 cell 90 Wh
- Khối lượng: 1.9 kg',
        65990000,
        1000000,
        10,
        '2022-01-01',
        1,
        5,
        'Máy tính xách tay',
        'ASUS'
    );

-- add data to phi_van_chuyen

INSERT INTO
    phi_van_chuyen (
        tinh_thanh,
        chi_phi_van_chuyen
    )
VALUES ('An Giang', 20000), ('Bạc Liêu', 27000), ('Bắc Giang', 44000), ('Bắc Kạn', 47000), ('Bắc Ninh', 54000), ('Bến Tre', 16000), ('Bình Dương', 5000), ('Bình Định', 15000), ('Bình Phước', 3000), ('Bình Thuận', 7000), ('Cà Mau', 28000), ('Cao Bằng', 49000), ('Cần Thơ', 24000), ('Đà Nẵng', 20000), ('Đắk Lắk', 6000), ('Đắk Nông', 5000), ('Điện Biên', 38000), ('Đồng Nai', 6000), ('Đồng Tháp', 11000), ('Gia Lai', 8000), ('Hà Giang', 50000), ('Hà Nam', 52000), ('Hà Nội', 56000), ('Hà Tĩnh', 24000), ('Hải Dương', 67000), ('Hải Phòng', 65000), ('Hậu Giang', 25000), ('Hòa Bình', 34000), ('Hồ Chí Minh', 0), ('Hưng Yên', 53000), ('Khánh Hòa', 13000), ('Kiên Giang', 21000), ('Kon Tum', 10000), ('Lai Châu', 40000), ('Lạng Sơn', 45000), ('Lào Cai', 39000), ('Lâm Đồng', 4000), ('Long An', 12000), ('Nam Định', 63000), ('Nghệ An', 27000), ('Ninh Bình', 62000), ('Ninh Thuận', 11000), ('Phú Thọ', 35000), ('Phú Yên', 14000), ('Quảng Bình', 23000), ('Quảng Nam', 18000), ('Quảng Ngãi', 16000), ('Quảng Ninh', 68000), ('Quảng Trị', 22000), ('Sóc Trăng', 26000), ('Sơn La', 36000), ('Tây Ninh', 10000), ('Thái Bình', 64000), ('Thái Nguyên', 46000), ('Thanh Hóa', 28000), ('Thừa Thiên Huế', 21000), ('Tiền Giang', 14000), ('Trà Vinh', 17000), ('Tuyên Quang', 48000), ('Vĩnh Long', 15000), ('Vĩnh Phúc', 55000), ('Vũng Tàu', 8000), ('Yên Bái', 37000);