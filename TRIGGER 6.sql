﻿-- TRIGGER 6
CREATE TRIGGER NGUOICHOI_AUDIT
ON NGUOICHOI 
AFTER UPDATE, INSERT
AS
DECLARE @new_PLAYER_ID AS INT
DECLARE @new_CITY_ID AS CHAR(7)
DECLARE	@new_HOVATEN AS NVARCHAR(40)
DECLARE @new_NICKNAME AS CHAR(12)
DECLARE @new_BIRTHDATE AS DATE
DECLARE @new_DATEREGIS AS DATE
DECLARE @new_LASTLOGOUT AS DATE
DECLARE @new_TONGST AS INT
DECLARE @new_CSTHANG AS INT

DECLARE @old_PLAYER_ID AS INT
DECLARE @old_CITY_ID AS CHAR(7)
DECLARE	@old_HOVATEN AS NVARCHAR(40)
DECLARE @old_NICKNAME AS CHAR(12)
DECLARE @old_BIRTHDATE AS DATE
DECLARE @old_DATEREGIS AS DATE
DECLARE @old_LASTLOGOUT AS DATE
DECLARE @old_TONGST AS INT
DECLARE @old_CSTHANG AS INT

SELECT @new_PLAYER_ID = I.PLAYER_ID FROM INSERTED AS I
SELECT @new_CITY_ID = I.CITY_ID FROM INSERTED AS I
SELECT @new_HOVATEN = I.HOVATEN FROM INSERTED AS I
SELECT @new_NICKNAME = I.NICKNAME FROM INSERTED AS I
SELECT @new_BIRTHDATE = I.BIRTH_DATE FROM INSERTED AS I
SELECT @new_DATEREGIS = I.DATE_REGIS FROM INSERTED AS I
SELECT @new_LASTLOGOUT = I.DATE_LAST_LOGOUT FROM INSERTED AS I
SELECT @new_TONGST = I.TONGSOTRAN FROM INSERTED AS I
SELECT @new_CSTHANG = I.CHISOTHANG FROM INSERTED AS I

SELECT @old_PLAYER_ID = I.PLAYER_ID FROM DELETED AS I
SELECT @old_CITY_ID = I.CITY_ID FROM DELETED AS I
SELECT @old_HOVATEN = I.HOVATEN FROM DELETED AS I
SELECT @old_NICKNAME = I.NICKNAME FROM DELETED AS I
SELECT @old_BIRTHDATE = I.BIRTH_DATE FROM DELETED AS I
SELECT @old_DATEREGIS = I.DATE_REGIS FROM DELETED AS I
SELECT @old_LASTLOGOUT = I.DATE_LAST_LOGOUT FROM DELETED AS I
SELECT @old_TONGST = I.TONGSOTRAN FROM DELETED AS I
SELECT @old_CSTHANG = I.CHISOTHANG FROM DELETED AS I

BEGIN
IF @new_PLAYER_ID <> @old_PLAYER_ID OR (@old_PLAYER_ID IS NULL AND @new_PLAYER_ID IS NOT NULL) OR (@new_PLAYER_ID IS NULL AND @old_PLAYER_ID IS NOT NULL)
INSERT INTO NGUOICHOI_CHANGE VALUES (@new_PLAYER_ID, 'PLAYER_ID', CAST(@old_PLAYER_ID AS NVARCHAR(7)), CAST(@new_PLAYER_ID AS NVARCHAR(7)), SYSDATETIME())

IF @new_CITY_ID <> @old_CITY_ID OR (@old_CITY_ID IS NULL AND @new_CITY_ID IS NOT NULL) OR (@new_CITY_ID IS NULL AND @old_CITY_ID IS NOT NULL)
INSERT INTO NGUOICHOI_CHANGE VALUES (@new_PLAYER_ID, 'CITY_ID', @old_CITY_ID, @new_CITY_ID, SYSDATETIME())

