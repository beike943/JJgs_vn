Include("\\script\\½á»é\\marriage_head.lua");
function OnEquip(item)
	return 0
end

function OnUnEquip(item)
	return 0;
end

function OnUse()
	return 0;
end

function CanEquip()
	if GetTask(TASK_WEDDING_LOVER) == 0 then
		Talk(1,"","cã h«n ­íc míi mÆc ®­îc lÔ phôc kÕt h«n");
		return 1;
	end;
	return 0;
end