--filename:injure_timer.lua
--create date:2006-10-19
--describe:Ö÷Õ½³¡ÖÐ´¦ÀíÍæ¼ÒÖÐÅÚµ¯µÄ¼ÆÊ±Æ÷½Å±¾
Include("\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\mainbattle_head.lua");
function OnTimer()
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		BT_OperateAllPlayer(judge_injure,{},ALL_ID);
	end;
end;

function judge_injure(tArg)
	local nEmplacementPosID = get_emplacement_pos_id();
	local nRoute = GetPlayerRoute();
	if nEmplacementPosID >= 0 then
		local nRand = random(1,100);
		local nPlayerCamp = BT_GetCamp();
		local nEmplacementCamp = GetMissionV(MV_EMPLACEMENT0_POSSESSION+nEmplacementPosID);
		if nEmplacementCamp ~= nPlayerCamp and nRand <= tRouteHurt[nRoute][1] then
			CastState("imme_damage_life_directly",tRouteHurt[nRoute][2],0);
			Msg2Player("B¹n bÞ háa ph¸o ®¸nh tróng! Tæn thÊt "..tRouteHurt[nRoute][2].." ®iÓm sinh lùc");
		end;			
	end;
end;

--¸ù¾ÝÍæ¼Òµ±Ç°Ëù´¦µÄÎ»ÖÃÀ´ÅÐ¶ÏÍæ¼Ò´¦ÓÚÄÄ¸öÅÚÌ¨µÄ¹¥»÷·¶Î§ÄÚ
function get_emplacement_pos_id()
	if BT_GetDistance(tEmplacementPos[ALL_ID][1],tEmplacementPos[ALL_ID][2]) <= EMPLACEMENT0RANGE then
		return ALL_ID;
	elseif BT_GetDistance(tEmplacementPos[SONG_ID][1],tEmplacementPos[SONG_ID][2]) <= EMPLACEMENT1RANGE then
		return SONG_ID;
	elseif BT_GetDistance(tEmplacementPos[LIAO_ID][1],tEmplacementPos[LIAO_ID][2]) <= EMPLACEMENT2RANGE then
		return LIAO_ID;
	else
		return -1;
	end;
end;
