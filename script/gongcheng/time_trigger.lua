--create date:07-04-16
--author:yanjun
--describe:µ¥ÌôÊ±¼ä´¥·¢Æ÷
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnTimer()
	local nState = GetTaskTemp(TEMP_FIGHT_STATE);
	local nCamp = GCZ_GetPlayerCamp();
	local nDoorIdx = GetTaskTemp(TEMP_GURAD_ID);
	if nState == ROOM_STATE_IDLE then
	elseif nState == ROOM_STATE_READY then
		SetTaskTemp(TEMP_FIGHT_STATE,ROOM_STATE_FIGHT);
		SetFightState(1);
		Msg2Player("B¾t ®Çu ®Êu ®¬n! Thêi gian thi ®Êu kho¶ng 7 phót, hai bªn h·y tranh thñ thêi gian");
		Talk(1,"","B©y giê b¾t ®Çu ®Êu ®¬n! Thêi gian ®Êu lµ <color=yellow>7 nÐn nhang (kho¶ng 7 ptót)<color>, hai bªn h·y tranh thñ thêi gian.");
		SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),70);	--Ò»ÖùÏãÊ±¼ä
		SetTaskTemp(TEMP_FIGHT_TIMER_LOOP,1);
	elseif nState == ROOM_STATE_FIGHT then
		local nLoop = GetTaskTemp(TEMP_FIGHT_TIMER_LOOP);
		if nLoop <= 6 then
			SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),70);	--Ò»ÖùÏãÊ±¼ä
			SetTaskTemp(TEMP_FIGHT_TIMER_LOOP,nLoop+1);
			Msg2Player("Thêi gian §¬n ®Êu cßn: "..(7-nLoop).." nÐn nhang");
			return 0;
		end;
		SetTaskTemp(TEMP_FIGHT_STATE,ROOM_STATE_END);
		if GetTaskTemp(TEMP_CHALLENGER) == 1 then	--µ±Ç°ÊÇÌôÕ½Õß
			local nEnemyCamp = GCZ_GetEnemyCamp();
			local nEnemyIdx = GetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nEnemyCamp-1);
			Msg2MSAll(MISSION_ID,"§¹i hiÖp"..GetName().."cïng víi "..GetName(nEnemyIdx).."§¹i chiÕn 300 hiÖp bÊt ph©n th¾ng b¹i, quyÕt ®Þnh chän ngµy t¸i chiÕn");
		end;
		SetFightState(0);
		PlaySound("\\sound\\µ¥ÌôÆ½¾Ö.wav");
		Say("TrËn ®Êu kÕt thóc! Hai bªn bÊt ph©n th¾ng b¹i, 5 gi©y sau sÏ rêi khái chiÕn tr­êng......",0);
		Restore();
		RestoreNeili();
		SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),5);
		if nCamp == SHOU_ID then	--Ö»´¦ÀíÊØ·½ÈËÔ±
			if GetTaskTemp(TEMP_CHALLENGER) ~= 1 then	--Èç¹û²»ÊÇÌôÕ½Õß£¬ÄÇÆ½¾Ö´ÎÊý¾Í¼Ó1
				SetMissionV(MV_EAST_DOOR_DRAW+nDoorIdx-1,GetMissionV(MV_EAST_DOOR_DRAW+nDoorIdx-1)+1);
			end;
			if GetMissionV(MV_EAST_DOOR_DRAW+nDoorIdx-1) == 3 then	--Á¬ÐøÈý´ÎÆ½ÊÖ				
				SetTaskTemp(TEMP_GURAD_ID,0);
				SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1),0);	--Çå¿ÕËù¼ÇÂ¼µÄÍæ¼ÒË÷Òý
				SetMissionV(MV_SPIDX_EAST_DOOR+2*(nDoorIdx-1),0);
				SetMissionV(MV_DESTROY_EAST_DOOR+nDoorIdx-1,1);	--³ÇÃÅ±»´Ý»Ù
				if nDoorIdx == 1 then	--Èç¹ûÊÇ¶«ÃÅ
					GCZ_SetGraveyardStatus(MV_GRAVEYARD_B2,GONG_ID,TRUE);	--¶Ô¹¥·½¿ª·ÅÄ¹µØB2
					Msg2MSAll(MISSION_ID,"§¬n ®Êu diÔn ra kÞch liÖt, Thµnh m«n kh«ng thÓ chÞu næi, ®· sôn ®æ, Thµnh m«n phÝa §«ng ®· më. §iÓm tËp kÕt ngoµi §«ng m«n ®· më");
				elseif nDoorIdx == 2 then 	--Èç¹ûÊÇÖÐÃÅ
					Msg2MSAll(MISSION_ID,"§¬n ®Êu diÔn ra kÞch liÖt, Thµnh m«n kh«ng thÓ chÞu næi, ®· sôn ®æ, Thµnh m«n Trung khu ®· më. ");
				elseif nDoorIdx == 3 then	--Èç¹ûÊÇÎ÷ÃÅ
					GCZ_SetGraveyardStatus(MV_GRAVEYARD_B1,GONG_ID,TRUE);	--¶Ô¹¥·½¿ª·ÅÄ¹µØB1
					Msg2MSAll(MISSION_ID,"§¬n ®Êu diÔn ra kÞch liÖt, Thµnh m«n kh«ng thÓ chÞu næi, ®· sôn ®æ, Thµnh m«n phÝa T©y ®· më. §iÓm tËp kÕt ngoµi T©y m«n ®· më");
				end;
				--SetNpcLifeTime(GetMissionV(MV_EAST_JIGUAN_INDEX+nDoorIdx-1),0);
				AddUnitStates(GetMissionV(MV_EAST_JIGUAN_INDEX+nDoorIdx-1),1,-100000000);	--½«³ÇÃÅ»ú¹ØµÄÉúÃüÉèÎª0
			end;
		end;
	elseif nState == ROOM_STATE_END then
		Msg2Player("Tõ chiÕn tr­êng ®¬n ®Êu quay vÒ hËu doanh!");
		if GetTaskTemp(TEMP_CHALLENGER) == 1 then	--µ±Ç°ÊÇÌôÕ½Õß
			SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nCamp-1,0);	--Çå³ýÌôÕ½ÕßµÄË÷Òý¼ÇÂ¼
			SetTaskTemp(TEMP_GURAD_ID,0);
		end;
		RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
		SetTaskTemp(TEMP_ARENA_FIGHTING,0);
		SetTaskTemp(TEMP_FIGHT_STATE,ROOM_STATE_END);
		SetTaskTemp(TEMP_CHALLENGER,0);
		SetPos(tEntrancePos[nCamp][1],tEntrancePos[nCamp][2]);	
	end;
end;