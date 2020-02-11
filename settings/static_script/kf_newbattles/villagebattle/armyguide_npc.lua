--filename:armyguide_npc.lua
--create date:2006-05-31
--describe:´åÂäÕù¶áÕ½³¡ÖÐËæ¾üÏòµ¼½Å±¾
Include("\\settings\\static_script\\kf_newbattles\\villagebattle\\villagebattle_head.lua");

function main()
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"X«ng pha trËn m¹c, tèc ®é rÊt quan träng!");
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","<color=green>H­íng ®¹o<color>:............");
		return 0;
	end;
	local sContent = "";
	local sName = "";
	local nCamp = BT_GetCamp();
	local nStep = GetMissionV(MV_SONG_TASKSTEP+nCamp-1);
	if nStep >= MAX_TASK_STEP then
		local _,nPosX,nPosY = GetNpcWorldPos(GetMissionV(MV_HEADER_APPEAR));
		Talk(1,"","Thñ lÜnh thæ d©n ®· xuÊt hiÖn, ng­¬i cã thÓ t×m thÊy h¾n ë <color=yellow>"..floor(nPosX/8)..","..floor(nPosY/16).."<color>.");
		return 0;
	end;
	if GetMissionS(MSTR_SONG_TARGETNAME+nCamp-1) == "" then	--µÚÒ»´Î±»µã»÷
		Go_To_Next_Step(nCamp);	--¿ªÊ¼µÚÒ»²½
	end;
	sName = GetMissionS(MSTR_SONG_TARGETNAME+nCamp-1);
	sContent = "Qua ®iÒu tra, ®­îc biÕt thæ d©n <color=yellow>"..sName.."<color> cã thÓ biÕt tung tÝch cña thñ lÜnh, mêi t­íng sÜ <color=yellow>";
	if GetMissionS(MSTR_SONG_ONE+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_ONE+nCamp-1)..", ";
	end;
	if GetMissionS(MSTR_SONG_TWO+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_TWO+nCamp-1)..", ";
	end;
	if GetMissionS(MSTR_SONG_THREE+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_THREE+nCamp-1)..", ";
	end;
	sContent = strsub(sContent,1,strlen(sContent)-2);
	sContent = sContent.."<color> mau ®Õn ®ã t×m B¸ch Sù Th«ng cã liªn quan ®Ó t×m ra t«ng tÝch <color=yellow>"..sName.."<color>.";
	local selTab = {
					--"·µ»Ø"..tCampNameZ[nCamp].."·½ºóÓª/back_to_home",
					"KÕt thóc ®èi tho¹i/nothing",
					}
	Say("<color=green>H­íng ®¹o<color>:"..sContent,0);
end;

function back_to_home()
	local nCamp = BT_GetCamp()
	SetPos(ENTRANCE_POINT[nCamp][2],ENTRANCE_POINT[nCamp][3]);
	BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	SetFightState(0);
end;