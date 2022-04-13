-- TRIGGER 3
CREATE TRIGGER KETQUA
ON DOIDAU
AFTER INSERT
AS
BEGIN
	DECLARE @thang INT
	SELECT @thang = I.WINNER FROM INSERTED AS I

	IF (@thang = 0) 
	BEGIN
		UPDATE THUOCTINH
		SET TN_01 = TN_01 + 2000
		FROM inserted, THUOCTINH JOIN NGUOICHOI 
		ON NGUOICHOI.CITY_ID = THUOCTINH.CITY_ID
		WHERE INSERTED.PLAYER1_ID = NGUOICHOI.PLAYER_ID 

		UPDATE THUOCTINH
		SET TN_02 = TN_02 + 2000
		FROM inserted, THUOCTINH JOIN NGUOICHOI 
		ON NGUOICHOI.CITY_ID = THUOCTINH.CITY_ID
		WHERE INSERTED.PLAYER1_ID = NGUOICHOI.PLAYER_ID 

		UPDATE THUOCTINH
		SET TN_03 = TN_03 + 500
		FROM inserted, THUOCTINH JOIN NGUOICHOI 
		ON NGUOICHOI.CITY_ID = THUOCTINH.CITY_ID
		WHERE INSERTED.PLAYER1_ID = NGUOICHOI.PLAYER_ID 

		UPDATE THUOCTINH
		SET TN_04 = TN_04 + 5
		FROM inserted, THUOCTINH JOIN NGUOICHOI 
		ON NGUOICHOI.CITY_ID = THUOCTINH.CITY_ID
		WHERE INSERTED.PLAYER1_ID = NGUOICHOI.PLAYER_ID 
	END
	ELSE
	BEGIN
		UPDATE THUOCTINH
		SET TN_01 = TN_01 + 2000
		FROM inserted, THUOCTINH JOIN NGUOICHOI 
		ON NGUOICHOI.CITY_ID = THUOCTINH.CITY_ID
		WHERE INSERTED.PLAYER2_ID = NGUOICHOI.PLAYER_ID 

		UPDATE THUOCTINH
		SET TN_02 = TN_02 + 2000
		FROM inserted, THUOCTINH JOIN NGUOICHOI 
		ON NGUOICHOI.CITY_ID = THUOCTINH.CITY_ID
		WHERE INSERTED.PLAYER2_ID = NGUOICHOI.PLAYER_ID 

		UPDATE THUOCTINH
		SET TN_03 = TN_03 + 500
		FROM inserted, THUOCTINH JOIN NGUOICHOI 
		ON NGUOICHOI.CITY_ID = THUOCTINH.CITY_ID
		WHERE INSERTED.PLAYER2_ID = NGUOICHOI.PLAYER_ID 

		UPDATE THUOCTINH
		SET TN_04 = TN_04 + 5
		FROM inserted, THUOCTINH JOIN NGUOICHOI 
		ON NGUOICHOI.CITY_ID = THUOCTINH.CITY_ID
		WHERE INSERTED.PLAYER2_ID = NGUOICHOI.PLAYER_ID 
	END
END