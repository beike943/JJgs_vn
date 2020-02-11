--宋军领航员脚本
--by liubo

Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function main()
	Say(sNpcNamePilot..tSTRING_DRAG_NPC[7],getn(tSTRING_PILOT_NPC),tSTRING_PILOT_NPC)
end

function begin_fight()
	local nCamp = LZZ_GetCamp()
	local nMapID = gf_GetCurMapID() 
	--是否已经领取了龙舟
	if GetTask(VET_LZZ_PLAYER_DRAG) == 0 then
		Talk(1,"",sNpcNamePilot..tSTRING_DRAG_NPC[12])
		return 0
	end
	--判断是否骑上龙舟
	if GetPlayerEquipIndex(10) == 0 or GetPlayerEquipIndex(10) ~= GetTask(VET_LZZ_PLAYER_DRAG) then 
		Talk(1,"",sNpcNamePilot..tSTRING_DRAG_NPC[9])
		return 0
	end
	--判断是否是战斗时间
	if GetMissionV(MV_LZZ_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"",sNpcNamePilot..tSTRING_DRAG_NPC[8])
		return 0
	end
	LZZ_RestoreAll()
	NewWorld(nMapID,tMsFightPos[nCamp][1],tMsFightPos[nCamp][2])
	SetFightState(1)
	--=====================
	-- 参与战斗，设置进行标识
	SetTask(VET_LZZ_PLAYER_TAG,1)
	-- 无敌3秒
	CastState("state_dispear",100,18*3)
end

function do_nothing()
--do nothing
end