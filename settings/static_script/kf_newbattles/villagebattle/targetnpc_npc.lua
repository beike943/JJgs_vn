Include("\\settings\\static_script\\kf_newbattles\\villagebattle\\villagebattle_head.lua");
function main()
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local npcIdx,npcModel,npcName = GetTriggeringUnit();
	if npcIdx == 0 then
		return 0;
	end;
	local _,nNpcX,nNpcY = GetNpcWorldPos(npcIdx);
	if BT_GetDistance(nNpcX,nNpcY) >= 5 then
		Msg2Player("B¹n vµ  "..npcName.."  c¸ch qu¸ xa.");
		return 0;
	end;
	local nCamp = BT_GetCamp();
	if npcName ~= GetMissionS(MSTR_SONG_TARGETNAME-1+nCamp) then	--Õâ¸öÊÇµĞ·½µÄÄ¿±êNPC
		Talk(1,"","<color=green>"..npcName.."<color>: Xin hái cã chuyÖn g×?");
		return 0;
	end;
	if Is_The_Selected(nCamp) == 1 then	--Èç¹ûÊÇ±»Ñ¡ÖĞµÄÈËÖ®Ò»
		Talk(1,"#reaction(\""..npcName.."\")","PhiÒn vŞ ®¹i ca cho biÕt tung tİch thñ lÜnh, t¹i h¹ mu«n phÇn c¶m kİch.");
		BT_AddBattleActivity(BA_VILL_TALK_TARGET);
	else
		Talk(1,"","<color=green>"..npcName.."<color>: Xin hái cã chuyÖn g×?");
	end;
end;

function reaction(sNpcName)
	local nPlayerCamp = BT_GetCamp();
	local nEnemyCamp = 3 - nPlayerCamp;
	local sName = GetMissionS(MSTR_SONG_TARGETNAME+nPlayerCamp-1);
	if sNpcName ~= sName then	--±ÜÃâÁ½¸öÍæ¼ÒÍ¬Ê±µã»÷NPCÊ±³öÏÖµÄÒâÍâÇé¿ö
		return 0;
	end;
	local sNewTargetName = "";
	
	if GetMissionV(MV_SONG_KILL_LIAO+nEnemyCamp-1) >= 10 then	--Èç¹û¶Ô·½É±ËÀ±¾·½·½È«²¿ÖªÇéÈË
		if Modify_Task_Step(nPlayerCamp,5) == 1 then
			Reach_Final_Step(nPlayerCamp);
		else
			sNewTargetName = Go_To_Next_Step(nPlayerCamp);
			if nEnemyCamp == SONG_ID then
				Say("<color=green>"..sName.."<color>: C¸c ng­¬i ®Õn trÔ vËy? Huynh ®Ö tû muéi cña ta ®· bŞ Binh sÜ phe Tèng s¸t h¹i, h·y gióp ta b¸o thï, huhu! VÒ tung tİch thñ lÜnh, <color=yellow>"..sNewTargetName.."<color> lµ ng­êi biÕt râ nhÊt.",0);	
			else
				Say("<color=green>"..sName.."<color>: C¸c ng­¬i ®Õn trÔ vËy? Huynh ®Ö tû muéi cña ta ®· bŞ Binh sÜ phe Liªu s¸t h¹i, h·y gióp ta b¸o thï, huhu! VÒ tung tİch thñ lÜnh, <color=yellow>"..sNewTargetName.."<color> lµ ng­êi biÕt râ nhÊt.",0);	
			end;
		end;
		BT_AddBattleEvenPoint(BP_VILLAGE_FIND_TARGET);
		BT_EmperorAward(1);	
	elseif GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1) >= 10 then--Èç¹û±¾·½É±ËÀ±¾·½È«²¿ÖªÇéÈË
		Talk(1,"","<color=green>"..sName.."<color>: Hõ! §¸m thæ phØ c¸c ng­¬i cßn cã gan ®Õn hái th¨m tin tøc cña thñ lÜnh n÷a sao? Ta liÒu chÕt víi ng­¬i ®©y!");
		change_npc2fight(nPlayerCamp,sName,RAGING_NPC);	--±äÉí¿ñ±©µÄÄ¿±ênpc
	elseif GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1) == 0 then	--Èç¹û±¾·½Î´É±ËÀ±¾·½ÈÎºÎÖªÇéÈË
		if Modify_Task_Step(nPlayerCamp,2) == 1 then
			Reach_Final_Step(nPlayerCamp);
		else
			sNewTargetName =Go_To_Next_Step(nPlayerCamp);
			Say("<color=green>"..sName.."<color>: Tuy ta lµ g· thÊt phu nh­ng vÉn hiÓu ®­îc lÏ ph¶i, ph©n biÖt ®­îc tèt xÊu. Muèn t×m thñ lÜnh cã thÓ hái th¨m <color=yellow>"..sNewTargetName.."<color>, h¾n ta th­êng ë trong th«n, biÕt ®©u gióp ®­îc ng­¬i.",0);	
		end;
		BT_AddBattleEvenPoint(BP_VILLAGE_FIND_TARGET);
		BT_EmperorAward(1);
	elseif GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1) <= 3 then	--Èç¹û±¾·½É±ËÀ±¾·½ÖªÇéÈËÊıÄ¿²»³¬¹ı3
		if Modify_Task_Step(nPlayerCamp,1) == 1 then
			Reach_Final_Step(nPlayerCamp);
		else
			sNewTargetName = Go_To_Next_Step(nPlayerCamp);
			Say("<color=green>"..sName.."<color>: µi! ChiÕn tranh ®o¹t quyÒn, ng­êi d©n nh­ chóng t«i chŞu khæ mµ th«i, muèn t×m thñ lÜnh cã thÓ hái <color=yellow>"..sNewTargetName.."<color>, ta kh«ng muèn nhóng tay vµo chuyÖn nµy!",0);
		end;
		BT_AddBattleEvenPoint(BP_VILLAGE_FIND_TARGET);
		BT_EmperorAward(1);
	elseif GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1) < GetMissionV(MV_SONG_KILL_LIAO+nEnemyCamp-1) then	--Èç¹û±¾·½É±ËÀÖªÇéÈËÊıÄ¿³¬¹ı3µ«±ÈµĞ·½É±µÄÉÙ
		Talk(1,"","<color=green>"..sName.."<color>: Hõ! MÊy ng­êi c¸c ng­¬i so víi lò giÕt ng­êi c­íp cña cã ph©n biÖt g×? Ta tuyÖt ®èi kh«ng tiÕt lé tung tİch cña thñ lÜnh.");
		change_npc2fight(nPlayerCamp,sName,SICK_NPC);	--±äÉí³ğºŞµÄÄ¿±ênpc
	else	--Èç¹û±¾·½É±ËÀÖªÇéÈËÊıÄ¿³¬¹ı3ÇÒ±ÈµĞÈËÉ±µÃ¶à
		if nEnemyCamp == SONG_ID then
			Talk(1,"","<color=green>"..sName.."<color>: Muèn t×m thñ lÜnh ph¶i b­íc qua x¸c ta ®·!");
		else
			Talk(1,"","<color=green>"..sName.."<color>: Muèn t×m thñ lÜnh ph¶i b­íc qua x¸c ta ®·!");
		end;
		change_npc2fight(nPlayerCamp,sName,ANGRY_NPC);	--±äÉí·ßÅ­µÄÄ¿±ênpc
	end;
