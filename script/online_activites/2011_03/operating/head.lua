Include("\\script\\online_activites\\2011_03\\operating\\strings.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\misc\\taskmanager.lua");

VET_201103_OPERATING_ACTIVITY_ID = 31;

VET_201103_OPERATING_ADV_MAX_USE_NUM = 500;
VET_201103_OPERATING_NOR_MAX_USE_NUM = 1500;

--TaskGroup
VET_201103_OPERATING_TaskGroup = TaskManager:Create(1, 2);
VET_201103_OPERATING_TaskGroup.TSK_FINAL_AWARD = 1;
VET_201103_OPERATING_TaskGroup.TSK_USE_ADV_COUNT = 2;
VET_201103_OPERATING_TaskGroup.TSK_USE_NOR_COUNT = 3;
VET_201103_OPERATING_TaskGroup.TSK_AWARD_MODE = 4;

function VET_201103_Operating_GivePlayerLoginItem()	
	local nDate = tonumber(date("%y%m%d"))
	if nDate < 110401 or nDate > 110417 then
		return 0;
	end
	
	if (type(VET_TB_201103_OPERATING_ITEM_LOGINGIVE_LIST) == "table") then
		for i=1,getn(VET_TB_201103_OPERATING_ITEM_LOGINGIVE_LIST) do
			if (GetItemCount(VET_TB_201103_OPERATING_ITEM_LOGINGIVE_LIST[i][2], VET_TB_201103_OPERATING_ITEM_LOGINGIVE_LIST[i][3], VET_TB_201103_OPERATING_ITEM_LOGINGIVE_LIST[i][4]) < 1) then
		    		gf_AddItemEx2({VET_TB_201103_OPERATING_ITEM_LOGINGIVE_LIST[i][2], VET_TB_201103_OPERATING_ITEM_LOGINGIVE_LIST[i][3], VET_TB_201103_OPERATING_ITEM_LOGINGIVE_LIST[i][4], 1}, VET_TB_201103_OPERATING_ITEM_LOGINGIVE_LIST[i][1], VET_STR_201103_OPERATING_LOG_TITLE, VET_TB_201103_OPERATING_LOG_ACTION_LIST[1], 0, 1);
			end
		end
	end
end

function VET_201103_Operating_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
	local nDate = tonumber(date("%y%m%d"))
	if nDate < 110401 or nDate > 110417 then
		return 0;
	end
	
	szSayHead = format("%s<enter>%s",szSayHead,format(VET_TB_201103_OPERATING_DLG[1],VET_TB_201103_OPERATING_DLG[2]));

	tinsert(tbSayDialog,  format("%s/%s", format(VET_TB_201103_OPERATING_DLG[3], VET_TB_201103_OPERATING_ITEM_TITLE[1], 5, VET_TB_201103_OPERATING_ITEM_TITLE[3], 2, VET_TB_201103_OPERATING_ITEM_TITLE[4]), "VET_201103_Operating_ExchangeZongzi1"));
	tinsert(tbSayDialog,  format("%s/%s", format(VET_TB_201103_OPERATING_DLG[3], VET_TB_201103_OPERATING_ITEM_TITLE[1], 5, VET_TB_201103_OPERATING_ITEM_TITLE[3], 1, VET_TB_201103_OPERATING_ITEM_TITLE[7]), "VET_201103_Operating_ExchangeZongzi2"));
	tinsert(tbSayDialog,  format("%s/#%s", format(VET_TB_201103_OPERATING_DLG[3], VET_TB_201103_OPERATING_ITEM_TITLE[2], 1, VET_TB_201103_OPERATING_ITEM_TITLE[1], 1, VET_TB_201103_OPERATING_ITEM_TITLE[5]), "VET_201103_Operating_ExchangeAdvZongzi()"));
	tinsert(tbSayDialog, format("%s/%s",VET_TB_201103_OPERATING_DLG[4],"VET_201103_Operating_GetFinalAwardDlg"));
	tinsert(tbSayDialog, format("%s/%s",VET_TB_201103_OPERATING_DLG[5],"VET_201103_Operating_SetAwardModeDlg"));
	tinsert(tbSayDialog, format("%s/%s",format(VET_TB_201103_OPERATING_DLG[6], 100, VET_TB_201103_OPERATING_ITEM_TITLE[4], 1, VET_TB_201103_OPERATING_ITEM_TITLE[6]),"VET_201103_Operating_ExchangeXu"));
	
	return tbSayDialog, szSayHead;
