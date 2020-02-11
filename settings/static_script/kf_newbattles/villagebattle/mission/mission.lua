Include("\\settings\\static_script\\kf_newbattles\\villagebattle\\villagebattle_head.lua");

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
	local npcIndex = CreateNpc(sModelName1,"Chñ so¸i",MAPID,1539,3631);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\villagebattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc(sModelName2,"Chñ so¸i",MAPID,1794,3147);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\villagebattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc("R­¬ng ®å Trung Nguyªn","Qu©n nhu quan",MAPID,1545,3609);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("R­¬ng ®å Trung Nguyªn","Qu©n nhu quan",MAPID,1803,3164);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("VÖ binh thµnh m«n","Binh sÜ",MAPID,1561,3614);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\villagebattle\\soldier_npc.lua");
	npcIndex = CreateNpc("VÖ binh thµnh m«n","Binh sÜ",MAPID,1776,3163);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\villagebattle\\soldier_npc.lua");
--	for i=1,30 do
--		AddMapTrap(MAPID,(1550+i)*32,(3600+i)*32,"\\settings\\static_script\\kf_newbattles\\villagebattle\\trap.lua")
--		AddMapTrap(MAPID,(1550+i)*32,(3601+i)*32,"\\settings\\static_script\\kf_newbattles\\villagebattle\\trap.lua")
--	end;
--	for i=1,30 do
--		AddMapTrap(MAPID,(1755+i)*32,(3161+i)*32,"\\settings\\static_script\\kf_newbattles\\villagebattle\\trap.lua");
--		AddMapTrap(MAPID,(1755+i)*32,(3162+i)*32,"\\settings\\static_script\\kf_newbattles\\villagebattle\\trap.lua");
--	end;
end;

function RunMission()
	local npcIndex = CreateNpc("V­¬ng An Th¹ch","H­íng ®¹o qu©n",MAPID,1629,3321);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\villagebattle\\armyguide_npc.lua");
	Msg2MSAll(MISSION_ID,"Th¸m m· håi b¸o ®Şch ph­¬ng ®· hµnh ®éng, cÇn nhanh chãng vµo trong chuÈn bŞ t¸c chiÕn.");
	BT_RunBattle();
end;

function EndMission()
	SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);	--ÉèÖÃÎª½áÊø×´Ì¬£¬ÔÚÕâÀïÉèÖÃÊÇÎªÁË·½±ã²âÊÔÊ±Ö±½ÓÓÃCloseMission½áÊøÕ½³¡
	local nStepSong = 0;
	local nStepLiao = 0;
	if GetMissionV(MV_WINNER) == 0 then	--Èç¹ûÊÇÊ±¼äµ½ÁË¶ø½áÊøµÄ
		nStepSong = GetMissionV(MV_SONG_TASKSTEP);
		nStepLiao = GetMissionV(MV_LIAO_TASKSTEP);
		if nStepSong > nStepLiao then
			SetMissionV(MV_WINNER,SONG_ID);
			Msg2SubWorld("Qua nh÷ng håi giao tranh ¸c liÖt, phe Tèng giµnh th¾ng lîi chung cuéc t¹i Nh¹n M«n Quan-chiÕn dŞch Th«n trang!");
		elseif nStepSong < nStepLiao then
			SetMissionV(MV_WINNER,LIAO_ID);
			Msg2SubWorld("Qua nh÷ng håi giao tranh ¸c liÖt, phe Liªu giµnh th¾ng lîi chung cuéc t¹i Nh¹n M«n Quan-chiÕn dŞch Th«n trang!");
		else
			SetMissionV(MV_WINNER,ALL_ID);
			Msg2SubWorld("Qua nh÷ng håi giao tranh ¸c liÖt, Tèng-Liªu hai bªn bÊt ph©n th¾ng b¹i t¹i Nh¹n M«n Quan-chiÕn dŞch Th«n trang!");
		end;
	end;
	local nWhoWin = GetMissionV(MV_WINNER);
	SetGlbValue(GLB_VILLAGE,nWhoWin);
	local nYear,nMonth,nDay,nHour = tonumber(date("%Y")),tonumber(date("%m")),tonumber(date("%d")),tonumber(date("%H"));
	if STATISTIC_OPEN == 1 then
		DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,1);
		AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,1,"","",0,"final_result","ddddddd",nWhoWin,nStepSong,nStepLiao,nYear,nMonth,nDay,nHour);
	end;
	BT_EndBattle();
end;

