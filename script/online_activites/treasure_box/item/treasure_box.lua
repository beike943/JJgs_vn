--by liubo
--≤ÿ±¶œ‰Ω≈±æ
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\treasure_box\\string.lua")
Include("\\script\\vng\\config\\newserver.lua");

VET_TREASUER_BOX_AWARD = {
 	{2, 5050, 5000000, 1},
 	{3, 1000, 450000, 1},
     {1, 3000, "Kim R≠¨ng", {2, 1, 30342, 1}, 0},
     {1, 900, "Bπch Kim R≠¨ng", {2, 1, 30343, 1}, 0},
     {1, 50, "Th«n Tµi B∂o R≠¨ng", {2, 1, 30344, 1}, 0},
}
function OnUse(nItem)
--	Talk(1, "", "T›nh n®ng tπm Æ„ng Æ” b∂o tr◊. Bπn vui lﬂng quay lπi sau !!")
--	do return end
	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	if tbGioiHanThanTaiBaoRuong[nNation] ~= nil then
		if nDate < tbGioiHanThanTaiBaoRuong[nNation] then
			Talk(1,"","ThÍi Æi”m hi÷n tπi ch≠a cho ph–p ÆÊi r≠¨ng, c∏c hπ h∑y sˆ dÙng sau nh–.")
			do	return	end
		end
	end
	if gf_CheckEventDateEx(46) ~= 1 then
		Talk(1,"",tSTRING_TREASUER_BOX[3])
		return 0
	end
	if gf_Judge_Room_Weight(1,200," ") ~= 1 then
        Talk(1,"",tSTRING_TREASUER_BOX[4])
		return 0
    end
	if DelItemByIndex(nItem,1) == 1 then
		gf_EventGiveRandAward(VET_TREASUER_BOX_AWARD,10000, "", "Than Tai Bao Ruong","Sˆ dÙng Tµng R≠¨ng")
	end
end