Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\2010_12\\activity_05\\head.lua");
Include("\\script\\online_activites\\2010_12\\activity_05\\npc\\carter.lua");

SB_CarterPositions = 
{
	{100, 1361, 2923},	-- 泉州
	{200, 1375, 2865}, -- 汴京
	{300, 1832, 3580},	-- 成都
}

function ServerStartUp(startTime, endTime)
	--WriteLog("ServerStartUp::called");
	--WriteLog("ServerStartUp::SB_ACTIVITY_ID: "..SB_ACTIVITY_ID);
	--WriteLog("ServerStartUp::gf_CheckEventDateEx(SB_ACTIVITY_ID): "..gf_CheckEventDateEx(SB_ACTIVITY_ID));
	if gf_CheckEventDateEx(SB_ACTIVITY_ID) == 1 then
		for i=1, getn(SB_CarterPositions) do
			--WriteLog("ServerStartUp::i: "..i);
			local npcIndex = CreateNpc(CR_TEMPLATE, CR_NAME, SB_CarterPositions[i][1], SB_CarterPositions[i][2], SB_CarterPositions[i][3]);
			SetNpcScript(npcIndex, "\\script\\online_activites\\2010_12\\activity_05\\npc\\carter.lua");
		end
	end
end

function PlayerLogin(exchangeComing, startTime, endTime)
end