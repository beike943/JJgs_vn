Include("\\script\\lib\\globalfunctions.lua")

VET_TB_FENGSHOUDAI_AWARD =
{
	{1, "B¹ch C©u Hoµn", {2, 1, 270, 2}, 30 * 24 * 3600,1},
	{1, "§¹i B¹ch C©u hoµn", {2, 1, 1007, 2}, 30 * 24 * 3600,1},
 	{1, "B¹ch C©u Tiªn ®¬n", {2, 1, 1008, 2}, 30 * 24 * 3600,1},
}
function OnUse(itemIndex)
	if (gf_JudgeRoomWeight(6,6,1) ~= 1) then
		return
	end
	if (DelItemByIndex(itemIndex, 1) == 1) then
		gf_EventGiveAllAward(VET_TB_FENGSHOUDAI_AWARD, "Gãi Tiªn §¬n", format("Sö dông %s","Gãi Tiªn §¬n"))
	end
end