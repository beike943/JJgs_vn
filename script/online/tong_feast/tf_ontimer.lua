Include("\\script\\online\\tong_feast\\tf_head.lua")

--5ÃëÃ¿´Î
function OnTimer()
	local nStep = tf_GetTimerStep();
	if nStep > 180 then
		Msg2Player("YÕn TiÖc bang héi kÕt thóc!");
		RemoveTrigger(GetTrigger(1533*2));
		return 0;
	end
	local npcMap, npcX, npcY = GetNpcWorldPos(tf_GetTcNpcIndex());
	local pMap, pX, pY = GetWorldPos();
	if npcMap ~= pMap then
		Msg2Player("YÕn TiÖc bang héi kÕt thóc!");
		RemoveTrigger(GetTrigger(1533*2));
		return 0;
	end
	local pMap, pX, pY = GetWorldPos();
	if (npcX - pX)*(npcX - pX) + (npcY - pY)*(npcY - pY) > 18*18 then
		Msg2Player("Kho¶ng c¸ch víi bµn tiÖc qu¸ xa, kh«ng thÓ nhËn th­ëng!");
		return 0;
	end
	local nKind = tf_GetDinnerKind();
	local tTimeStarmp = {
		[0] = {12, 120},
		[1] = {9, 120},
	}
	local nIsUseTw = 0;
	if tf_GetIsUseTw() ~= 0 then
		nIsUseTw = 1;
	end
	if mod(nStep, tTimeStarmp[nIsUseTw][1]) == 0 then
		ModifyExp(TF_FEAST_AWARD[nKind][1]);
		AwardGenuineQi(TF_FEAST_AWARD[nKind][2]);
		ModifyPopur(TF_FEAST_AWARD[nKind][3]);
		if GetFreeItemRoom() > 0 then
			AddItem(TF_ITEM_TONG_TOKEN_CHIP[1], TF_ITEM_TONG_TOKEN_CHIP[2], TF_ITEM_TONG_TOKEN_CHIP[3], TF_FEAST_AWARD[nKind][4]);
		end
	end
	if mod(nStep, tTimeStarmp[nIsUseTw][2]) == 0 then
		tf_AddBuff();
	end
	tf_SetTimerStep(nStep + 1);
end