Include("\\script\\online_activites\\shimen_tier4\\string.lua")

function VET_Tier4AddCangJianAwardNpc(nStage, nPosNpcIndex)
	if (gf_CheckEventDateEx(VET_TIER4_ACTIVITY_ID) ~= 1) then
		return
	end
	
	local strNpcName = GetNpcName(nPosNpcIndex);
	if (VET_TB_TIER4_BOSS_NAME[strNpcName] == nil) then
		return
	end
	
	local nRate = VET_TB_TIER4_DROP_RATE[nStage];
	if (type(nRate) ~= "number") then
		return
	end
	
	local nRand = random(1,10000);
	if (nRand <= nRate) then
		local nWordIdx, nX, nY = GetNpcWorldPos(nPosNpcIndex);
		nX = nX+2;
		nY = nY+2;
		local nNpcIndex = CreateNpc(VET_TB_TIER4_NPC_TEMPLATE[1], VET_TB_TIER4_NPC_NAME[1], nWordIdx, nX, nY)
		SetNpcScript(nNpcIndex, VET_TB_TIER4_SCRIPT_NAME[1]);
		-- 用到的NPC属性，清零先
		local tbNpcAttrIdx = {4,5} --分别记录第几关及DiceId
		for i, idx in tbNpcAttrIdx do
			local nState = GetUnitCurStates(nNpcIndex, idx);
			AddUnitStates(nNpcIndex, idx, (0 - nState));
		end
		
		AddUnitStates(nNpcIndex, 4, nStage);
	end
end

function VET_Tier4GiveKillerHallAward(nType)
	if (gf_CheckEventDateEx(VET_TIER4_ACTIVITY_ID) ~= 1) then
		return
	end
	local tbAward = VET_TB_TIER4_KILLER_HALL_AWARD[nType];
	if (tbAward ~= nil) then
		gf_EventGiveRandAward(tbAward, 1000000, 1, VET_STR_TIER4_LOG_TITLE, format(VET_TB_TIER4_LOG_ACTION[2],nType));
	end
end

function VET_Tier4ExchangeXiuWei_Dlg()
	local nHave = tonumber(GetItemCount(2, 1, 30284));
	AskClientForNumber(VET_TB_TIER4_FUNC_NAME[2], 1, nHave, VET_TB_TIER4_NPC_DLG[5]);
end

function VET_Tier4ExchangeXuanJin_Dlg()
	local nHave = tonumber(GetItemCount(2, 1, 30284));
	AskClientForNumber(VET_TB_TIER4_FUNC_NAME[3], 1, floor(nHave/99), format(VET_TB_TIER4_NPC_DLG[7],VET_TB_TIER4_ITEM_NAME[2]));
end

function VET_Tier4ExchangeXiuWei_Confirm(nCount)
	if DelItem(2, 1, 30284, nCount) == 1 then
		ModifyPopur(nCount*15);
		Msg2Player(format(VET_TB_TIER4_MSG[2],nCount*15));
		gf_WriteLogEx(VET_STR_TIER4_LOG_TITLE, format(VET_TB_TIER4_LOG_ACTION[3],VET_TB_TIER4_ITEM_NAME[1],VET_TB_TIER4_ITEM_NAME[3],nCount,nCount*15), 1, GetItemName(2, 1, 30284), format("(%d,%d,%d,%d)",2,1,30284,nCount));
	else
		Talk(1,"",format(VET_TB_TIER4_NPC_DLG[6],VET_TB_TIER4_ITEM_NAME[1],nCount));
	end
end

function VET_Tier4ExchangeXuanJin_Confirm(nCount)
	if (gf_JudgeRoomWeight(nCount,0,"") ~= 1) then
		return
	end
	if DelItem(2, 1, 30284, nCount*99) == 1 then
		gf_AddItemEx2({2, 1, 30285,nCount}, VET_TB_TIER4_ITEM_NAME[2], VET_STR_TIER4_LOG_TITLE, format(VET_TB_TIER4_LOG_ACTION[3],VET_TB_TIER4_ITEM_NAME[1],VET_TB_TIER4_ITEM_NAME[2],nCount*99,nCount), 0, 1);
	else
		Talk(1,"",format(VET_TB_TIER4_NPC_DLG[6],VET_TB_TIER4_ITEM_NAME[1],nCount*99));
	end
