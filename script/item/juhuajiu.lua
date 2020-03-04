--重阳节菊花酒
--by vivi
--2007/10/16

Include("\\script\\lib\\globalfunctions.lua");

--任务变量
TASK_JHJ_NUM = 2317; --使用次数，最多5次
IB_VERSION = 1;

function OnUse()
	if GetTask(TASK_JHJ_NUM) == 5 then
		Talk(1,"","抱歉！你已经使用了5次了，不能再用了。");
		return
	end
	local szExp = "";
	local nLevel = GetLevel();
	if IB_VERSION == 1 then
		szExp = "获得<color=yellow>"..floor(3000000*(nLevel^3)/(80^3)).."点经验<color>. ";
	else
		szExp = "转<color=yellow>"..floor(5000000*(nLevel^3)/(80^3)).."点<color>. ";
	end;	
	Say("使用菊花酒,你可以获得"..szExp.."确定使用吗？",
		2,
		"确定/give_exp",
		"不用了/nothing")
end

function give_exp()
	if DelItem(2,0,549,1) == 1 then
		local nLevel = GetLevel();
		local nExp = 0;
		local nGoldenExp = 0;
		if IB_VERSION == 1 then
			nExp = floor(3000000*(nLevel^3)/(80^3));
			ModifyExp(nExp);
			Msg2Player("你获得"..nExp.."点经验");
		else
			nGoldenExp = floor(5000000*(nLevel^3)/(80^3));
			nExp = gf_GoldenExp2Exp(nGoldenExp);
		end;
		WriteLog("[重阳节活动]:"..GetName().."获得1个奖励:"..nExp.."点经验");
		SetTask(TASK_JHJ_NUM,GetTask(TASK_JHJ_NUM)+1);
	end
end
