Include("\\settings\\static_script\\kf_newbattles\\functions.lua");
function OnUse(nItemIdx)
	local nCurMapID = GetWorldPos();
	if BT_GetData(PT_BATTLE_TYPE) == 0 then
		Msg2Player("D­îc phÈm chiÕn tr­êng chuyªn dông chØ cã thÓ sö dông trong chiÕn tr­êng");
		return 0;
	end;
	if abs(BT_GetData(PT_CURRANK)) < get_medicine_rank(nItemIdx) then
		Msg2Player("Qu©n hµm cña b¹n qu¸ thÊp, kh«ng thÓ sö dông d­îc phÈm nµy");
		return 0;
	end;
	return 1;
end;

function get_medicine_rank(nItemIdx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
	for i,v in tBattleMed do
		if v[2] == nGenre and v[3] == nDetail and v[4] == nParticular then
			return tBattleMed[i][7];
		end;
	end;
	for i,v in tPKMed do
		if v[2] == nGenre and v[3] == nDetail and v[4] == nParticular then
			return tPKMed[i][7];
		end;	
	end;
	return 0;
end;