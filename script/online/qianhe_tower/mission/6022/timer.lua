Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\online\\qianhe_tower\\mission\\6022\\mission.lua")
Include("\\script\\lib\\missionfunctions.lua")

function OnTimer()
	if qht_activity_isopen() ~= 1 then
		EndMission();
	end
	local nStep = mf_GetMissionV(QHT_MISSION_ID[2], 99, QHT_MAP_TABLE[2]);
	mf_SetMissionV(QHT_MISSION_ID[2], 99, mod(nStep + 1, QHT_NPC_REFLASH * 3), QHT_MAP_TABLE[2]);
	--一个周期做一次
	if nStep == 0 then
		local tBuff, tBox, tBoss = qht_random_flash(6022, QHT_RANDOM_POINT_6022);
		
		if not tBuff or not tBox or not tBoss then 
			return 0; 
		end
		--处理以前的
		for i = 1, 30 do
			mf_SetMissionV(QHT_MISSION_ID[2], i, 0, QHT_MAP_TABLE[2]);
		end
		--记录buff点
		for i = 1, getn(tBuff) do
			mf_SetMissionV(QHT_MISSION_ID[2], i, tBuff[i], QHT_MAP_TABLE[2]);
		end
		--记录box点
		for i = 11, getn(tBox) + 10 do
			mf_SetMissionV(QHT_MISSION_ID[2], i, tBox[i - 10], QHT_MAP_TABLE[2]);
		end
		--记录boss点
		for i = 21, getn(tBoss) + 20 do
			mf_SetMissionV(QHT_MISSION_ID[2], i, tBoss[i - 20], QHT_MAP_TABLE[2]);
		end
	end
	--神坛亲
	if nStep + 1 == QHT_NPC_REFLASH then
		--每一周期开启30min开始刷时清楚之前所有
		for i = 31, 50 do
			local oldnpcIndex = mf_GetMissionV(QHT_MISSION_ID[2], i, QHT_MAP_TABLE[2]);
			if oldnpcIndex > 0 and qht_npc_name_cmp(GetNpcName(oldnpcIndex)) == 1 then
				SetNpcLifeTime(oldnpcIndex, 0);
				mf_SetMissionV(QHT_MISSION_ID[2], i, 0, QHT_MAP_TABLE[2]);
			end
		end
		--开始刷妹子
		create_buff_npc();
	end
	--boss亲
	if nStep + 1 == 2 * QHT_NPC_REFLASH then
		--开始刷妹子
		create_buff_npc();
		create_boss_npc();
	end
	--宝箱亲
	if nStep + 1 == 3 * QHT_NPC_REFLASH  then
		--开始刷妹子
		create_buff_npc();
		create_boss_npc();
		create_box_npc();
	end
end


function create_buff_npc()
	for i = 1, 10 do 
		local nRand = mf_GetMissionV(QHT_MISSION_ID[2], i, QHT_MAP_TABLE[2]);
		--这个点有值
		if nRand > 0 and nRand <= getn(QHT_RANDOM_POINT_6022) then
			--之前的npc处理
			local oldnpcIndex = mf_GetMissionV(QHT_MISSION_ID[2], i + 30, QHT_MAP_TABLE[2]);
			if oldnpcIndex > 0 and qht_npc_name_cmp(GetNpcName(oldnpcIndex)) == 1 then
				SetNpcLifeTime(oldnpcIndex, 0);
			end
			--创建新npc
			local npcIndex = qht_create_buff(QHT_SHENTAN_TABLE_6022,{QHT_RANDOM_POINT_6022[nRand][1], QHT_RANDOM_POINT_6022[nRand][2], QHT_RANDOM_POINT_6022[nRand][3]});
			--记录npc的值
			mf_SetMissionV(QHT_MISSION_ID[2], i + 30, npcIndex, QHT_MAP_TABLE[2])
		end
	end
end

function create_box_npc()
	for i = 11, 20 do 
		local nRand = mf_GetMissionV(QHT_MISSION_ID[2], i, QHT_MAP_TABLE[2]);
		--这个点有值
		if nRand > 0 and nRand <= getn(QHT_RANDOM_POINT_6022) then
			--之前的npc处理
			local oldnpcIndex = mf_GetMissionV(QHT_MISSION_ID[2], i + 30, QHT_MAP_TABLE[2]);
			if oldnpcIndex > 0 and qht_npc_name_cmp(GetNpcName(oldnpcIndex)) == 1 then
				SetNpcLifeTime(oldnpcIndex, 0);
			end
			--创建新npc
			local npcIndex = qht_create_box(QHT_BOX_TABLE_6022,{QHT_RANDOM_POINT_6022[nRand][1], QHT_RANDOM_POINT_6022[nRand][2], QHT_RANDOM_POINT_6022[nRand][3]});
			--记录npc的值
			mf_SetMissionV(QHT_MISSION_ID[2], i + 30, npcIndex, QHT_MAP_TABLE[2])
		end
	end
end

function create_boss_npc()
	for i = 21, 30 do 
		local nRand = mf_GetMissionV(QHT_MISSION_ID[2], i, QHT_MAP_TABLE[2]);
		--这个点有值
		if nRand > 0 and nRand <= getn(QHT_RANDOM_POINT_6022) then
			--之前的npc处理
			local oldnpcIndex = mf_GetMissionV(QHT_MISSION_ID[2], i + 30, QHT_MAP_TABLE[2]);
			if oldnpcIndex > 0 and qht_npc_name_cmp(GetNpcName(oldnpcIndex)) == 1 then
				SetNpcLifeTime(oldnpcIndex, 0);
			end
			--创建新npc
			local npcIndex = qht_create_boss(QHT_BOSS_TABLE_6022,{QHT_RANDOM_POINT_6022[nRand][1], QHT_RANDOM_POINT_6022[nRand][2], QHT_RANDOM_POINT_6022[nRand][3]});
			--记录npc的值
			mf_SetMissionV(QHT_MISSION_ID[2], i + 30, npcIndex, QHT_MAP_TABLE[2])
		end
	end
end