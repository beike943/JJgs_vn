Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	local nCount = GetItemCount(2, 1, 30724);
	AskClientForNumber("UseLingLiWanCb", min(1, nCount), nCount,"NhËp sè l­îng sö dông","")
end

function UseLingLiWanCb(nNum)
	if tonumber(nNum) < 1 then
		return 0;
	end
	if DelItem(2, 1, 30724, nNum) ~= 1 then
		return 0;
	end
	gf_ModifyPetLingli(tonumber(nNum) * 5);
end