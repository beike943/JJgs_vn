Include("\\script\\online\\qianhe_tower\\qht_head.lua")

function main()
	local tbSay = {};
	local nMapID,nX,nY = GetWorldPos();
	if nMapID == 6021 then
		tinsert(tbSay,"T¹i h¹ muèn ®i Thiªn TÇm HuyÔn C¶nh tÇng 2/#qht_ds_goto_qht(2)");
	end
	if nMapID == 6022 then
		tinsert(tbSay,"T¹i h¹ muèn ®i Thiªn TÇm HuyÔn C¶nh tÇng 1/#qht_ds_goto_qht(1)");
		tinsert(tbSay,"T¹i h¹ muèn ®i Thiªn TÇm HuyÔn C¶nh tÇng 3/#qht_ds_goto_qht(3)");
	end
	if nMapID == 6023 then
		tinsert(tbSay,"T¹i h¹ muèn ®i Thiªn TÇm HuyÔn C¶nh tÇng 2/#qht_ds_goto_qht(2)");
	end
	tinsert(tbSay,"Ta muèn rêi khái n¬i nµy/leave_qht");
	tinsert(tbSay,"T¹i h¹ chØ xem qua th«i/nothing");
	Say("<color=green> §¹i Sø ho¹t ®éng :<color> §¹i héi vâ l©mTrung ViÖt s¾p diÔn ra, më ho¹t ®éng Thiªn TÇm HuyÔn C¶nh cæ ®éng cho ng­êi ch¬i.",getn(tbSay),tbSay);
end

function leave_qht()
--	if GetTeamSize() ~= 0 then
--		LeaveTeam();
--	end
	local nMapIndex = QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.InPosFlag);
	if QHT_OUT_POS[nMapIndex] ~= nil then
		NewWorld(nMapIndex, QHT_OUT_POS[nMapIndex][1], QHT_OUT_POS[nMapIndex][2]);
	else
		NewWorld(200, QHT_OUT_POS[200][1], QHT_OUT_POS[200][2]);
	end
	SetFightState(0);
	for i = 9926, 9928 do
		RemoveState(i);
	end
	QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.InPosFlag,0);
	SetPlayerScript("\\script\\online\\qianhe_tower\\qht_playerdeath.lua");
	SetDeathPunish(1);
end