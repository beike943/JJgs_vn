Include("\\script\\lib\\globalfunctions.lua")

VET_TB_FENGSHOUDAI_AWARD =
{
	{1, "Tói h¹t gièng", {2, 1, 30087, 2}, 30 * 24 * 3600,1},
	{1, "C©y B¸t Nh· nhá", {2, 0, 504, 8}, 30 * 24 * 3600,1},
 	{1, "C©y B¸t Nh·", {2, 0, 398, 4}, 30 * 24 * 3600,1},
}
function OnUse(itemIndex)
	if (gf_JudgeRoomWeight(14,14,1) ~= 1) then
		return
	end
	if (DelItemByIndex(itemIndex, 1) == 1) then
		gf_EventGiveAllAward(VET_TB_FENGSHOUDAI_AWARD, 100, 1, "Gãi N«ng S¶n", format("Sö dông %s","Gãi N«ng S¶n"))
	end
end