end;
--±äÉíÎªÕ½¶·NPC¡£ÊäÈë²ÎÊı£ºNPCÕóÓª£¬NPCÃû×Ö£¬NPCÀàĞÍ
function change_npc2fight(nCamp,sName,nType)	
	local npcIndex = GetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp);
	if npcIndex == 0 then
		WriteLog("[ChiÕn tr­êng b¸o lçi]: Hµm sè change_npc2fight nhËn ®­îc trŞ h­íng dÉn NPC lµ 0");
		return 0;
	end;
	local MapID,MapX,MapY = GetNpcWorldPos(npcIndex);
	SetNpcScript(npcIndex,"");
	SetNpcLifeTime(npcIndex,0)
	if nType == SICK_NPC then
		npcIndex = CreateNpc("Thæ d©n thï hËn","o¸n hËn"..sName,MapID,MapX,MapY);
	elseif nType == ANGRY_NPC then
		npcIndex = CreateNpc("Thæ d©n phÉn né","phÉn né"..sName,MapID,MapX,MapY);
	else
		npcIndex = CreateNpc("Thæ d©n cuång b¹o","cuång b¹o"..sName,MapID,MapX,MapY);
	end;
	SetMissionV(MV_FIGHT_NPC_TYPE_SONG+nCamp-1,nType);
	SetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp,npcIndex);
	SetNpcDeathScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\villagebattle\\targetnpcdeath.lua");
	SetMissionV(MV_TARGET_NPC_STATE_SONG+nCamp-1,1);	--ÉèÖÃÄ¿±êNPCµÄµ±Ç°×´Ì¬ÎªÕ½¶·×´Ì¬
	SetMissionV(MV_NPC_FIGHT_BEGIN_SONG+nCamp-1,GetMissionV(MV_TIMER_LOOP));	--¼ÇÂ¼Ä¿±êNPC±ä³ÉÕ½¶·NPCÊ±¼ÆÊ±Æ÷µÄ¼ÆÊ±´ÎÊı
end;
