--08´º½Ú»î¶¯°ÝÄênpc´¥·¢½Å±¾
--by vivi
--2008/01/10

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function main()
	local nIdx = GetTask(TASK_WIND_TABLE_IDX);
	local nState = getwindstate();
	local nActionStep = GetMapTaskTemp(nMapId,MAP_WIND_TIME);
	local nMapId = GetWorldPos();
	local nStep = GetTask(TASK_WIND_STEP);
		
	if GetTask(TASK_WIND_ID) ~= 0 and GetTask(TASK_WIND_ID) < nActionStep then
		RemoveTrigger(GetTrigger(WIND_TRIGGER_ID)); --É¾³ý´¥·¢Æ÷
		Talk(1,"","Ng­¬i kh«ng ®óng thêi h¹n ®Õn gÆp ta. Xin trë vÒ t×m Niªn Sø.");
		return
	end
	RemoveTrigger(GetTrigger(WIND_TRIGGER_ID)); --É¾³ý´¥·¢Æ÷
	if nStep <= WIND_STEP_TOTAL then
		local nRand = randomx(1,getn(tWindNpc[nMapId][2]),nIdx);
		if CreateTrigger(4,tWindNpc[nMapId][3][nRand],WIND_TRIGGER_ID) == 0 then
			WriteLog("[Ho¹t ®éng n¨m míi 08, kÕt nèi npc bÞ lçi]: Ng­êi ch¬i"..GetName().."ThiÕt lËp kÕt nèi npc CreateTrigge (4,tWindNpc[nMapId][3][nRand],WIND_TRIGGER_ID) ®· thÊt b¹i, trÞ WIND_TRIGGER_ID:"..WIND_TRIGGER_ID..". TrÞ tWindNpc[nMapId][3][nRand]:"..tWindNpc[nMapId][3][nRand]);
			return 0;	--´´½¨Ê§°Ü
		end	 
		SetTask(TASK_WIND_TABLE_IDX,nRand);
		SetTask(TASK_WIND_STEP,GetTask(TASK_WIND_STEP)+1);
		Talk(1,"","§a t¹. Ta nghe nãi <color=yellow>"..tWindNpc[nMapId][1].."-"..tWindNpc[nMapId][2][nRand].." <color> còng c« ®¬n, ng­¬i nªn ®i chóc tÕt h¾n.");
		Msg2Player("t×m"..tWindNpc[nMapId][1].."-"..tWindNpc[nMapId][2][nRand].."Chóc tÕt.");
	else
		SetTask(TASK_WIND_STEP,GetTask(TASK_WIND_STEP)+1);
		Talk(1,"","§a t¹ ®· chót tÕt mäi ng­êi, trë vÒ t×m Niªn Sø.");
		Msg2Player("NhiÖm vô chóc tÕt hoµn thµnh hoµn thµnh nhiÖm vô chóc tÕt, trë vÒ t×m Niªn Sø.");
	end
end

function randomx(a,b,c)
	local r = random(a,b-1);
	if r < c then
		return r;
	else
		return r+1;
	end
end