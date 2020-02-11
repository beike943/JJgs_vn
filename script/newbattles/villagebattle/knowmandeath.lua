--filename:knowmandeath.lua
--create date:2006-06-02
--describe:ÖªÇéÈËNPCËÀÍö½Å±¾
Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");
function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local nNpcCamp,nNum = get_npc_camp(tonumber(npcIndex));
	local nPlayerCamp = BT_GetCamp();
	SetNpcDeathScript(npcIndex,"");
	SetNpcLifeTime(npcIndex,DEAD_BODY_TIME);
	SetMissionV(nNum,0);
	BT_EmperorAward(1);
	BT_AddBattleEvenPoint(BP_VILLAGE_KILL_KNOWMAN);
	BT_AddBattleActivity(BA_VILL_KILL_KNOWMAN);
	if nNpcCamp == nPlayerCamp then
		SetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1,GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1)+1);	--nPlayerCampÉ±ËÀnPlayerCampµÄÖªÇéÈË
		if nPlayerCamp == SONG_ID then
			Msg2MSGroup(MISSION_ID,"Sè B¸ch Sù Th«ng cña phe Tèng bŞ phe Tèng diÖt:"..GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1),nPlayerCamp);
		else
			Msg2MSGroup(MISSION_ID,"Sè B¸ch Sù Th«ng cña phe Liªu bŞ phe Liªu diÖt:"..GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1),nPlayerCamp);
		end;
	else
		SetMissionV(MV_SONG_KILL_LIAO+nPlayerCamp-1,GetMissionV(MV_SONG_KILL_LIAO+nPlayerCamp-1)+1);	--nPlayerCampÉ±ËÀnEnemyCampµÄÖªÇéÈË
		if nPlayerCamp == SONG_ID then
			Msg2MSGroup(MISSION_ID,"Sè B¸ch Sù Th«ng cña phe Liªu bŞ phe Tèng diÖt:"..GetMissionV(MV_SONG_KILL_LIAO+nPlayerCamp-1),nPlayerCamp);
		else
			Msg2MSGroup(MISSION_ID,"Sè B¸ch Sù Th«ng cña phe Tèng bŞ phe Liªu diÖt:"..GetMissionV(MV_SONG_KILL_LIAO+nPlayerCamp-1),nPlayerCamp);
		end;
	end;
	local MapID,MapX,MapY = GetNpcWorldPos(GetMissionV(MV_TASK_NPCINDEX_SONG+nNpcCamp-1));
	if nNpcCamp == SONG_ID then
		Say("Nh©n vËt phe Tèng <color=yellow>"..GetMissionS(MSTR_SONG_TARGETNAME+nNpcCamp-1).."<color> täa ®é: <color=yellow>"..floor(MapX/8)..","..floor(MapY/16).."<color>",0);
	else
		Say("Nh©n vËt phe Liªu <color=yellow>"..GetMissionS(MSTR_SONG_TARGETNAME+nNpcCamp-1).."<color> täa ®é: <color=yellow>"..floor(MapX/8)..","..floor(MapY/16).."<color>",0);
	end;
end;
--ÅĞ¶ÏNPCÊÇÄÄ¸öÕóÓªµÄ¡£ÔÚÕâÀïÒªËµÃ÷Ò»ÏÂ£¬ÎÒÃÇ¿ÉÒÔ¸ù¾İNPCµÄÃû×ÖÀ´ÅĞ¶ÏËüËùÊôµÄÕóÓª£¬
--µ«ÊÇÕâÑùµÄ»°£¬Õâ¸öº¯Êı½«²»ÊÊÓÃÓÚº£Íâ°æ£¬ÒòÎªº£Íâ°æ¶Ô×Ö·û´®µÄ´¦Àí²»Í¬ÓÚÖĞÎÄ°æ¡£
--ËùÒÔ¾¡Á¿²»ÒªÓÃÅĞ¶ÏÖĞÎÄ×Ö·ûµÄ·½Ê½À´´¦ÀíÒ»Ğ©ÊÂÇé¡£
function get_npc_camp(nIndex)
	for i=MV_KNOWMAN_SONG_BEGIN,MV_KNOWMAN_SONG_END do
		if nIndex == GetMissionV(i) then
			return SONG_ID,i;
		end;
	end;
	for i=MV_KNOWMAN_LIAO_BEGIN,MV_KNOWMAN_LIAO_END do
		if nIndex == GetMissionV(i) then
			return LIAO_ID,i;
		end;
	end;
	WriteLog("[ChiÕn tr­êng b¸o lçi]: get_npc_camp kh«ng t×m thÊy ®èi ph­¬ng NPC, nhËp tham sè:"..nIndex);
end;