end

function VET_201103_Operating_ExchangeZongzi1()
	AskClientForNumber("ConfirmMassExchangeZongzi", 1, 999, "Sè B¸nh Ch­ng?")
end

function ConfirmMassExchangeZongzi(nCount)
    if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        return 0;
    end
    local tbMaterial = VET_TB_201103_OPERATING_EXCHANGE_MATERIAL[1]
    
    if GetItemCount(tbMaterial[1][2], 
                    tbMaterial[1][3], 
                    tbMaterial[1][4]) < (5 * nCount )
        or GetItemCount(tbMaterial[2][2], 
                        tbMaterial[2][3], 
                        tbMaterial[2][4]) < (2 * nCount)
    then
        Talk(1, "", VET_TB_201103_OPERATING_DLG[7]);
        return 0;
        
    elseif DelItem(tbMaterial[1][2],  
                   tbMaterial[1][3], 
                   tbMaterial[1][4], 
                   5 * nCount) 
        and DelItem(tbMaterial[2][2], 
                    tbMaterial[2][3], 
                    tbMaterial[2][4], 
                    2 * nCount) == 1
    then 
        gf_AddItemEx2({2,1,30293, nCount},
                        VET_TB_201103_OPERATING_ITEM_TITLE[1],
                        VET_STR_201103_OPERATING_LOG_TITLE, 
                        VET_TB_201103_OPERATING_LOG_ACTION_LIST[6],
                        0, 
                        1)
    end
    SelectSay()
end

function VET_201103_Operating_ExchangeZongzi2()
	if gf_Judge_Room_Weight(1, 0, "") ~= 1 then
		return 0;
	end
	local tbMaterial = VET_TB_201103_OPERATING_EXCHANGE_MATERIAL[2];
	if (tbMaterial == nil) then
		return 0;
	end
	
	for i=1,getn(tbMaterial) do
		if (GetItemCount(tbMaterial[i][2], tbMaterial[i][3], tbMaterial[i][4]) < tbMaterial[i][5]) then
			Talk(1, "", VET_TB_201103_OPERATING_DLG[7]);
			return 0;
		end
	end

	for i=1,getn(tbMaterial) do
		if (DelItem(tbMaterial[i][2], tbMaterial[i][3], tbMaterial[i][4], tbMaterial[i][5]) ~= 1) then
			Talk(1, "", VET_TB_201103_OPERATING_DLG[7]);
			return 0;
		end
	end
	
	gf_AddItemEx2({2,1,30293, 1},VET_TB_201103_OPERATING_ITEM_TITLE[1],VET_STR_201103_OPERATING_LOG_TITLE,format(VET_TB_201103_OPERATING_LOG_ACTION_LIST[2],VET_TB_201103_OPERATING_ITEM_TITLE[1]),0,1)
	SelectSay()
end

function VET_201103_Operating_ExchangeAdvZongzi()
	if gf_Judge_Room_Weight(1, 0, "") ~= 1 then
		return 0;
	end
	local tbMaterial = VET_TB_201103_OPERATING_EXCHANGE_ADV_MATERIAL;
	if (tbMaterial == nil) then
		return 0;
	end
	
	for i=1,getn(tbMaterial) do
		if (GetItemCount(tbMaterial[i][2], tbMaterial[i][3], tbMaterial[i][4]) < tbMaterial[i][5]) then
			Talk(1, "", VET_TB_201103_OPERATING_DLG[7]);
			return 0;
		end
	end

	for i=1,getn(tbMaterial) do
		if (DelItem(tbMaterial[i][2], tbMaterial[i][3], tbMaterial[i][4], tbMaterial[i][5]) ~= 1) then
			Talk(1, "", VET_TB_201103_OPERATING_DLG[7]);
			return 0;
		end
	end
	
	gf_AddItemEx2({2,1,30294, 1},VET_TB_201103_OPERATING_ITEM_TITLE[2],VET_STR_201103_OPERATING_LOG_TITLE,format(VET_TB_201103_OPERATING_LOG_ACTION_LIST[2],VET_TB_201103_OPERATING_ITEM_TITLE[2]),0,1);
	SelectSay()
