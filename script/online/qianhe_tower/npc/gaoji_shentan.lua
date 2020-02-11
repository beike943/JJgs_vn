Include("\\script\\online\\qianhe_tower\\qht_head.lua")

function main()
	local npcIndex = GetTargetNpc();
	local npcName = GetNpcName(npcIndex);
	local oldPlayerIndex = PlayerIndex;
	local oldMapId = GetWorldPos();
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		local nMapID, nX, nY = GetWorldPos();
		if nMapID == oldMapId then
			if npcName == QHT_SHENTAN_TABLE_6023[1][3] then
				CastState(QHT_BUFF_6023.tState[1][3], QHT_BUFF_6023.tState[1][4], QHT_BUFF_6023.tState[1][6] * 60 * 18, 1, QHT_BUFF_6023.tState[1][1], 1);
				SyncCustomState(1, QHT_BUFF_6023.tState[1][1], 0, format(QHT_BUFF_6023.tInfo[1],QHT_BUFF_6023.tInfo[2],format(QHT_BUFF_6023.tState[1][5],QHT_BUFF_6023.tState[1][4])));
				Talk(1,"",format("C∏c hπ nhÀn Æ≠Óc hi÷u qu∂ %s",format(QHT_BUFF_6023.tState[1][5],QHT_BUFF_6023.tState[1][4])));
				SetCurrentNpcSFX(npcIndex, 972, 2, 1, 8* 18);
			end
			if npcName == QHT_SHENTAN_TABLE_6023[2][3] then
				CastState(QHT_BUFF_6023.tState[2][3], QHT_BUFF_6023.tState[2][4], QHT_BUFF_6023.tState[2][6] * 60 * 18, 1, QHT_BUFF_6023.tState[2][1], 1);
				SyncCustomState(1, QHT_BUFF_6023.tState[2][1], 0, format(QHT_BUFF_6023.tInfo[1],QHT_BUFF_6023.tInfo[2],format(QHT_BUFF_6023.tState[2][5],QHT_BUFF_6023.tState[2][4])));
				Talk(1,"",format("C∏c hπ nhÀn Æ≠Óc hi÷u qu∂ %s",format(QHT_BUFF_6023.tState[2][5],QHT_BUFF_6023.tState[2][4])));
				SetCurrentNpcSFX(npcIndex, 972, 2, 1, 8* 18);
			end
			if npcName == QHT_SHENTAN_TABLE_6023[3][3] then
				CastState(QHT_BUFF_6023.tState[3][3], QHT_BUFF_6023.tState[3][4], QHT_BUFF_6023.tState[3][6] * 60 * 18, 1, QHT_BUFF_6023.tState[3][1], 1);
				SyncCustomState(1, QHT_BUFF_6023.tState[3][1], 0, format(QHT_BUFF_6023.tInfo[1],QHT_BUFF_6023.tInfo[2],format(QHT_BUFF_6023.tState[3][5],QHT_BUFF_6023.tState[3][4])));
				Talk(1,"",format("C∏c hπ nhÀn Æ≠Óc hi÷u qu∂ %s",format(QHT_BUFF_6023.tState[3][5],QHT_BUFF_6023.tState[3][4])));
				SetCurrentNpcSFX(npcIndex, 972, 2, 1, 8* 18);
			end
		end
	end
	PlayerIndex = oldPlayerIndex;
	SetNpcLifeTime(npcIndex, 0);
end