function OnLeave(RoleIndex)	--×¢Òâ¶ÔÔÚ´òÕÌ¹ı³ÌÖĞÀëÏßµÄ´¦Àí
	PlayerIndex = RoleIndex;
	BT_ShowDebugInfor(GetName().."BT_GetCamp trong OnLeave");
	local nCamp = BT_GetCamp();
	local sName = GetName();
	local nFoundTag = 0;
	local nTempState = BT_GetTempData(PTT_SELECTED);	--BT_LeaveBattle»áÇå³ıËùÓĞÁÙÊ±±äÁ¿£¬Òò´ËÕâÀïÒªÏÈ±£´æÏÂÀ´
	if BT_LeaveBattle() == 1 then
		if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT and nTempState == 1 then	--Ö»ÓĞÔÚ¿ªÕ½½×¶Î²¢ÇÒÊÇÑ¡ÖĞµÄÈËÀë¿ªÕ½³¡²Å×÷ÒÔÏÂ´¦Àí
			local tPlayer = BT_GetMSPlayerIndex(nCamp);
			local nPlayerCount = getn(tPlayer);
			local sNewName = "";
			local nFakeIndex = 0;	--¼ÇÂ¼Íæ¼ÒË÷ÒıÔÚtPlayerÖĞµÄË÷Òı£¬Òò´ËÊÇ¼ÙµÄÍæ¼ÒË÷Òı =,=
			local nTargetName = GetMissionS(MSTR_SONG_TARGETNAME+nCamp-1);
			BT_ShowDebugInfor("nPlayerCount:"..nPlayerCount);
			if nPlayerCount > 0 then	--Èç¹û³¡ÄÚ»¹ÓĞÍ¬ÕóÓªµÄÍæ¼Ò
				BT_ShowDebugInfor("nPlayerCount > 0")
				for i=1,10 do	--ÖØĞÂÑ¡ÈËµÄÊ±ºò×î¶àÑ­»·10´Î£¬Èç¹ûÕÒ²»µ½¾ÍËµÃ÷Ê£ÏÂµÄÍæ¼Ò¶¼ÊÇÒÑ¾­±»Ñ¡ÔñµÄÈË
					nPlayerCount = getn(tPlayer);
					if nPlayerCount == 0 then
						BT_ShowDebugInfor("Ng­êi ch¬i cßn l¹i ®Òu ®­îc chän");
						break;
					end;
					nFakeIndex = random(1,nPlayerCount);
					PlayerIndex = tPlayer[nFakeIndex];
					if PlayerIndex > 0 and Is_The_Selected(nCamp) ~= 1 then	--ĞÂÑ¡ÔñµÄÍæ¼Ò²»ÊÇÖ®Ç°±»Ñ¡ÖĞµÄ
						BT_SetTempData(PTT_SELECTED,1);
						sNewName = GetName();
						TaskTip("Nguyªn so¸i cã lÖnh, ng­¬i mau t×m"..nTargetName);
						nFoundTag = 1;
						break
					else	--Èç¹û²»·ûºÏÌõ¼ş£¬Ôò°ÑÕâ¸öÍæ¼ÒµÄË÷Òı´ÓtPlayerÖĞÉ¾³ıµô
						tremove(tPlayer,nFakeIndex);
					end;
				end;
				for i=1,SELECT_COUNT do
					if GetMissionS(MSTR_SONG_ONE+nCamp+i*2-3) == sName then	--ÕÒµ½Ô­À´µÄÃû×Ö
						SetMissionS(MSTR_SONG_ONE+nCamp+i*2-3,sNewName);	--ÉèÖÃĞÂµÄÃû×Ö£¬Èç¹ûÉÏÃæÃ»ÕÒµ½£¬ÄÇÃ´sNewName¾ÍÊÇ""
					end;
				end;
			else --Èç¹ûÊÇ×îºóÒ»Î»ÍË³öµÄ
				BT_ShowDebugInfor("Ng­êi ch¬i cuèi cïng t¹i Th«n trang chiÕn ®· rêi khái")
				Clear_Task_NPC(nCamp);
				SetMissionS(MSTR_SONG_TARGETNAME-1+nCamp,"");	--Ãû×ÖÖÃ¿Õ£¬ÒÔ±ãºóÀ´½øÈëµÄÍæ¼Ò¿ÉÒÔÖØĞÂ¿ªÊ¼¡£
			end;
			if nFoundTag == 1 then
				Msg2MSGroup(MISSION_ID,"Do "..sName.." rêi khái chiÕn tr­êng, nhiÖm vô t×m diÖt B¸ch Sù Th«ng sÏ ®­îc chuyÓn cho "..sNewName..", c¸c t­íng sÜ cÇn ph¶i ®oµn kÕt mét lßng.",nCamp);
				Msg2MSAll(MISSION_ID,tCampNameZ[nCamp].."_t×m B¸ch Sù Th«ng, nhiÖm vô chuyÓn giao:"..sNewName.."nhËn nhiÖm vô");
			end;
		end;
	end;
	PlayerIndex = RoleIndex;
end;

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex;
	BT_JoinBattle(nCamp);
	PlayerIndex = RoleIndex;
end;