end

function VET_201103_Operating_GetFinalAwardDlg()
	if gf_Judge_Room_Weight(1, 0, "") ~= 1 then
		return 0;
	end
	if VET_201103_OPERATING_TaskGroup:GetTask(VET_201103_OPERATING_TaskGroup.TSK_FINAL_AWARD) == 1 then
		Talk(1, "", VET_TB_201103_OPERATING_DLG[14])
		return 0;
	end
	if VET_201103_OPERATING_TaskGroup:GetTask(VET_201103_OPERATING_TaskGroup.TSK_USE_NOR_COUNT) < VET_201103_OPERATING_NOR_MAX_USE_NUM then 
		Talk(1, "", format(VET_TB_201103_OPERATING_DLG[8], VET_TB_201103_OPERATING_ITEM_TITLE[1], VET_201103_OPERATING_TaskGroup:GetTask(VET_201103_OPERATING_TaskGroup.TSK_USE_NOR_COUNT), VET_201103_OPERATING_NOR_MAX_USE_NUM));
		return 0;
	else
		local tbDialog = 
		{
			format("%s/#%s", VET_TB_201103_OPERATING_DLG[9],"VET_201103_Operating_GetFinalAward(1)"),
			format("%s/#%s", VET_TB_201103_OPERATING_DLG[10],"VET_201103_Operating_GetFinalAward(2)"),
			format("%s/#%s", VET_TB_201103_OPERATING_DLG[11],"VET_201103_Operating_GetFinalAward(3)"),
			format("%s/%s", VET_TB_201103_OPERATING_DLG[12],"gf_DoNothing"),
		};
		Say(VET_TB_201103_OPERATING_DLG[13], getn(tbDialog), tbDialog);
	end
	
	return 1;
end

function VET_201103_Operating_GetFinalAward(nType)
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if gf_Judge_Room_Weight(1, 100, "") ~= 1 then
		return 0;
	end
	
	if VET_201103_OPERATING_TaskGroup:GetTask(VET_201103_OPERATING_TaskGroup.TSK_FINAL_AWARD) == 1 then
		Talk(1, "", VET_TB_201103_OPERATING_DLG[14]);
		return 0;
	end
	
	if nType == 1 then
		gf_EventGiveCustomAward(1, 20000000, 1, VET_STR_201103_OPERATING_LOG_TITLE, VET_TB_201103_OPERATING_LOG_ACTION_LIST[3]);
	elseif nType == 2 then
		if nCurPetLevel < 1 then
			Talk(1,"","§¹i hiÖp ch­a cã B¹n §ång Hµnh, kh«ng thÓ nhËn phÇn th­ëng nµy!")			
			return 0
	     end
   	     SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (20 * 100))
	     Msg2Player("B¹n nhËn ®­îc 20 §iÓm N©ng CÊp B¹n §ång Hµnh")
	elseif nType == 3 then
		if nCurPetLevel < 2 then
			Talk(1,"","B¹n §ång Hµnh ®¼ng cÊp 2 trë lªn míi cã thÓ nhËn phÇn th­ëng nµy!")
			return 0
	     end
	     Pet_AddGP(1)
	     Msg2Player("B¹n nhËn ®­îc 1 §iÓm Linh Lùc B¹n §ång Hµnh")
	end
	
	VET_201103_OPERATING_TaskGroup:SetTask(VET_201103_OPERATING_TaskGroup.TSK_FINAL_AWARD,1)
	gf_EventGiveRandAward(VET_TB_201103_OPERATING_FINAL_AWARD, 1000, 1, VET_STR_201103_OPERATING_LOG_TITLE, format(VET_TB_201103_OPERATING_LOG_ACTION_LIST[7], nType)) 