end

function VET_Tier4DailyPersonalTaskAward(bBonus)
	local nCount = 1;
	if (bBonus == 1) then
		nCount = nCount * 2;
	end
	gf_AddItemEx2({2, 1, 30284,nCount}, VET_TB_TIER4_ITEM_NAME[1], VET_STR_TIER4_LOG_TITLE, format(VET_TB_TIER4_LOG_ACTION[4],bBonus or 0), 0, 1);
end

function VET_Tier4DailyTeamTaskAward(bBonus)
	local nCount = 1;
	if (bBonus == 1) then
		nCount = nCount * 2;
	end
	gf_AddItemEx2({2, 1, 30284,nCount}, VET_TB_TIER4_ITEM_NAME[1], VET_STR_TIER4_LOG_TITLE, format(VET_TB_TIER4_LOG_ACTION[5],bBonus or 0), 0, 1);
end

function VET_Tier4ExchaneEquip_Dlg()
	local nRoute = GetPlayerRoute();
	local tbRoute = VET_TB_TIER4_EXCHANGE_EQUIP[1][nRoute];
	if (type(tbRoute) ~= "table") then
		Talk(1,"",VET_TB_TIER4_NPC_DLG[21]);
		return
	end
	
	local strTitle = VET_TB_TIER4_NPC_DLG[13];
	local tbOpt = 
	{
		format("%s/#%s",VET_TB_TIER4_NPC_DLG[14],"VET_Tier4ExchaneEquipSel_Dlg(1)"),
		format("%s/#%s",VET_TB_TIER4_NPC_DLG[15],"VET_Tier4ExchaneEquipSel_Dlg(2)"),
		format("%s/#%s",VET_TB_TIER4_NPC_DLG[16],"VET_Tier4ExchaneEquipSel_Dlg(3)"),
		format("%s/#%s",VET_TB_TIER4_NPC_DLG[17],"VET_Tier4ExchaneEquipSel_Dlg(4)"),
		format("%s/#%s",VET_TB_TIER4_NPC_DLG[18],"VET_Tier4ExchaneEquipSel_Dlg(5)"),
		format("%s/#%s",VET_TB_TIER4_NPC_DLG[19],"VET_Tier4ExchaneEquipSel_Dlg(6)"),
		format("%s/%s",VET_TB_TIER4_NPC_DLG[1],"gf_DoNothing"),
	};
	Say(strTitle, getn(tbOpt), tbOpt);
end

function VET_Tier4ExchaneEquipSel_Dlg(nType)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local tbRoute = VET_TB_TIER4_EXCHANGE_EQUIP[nType][nRoute];
	local tbCost = VET_TB_TIER4_EXCHANGE_COST;
	
	if (type(tbRoute) ~= "table" or getn(tbRoute) == 0 or type(tbCost) ~= "table") then
		Talk(1,"",VET_TB_TIER4_NPC_DLG[20]);
		return
	end
	
	local tbItemList = VET_TB_TIER4_EXCHANGE_EQUIP[nType][nRoute][nBody];
	
	if (type(tbItemList) ~= "table" or getn(tbItemList) == 0) then
		Talk(1,"",VET_TB_TIER4_NPC_DLG[20]);
		return
	end
	
	local strCost = "";
	for i = 1,getn(tbCost) do
		strCost = strCost .. format(VET_TB_TIER4_NPC_DLG[23],tbCost[i][5] or 0,tbCost[i][1]);
	end
	
	strCost = strCost .. format(VET_TB_TIER4_NPC_DLG[24],2000,VET_TB_TIER4_ITEM_NAME[5]);
	strCost = strCost .. format(VET_TB_TIER4_NPC_DLG[24],2000,VET_TB_TIER4_ITEM_NAME[6]);

	local strTitle = format(VET_TB_TIER4_NPC_DLG[22],strCost);
	local tbOpt = {};
	for i=1,getn(tbItemList) do
		tinsert(tbOpt,format("%s/#%s",GetItemName(tbItemList[i][1],tbItemList[i][2],tbItemList[i][3]),format("VET_Tier4ExchaneEquip(%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d)",tbItemList[i][1],tbItemList[i][2],tbItemList[i][3],tbItemList[i][4] or 1,tbItemList[i][5] or 1,tbItemList[i][6] or -1,tbItemList[i][7] or -1,tbItemList[i][8] or -1,tbItemList[i][9] or -1,tbItemList[i][10] or -1,tbItemList[i][11] or -1)))
	end
	tinsert(tbOpt,format("%s/%s",VET_TB_TIER4_NPC_DLG[1],"gf_DoNothing"))
	Say(strTitle, getn(tbOpt), tbOpt);
