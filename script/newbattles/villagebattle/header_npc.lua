Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");
function main()
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","Tèng-Liªu giao tranh, ®au khæ vÉn lµ b¸ t¸nh v« téi!");
		return 0;
	end;
	local npcIndex = GetTargetNpc();
	if npcIndex <= 0 then
		return 0;
	end;
	local _,nNpcX,nNpcY = GetNpcWorldPos(npcIndex);
	if BT_GetDistance(nNpcX,nNpcY) >= 5 then
		Msg2Player("B¹n c¸ch thñ lÜnh thæ d©n qu¸ xa.");
		return 0;
	end;
	local nCamp = BT_GetCamp();
	if GetMissionV(MV_SONG_TASKSTEP-1+nCamp) >= MAX_TASK_STEP then
		SetNpcLifeTime(npcIndex,0);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		SetMissionV(MV_WINNER,nCamp);
		ClearMapNpc(MAPID);
		BT_AddPersonalPoint(30);
		BT_SetData(PT_FIND_HEADER,BT_GetData(PT_FIND_HEADER)+1);
		if nCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,"Tèng_ "..GetName().." t×m ®­îc Thñ lÜnh sím nhÊt, phe Tèng th¾ng lîi. 30 gi©y sau sÏ rêi khái chiÕn tr­êng");
		else
			Msg2MSAll(MISSION_ID,"Liªu_ "..GetName().."  t×m ®­îc Thñ lÜnh sím nhÊt, phe Liªu giµnh th¾ng lîi. 30 gi©y sau sÏ rêi khái chiÕn tr­êng");
		end;
		BT_OperateAllPlayer(change_state_peace,{},ALL_ID);	--ËùÓÐÍæ¼Ò±äºÍÆ½×´Ì¬
		Talk(1,"","Bao giê chiÕn tranh míi kÕt thóc ®©y!?");
	else
		Talk(1,"","Ng­¬i lµ ai? Sao ta kh«ng biÕt.");
	end;
end;

function change_state_peace(tArg)
	Say(tBattleName[BATTLE_TYPE].."®· kÕt thóc, sù næ lùc cña c¸c vÞ sÏ ®­îc ban th­ëng xøng ®¸ng.",0);
	SetFightState(0);
end;