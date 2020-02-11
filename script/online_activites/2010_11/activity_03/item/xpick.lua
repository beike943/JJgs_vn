Include("\\script\\online_activites\\2010_11\\activity_03\\head.lua");

function XP_doUse(itemIndex, type, abrasionValue)
	do return end
	if abrasionValue > AbradeItem(itemIndex, 0) then
		return
	else
		if 1 == GT_doGather(type) then
			AbradeItem(itemIndex, abrasionValue);
		end
	end
end