Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse()
	if DelItem(tMoonCake[17][2],tMoonCake[17][3],tMoonCake[17][4],1) == 1 then
		local nLevel = GetLevel();
		local nUseTimes = GetTask(TASK_USE_JSMWYB);
		local nX = 100;
		if nUseTimes > 100 then
			nX = max(20,200-nUseTimes);
		end;
		local nExp = floor((nX/100)*(200000*nLevel^3)/(80^3));
		ModifyExp(nExp);
		Msg2Player("§©y lµ lÇn thø "..(nUseTimes+1).." lÇn dïng B¸nh Trung Thu Giang S¬n Mü VÞ, nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
		SetTask(TASK_USE_JSMWYB,nUseTimes+1);
	end;
end;