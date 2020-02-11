Include("\\script\\lib\\globalfunctions.lua")
VET_201111_TEACHERDAY_ID = 44
VET_201111_KINDNESSBOX_TB_AWARD = {
	{6, 5000, 60, 1},
    {13, 5000, 60, 1},
    {10, 5000, 60, 1},
    {7, 5000, 60, 1},
    {14, 5000, 60, 1},
    {11, 5000, 60, 1},
    {8, 5000, 60, 1},
    {15, 5000, 60, 1},
    {12, 5000, 60, 1},
    {3, 10000, 60000, 1},
    {2, 44890, 350000, 1},
	{1, 50, "Phi Yªn Th¹ch", {2, 1, 30130, 1}, 0},
	{1, 50, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1}, 0},
	{1, 5, "Thiªn Qu¸i Th¹ch", {2, 0, 1084, 1}, 0},
	{1, 5, "N÷ Oa Tinh Th¹ch", {2, 1, 504, 1}, 0},
}
function OnUse(nIdx)
--	print("nIdx = ",nIdx)
	--±³°ü¿Õ¼ä
	if gf_Judge_Room_Weight(1,1,"") == 0 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
		return 0
	end
	if gf_CheckEventDateEx(VET_201111_TEACHERDAY_ID) == 1 then
		if DelItem(2,1,30339,1) == 1 then
			gf_EventGiveRandAward(VET_201111_KINDNESSBOX_TB_AWARD,100000,1)
--			print("get award")
		end
	else
		DelItem(2,1,30339,1)
		Talk(1,"","VËt phÈm ®· qu¸ h¹n sö dông")
	end
--	print("end")
end