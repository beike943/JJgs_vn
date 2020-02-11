Include("\\script\\newbattles\\emplacementbattle\\emplacementbattle_head.lua");

function InitMission()
	BT_InitBattle();
	local sCampName1,sCampName2 = "Tèng","Liªu";
	local sModelName1,sModelName2 = "Tèng T­íng Qu©n","Vâ t­íng Liªu_®èi tho¹i";
	if GetGlbValue(RANDOM_PLACE) == 1 then
		sCampName1 = "Liªu";
		sCampName2 = "Tèng";
		sModelName1 = "Vâ t­íng Liªu_®èi tho¹i";
		sModelName2 = "Tèng T­íng Qu©n";
	end;
	local npcIndex = CreateNpc(sModelName1,sCampName1.."Chñ so¸i",MAPID,1602,3358);
	SetNpcScript(npcIndex,"\\script\\newbattles\\emplacementbattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc(sModelName2,sCampName2.."Chñ so¸i",MAPID,1855,3360);
	SetNpcScript(npcIndex,"\\script\\newbattles\\emplacementbattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc("R­¬ng ®å Trung Nguyªn",sCampName1.."Qu©n nhu quan",MAPID,1582,3366);
	SetNpcScript(npcIndex,"\\script\\newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("R­¬ng ®å Trung Nguyªn",sCampName2.."Qu©n nhu quan",MAPID,1875,3365);
	SetNpcScript(npcIndex,"\\script\\newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("VÖ binh thµnh m«n","Binh sÜ",MAPID,1623,3358);
	SetNpcScript(npcIndex,"\\script\\newbattles\\emplacementbattle\\soldier_npc.lua");
	npcIndex = CreateNpc("VÖ binh thµnh m«n","Binh sÜ",MAPID,1837,3361);
	SetNpcScript(npcIndex,"\\script\\newbattles\\emplacementbattle\\soldier_npc.lua");
--	for i=1,30 do
--		AddMapTrap(MAPID,(1617+i)*32,(3332+i)*32,"\\script\\newbattles\\emplacementbattle\\trap.lua")
--		AddMapTrap(MAPID,(1617+i)*32,(3333+i)*32,"\\script\\newbattles\\emplacementbattle\\trap.lua")
--	end;
--	for i=1,30 do
--		AddMapTrap(MAPID,(1810+i)*32,(3357-i)*32,"\\script\\newbattles\\emplacementbattle\\trap.lua");
--		AddMapTrap(MAPID,(1810+i)*32,(3358-i)*32,"\\script\\newbattles\\emplacementbattle\\trap.lua");
--	end;
end;

function RunMission()
	Msg2MSAll(MISSION_ID,"Th¸m tö håi b¸o, ®Şch ph­¬ng ®· hµnh ®éng, t­íng sÜ phe ta nhanh chãng vµo trong chuÈn bŞ t¸c chiÕn.");
	Create_Emplacement(ALL_ID); --ÉèÖÃÅÚÌ¨ÎªÖĞÁ¢×´Ì¬
	Create_Npc("Thæ d©n",getn(tNative_Pos));
	Create_Npc("VÖ binh Ph¸o ®µi",getn(tGuard_Pos));
	Create_Box();
	StartMissionTimer(MISSION_ID,INJURE_TIMER_ID,INTERVAL_TIME);
	BT_RunBattle();
end;

function EndMission()
	SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);	--ÉèÖÃÎª½áÊø×´Ì¬£¬ÔÚÕâÀïÉèÖÃÊÇÎªÁË·½±ã²âÊÔÊ±Ö±½ÓÓÃCloseMission½áÊøÕ½³¡
	local nTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG);
	local nTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO);
	if nTimeSong > nTimeLiao then
		SetMissionV(MV_WINNER,SONG_ID);--ËÎÓ®
		Msg2SubWorld("Qua nh÷ng håi giao tranh ¸c liÖt  phe Tèng ®· giµnh th¾ng lîi chung cuéc t¹i Nh¹n M«n Quan-chiÕn dŞch B¶o VÖ Thµnh Tr×!");
	elseif nTimeSong == nTimeLiao then
		SetMissionV(MV_WINNER,ALL_ID);--´òÆ½
		Msg2SubWorld("Qua nh÷ng håi giao tranh ¸c liÖt, Tèng-Liªu hai bªn bÊt ph©n th¾ng b¹i t¹i Nh¹n M«n Quan-chiÕn dŞch B¶o VÖ Thµnh Tr×!");
	else
		SetMissionV(MV_WINNER,LIAO_ID);--ÁÉÓ®
		Msg2SubWorld("Qua nh÷ng håi giao tranh ¸c liÖt, phe Liªu ®· giµnh th¾ng lîi chung cuéc t¹i Nh¹n M«n Quan-chiÕn dŞch B¶o VÖ Thµnh Tr×!");
	end;
	--ÏÂÃæÁ½¸ö¹«¸æÊÇÅÚÌ¨Õ½ÌØÓĞµÄ£¬ÒòÎªÅÚÌ¨Õ½½áÊøµÄÊ±ºò£¬ÁíÁ½¸öÕ½³¡±Ø½áÊø£¬Òò´ËÁíÁ½¸öÕ½³¡½áÊøÊ±²»±Ø·¢Í¨¸æ
	AddGlobalNews("Thu ThËp L­¬ng Th¶o, B¶o VÖ Thµnh Tr×, Gi¶i Cøu N«ng Trang ®· kÕt thóc, Nh¹n M«n Rùc Löa sÏ b¾t ®Çu sau 15 phót, mêi c¸c t­íng sÜ hai bªn chuÈn bŞ t¸c chiÕn.");
	Msg2SubWorld("Thu ThËp L­¬ng Th¶o, B¶o VÖ Thµnh Tr×, Gi¶i Cøu N«ng Trang ®· kÕt thóc, Nh¹n M«n Rùc Löa sÏ b¾t ®Çu sau 15 phót, mêi c¸c t­íng sÜ hai bªn chuÈn bŞ t¸c chiÕn.");

	--ÕâÀïÒª¸ù¾İMV_WHO_WINµÄMission±äÁ¿ÖµÀ´¼ÇÂ¼Õâ³¡Õ½ÕùµÄÊ¤¸ºÇé¿ö£¬Ê¹ÓÃ·şÎñÆ÷±äÁ¿
	SetGlbValue(GLB_EMPLACEMENT,GetMissionV(MV_WINNER));
	SetGlbValue(GLB_NEW_BATTLESTATE,0);	--±ê¼ÇĞ¡Õ½³¡È«²¿½áÊø
	StopMissionTimer(MISSION_ID,INJURE_TIMER_ID);
	local nWhoWin = GetMissionV(MV_WINNER);
	local nPubPointSong = BT_GetMissionPoint(SONG_ID);
	local nPubPointLiao = BT_GetMissionPoint(LIAO_ID);
	local nDeathSong = GetMissionV(MV_DEATH_COUNT_SONG);
	local nDeathLiao = GetMissionV(MV_DEATH_COUNT_LIAO);
	local nYear,nMonth,nDay,nHour = tonumber(date("%Y")),tonumber(date("%m")),tonumber(date("%d")),tonumber(date("%H"));
	if STATISTIC_OPEN == 1 then
		DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,1);
		AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,1,"","",0,"final_result","ddddddddddd",nWhoWin,nTimeSong,nTimeLiao,nPubPointSong,nPubPointLiao,nDeathSong,nDeathLiao,nYear,nMonth,nDay,nHour);
	end;
	BT_EndBattle();
end;

function OnLeave(RoleIndex)	--×¢Òâ¶ÔÔÚ´òÕÌ¹ı³ÌÖĞÀëÏßµÄ´¦Àí
	PlayerIndex = RoleIndex;
	BT_LeaveBattle();
	PlayerIndex = RoleIndex;
end;

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex;
	BT_JoinBattle(nCamp);
	PlayerIndex = RoleIndex;
end;
