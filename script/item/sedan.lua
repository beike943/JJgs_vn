Include("\\script\\½á»é\\marriage_head.lua");
function OnEquip(item)
	DesaltPlayer(1, 7)
	return 0
end

function OnUnEquip(item)
	DesaltPlayer(0)
	return 0
end

function OnUse()
	return 0;
end

function CanEquip()
	if GetSex() == 1 then
		Talk(1,"","Nam nh©n kh«ng thÓ lªn kiÖu.");
		return 1;
	end;
	if GetTask(TASK_WEDDING_LOVER) == 0 then
		Talk(1,"","Ph¶i cã h«n ­íc míi ®­îc lªn kiÖu.");
		return 1;
	end;
	return 0;
end
