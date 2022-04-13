-- TRIGGER 4
CREATE TRIGGER CAPNHATDIEMLM
ON DOIDAU
AFTER INSERT
AS
BEGIN
	UPDATE LIENMINH
	SET LIENMINH.DIEMLIENMINH = I.DIEMLM 
	FROM
		(SELECT THANHVIEN.LIENMINH_ID, SUM(CHISOTHANG) AS DIEMLM
		FROM THANHVIEN
		LEFT JOIN NGUOICHOI 
		ON THANHVIEN.PLAYER_ID = NGUOICHOI.PLAYER_ID
		GROUP BY THANHVIEN.LIENMINH_ID) AS I
	WHERE LIENMINH.LIENMINH_ID = I.LIENMINH_ID
END

