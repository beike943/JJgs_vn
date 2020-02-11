Include("\\script\\online_activites\\2011_03\\boss\\string.lua");
Include("\\script\\lib\\globalfunctions.lua");

function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex, 0)
	SetNpcScript(nNpcIndex,"");
	gf_EventGiveCustomAward(1, 5000000, 1, VET_STR_201103_EVENTBOSS_LOG_TITLE, format(VET_TB_201103_EVENTBOSS_LOG_ACTION_LIST[2],VET_TB_201103_EVENTBOSS_NPC_NAME[1]));
	local nMapID,nX,nY = GetNpcWorldPos(nNpcIndex)
	for i=1,20 do
		local nTempNpcIndex = CreateNpc("TiÓu Niªn Thó","TiÓu Niªn Thó",nMapID,nX,nY,-1,1,1,2000)
		if (nTempNpcIndex > 0) then
			SetNpcScript(nTempNpcIndex,"\\script\\online_activites\\2011_03\\boss\\npc\\smallboss.lua")
			SetNpcLifeTime(nTempNpcIndex,600);
		end
	end
end