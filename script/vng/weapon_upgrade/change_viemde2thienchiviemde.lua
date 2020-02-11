Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\lib\\globalfunctions.lua");

function OnPutinCheck(param, idx, genre, detail, particular)
	local tbAllowItem = {8001, 8002, 8003, 8004}
	local nBody = GetBody()
	local nOrder = 0
	for i=1,getn(tbAllowItem) do
		if particular == tbAllowItem[i] then
			nOrder = i
			break
		end
	end
	
	if genre ~= 0 or (detail ~= 100 and detail ~= 101 and detail ~= 103) or nOrder == 0 then
		Talk(1,"","Trang bÞ ®em ®æi kh«ng hîp lÖ.")
		return 0
	end
	
	if GetEquipAttr(idx,2) < 7 then
		Talk(1,"","Trang bÞ ph¶i ®­îc c­êng hãa 7 trë lªn.")
		return 0
	end
	
	return 1
end


function OnPutinComplete(param)
	local tbMaterial = {item={{gdp={2,1,30230,100}}}}
	local tbAllowItem = {8001, 8002, 8003, 8004}
	local nCheck = 0
	local szItem = "C¸c vËt phÈm ®­îc ®æi:\n"
	local tbChangeList = GetPutinItem();
	for i=1, getn(tbChangeList) do
		if tbChangeList[i][3] == 100 then
			nCheck = nCheck + 1
		elseif tbChangeList[i][3] == 101 then
			nCheck = nCheck + 10
		elseif tbChangeList[i][3] == 103 then
			nCheck = nCheck + 100
		end
	end
	
	if nCheck ~= 111 then
		Talk(1,"","C¸c h¹ kh«ng ®­a ®ñ bé trang bÞ Viªm §Õ gåm nãn, ¸o, quÇn, ta sÏ kh«ng ®æi cho c¸c h¹")
		return 0
	end
	
	local nCheckMaterial = 0
	nCheckMaterial = LIB_Award:CheckMaterial(tbMaterial)
	if nCheckMaterial ~= 1 then
		return 0
	end
	LIB_Award:PayMaterial(tbMaterial)
	VNG_SetTaskPos(TSK_TC_BK_VD,2,1,1)

	local tbViemDe_B1 = {item = {
			{gdp={0,100,8055,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			{gdp={0,103,8055,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			{gdp={0,101,8055,1,1,-1,-1,-1,-1,-1,-1,-1,0}},}
	}
	local tbViemDe_B2 = {item = {
			{gdp={0,100,8056,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			{gdp={0,103,8056,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			{gdp={0,101,8056,1,1,-1,-1,-1,-1,-1,-1,-1,0}},}
	}
	local tbViemDe_B3 = {item = {
			{gdp={0,100,8057,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			{gdp={0,103,8057,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			{gdp={0,101,8057,1,1,-1,-1,-1,-1,-1,-1,-1,0}},}
	}
	local tbViemDe_B4 = {item = {
			{gdp={0,100,8058,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			{gdp={0,103,8058,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			{gdp={0,101,8058,1,1,-1,-1,-1,-1,-1,-1,-1,0}},}
	}
	local tbViemDeAll = {
		[1] = tbViemDe_B1,
		[2] = tbViemDe_B2,
		[3] = tbViemDe_B3,
		[4] = tbViemDe_B4,
	}
	
	LIB_Award.szLogTitle = "DOI VIEM DE - THIEN CHI VIEM DE"
	LIB_Award.szLogAction = "nhËn"
	
	for i=1, getn(tbChangeList) do
		DelItemByIndex(tbChangeList[i][1],-1)
	end
	LIB_Award:AwardByBody(tbViemDeAll)
	Talk(1,"","Trao ®æi thµnh c«ng, c¸c h¹ h·y kiÓm tra bé trang bÞ míi.")
	gf_WriteLogEx("NHAN NV DOI VD 2 TCVD", "thµnh c«ng", 1, "hoµn thµnh nhiÖm vô")
end
