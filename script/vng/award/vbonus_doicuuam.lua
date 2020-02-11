Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\lib\\globalfunctions.lua");

function OnPutinCheck(param, idx, genre, detail, particular)
	local tbAllowItem = {3034, 3040, 3046, 3052, 3037, 3043, 3049, 3055}
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
	
	if GetEquipAttr(idx,2) ~= 11 then
		Talk(1,"","Møc c­êng hãa kh«ng hîp lÖ.")
		return 0
	end
	
	return 1
end


function OnPutinComplete(param)
	local tbAllowItem = {3034, 3040, 3046, 3052, 3037, 3043, 3049, 3055}
	local nCheck = 0
	local szItem = "C¸c vËt phÈm ®­îc ®æi:\n"
	local tbChangeList = GetPutinItem();
	for i=1, getn(tbChangeList) do
		if tbChangeList[i][3] == 100 and tbChangeList[i][4] == tbChangeList[1][4] then
			nCheck = nCheck + 1
		elseif tbChangeList[i][3] == 101 and tbChangeList[i][4] == tbChangeList[1][4]  then
			nCheck = nCheck + 10
		elseif tbChangeList[i][3] == 103 and tbChangeList[i][4] == tbChangeList[1][4]  then
			nCheck = nCheck + 100
		end
	end
	
	if nCheck ~= 111 then
		Talk(1,"","C¸c h¹ kh«ng ®­a ®ñ bé trang bÞ Thiªn NghÜa gåm nãn, ¸o, quÇn, ta sÏ kh«ng ®æi cho c¸c h¹")
		return 0
	end
	
	local tbThienNghia2_B1 = {item = {
			{gdp={0,100,3037,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thiªn NghÜa-Cöu ¢m Thñy Y"},
			{gdp={0,103,3037,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n"},
			{gdp={0,101,3037,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thiªn NghÜa-Cöu ¢m Phông Trang"},}
	}
	local tbThienNghia2_B2 = {item = {
			{gdp={0,100,3043,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thiªn NghÜa-Cöu ¢m Thñy Y"},
			{gdp={0,103,3043,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n"},
			{gdp={0,101,3043,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thiªn NghÜa-Cöu ¢m Phông Trang"},}
	}
	local tbThienNghia2_B3 = {item = {
			{gdp={0,100,3049,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thiªn NghÜa-Cöu ¢m Thñy Y"},
			{gdp={0,103,3049,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n"},
			{gdp={0,101,3049,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thiªn NghÜa-Cöu ¢m Phông Trang"},}
	}
	local tbThienNghia2_B4 = {item = {
			{gdp={0,100,3055,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thiªn NghÜa-Cöu ¢m Thñy Y"},
			{gdp={0,103,3055,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n"},
			{gdp={0,101,3055,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thiªn NghÜa-Cöu ¢m Phông Trang"},}
	}
	local tbThienNghiaSet2 = {
		[1] = tbThienNghia2_B1,
		[2] = tbThienNghia2_B2,
		[3] = tbThienNghia2_B3,
		[4] = tbThienNghia2_B4,
	}
	
	LIB_Award.szLogTitle = "DOI PHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nhËn"
	
	local nVB = GetExtPoint(1)
	nVB = SetBit(nVB,8,1)
	PayExtPoint(1,GetExtPoint(1))
	AddExtPoint(1, nVB)
	
	for i=1, getn(tbChangeList) do
		DelItemByIndex(tbChangeList[i][1],-1)
	end
	LIB_Award:AwardByBody(tbThienNghiaSet2)
	Talk(1,"","Trao ®æi thµnh c«ng, c¸c h¹ h·y kiÓm tra bé trang bÞ míi.")
end
