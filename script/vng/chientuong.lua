Include("\\script\\vng\\lib\\vnglib_award.lua");

function OnPutinCheck(param, idx, genre, detail, particular)
	if genre ~= 0 or detail ~= 105 or particular ~= 30033 then
		Talk(1,"","Muèn ®æi ChiÕn T­îng kh¸c ph¶i tr¶ ChiÕn T­îng cò cho ta.")
		return 0
	end
	local nOp1, nLv1 = GetItemAttr(idx,1)
	local nOp2, nLv2 = GetItemAttr(idx,2)
	local nOp3, nLv3 = GetItemAttr(idx,3)	
	if nLv1 ~= 0 or nLv2 ~= 0 or nLv3 ~= 0 then
		Talk(1,"","ChiÕn T­îng cña ng­¬i søc tèt, ch¹y nhanh, cÇn g× ph¶i ®æi.")
		return 0
	end
	return 1
end


function OnPutinComplete(param)
	local tbChangeList = GetPutinItem();
	DelItemByIndex(tbChangeList[1][1],-1)
	
	LIB_Award.szLogTitle = "CHIEN TUONG"
	LIB_Award.szLogAction = "®æi"
	local tbAward = {item = {{gdp = {0,105,30033,1,4,-1,-1,-1,-1,-1,-1,-1}, nExpired = (90*24*60*60), name = "ChiÕn T­îng Nguyªn So¸i"}}}
	LIB_Award:Award(tbAward)
	Talk(1,"","Trao ®æi thµnh c«ng, c¸c h¹ h·y kiÓm tra ChiÕn T­îng míi.")
end
