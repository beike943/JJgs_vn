Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse()
	if DelItem(tMoonCake[2][2],tMoonCake[2][3],tMoonCake[2][4],1) == 1 then
		local nLevel = GetLevel();
		local nUseTimes = GetTask(TASK_USE_JSHTYB);
		local nX = 100;
		if nUseTimes > 100 then
			nX = max(20,200-nUseTimes);
		end;
		local nExp = floor((nX/100)*(300000*nLevel^3)/(80^3));
		ModifyExp(nExp);
		Msg2Player("ß©y lµ l«n th¯ "..(nUseTimes+1).." l«n dÔng B∏nh Trung Thu ch©n gµ Giang S¨n, nhÀn Æ≠Óc "..nExp.." Æi”m kinh nghi÷m");
		SetTask(TASK_USE_JSHTYB,nUseTimes+1);
	end;
end;