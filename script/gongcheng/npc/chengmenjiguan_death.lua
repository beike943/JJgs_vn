--create date:07-04-13
--author:yanjun
--describe:³ÇÃÅ»ú¹ØËÀÍö½Å±¾
Include("\\script\\gongcheng\\gongcheng_function.lua");

function OnDeath(nNpcIdx)
	local nJiGuanID = GCZ_GetChengMenJiGuanIndex(nNpcIdx);
	--SetNpcLifeTime(nNpcIdx,0);
	if nJiGuanID == 0 then
		WriteLog("[c«ng thµnh C«ng thµnh chiÕn bÞ lçi]: chengmenjiguan_death.lua trong script GCZ_GetChengMenJiGuanIndex hµm sè tr¶ vÒ trÞ sè bÞ lçi");
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local nEnemyCamp = GCZ_GetEnemyCamp();
	GCZ_PlaySound(nPlayerCamp,tWavFileName[3][1]);
	GCZ_PlaySound(nEnemyCamp,tWavFileName[3][2]);
	SetMissionV(MV_DESTROY_EAST_DOOR+nJiGuanID-1,1);
	SetMissionV(MV_EAST_JIGUAN_INDEX+nJiGuanID-1,0);
	if nJiGuanID == 1 then
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_B2,GONG_ID,TRUE);
		Msg2MSAll(MISSION_ID,"Thµnh m«n phÝa §«ng nguy cÊp, ®iÓm tËp kÕt ngoµi thµnh ®· më");
	elseif nJiGuanID == 2 then
		Msg2MSAll(MISSION_ID,"Trung khu thµnh m«n nguy cÊp");
	elseif nJiGuanID == 3 then
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_B1,GONG_ID,TRUE);
		Msg2MSAll(MISSION_ID,"Thµnh m«n phÝa T©y nguy cÊp, T©y thµnh m«n®iÓm tËp kÕt ngoµi thµnh ®· më");
	end;
	Msg2MSAll(MISSION_ID,GetName().." ®· ph¸ hñy "..tChengMenJiGuanPos[nJiGuanID][3])
	if GCZ_CheckAllDoor() == 1 then
		Msg2MSAll(MISSION_ID,"thµnh m«n ®· hoµn toµn l©m nguy, C«ng thµnh ®¹i ph¸o cßn c¸ch ");
		GCZ_ComeToGongmeng();
	end;
end;
