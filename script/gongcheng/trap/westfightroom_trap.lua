--create date:07-04-24
--author:yanjun
--describe:西门单挑TRAP点脚本
Include("\\script\\gongcheng\\gongcheng_function.lua");

g_RoomIdx = 3;

function main()
	if GetTaskTemp(TEMP_ARENA_FIGHTING) ~= 0 then	--正在单挑中
		return 0;
	end;
	local nRoomIdx = GetTaskTemp(TEMP_AUDIENCE);
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local nState = GetMissionV(MV_MISSION_STATE);
	if nRoomIdx ~= 0 then	--在单挑场地里面
		SetTaskTemp(TEMP_AUDIENCE,0);
		SetPos(tFightRoomExit[nRoomIdx][nPlayerCamp][1],tFightRoomExit[nRoomIdx][nPlayerCamp][2]);
		DesaltPlayer(0);
		SetFightState(1);
		UseSkillEnable(1);--  (1可以使用武功，0禁止使用武功)
	else	--在单挑场地外面
		if nState >= MS_STATE_GONGCHENG then	--转入攻城阶段后就不起作用
			return 0;
		end;
		SetFightState(0);
		SetTaskTemp(TEMP_AUDIENCE,g_RoomIdx);
		SetPos(tFightingPos[g_RoomIdx][1],tFightingPos[g_RoomIdx][2]);	
		DesaltPlayer(1);
		UseSkillEnable(0);--  (1可以使用武功，0禁止使用武功)
	end;
end;