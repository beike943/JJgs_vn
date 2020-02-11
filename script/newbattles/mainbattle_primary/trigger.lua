Include("\\script\\newbattles\\mainbattle_primary\\mainbattle_head.lua");

function OnTimer()
	local nRoomIndex = BT_GetTempData(PTT_ROOMINDEX);
	local nState = BT_GetTempData(PTT_FIGHT_STATE);
	local nCamp = BT_GetCamp();
	local nCampPlace = nCamp;
	if nState == ROOM_STATE_IDLE then
	elseif nState == ROOM_STATE_READY then
		SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_FIGHT);
		BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_FIGHT);
		SetFightState(1);
		Msg2Player("TrËn ®Êu b¾t ®Çu! Thêi gian lµ 2 phót! H·y tranh thñ thêi gian");
		Talk(1,"","§¬n ®Êu b¾t ®Çu! Thêi gian kho¶ng <color=yellow>2 phót<color>, ®«i bªn h·y chuÈn bÞ.");
		SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),120);
	elseif nState == ROOM_STATE_FIGHT then
		SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_END);	
		BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_END);
		Msg2Player("TrËn ®Êu kÕt thóc! Hai bªn bÊt ph©n th¾ng b¹i, 5 gi©y sau sÏ rêi khái chiÕn tr­êng......");
		SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),5);
		SetFightState(0);
		Say("TrËn ®Êu kÕt thóc! Hai bªn bÊt ph©n th¾ng b¹i, 5 gi©y sau sÏ rêi khái chiÕn tr­êng......",0)
		local nOffset = (nRoomIndex-1)*2+nCamp-1;
		SetMissionV(MV_FIGHTER_GROUP1_1+nOffset,0);
		Restore();
		RestoreNeili();
	elseif nState == ROOM_STATE_END then
		SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_IDLE);
		Msg2Player("Tõ chiÕn tr­êng ®¬n ®Êu quay vÒ hËu doanh!");
		BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_IDLE);
		BT_SetTempData(PTT_LOCK,0);	--½âËø
		BT_SetTempData(PTT_ROOMINDEX,0);
		RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
		SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3]);	
	end;
end;