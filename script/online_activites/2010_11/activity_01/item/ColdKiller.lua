Include("\\script\\online_activites\\2010_11\\activity_01\\head.lua")

function OnUse(nItemIdx)
	XK_RemoveTitle(65, 19, nItemIdx);
end

function XK_RemoveTitle(type1, type2, nItemIdx)	
	if 1 == IsTitleExist(type1, type2) then
		local szName = GetItemName(nItemIdx)
		if 1 == DelItemByIndex(nItemIdx, 1) then
			RemoveTitle(type1, type2);
			Msg2Player("C¸c h¹ ®· sö dông "..szName..", bÖnh"..NT_GetTitleName(type1, type2).." ®· ch÷a khái");		
		end
	end
end