IF @new_HOVATEN <> @old_HOVATEN OR (@old_HOVATEN IS NULL AND @new_HOVATEN IS NOT NULL) OR (@new_HOVATEN IS NULL AND @old_HOVATEN IS NOT NULL)
INSERT INTO NGUOICHOI_CHANGE VALUES (@new_PLAYER_ID, 'HOVATEN',@old_HOVATEN, @new_HOVATEN, SYSDATETIME())

IF @new_NICKNAME <> @old_NICKNAME OR (@old_NICKNAME IS NULL AND @new_NICKNAME IS NOT NULL) OR (@new_NICKNAME IS NULL AND @old_NICKNAME IS NOT NULL)
INSERT INTO NGUOICHOI_CHANGE VALUES (@new_PLAYER_ID, 'NICKNAME', @old_NICKNAME, @new_NICKNAME, SYSDATETIME())

IF @new_BIRTHDATE <> @old_BIRTHDATE OR (@old_BIRTHDATE IS NULL AND @new_BIRTHDATE IS NOT NULL) OR (@new_BIRTHDATE IS NULL AND @old_BIRTHDATE IS NOT NULL)
INSERT INTO NGUOICHOI_CHANGE VALUES (@new_PLAYER_ID, 'BIRTH_DATE', CAST(@old_BIRTHDATE AS NVARCHAR(20)), CAST(@new_BIRTHDATE AS VARCHAR(20)), SYSDATETIME())

IF @new_DATEREGIS <> @old_DATEREGIS OR (@old_DATEREGIS IS NULL AND @new_DATEREGIS IS NOT NULL) OR (@new_DATEREGIS IS NULL AND @old_DATEREGIS IS NOT NULL)
INSERT INTO NGUOICHOI_CHANGE VALUES (@new_PLAYER_ID, 'DATE_REGIS', CAST(@old_DATEREGIS AS NVARCHAR(20)), CAST(@new_DATEREGIS AS VARCHAR(20)), SYSDATETIME())

IF @new_LASTLOGOUT <> @old_LASTLOGOUT OR (@old_LASTLOGOUT IS NULL AND @new_LASTLOGOUT IS NOT NULL) OR (@new_LASTLOGOUT IS NULL AND @old_LASTLOGOUT IS NOT NULL)
INSERT INTO NGUOICHOI_CHANGE VALUES (@new_PLAYER_ID, 'DATE_LAST_LOGOUT', CAST(@old_LASTLOGOUT AS NVARCHAR(20)), CAST(@new_LASTLOGOUT AS VARCHAR(20)), SYSDATETIME())

IF @new_TONGST <> @old_TONGST OR (@old_TONGST IS NULL AND @new_TONGST IS NOT NULL) OR (@new_TONGST IS NULL AND @old_TONGST IS NOT NULL)
INSERT INTO NGUOICHOI_CHANGE VALUES (@new_PLAYER_ID, 'TONGSOTRAN', CAST(@old_TONGST AS NVARCHAR(7)), CAST(@new_TONGST AS NVARCHAR(7)), SYSDATETIME())

IF @new_CSTHANG <> @old_CSTHANG OR (@old_CSTHANG IS NULL AND @new_CSTHANG IS NOT NULL) OR (@new_CSTHANG IS NULL AND @old_CSTHANG IS NOT NULL)
INSERT INTO NGUOICHOI_CHANGE VALUES (@new_PLAYER_ID, 'CHISOTHANG', CAST(@old_CSTHANG AS NVARCHAR(7)), CAST(@new_CSTHANG AS NVARCHAR(7)), SYSDATETIME())
END

-- THU KET QUA TRIGGER
UPDATE NGUOICHOI
SET BIRTH_DATE = GETDATE()
WHERE PLAYER_ID = 110020

UPDATE NGUOICHOI 
SET NICKNAME = 'trunghieu'
WHERE PLAYER_ID = 110020

EXEC themnguoichoi @nc_id = 110021, @city_id = 'CC10100', @hoten = N'Nguyễn Như Quỳnh', @nickname = 'quynhihi', @ngaysinh = '2001-10-10', @tentp = 'mitom', @tg_id = 1, @vm_id = 'AC01'


SELECT * FROM NGUOICHOI
SELECT * FROM NGUOICHOI_CHANGE