end

function VET_201103_Operating_GetFYAward()
	gf_EventGiveRandAward(VET_TB_201103_OPERATING_FY_AWARD, 10000, 1, VET_STR_201103_OPERATING_LOG_TITLE, VET_TB_201103_OPERATING_LOG_ACTION_LIST[3]);
end

function VET_201103_Operating_GetShimenWeaponAward()
	gf_EventGiveRandAward(VET_TB_201103_OPERATING_SHIMEN_WEAPON_AWARD, 1000, 1, VET_STR_201103_OPERATING_LOG_TITLE, VET_TB_201103_OPERATING_LOG_ACTION_LIST[3]);
end

function VET_201103_Operating_GetShimenEquipAward()
	gf_EventGiveRandAward(VET_TB_201103_OPERATING_SHIMEN_EQUIP_AWARD, 1000, 1, VET_STR_201103_OPERATING_LOG_TITLE, VET_TB_201103_OPERATING_LOG_ACTION_LIST[3]);
end

--½±ÀøÄ£Ê½£¬1ÊÇ»ñµÃÎïÆ·£¬2ÊÇ²»ÒªÎïÆ·
function VET_201103_Operating_SetAwardModeDlg()
	local tbDialog = 
	{
		format("%s/#%s", VET_TB_201103_OPERATING_DLG[15],"VET_201103_Operating_SetAwardMode(1)"),
		format("%s/#%s", VET_TB_201103_OPERATING_DLG[16],"VET_201103_Operating_SetAwardMode(2)"),
		format("%s/%s", VET_TB_201103_OPERATING_DLG[12],"gf_DoNothing"),
	}
	Say(VET_TB_201103_OPERATING_DLG[17], getn(tbDialog), tbDialog);
end

function VET_201103_Operating_SetAwardMode(nType)
	VET_201103_OPERATING_TaskGroup:SetTask(VET_201103_OPERATING_TaskGroup.TSK_AWARD_MODE,nType)
	Talk(1, "", format(VET_TB_201103_OPERATING_DLG[17+nType],format("%s,%s",VET_TB_201103_OPERATING_ITEM_TITLE[1],VET_TB_201103_OPERATING_ITEM_TITLE[2]), VET_TB_201103_OPERATING_DLG[21]));
end

function VET_201103_Operating_ExchangeXu()
	if gf_Judge_Room_Weight(1, 0, "") ~= 1 then
		return 0;
	end
	
	if (GetItemCount(2, 1, 199) < 1) then
		Talk(1, "", format(VET_TB_201103_OPERATING_DLG[20],VET_TB_201103_OPERATING_ITEM_TITLE[5]));
		return 0;
	elseif (DelItem(2, 1, 199, 1) == 1)then 
		gf_AddItemEx2({2, 1, 30230, 100}, VET_TB_201103_OPERATING_ITEM_TITLE[3],VET_STR_201103_OPERATING_LOG_TITLE, format(VET_TB_201103_OPERATING_LOG_ACTION_LIST[2],VET_TB_201103_OPERATING_ITEM_TITLE[4]),0,1);
	end
	return 1;
end

function VET_201103_Operating_PlantBigTreeAward()
	local nDate = tonumber(date("%y%m%d"))
	if nDate < 110401 or nDate > 110417 then
		return 0;
	end
	gf_GivePlantBigTreeAward({2,1,30290,60},VET_TB_201103_OPERATING_ITEM_TITLE[2],VET_STR_201103_OPERATING_LOG_TITLE);
	return 1;
end

function VET_201103_Operating_PlantSmallTreeAward()
	local nDate = tonumber(date("%y%m%d"))
	if nDate < 110401 or nDate > 110417 then
		return 0;
	end
	gf_GivePlantSmallTreeAward({2,1,30290,50},VET_TB_201103_OPERATING_ITEM_TITLE[2],VET_STR_201103_OPERATING_LOG_TITLE);
	return 1;
end

