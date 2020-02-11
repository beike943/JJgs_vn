--create date:07-04-13
--author:yanjun
--describe:²»¿ÉÖØÉúÆì×ÓËÀÍö½Å±¾
Include("\\script\\gongcheng\\gongcheng_function.lua");

function OnDeath(nNpcIdx)
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState == MS_STATE_ENDING then	--½áÊø½×¶Î²»´¦Àí
		return 0;
	end;
	SetMissionV(MV_FLAG_OWN_COUNT,GetMissionV(MV_FLAG_OWN_COUNT)+1);
	if GCZ_CheckWinCondition() == 1 then
		return 1;
	end;
	local nMusicState = GCZ_SetMusicState();
	GCZ_PlayBackGroundMusic(nMusicState);
	local nFlagID = GCZ_GetNormalFlagIndex(nNpcIdx);
	if nFlagID == 0 then
		WriteLog("[C«ng thµnh C«ng thµnh chiÕn bŞ lçi]: flag_normal_death.lua trong script GCZ_GetNormalFlagIndexhµm sè tr¶ gi¸ trŞ vÒ bŞ lçi");
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local nEnemyCamp = GCZ_GetEnemyCamp();
	GCZ_PlaySound(nPlayerCamp,tWavFileName[1][1]);
	GCZ_PlaySound(nEnemyCamp,tWavFileName[1][2]);
	SetMissionV(MV_DESTROY_FLAG1+nFlagID-1,1);
	SetMissionV(MV_NORMAL_FLAG1_OWNER+nFlagID-1,GONG_ID);
	local nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
	GCZ_Msg2Camp("Phe ta ®· chiÕm lÜnh "..tNormalFlagPos[nFlagID][3]..", chó ı phßng ®Şch nh©n ph¶n kİch! HiÖn t¹i tiÕn ®é c«ng thµnh phe ta lµ "..nFlagCount.."Thµnh",nPlayerCamp);
	GCZ_Msg2Camp("Phe ®Şch ®· chiÕm lÜnh "..tNormalFlagPos[nFlagID][3]..", nÕu kh«ng lËp tøc hµnh ®éng tæn thÊt sÏ ngµy mét lín. HiÖn t¹i tiÕn ®é c«ng thµnh phe ®Şch lµ "..nFlagCount.."Thµnh",nEnemyCamp)
	if nFlagID == 1 then
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_C2,GONG_ID,TRUE);	--Æì×Ó1±»´İ»Ùºó£¬¹¥·½¿ÉÓÃÄ¹µØC2
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_22,SHOU_ID,FALSE);	--ÊØ·½²»¿ÉÓÃÄ¹µØ22
		GCZ_Msg2Camp("§¹i kú ë §«ng thµnh bŞ ph¸ hñy, ®iÓm tËp kÕt trong thµnh m«n phİa §«ng ®· më",GONG_ID);
		GCZ_Msg2Camp("§¹i kú ë §«ng thµnh nguy cÊp, ®iÓm tËp kÕt trung bé §«ng thµnh ®· më",SHOU_ID);
	elseif nFlagID == 2 then
		Msg2MSAll(MISSION_ID,"§¹i kú ë Trung khu bŞ ph¸ hñy, ");
	elseif nFlagID == 3 then
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_C1,GONG_ID,TRUE);	--Æì×Ó3±»´İ»Ùºó£¬¹¥·½¿ÉÓÃÄ¹µØC1
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_21,SHOU_ID,FALSE);	--ÊØ·½²»¿ÉÓÃÄ¹µØ21		
		GCZ_Msg2Camp("§¹i kú ë T©y thµnh bŞ ph¸ hñy, ®iÓm tËp kÕt trong thµnh m«n phİa T©y ®· më",GONG_ID);
		GCZ_Msg2Camp("§¹i kú ë T©y thµnh bŞ nguy cÊp, ®iÓm tËp kÕt trung bé T©y thµnh ®· ®ãng",SHOU_ID);
	end;
	--SetNpcLifeTime(nNpcIdx,0);
end;