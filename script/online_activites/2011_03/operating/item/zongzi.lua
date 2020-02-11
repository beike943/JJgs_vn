Include("\\script\\online_activites\\2011_03\\operating\\head.lua")

function OnUse(nItemIndex)
	local nDate = tonumber(date("%y%m%d"))
	if nDate < 110401 or nDate > 110417 then
		Talk(1,"",VET_TB_201103_OPERATING_DLG[22]);
		return 0
	end
	return VET_201103_Operating_UseZongzi(nItemIndex,0);
end