end

function VET_Tier4ExchaneEquip(nG,nD,nP,nCount,bIdentify,nParam1,nParam2,nParam3,nParam4,nParam5,nParam6)
	if (gf_JudgeRoomWeight(1,0,"") ~= 1) then
		return
	end
	
	local tbCost = VET_TB_TIER4_EXCHANGE_COST;
	local strCost = "";
	for i = 1,getn(tbCost) do
		strCost = strCost .. format(VET_TB_TIER4_NPC_DLG[23],tbCost[i][5] or 0,tbCost[i][1]);
	end
	
	strCost = strCost .. format(VET_TB_TIER4_NPC_DLG[24],2000,VET_TB_TIER4_ITEM_NAME[5]);
	strCost = strCost .. format(VET_TB_TIER4_NPC_DLG[24],2000,VET_TB_TIER4_ITEM_NAME[6]);

	local strTitle = format(VET_TB_TIER4_NPC_DLG[25], GetItemName(nG,nD,nP), strCost);
	
	local nMoney = GetCash();
	local nShiMen = GetTask(336);
	
	if (nMoney < 20000000 or nShiMen < 2000) then
		Talk(1,"",strTitle);
		return
	end
	
	for i=1,getn(tbCost) do
		if (GetItemCount(tbCost[i][2],tbCost[i][3],tbCost[i][4]) < tbCost[i][5]) then
			Talk(1,"",strTitle);
			return
		end
	end
	
	for i=1,getn(tbCost) do
		if (DelItem(tbCost[i][2],tbCost[i][3],tbCost[i][4], tbCost[i][5]) ~= 1) then
			Talk(1,"",strTitle);
			return
		end
	end
	
	Pay(20000000);
	SetTask(336, nShiMen - 2000);
	
	gf_AddItemEx2({nG,nD,nP,nCount,bIdentify,nParam1,nParam2,nParam3,nParam4,nParam5,nParam6}, GetItemName(nG,nD,nP), VET_STR_TIER4_LOG_TITLE, format(VET_TB_TIER4_LOG_ACTION[6],VET_TB_TIER4_ITEM_NAME[4]), 0, 1);
end

function VET_Tier4Help_Dlg()
	local strTitle = format(VET_TB_TIER4_NPC_DLG[12],VET_TB_TIER4_ITEM_NAME[1]);
	local tbOpt = 
	{
		format("%s/%s",VET_TB_TIER4_NPC_DLG[1],"gf_DoNothing"),
	};
	Say(strTitle, getn(tbOpt), tbOpt);
end

function VET_Tier4ShowEquip()
	local nRoute = GetPlayerRoute();
	if (nRoute == 0) then
		Talk(1,"",VET_TB_TIER4_NPC_DLG[21]);
		return
	end
	local nFaction = GetPlayerFaction();
	local nShopId = VET_TB_TIER4_SHOW_EQUIP_SHOP[nFaction];
	if (type(nShopId) ~= "number") then
		Talk(1,"",VET_TB_TIER4_NPC_DLG[20]);
		return
	end
	
	Sale(nShopId,100,1);
end
