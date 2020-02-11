--Ô½ÄÏ°æ·ÛºìÃµ¹å½Å±¾
--by vivi
--2008/03/05

Include("\\script\\online\\march08\\march08_head.lua");

function OnUse()
	if check_rose_date() ~= 1 then
		return
	end
	
	local nLv = GetLevel();
	local nHongNum = GetTask(TASK_MARCH_HONG);
	local nFenhongNum = GetTask(TASK_MARCH_FENHONG);
	local nExp = nHongNum*HONG_EXP+nFenhongNum*FENHONG_EXP;
	
	if nLv < 11 then
		Talk(1,"","Nh©n vËt cÊp 10 trë lªn míi cã thÓ sö dông hoa hång.");
		return
	end
	if nExp >= TOTAL_EXP then
		Talk(1,"","Mçi nh©n vËt chØ cã thÓ th«ng qua ho¹t ®éng nµy nhËn ®­îc tèi ®a 10.000.000 ®iÓm kinh nghiÖm.");
		return
	end
	if DelItem(2,0,1164,1) == 1 then
		ModifyExp(FENHONG_EXP);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..FENHONG_EXP.."Kinh nghiÖm");
		SetTask(TASK_MARCH_FENHONG,GetTask(TASK_MARCH_FENHONG)+1);
	end
end