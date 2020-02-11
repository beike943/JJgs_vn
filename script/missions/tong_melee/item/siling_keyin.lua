--ÕÙ»½¶ÓÓÑ
Include("\\script\\missions\\tong_melee\\tm_head.lua")

function OnUse(nItem)
	if tm_IsTongMeleeOpen() ~= 1 then
		return 0;
	end
	local nMapId, nMapTemplteId = SubWorldIdx2ID(SubWorld);
	if nMapTemplteId ~= 6074 then
		Talk(1,"","B¶n ®å nµy kh«ng thÓ sö dông");
		return 0;
	end
	DoWait(117, 118, 3);
	SetItemUseLapse(nItem, 2*60*18);
end

function dowait_cb()
	local sName = GetName();
	local nMapId, nX, nY = GetWorldPos();
	local oldPlayerIndex = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex ~= oldPlayerIndex then
			SetTaskTemp(TMP_TASK_TONG_MELEE_X, nX);
			SetTaskTemp(TMP_TASK_TONG_MELEE_Y, nY);
			SetPlayerScript("\\script\\missions\\tong_melee\\item\\siling_keyin.lua");
			Say(format("%s [ThÇn Thó Khan Hé Gi¶] triÖu håi ng­¬i! ", sName), 2, "H­ëng øng chiªu gäi/ensure", "Ta rÊt bËn/nothing");
		end
	end
	PlayerIndex = oldPlayerIndex;
end

function ensure() 
	SetPos(GetTaskTemp(TMP_TASK_TONG_MELEE_X), GetTaskTemp(TMP_TASK_TONG_MELEE_Y));
	Msg2Player("Ng­¬i h­ëng øng triÖu gäi ThÇn Thó Khan Hé Gi¶!");
end

function nothing()
end