function VET_201103_Operating_SeedbagAward()
	local nDate = tonumber(date("%y%m%d"))
	if nDate < 110401 or nDate > 110417 then
		return 0;
	end
	gf_GiveSeedBagAward({2,1,30290,150},VET_TB_201103_OPERATING_ITEM_TITLE[2],VET_STR_201103_OPERATING_LOG_TITLE);
	return 1;
end

function VET_201103_Operating_DailyTaskPersonalAward()
	local nDate = tonumber(date("%y%m%d"))
	if nDate < 110401 or nDate > 110417 then
		return 0;
	end
	gf_GiveDailyTaskPersonalAward({2,1,30290,30},VET_TB_201103_OPERATING_ITEM_TITLE[3],VET_STR_201103_OPERATING_LOG_TITLE);
	return 1;
end

function VET_201103_Operating_DailyTaskTeamAward()
	local nDate = tonumber(date("%y%m%d"))
	if nDate < 110401 or nDate > 110417 then
		return 0;
	end
	gf_GiveDailyTaskTeamAward({2,1,30290,30},VET_TB_201103_OPERATING_ITEM_TITLE[3],VET_STR_201103_OPERATING_LOG_TITLE);
	return 1;
end

function VET_201103_Operating_UseZongzi(nItemIndex,nType)
	local nAwardMode = VET_201103_OPERATING_TaskGroup:GetTask(VET_201103_OPERATING_TaskGroup.TSK_AWARD_MODE);
	if  nAwardMode == 0 then
		VET_201103_Operating_SetAwardModeDlg()
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10 , "") ~= 1 then 
		return 0;
	end
	
	local nCurCount = VET_201103_OPERATING_TaskGroup:GetTask(VET_201103_OPERATING_TaskGroup.TSK_USE_NOR_COUNT);
	local nMaxCount = VET_201103_OPERATING_NOR_MAX_USE_NUM;
	local szItemName = VET_TB_201103_OPERATING_ITEM_TITLE[1];
	local nTaskId = VET_201103_OPERATING_TaskGroup.TSK_USE_NOR_COUNT;
	local nExp = 200000;
	local nExp1 = 250000;
	
	if (nType == 1) then
		nCurCount = VET_201103_OPERATING_TaskGroup:GetTask(VET_201103_OPERATING_TaskGroup.TSK_USE_ADV_COUNT);
		nMaxCount = VET_201103_OPERATING_ADV_MAX_USE_NUM;
		szItemName = VET_TB_201103_OPERATING_ITEM_TITLE[2];
		nTaskId = VET_201103_OPERATING_TaskGroup.TSK_USE_ADV_COUNT;
		nExp = 250000;
		nExp1 = 312500;
	end
	
	if nCurCount >= nMaxCount then
		Talk(1, "", format(VET_TB_201103_OPERATING_DLG[8], szItemName,nCurCount, nMaxCount));
		return 0;
	end
	
	if DelItemByIndex(nItemIndex, 1) == 1 then
		VET_201103_OPERATING_TaskGroup:SetTask(nTaskId,nCurCount+1);
		if (nAwardMode == 1) then
			gf_EventGiveCustomAward(1, nExp1, 1, VET_STR_201103_OPERATING_LOG_TITLE, format(VET_TB_201103_OPERATING_LOG_ACTION_LIST[4],szItemName));
		else
			gf_EventGiveCustomAward(1, nExp, 1, VET_STR_201103_OPERATING_LOG_TITLE, format(VET_TB_201103_OPERATING_LOG_ACTION_LIST[4],szItemName));
			if mod(nCurCount+1, 20) == 0 then
				gf_EventGiveRandAward(VET_TB_201103_OPERATING_SP_AWARD, 10000, 1, VET_STR_201103_OPERATING_LOG_TITLE, format(VET_TB_201103_OPERATING_LOG_ACTION_LIST[5],nCurCount+1,szItemName))
			else
				gf_EventGiveRandAward(VET_TB_201103_OPERATING_NOMAL_AWARD, 1000, 1, VET_STR_201103_OPERATING_LOG_TITLE, format(VET_TB_201103_OPERATING_LOG_ACTION_LIST[4],szItemName))
			end
		end
		return 1;
	end
	
	return 0;
end
