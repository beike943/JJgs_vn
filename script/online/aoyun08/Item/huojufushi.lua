--»ğ¾æ·şÊÎ½Å±¾
--by vivi
--2008/06/18

Include("\\script\\online\\aoyun08\\aoyun_head.lua")

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
	if GetTask(547) ~= 0 and GetTask(TASK_AOYUN_HUOJU_NUM) ~= 0 then
		return 0;
	else
		Talk(1,"","ChØ cã ng­êi r­íc ®uèc míi cã thÓ mÆc ®ång phôc nµy.")
		return 1;
	end
end