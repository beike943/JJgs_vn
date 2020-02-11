Include("\\script\\online_activites\\silingmount\\string.lua")

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
	local jugong = GetTask(701); -- 宋方是正数, 辽方是负数
	local nRank = GetTask(704);
	
	if ( (jugong <= -250000 and nRank == -6) or (jugong >= 250000 and nRank == 6) ) then
		return 0;
	end
	Talk(1,"",format(VET_TB_SILING_MSG[16],250000,VET_TB_SILING_MSG[18]));
	return 1;
end