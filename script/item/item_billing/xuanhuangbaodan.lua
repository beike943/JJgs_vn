------------------------------------------------------------
-- Ðþ»Æ±¦µ¤µÄ½Å±¾ xuanhuangbaodan.lua
--
-- comment: Ï´µôÈ«²¿µÄPKÖµ
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID: 2,0,142
------------------------------------------------------------
Include("\\script\\lib\\globalfunctions.lua")

-- ½Å±¾±»³ÌÐòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êý
function OnUse(nIndex)
	local nPK = GetPKValue()
	if nPK == 0 then
		Talk(1, "", "§iÓm PK hiÖn t¹i cña c¸c h¹ ®ang lµ 0, kh«ng cÇn ph¶i tÈy PK!")
		return
	end
	local nExBigBCH = GetTask(2508)
	local nExBigLTH = EatLiushen(3,0)
	local nExBigTTH = EatSanqin(3,0)	
	if nExBigBCH < (120 * nPK) then
		Talk(1,"","Kh«ng ®ñ giê ñy th¸c B¹ch C©u Tiªn §¬n!")
		return
	elseif nExBigTTH < (60 * nPK) then
		Talk(1,"","Kh«ng ®ñ giê ñy th¸c Tam Thanh Tiªn §¬n!")
		return
	elseif nExBigLTH < (60 * nPK) then
		Talk(1,"","Kh«ng ®ñ giê ñy th¸c Lôc ThÇn Tiªn §¬n!")
		return
	elseif DelItemByIndex(nIndex, 1) == 1 then
		SetTask(2508,nExBigBCH - (120 * nPK))
		EatLiushen(3,-(60 * nPK))
		EatSanqin(3,-(60 * nPK))
		AddPKValue(nPK * (-1))
		WriteLogEx("Hoat dong thang 5", "tÈy "..nPK.." ®iÓm PK")			
	end
end;



