--MSSV    : 19522253
--HOTEN   : Phạm Đức Thể
--DE	  : Đề 01
--NGAY THI: 21/12/2020

----------------------------------------------------------------------------------------------------------------------------
--<CAU 1>: 
SELECT DISTINCT MANB,HOTEN,DIACHI
FROM NGUOI_BAN
WHERE MANB IN (SELECT DISTINCT MANB
				FROM PHIEU_DANG_KY
				WHERE MAPDK IN (SELECT DISTINCT MAPDK
								FROM CT_PDK
								WHERE MONTH(TuNgay) >= 8 
									AND MONTH(DenNgay) <= 10
									AND MAPDK IN (SELECT DISTINCT MAPDK
													FROM CT_PDK
													WHERE YEAR(TuNgay) ='2006' 
													AND YEAR(DenNgay) = '2006')))

----------------------------------------------------------------------------------------------------------------------------
--<CAU 2>:
SELECT MADO, SO, DUONG, PHUONG, QUAN, 


----------------------------------------------------------------------------------------------------------------------------
--<CAU 3>:
SELECT DISTINCT NGUOIMaNB, HOTEN, DIACHI, DATEDIFF(DAY, CT_PDK.TuNgay, CT_PDK.DenNgay)
FROM NGUOI_BAN JOIN PHIEU_DANG_KY
ON NGUOI_BAN.MaNB = PHIEU_DANG_KY.MANB
JOIN CT_PDK
ON PHIEU_DANG_KY.MaPDK = CT_PDK.MaPDK
WHERE MANB IN (SELECT DISTINCT MANB 
				FROM PHIEU_DANG_KY
				WHERE MaPDK IN(SELECT DISTINCT MaPDK
								FROM CT_PDK 
								WHERE YEAR(CT_PDK.DenNgay) = '2006'))

----------------------------------------------------------------------------------------------------------------------------
--<CAU 4>:
CREATE TRIGGER TRG_INS_PGH ON PHIEU_GIA_HAN
FOR INSERT
AS
BEGIN
	DECLARE @NgayKTDK DATETIME, @NgayDKGH DATETIME, @MaPDK CHAR(10)
	SELECT @MaPDK = MAPDK
	FROM INSERTED

	SELECT @NgayDKGH = TUNGAY
	FROM PHIEU_GIA_HAN
	WHERE @MaPDK = MAPDK

	SELECT @NgayKTDK = DenNgay
	FROM CT_PDK
	WHERE @MaPDK = MAPDK

	IF (@NgayKTDK > @NgayDKGH)
	BEGIN
		PRINT'lOI: NGAY GIA HAN KHONG HOP LE'
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		PRINT'THEM THANH CONG MOT PHIEU GIA HAN'
	END
END

SELECT *FROM PHIEU_GIA_HAN

