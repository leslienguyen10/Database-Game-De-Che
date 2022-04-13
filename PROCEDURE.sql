-- PRO 1
CREATE PROCEDURE themnguoichoi 
(
@nc_id INT,
@city_id VARCHAR(7),
@hoten NVARCHAR(30),
@nickname VARCHAR(12),
@ngaysinh DATE,
@tentp VARCHAR(30),
@tg_id INT,
@vm_id VARCHAR(5)
)
AS
BEGIN
SET NOCOUNT ON
		INSERT INTO THANHPHO
		(CITY_ID, CITY_NAME, THEGIOI_ID, VANMINH_ID) VALUES
			(@city_id, @tentp, @tg_id, @vm_id)
		INSERT INTO NGUOICHOI
		(PLAYER_ID, CITY_ID, HOVATEN, NICKNAME, BIRTH_DATE, DATE_REGIS, DATE_LAST_LOGOUT) VALUES
			(@nc_id, @city_id, @hoten, @nickname, @ngaysinh, GETDATE(), GETDATE())
		INSERT INTO THUOCTINH
		(CITY_ID, BC01, BC02, BC03, BC04, BC05, BC06, TN_01, TN_02, TN_03, TN_04, DIEMKN) VALUES
			(@city_id, 50, 20,0 ,0 ,0 ,0, 2000, 2000, 500, 20, 0)
	END

EXEC themnguoichoi @nc_id = 9922334, @city_id = 'CCCCCCC', @hoten = N'NguyỄNn NhƯ QuỲnh', @nickname = 'HAHAHA',
@ngaysinh = '2001-10-10', @tentp = 'Condhai', @tg_id = 2, @vm_id = 'AC01'

-- PRO 2
CREATE PROCEDURE themlienminh 
(
@tg_id INT,
@lm_id VARCHAR(5),
@lm_name VARCHAR(30),
@boss_id INT
)
AS
BEGIN
SET NOCOUNT ON
	INSERT INTO LIENMINH
		(THEGIOI_ID, LIENMINH_ID, LIENMINH_NAME, BOSS_ID, THANHLAP) VALUES
			(@tg_id, @lm_id, @lm_name, @boss_id, GETDATE())
	INSERT INTO THANHVIEN
		(LIENMINH_ID, PLAYER_ID, NGAYTGIA) VALUES
			(@lm_id, @boss_id, GETDATE())
	END

EXEC themlienminh @tg_id = 2, @lm_id = 'LM_31', @lm_name = 'KhonglamdoiAn', @boss_id = 140152

-- PRO 3
CREATE PROCEDURE thaydoitentp
(
@tp_id CHAR(7),
@tp_name VARCHAR(30)
)
AS
BEGIN
	UPDATE THANHPHO
	SET CITY_NAME = @tp_name
	WHERE CITY_ID = @tp_id
END

EXEC thaydoitentp 'BN97758', 'NHUANFD'

-- PRO 4
CREATE PROCEDURE soluongthanhvien (@TENLM VARCHAR(20))
AS
BEGIN
	SELECT LIENMINH.LIENMINH_ID, COUNT(PLAYER_ID) AS SOLUONG 
	FROM THANHVIEN
	JOIN LIENMINH 
	ON THANHVIEN.LIENMINH_ID = LIENMINH.LIENMINH_ID
	GROUP BY LIENMINH.LIENMINH_ID, LIENMINH.LIENMINH_NAME
	HAVING LIENMINH.LIENMINH_NAME = @TENLM
END

EXEC soluongthanhvien 'ConRongChauTien'

-- PRO 5
CREATE PROCEDURE giaodichgannhat (@TENNC VARCHAR(20))
AS
BEGIN
	SELECT TOP(1) NC.PLAYER_ID, NICKNAME, GIAODICH_ID, GOIVP_ID, NGAYGD 
	FROM NGUOICHOI AS NC
	JOIN GIAODICH AS GD
	ON NC.PLAYER_ID = GD. PLAYER_ID
	WHERE NICKNAME = @TENNC
	ORDER BY NGAYGD DESC
END

EXEC giaodichgannhat 'jvijirj4'

-- PRO 6
CREATE PROCEDURE nhiemvuhientai (@TENTP VARCHAR(20))
AS
BEGIN
	SELECT TP.CITY_ID, CITY_NAME, NHIEMVU_ID, "STATUS" 
	FROM THUCHIEN AS TH
	JOIN THANHPHO AS TP
	ON TP.CITY_ID = TH.CITY_ID
	WHERE "STATUS" = 'PROCESSING'
	AND CITY_NAME = @TENTP
END

EXEC nhiemvuhientai 'Barcelona'