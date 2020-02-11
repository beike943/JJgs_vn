Include("\\script\\online_activites\\silingmount\\string.lua");
Include("\\script\\lib\\globalfunctions.lua");

function OnPutinCheck(nParam,nItemIdx,nID1,nID2,nID3)
	-- 锁定的不让交
	if GetItemSpecialAttr(nItemIdx, "LOCK") > 0 then
		Talk(1,"",VET_TB_SILING_MSG[13]);
		return 0;
	end
	
	if ((nID1 == 0 and nID2 == 105 and nID3 >= 30001 and nID3 <= 30016) or
		(nID1 == 2 and nID2 == 1 and nID3 == 1001)) then
		return 1;
	else
		Talk(1,"",format(VET_TB_SILING_MSG[14],1,3));
	end
	return 0;
end

function OnPutinComplete(nParam)
	if (gf_Judge_Room_Weight(1, 0, "") ~= 1) then
		return 0;
	end
	
	local tbDelItemInfo = GetPutinItem();
	
	local nBaseItem = 0;
	local nMetiralCount = 0;
	local nBaseP = 0;
	for i=1,getn(tbDelItemInfo) do
		if (tbDelItemInfo[i][2] == 0 or tbDelItemInfo[i][3]  == 105 or tbDelItemInfo[i][4] >= 30001 and tbDelItemInfo[i][4] <= 30016) then
			nBaseItem = nBaseItem + 1;
			nBaseP = tbDelItemInfo[i][4];
		elseif(tbDelItemInfo[i][2] == 2 and tbDelItemInfo[i][3] == 1 and tbDelItemInfo[i][4] == 1001) then
			nMetiralCount = nMetiralCount + 1;
		end
	end
	
	local nBabyP = VET_TB_SILING_MOUNT_EVOLVE_MAP[nBaseP];
	if (nBaseItem ~= 1 or nMetiralCount ~= 3 or type(nBabyP) ~= "number") then
		Talk(1,"",format(VET_TB_SILING_MSG[14],1,3));
		return 0;
	end
	
	for i=1,getn(tbDelItemInfo) do
		local nCount = 1;
		if (tbDelItemInfo[i][2] == 0 or tbDelItemInfo[i][3]  == 105 or tbDelItemInfo[i][4] >= 30001 and tbDelItemInfo[i][4] <= 30016) then
			nCount = -1; --如果是坐骑的话 用-1 不然调用 DelItemByIndex 扣的是耐久
		end
		if (DelItemByIndex(tbDelItemInfo[i][1],nCount) ~= 1) then
			Talk(1,"",format(VET_TB_SILING_MSG[14],1,3));
			return 0;
		end
	end
	
	local strBaseMountName = GetItemName(0,105,nBaseP);
	local strBabyMountName = GetItemName(0,105,nBabyP);
	
	gf_AddItemEx2({0,105,nBabyP,1,1,-1,-1,-1,-1,-1,-1}, strBabyMountName, VET_STR_SILING_LOG_TITLE, VET_TB_SILING_LOG_ACTION[3], 30 * 24 * 3600, 1);
	
	Talk(1,"",format(VET_TB_SILING_MSG[15],strBaseMountName,strBabyMountName));
	
	return 1;
end