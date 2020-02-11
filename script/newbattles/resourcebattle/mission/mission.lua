Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");

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
	local npcIndex = CreateNpc(sModelName1,sCampName1.."Chñ so¸i",MAPID,1560,3562);
	SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc(sModelName2,sCampName2.."Chñ so¸i",MAPID,1779,3172);
	SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc("R­¬ng ®å Trung Nguyªn",sCampName1.."Qu©n nhu quan",MAPID,1563,3538);
	SetNpcScript(npcIndex,"\\script\\newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("R­¬ng ®å Trung Nguyªn",sCampName2.."Qu©n nhu quan",MAPID,1764,3168);
	SetNpcScript(npcIndex,"\\script\\newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("VÖ binh thµnh m«n","Binh sÜ",MAPID,1582,3546);
	SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\soldier_npc.lua");
	npcIndex = CreateNpc("VÖ binh thµnh m«n","Binh sÜ",MAPID,1758,3196);
	SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\soldier_npc.lua");
	npcIndex = CreateNpc("N¹n d©n","N¹n d©n",MAPID,1602,3260);
	SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\refugee_npc.lua");
	npcIndex = CreateNpc("Thñ lÜnh s¬n tÆc","Thñ lÜnh s¬n tÆc",MAPID,1735,3534)
	SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\cateran_header_npc.lua");
--	for i=1,30 do
--		AddMapTrap(MAPID,(1573+i)*32,(3532+i)*32,"\\script\\newbattles\\resourcebattle\\trap.lua")
--		AddMapTrap(MAPID,(1573+i)*32,(3533+i)*32,"\\script\\newbattles\\resourcebattle\\trap.lua")
--	end;
--	for i=1,30 do
--		AddMapTrap(MAPID,(1742+i)*32,(3192+i)*32,"\\script\\newbattles\\resourcebattle\\trap.lua");
--		AddMapTrap(MAPID,(1742+i)*32,(3193+i)*32,"\\script\\newbattles\\resourcebattle\\trap.lua");
--	end;
	SetMissionV(MV_CHANGEDRUMLEFT_SONG,DRUM_COUNT)	--³õÊ¼»¯Õ½¹ÄÊıÁ¿
	SetMissionV(MV_CHANGEDRUMLEFT_LIAO,DRUM_COUNT)	--³õÊ¼»¯Õ½¹ÄÊıÁ¿
end;

function RunMission()
	Msg2MSAll(MISSION_ID,"Th¸m m· håi b¸o ®Şch ph­¬ng ®· hµnh ®éng, cÇn nhanh chãng vµo trong chuÈn bŞ t¸c chiÕn.");
	SetMissionV(MV_RESOURCE_SONG,BASE_RESOURCE);
	SetMissionV(MV_RESOURCE_LIAO,BASE_RESOURCE);
	Create_QuarterMaster();
	Reflash_Res();
	BT_RunBattle();
end;

function EndMission()
	SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);	--ÉèÖÃÎª½áÊø×´Ì¬£¬ÔÚÕâÀïÉèÖÃÊÇÎªÁË·½±ã²âÊÔÊ±Ö±½ÓÓÃCloseMission½áÊøÕ½³¡
	local nResSong = GetMissionV(MV_RESOURCE_SONG);
	local nResLiao = GetMissionV(MV_RESOURCE_LIAO);
	if nResSong > nResLiao then
		SetMissionV(MV_WINNER,SONG_ID);--ËÎÓ®
		Msg2SubWorld("Qua nh÷ng håi giao tranh ¸c liÖt, phe Tèng giµnh th¾ng lîi chung cuéc t¹i Nh¹n M«n Quan-chiÕn dŞch Thu ThËp L­¬ng Th¶o!");
	elseif nResSong == nResLiao then
		SetMissionV(MV_WINNER,ALL_ID);--´òÆ½
		Msg2SubWorld("Qua nh÷ng håi giao tranh ¸c liÖt, Tèng-Liªu ®«i bªn bÊt ph©n th¾ng b¹i t¹i Nh¹n M«n Quan-chiÕn dŞch Thu ThËp L­¬ng Th¶o!");
	else
		SetMissionV(MV_WINNER,LIAO_ID);--ÁÉÓ®
		Msg2SubWorld("Qua nh÷ng håi giao tranh ¸c liÖt, phe Liªu giµnh th¾ng lîi chung cuéc t¹i Nh¹n M«n Quan-chiÕn dŞch Thu ThËp L­¬ng Th¶o!");
	end;
	--ÕâÀïÒª¸ù¾İMV_WHO_WINµÄMission±äÁ¿ÖµÀ´¼ÇÂ¼Õâ³¡Õ½ÕùµÄÊ¤¸ºÇé¿ö£¬Ê¹ÓÃ·şÎñÆ÷±äÁ¿
	SetGlbValue(GLB_RESOURCE,GetMissionV(MV_WINNER));
	local nWhoWin = GetMissionV(MV_WINNER);
	local nYear,nMonth,nDay,nHour = tonumber(date("%Y")),tonumber(date("%m")),tonumber(date("%d")),tonumber(date("%H"));
	if STATISTIC_OPEN == 1 then
		DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,1);
		AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,1,"","",0,"final_result","ddddddd",nWhoWin,nResSong,nResLiao,nYear,nMonth,nDay,nHour);
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
