Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse()
	if DelItem(tMoonCake[18][2],tMoonCake[18][3],tMoonCake[18][4],1) == 1 then
		local nLevel = GetLevel();
		local nUseTimes = GetTask(TASK_USE_HHDYB);
		local nX = 100;
		if nUseTimes > 100 then
			nX = max(20,200-nUseTimes);
		end;
		local nExp = floor((nX/100)*(100000*nLevel^3)/(80^3));
		ModifyExp(nExp);
		Msg2Player("Bπn nhÀn Æ≠Óc "..nExp.." Æi”m kinh nghi÷m");
		Msg2Player("ß©y lµ l«n th¯ "..(nUseTimes+1).." sˆ dÙng b∏nh Trung Thu bﬁ h·ng, nhÀn Æ≠Óc "..nExp.." Æi”m kinh nghi÷m");
		SetTask(TASK_USE_HHDYB,nUseTimes+1);
		local nRand = random(1,100);
		if nRand <= 25 then
			CastState("state_confusion",0,10*18,1,211000);
			Msg2Player("HÁn loπn 10 gi©y");
		elseif nRand <= 50 then
			CastState("state_vertigo",0,10*18,1,213000);
			Msg2Player("Bﬁ cho∏ng 10 gi©y");
		end;
	end;
end;