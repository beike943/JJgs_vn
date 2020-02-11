--作者：严军
--创建日期：07年12月27日17:34
--NPC死亡脚本
Include("\\script\\task\\faction_back_room\\back_room_function.lua");
function OnDeath(nNpcIdx)
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	local nMapID2,nMapX2,nMapY2 = 0,0,0;
	local nEnemyIdx = 0;
	local nDistance = 0;
	for i=MV_NPC_INDEX_BEGING,MV_NPC_INDEX_END do
		nEnemyIdx = GetMissionV(i);
		if nEnemyIdx ~= 0 then
			nMapID2,nMapX2,nMapY2 = GetNpcWorldPos(nEnemyIdx);
			nDistance = gf_GetDistance(nMapX,nMapY,nMapX2,nMapY2);
			if nDistance <= 10 then
				BR_ModifyNpcLife(nEnemyIdx,-48,1,1);	--减少%48的生命
			end;
		end;
	end;
end;