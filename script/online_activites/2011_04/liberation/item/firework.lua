Include("\\script\\online_activites\\2011_04\\liberation\\head.lua")

function OnUse(nItemIndex)
	if gf_CheckEventDateEx(VET_201104_LIBERATION_ACTIVITY_ID) == 0 then
		Talk(1,"",VET_STR_201104_LIBERATION_OPERATING_DLG[3]);
		return 0;
	end
	return VET_201104_Liberation_Firework(nItemIndex);
end