--filename:targetnpcdeath.lua
--create date:2006-06-02
--describe:Ä¿±êNPCËÀÍö½Å±¾
Include("\\settings\\static_script\\kf_newbattles\\villagebattle\\villagebattle_head.lua");
function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local nCamp = BT_GetCamp()
	local nEnemyCamp = 3 - nCamp;
	local sName = GetMissionS(MSTR_SONG_TARGETNAME-1+nCamp);
	local sNewTargetName = "";
	local nStep = 0;
	local nPoint = 0;
	local nEvenID = 0;
	local nNpcType = 0;
	SetNpcLifeTime(npcIndex,DEAD_BODY_TIME);
	SetNpcDeathScript(npcIndex,"");
	BT_EmperorAward(1);
	BT_AddBattleActivity(BA_VILL_TALK_TARGET);
	if tonumber(npcIndex) == GetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp) then	--É±ËÀµÄÊÇ±¾·½Ä¿±êNPC
		nNpcType = GetMissionV(MV_FIGHT_NPC_TYPE_SONG+nCamp-1);
		if nNpcType == SICK_NPC then
			nStep = 1;
			nEvenID = BP_VILLAGE_KILL_SICK;
		elseif nNpcType == ANGRY_NPC then
			nStep = 2;
			nEvenID = BP_VILLAGE_KILL_ANGRY;
		else
			nStep = 3;
			nEvenID = BP_VILLAGE_KILL_RAGIN;
		end;
		BT_AddBattleEvenPoint(nEvenID);
		if Modify_Task_Step(nCamp,nStep) == 1 then
			Reach_Final_Step(nCamp);
		else
			sNewTargetName = Go_To_Next_Step(nCamp);
			Talk(1,"","<color=green>"..sName.."<color>: C¸c ng­¬i muèn t×m thñ lÜnh, ph¶i ®i hái <color=yellow>"..sNewTargetName.."<color>, h¾n ta th­êng ë trong th«n.")
			Msg2MSGroup(MISSION_ID,"Doanh tr¹i cÊp b¸o:"..sNewTargetName.."cã thÓ biÕt tung tÝch thñ lÜnh, mêi c¸c vÞ anh hïng nhanh chãng t×m ra. HiÖn phe ta nhËn ®­îc sù tÝn nhiÖm cña thæ d©n lµ"..GetMissionV(MV_SONG_TASKSTEP+nCamp-1)..".",nCamp);
		end;
	else	--É±ËÀµÄÊÇµÐ·½Ä¿±êNPC
		nNpcType = GetMissionV(MV_FIGHT_NPC_TYPE_SONG+nEnemyCamp-1);
		if nNpcType == SICK_NPC then
			nStep = -2;	--¿ÛµôµÐ·½²½ÖèÊý
			nEvenID = BP_VILLAGE_KILL_SICK;
		elseif nNpcType == ANGRY_NPC then
			nStep = -3;
			nEvenID = BP_VILLAGE_KILL_ANGRY;
		else
			nStep = -5;
			nEvenID = BP_VILLAGE_KILL_RAGIN;
		end;
		Modify_Task_Step(nEnemyCamp,nStep);
		BT_AddBattleEvenPoint(nEvenID);
		sNewTargetName = Go_To_Next_Step(nEnemyCamp);
		BT_OperateAllPlayer(tell_fail,{sNewTargetName,nEnemyCamp},nEnemyCamp)
	end;
end;

function tell_fail(tArg)
	local sName = tArg[1];
	local nCamp = tArg[2];
	local sContent = "";
	sContent = "§¸ng tiÕc! B¸ch Sù Th«ng ®· bÞ ®Þch ph­¬ng s¸t h¹i. Nh­ng ta võa nhËn ®­îc tin tøc: Thæ d©n <color=yellow>"..sName.."<color> cã thÓ biÕt tung tÝch cña thñ lÜnh, mêi t­íng sÜ <color=yellow>";
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
	Say(sContent,0);
end;