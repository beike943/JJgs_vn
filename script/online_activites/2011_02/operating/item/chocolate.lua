Include("\\script\\online_activites\\2011_02\\operating\\head.lua")

function OnUse(nItemIndex)
	if gf_CheckEventDateEx(VET_201102_OPERATING_ACTIVITY_ID) == 0 then
		return 0;
	end
	return VET_201102_Operating_UseChocolate(nItemIndex);
end