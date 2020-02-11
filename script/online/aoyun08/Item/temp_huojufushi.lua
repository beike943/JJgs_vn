--ÁÙÊ±»ğ¾æ·şÊÎ½Å±¾
--by vivi
--2008/06/18

function OnEquip(item)
	CleanInteractive();
	InteractiveEnable(0);
	return 0
end

function OnUnEquip(item)
	InteractiveEnable(1);
	return 0
end

function OnUse()
	return 0;
end

function CanEquip()
	return 0;
end