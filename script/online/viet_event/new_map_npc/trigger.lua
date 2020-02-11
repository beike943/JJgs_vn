
Include("\\script\\lib\\writelog.lua")

g_szLogTitle = "new map : 963"

g_NpcInfo =
{
	{"kylin_viet", "Kú l©n"},
	{"phenix_viet", "Phông Vò"},
}

MAP_ID = 963
GROUP_OFFSET = 60
NPC_MAX_NUM = 200

function EnterMap()
--	create_map_trigger()
--	if CreateTrigger(1,3001,2504) == 0 then
--		WriteLogEx(g_szLogTitle, "CreateTrigger", "", "", "CreateTrigger(1,3001,2504) Failed.", GetTongName(), "CreateTrigger(1,3001,2504) Failed.")
--	end
end

function LeaveMap()
--	create_map_trigger()
--	RemoveTrigger(GetTrigger(2504))
end

function OnTimer()
--	while CountGroupUnit(1 + GROUP_OFFSET) < NPC_MAX_NUM do
--		local nRandom = random(1, 2)
--		local nPosX = (random(1, 13) * 15) + 1650
--		local nPosY = (random(1, 30) * 15) + 3205
--		local nNpcIndex = CreateNpc(g_NpcInfo[nRandom][1], g_NpcInfo[nRandom][2], MAP_ID, nPosX, nPosY)
--		AddGroupUnit(1 + GROUP_OFFSET, nNpcIndex)
--	end
end

function create_map_trigger()
--	if GetTrigger(2505) == 0 then
--		if CreateTrigger(2,3003,2505) == 0 then
--			WriteLogEx(g_szLogTitle, "CreateTrigger", "", "", "CreateTrigger(2,3003,2505) Failed.", GetTongName(), "CreateTrigger(2,3003,2505) Failed.")
--		end
--	end
--	if GetTrigger(2506) == 0 then
--		if CreateTrigger(2,3004,2506) == 0 then
--			WriteLogEx(g_szLogTitle, "CreateTrigger", "", "", "CreateTrigger(2,3004,2506) Failed.", GetTongName(), "CreateTrigger(2,3004,2506) Failed.")
--		end
--	end
end

