Include("\\script\\online_activites\\2010_12\\activity_06\\head.lua");
Include("\\script\\online_activites\\2010_12\\activity_06\\npc\\fruit_keeper.lua");
Include("\\script\\lib\\globalfunctions.lua");

FG_StartDate = 2010121000;
FG_EndDate = 2011013024;

FG_NpcSpawnPoints =
{
	{100, 1403, 2916},
	{150, 1727, 3175},
	{200, 1447, 2908},
	{300, 1760, 3632},
	{350, 1351, 2900}
}


function ServerStartUp(startTime, endTime)
	do	return	end
	--WriteLog("ServerStartUp::called");
	--WriteLog("ServerStartUp::FG_ACTIVITY_ID: "..FG_ACTIVITY_ID);
	--WriteLog("ServerStartUp::gf_CheckEventDateEx(FG_ACTIVITY_ID): "..gf_CheckEventDateEx(FG_ACTIVITY_ID));
	local curDate = tonumber(date("%Y%m%d%H"));
	if FG_StartDate <= curDate and FG_EndDate >= curDate then
		--WriteLog("ServerStartUp::test1");
		for i=1, getn(FG_NpcSpawnPoints) do
			local npcIndex = CreateNpc(FK_TEMPLATE, FK_NAME, FG_NpcSpawnPoints[i][1], FG_NpcSpawnPoints[i][2], FG_NpcSpawnPoints[i][3]);
			--WriteLog("ServerStartUp::npcIndex: "..npcIndex);
			if 0 < npcIndex then
				SetNpcScript(npcIndex, "\\script\\online_activites\\2010_12\\activity_06\\npc\\fruit_keeper.lua");
			end
		end
	end
	--WriteLog("ServerStartUp::end");
end

function PlayerLogin(exchangeComing, startTime, endTime)
end