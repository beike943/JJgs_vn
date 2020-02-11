Include("\\script\\online_activites\\2011_02\\operating\\strings.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\misc\\taskmanager.lua");

VET_201102_OPERATING_ACTIVITY_ID = 28;

VET_201102_OPERATING_MAX_USE_NUM = 1500;

--TaskGroup
VET_201102_OPERATING_TaskGroup = TaskManager:Create(1, 1);
VET_201102_OPERATING_TaskGroup.TSK_FINAL_AWARD = 1;
VET_201102_OPERATING_TaskGroup.TSK_USE_COUNT = 2;
VET_201102_OPERATING_TaskGroup.TSK_AWARD_MODE = 3;

function VET_201102_Operating_GivePlayerLoginItem()
	if gf_CheckEventDateEx(VET_201102_OPERATING_ACTIVITY_ID) == 0 then
	    return 0;
	end
	
	for i=1,getn(VET_TB_201102_OPERATING_ITEM_LOGINGIVE_LIST) do
		if (GetItemCount(VET_TB_201102_OPERATING_ITEM_LOGINGIVE_LIST[i][2], VET_TB_201102_OPERATING_ITEM_LOGINGIVE_LIST[i][3], VET_TB_201102_OPERATING_ITEM_LOGINGIVE_LIST[i][4]) < 1) then
	    		gf_AddItemEx2({VET_TB_201102_OPERATING_ITEM_LOGINGIVE_LIST[i][2], VET_TB_201102_OPERATING_ITEM_LOGINGIVE_LIST[i][3], VET_TB_201102_OPERATING_ITEM_LOGINGIVE_LIST[i][4], 1}, VET_TB_201102_OPERATING_ITEM_LOGINGIVE_LIST[i][1], VET_STR_201102_OPERATING_LOG_TITLE, VET_TB_201102_OPERATING_LOG_ACTION_LIST[1], 0, 1);
		end
	end
end

function VET_201102_Operating_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201102_OPERATING_ACTIVITY_ID) == 1 then
		szSayHead = format(VET_TB_201102_OPERATING_DLG[1],VET_TB_201102_OPERATING_DLG[2])

		tinsert(tbSayDialog,  format("%s/#%s", format(VET_TB_201102_OPERATING_DLG[3], VET_TB_201102_OPERATING_ITEM_TITLE[1], 5, VET_TB_201102_OPERATING_ITEM_TITLE[2], 1, VET_TB_201102_OPERATING_ITEM_TITLE[4]), "VET_201102_Operating_ExchangeChocolate(2)"));
		tinsert(tbSayDialog,  format("%s/%s", format(VET_TB_201102_OPERATING_DLG[3], VET_TB_201102_OPERATING_ITEM_TITLE[1], 5, VET_TB_201102_OPERATING_ITEM_TITLE[2], 2, VET_TB_201102_OPERATING_ITEM_TITLE[3]), "VET_201102_Operating_MassExchangeChocolate"));
		--tinsert(tbSayDialog, format("%s/%s",VET_TB_201102_OPERATING_DLG[4],"VET_201102_Operating_GetFinalAwardDlg"));
		--tinsert(tbSayDialog, format("%s/%s",VET_TB_201102_OPERATING_DLG[5],"VET_201102_Operating_SetAwardModeDlg"));
		--tinsert(tbSayDialog, format("%s/%s",format(VET_TB_201102_OPERATING_DLG[6], 100, VET_TB_201102_OPERATING_ITEM_TITLE[3], 1, VET_TB_201102_OPERATING_ITEM_TITLE[5]),"VET_201102_Operating_ExchangeXu"));
	end
	return tbSayDialog, szSayHead;
end

function VET_201102_Operating_ExchangeChocolate(nType)
	if gf_Judge_Room_Weight(1, 0, "") ~= 1 then
		return 0;
	end
	local tbMaterial = VET_TB_201102_OPERATING_EXCHANGE_MATERIAL[nType];
	if (tbMaterial == nil) then
		return 0;
	end
	
	for i=1,getn(tbMaterial) do
		if (GetItemCount(tbMaterial[i][2], tbMaterial[i][3], tbMaterial[i][4]) < tbMaterial[i][5]) then
			Talk(1, "", VET_TB_201102_OPERATING_DLG[7]);
			return 0;
		end
	end

	for i=1,getn(tbMaterial) do
		if (DelItem(tbMaterial[i][2], tbMaterial[i][3], tbMaterial[i][4], tbMaterial[i][5]) ~= 1) then
			Talk(1, "", VET_TB_201102_OPERATING_DLG[7]);
			return 0;
		end
	end
	
	gf_AddItemEx2({2,1,30286, 1},VET_TB_201102_OPERATING_ITEM_TITLE[1],VET_STR_201102_OPERATING_LOG_TITLE,format(VET_TB_201102_OPERATING_LOG_ACTION_LIST[2],VET_TB_201102_OPERATING_ITEM_TITLE[1]),0,1);
	SelectSay()
end

function VET_201102_Operating_MassExchangeChocolate()
	AskClientForNumber("ConfirmMassExchangeChocolate", 1, 999, "Sè S«c«la?")
end

function ConfirmMassExchangeChocolate(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        return 0;
    end
    local tbMaterial = VET_TB_201102_OPERATING_EXCHANGE_MATERIAL[1]
    
    if GetItemCount(tbMaterial[1][2], 
                    tbMaterial[1][3], 
                    tbMaterial[1][4]) < (5 * nCount )
        or GetItemCount(tbMaterial[2][2], 
                        tbMaterial[2][3], 
                        tbMaterial[2][4]) < (2 * nCount)
    then
        Talk(1, "", VET_TB_201102_OPERATING_DLG[7]);
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
        gf_AddItemEx2({2,1,30286, nCount},
                        VET_TB_201102_OPERATING_ITEM_TITLE[1],
                        VET_STR_201102_OPERATING_LOG_TITLE, 
                        VET_TB_201102_OPERATING_LOG_ACTION_LIST[6],
                        0, 
                        1)
    end
    SelectSay()
end

function VET_201102_Operating_GetFinalAwardDlg()
	if gf_Judge_Room_Weight(1, 0, "") ~= 1 then
		return 0;
	end
	if VET_201102_OPERATING_TaskGroup:GetTask(VET_201102_OPERATING_TaskGroup.TSK_FINAL_AWARD) == 1 then
		Talk(1, "", VET_TB_201102_OPERATING_DLG[14])
		return 0;
	end
	if VET_201102_OPERATING_TaskGroup:GetTask(VET_201102_OPERATING_TaskGroup.TSK_USE_COUNT) < VET_201102_OPERATING_MAX_USE_NUM then 
		Talk(1, "", format(VET_TB_201102_OPERATING_DLG[8], VET_TB_201102_OPERATING_ITEM_TITLE[1], VET_201102_OPERATING_TaskGroup:GetTask(VET_201102_OPERATING_TaskGroup.TSK_USE_COUNT), VET_201102_OPERATING_MAX_USE_NUM));
		return 0;
	else
		local tbDialog = 
		{
			format("%s/#%s", VET_TB_201102_OPERATING_DLG[9],"VET_201102_Operating_GetFinalAward(1)"),
			format("%s/#%s", VET_TB_201102_OPERATING_DLG[10],"VET_201102_Operating_GetFinalAward(2)"),
			format("%s/#%s", VET_TB_201102_OPERATING_DLG[11],"VET_201102_Operating_GetFinalAward(3)"),
			format("%s/%s", VET_TB_201102_OPERATING_DLG[12],"gf_DoNothing"),
		};
		Say(VET_TB_201102_OPERATING_DLG[13], getn(tbDialog), tbDialog);
	end
	
	return 1;
end

function VET_201102_Operating_GetFinalAward(nType)
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if gf_Judge_Room_Weight(1, 100, "") ~= 1 then
		return 0;
	end
	
	if VET_201102_OPERATING_TaskGroup:GetTask(VET_201102_OPERATING_TaskGroup.TSK_FINAL_AWARD) == 1 then
		Talk(1, "", VET_TB_201102_OPERATING_DLG[14]);
		return 0;
	end
	
	if nType == 1 then
		gf_EventGiveCustomAward(1, 20000000, 1, VET_STR_201102_OPERATING_LOG_TITLE, VET_TB_201102_OPERATING_LOG_ACTION_LIST[3]);
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
	
	VET_201102_OPERATING_TaskGroup:SetTask(VET_201102_OPERATING_TaskGroup.TSK_FINAL_AWARD,1)
	gf_EventGiveRandAward(VET_TB_201102_OPERATING_FINAL_AWARD, 1000, 1, VET_STR_201102_OPERATING_LOG_TITLE, VET_TB_201102_OPERATING_LOG_ACTION_LIST[3]); 
	gf_WriteLogEx(VET_STR_201102_OPERATING_LOG_TITLE, VET_TB_201102_OPERATING_LOG_ACTION_LIST[7]..nType)
end

function VET_201102_Operating_GetFYAward()
	gf_EventGiveRandAward(VET_TB_201102_OPERATING_FY_AWARD, 10000, 1, VET_STR_201102_OPERATING_LOG_TITLE, VET_TB_201102_OPERATING_LOG_ACTION_LIST[3]);
end

function VET_201102_Operating_GetShimenWeaponAward()
	gf_EventGiveRandAward(VET_TB_201102_OPERATING_SHIMEN_WEAPON_AWARD, 1000, 1, VET_STR_201102_OPERATING_LOG_TITLE, VET_TB_201102_OPERATING_LOG_ACTION_LIST[3]);
end

function VET_201102_Operating_GetShimenEquipAward()
	gf_EventGiveRandAward(VET_TB_201102_OPERATING_SHIMEN_EQUIP_AWARD, 1000, 1, VET_STR_201102_OPERATING_LOG_TITLE, VET_TB_201102_OPERATING_LOG_ACTION_LIST[3]);
end

--½±ÀøÄ£Ê½£¬1ÊÇ»ñµÃÎïÆ·£¬2ÊÇ²»ÒªÎïÆ·
function VET_201102_Operating_SetAwardModeDlg()
	local tbDialog = 
	{
		format("%s/#%s", VET_TB_201102_OPERATING_DLG[15],"VET_201102_Operating_SetAwardMode(1)"),
		format("%s/#%s", VET_TB_201102_OPERATING_DLG[16],"VET_201102_Operating_SetAwardMode(2)"),
		format("%s/%s", VET_TB_201102_OPERATING_DLG[12],"gf_DoNothing"),
	}
	Say(VET_TB_201102_OPERATING_DLG[17], getn(tbDialog), tbDialog);
end

function VET_201102_Operating_SetAwardMode(nType)
	VET_201102_OPERATING_TaskGroup:SetTask(VET_201102_OPERATING_TaskGroup.TSK_AWARD_MODE,nType)
	Talk(1, "", format(VET_TB_201102_OPERATING_DLG[17+nType],VET_TB_201102_OPERATING_ITEM_TITLE[1], VET_TB_201102_OPERATING_DLG[21]));
end

function VET_201102_Operating_ExchangeXu()
	if gf_Judge_Room_Weight(1, 0, "") ~= 1 then
		return 0;
	end
	
	if (GetItemCount(2, 1, 199) < 1) then
		Talk(1, "", format(VET_TB_201102_OPERATING_DLG[20],VET_TB_201102_OPERATING_ITEM_TITLE[5]));
		return 0;
	elseif (DelItem(2, 1, 199, 1) == 1)then 
		gf_AddItemEx2({2, 1, 30230, 100}, VET_TB_201102_OPERATING_ITEM_TITLE[3],VET_STR_201102_OPERATING_LOG_TITLE, format(VET_TB_201102_OPERATING_LOG_ACTION_LIST[2],VET_TB_201102_OPERATING_ITEM_TITLE[3]),0,1);
	end
	return 1;
end

function VET_201102_Operating_PlantBigTreeAward()
	if gf_CheckEventDateEx(VET_201102_OPERATING_ACTIVITY_ID) == 0 then
		return 0;
	end
	gf_GivePlantBigTreeAward({2,1,30287,60},VET_TB_201102_OPERATING_ITEM_TITLE[2],VET_STR_201102_OPERATING_LOG_TITLE);
	return 1;
end

function VET_201102_Operating_PlantSmallTreeAward()
	if gf_CheckEventDateEx(VET_201102_OPERATING_ACTIVITY_ID) == 0 then
		return 0;
	end
	gf_GivePlantSmallTreeAward({2,1,30287,50},VET_TB_201102_OPERATING_ITEM_TITLE[2],VET_STR_201102_OPERATING_LOG_TITLE);
	return 1;
end

function VET_201102_Operating_SeedbagAward()
	if gf_CheckEventDateEx(VET_201102_OPERATING_ACTIVITY_ID) == 0 then
		return 0;
	end
	gf_GiveSeedBagAward({2,1,30287,150},VET_TB_201102_OPERATING_ITEM_TITLE[2],VET_STR_201102_OPERATING_LOG_TITLE);
	return 1;
end

function VET_201102_Operating_DailyTaskPersonalAward()
	if gf_CheckEventDateEx(VET_201102_OPERATING_ACTIVITY_ID) == 0 then
		return 0;
	end
	gf_GiveDailyTaskPersonalAward({2,1,30287,30},VET_TB_201102_OPERATING_ITEM_TITLE[2],VET_STR_201102_OPERATING_LOG_TITLE);
	return 1;
end

function VET_201102_Operating_DailyTaskTeamAward()
	if gf_CheckEventDateEx(VET_201102_OPERATING_ACTIVITY_ID) == 0 then
		return 0;
	end
	gf_GiveDailyTaskTeamAward({2,1,30287,30},VET_TB_201102_OPERATING_ITEM_TITLE[2],VET_STR_201102_OPERATING_LOG_TITLE);
	return 1;
end

function VET_201102_Operating_UseChocolate(nItemIndex)
	local nAwardMode = VET_201102_OPERATING_TaskGroup:GetTask(VET_201102_OPERATING_TaskGroup.TSK_AWARD_MODE);
	if  nAwardMode == 0 then
		VET_201102_Operating_SetAwardModeDlg()
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10 , "") ~= 1 then 
		return 0;
	end
	
	local nCurCount = VET_201102_OPERATING_TaskGroup:GetTask(VET_201102_OPERATING_TaskGroup.TSK_USE_COUNT);
	if nCurCount >= VET_201102_OPERATING_MAX_USE_NUM then
		Talk(1, "", format(VET_TB_201102_OPERATING_DLG[8], VET_TB_201102_OPERATING_ITEM_TITLE[1],nCurCount, VET_201102_OPERATING_MAX_USE_NUM));
		return 0;
	end
	
	if DelItemByIndex(nItemIndex, 1) == 1 then
		VET_201102_OPERATING_TaskGroup:SetTask(VET_201102_OPERATING_TaskGroup.TSK_USE_COUNT,nCurCount+1);
		if (nAwardMode == 1) then
			gf_EventGiveCustomAward(1, 250000, 1, VET_STR_201102_OPERATING_LOG_TITLE, format(VET_TB_201102_OPERATING_LOG_ACTION_LIST[4],VET_TB_201102_OPERATING_ITEM_TITLE[1]));
		else
			gf_EventGiveCustomAward(1, 200000, 1, VET_STR_201102_OPERATING_LOG_TITLE, format(VET_TB_201102_OPERATING_LOG_ACTION_LIST[4],VET_TB_201102_OPERATING_ITEM_TITLE[1]));
			if mod(nCurCount+1, 20) == 0 then
				gf_EventGiveRandAward(VET_TB_201102_OPERATING_SP_AWARD, 10000, 1, VET_STR_201102_OPERATING_LOG_TITLE, format(VET_TB_201102_OPERATING_LOG_ACTION_LIST[5],nCurCount+1,VET_TB_201102_OPERATING_ITEM_TITLE[1]))
			else
				gf_EventGiveRandAward(VET_TB_201102_OPERATING_NOMAL_AWARD, 1000, 1, VET_STR_201102_OPERATING_LOG_TITLE, format(VET_TB_201102_OPERATING_LOG_ACTION_LIST[4],VET_TB_201102_OPERATING_ITEM_TITLE[1]))
			end
		end
		return 1;
	end
	
	return 0;
end

function VET_201102_give_dahongbao()
	local nUsedDate = floor(GetTask(TSK_DAHONGBAO_201101) / 1000)
	local nDate = tonumber(date("%y%m%d"))
	
	if GetLevel() < 77 then
		Talk(1, "", "§¼ng cÊp 77 trë lªn míi cã thÓ sö dông bao l× x×!")
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "Ph¶i cã kü n¨ng cÊp 55 míi cã thÓ tham gia ho¹t ®éng nµy!")
		return
	end
	
	if nDate > 110421 then
		Talk(1,"","§· hÕt thêi h¹n sù kiÖn!")
		return
	end
	
	if nUsedDate ~= nDate then
		SetTask ( TSK_DAHONGBAO_201101, nDate * 1000 )
		SetTask ( TSK_DAHONGBAO_201101_TIME, 0 )
	end
	
	local nCount = floor(mod(GetTask(TSK_DAHONGBAO_201101), 1000) / 100)
	if nCount >= 1 then
		Talk(1,"","Mçi ngµy chØ cã thÓ nhËn bao l× x× 1 lÇn mµ th«i!")
		return
	end
	
	gf_AddItemEx2({2, 1, 30280, 40, 4}, "LÔ Bao §¹i C¸t", VET_201101_01_STR_LOG_TITLE, "nhËn 40 bao l× x×")

	Msg2Player("NhËn ®­îc 40 bao l× x×!")
	SetTask(TSK_DAHONGBAO_201101, GetTask(TSK_DAHONGBAO_201101) + 100)
end

function VET_201102_give_chocolate()
	local nUsedDate = floor(GetTask(TSK_GIVE_EVENT_ITEM) / 100)
	local nDate = tonumber(date("%y%m%d"))
	
	if nDate < 110304 or nDate > 110410 then
		Talk(1,"","§· hÕt thêi h¹n sù kiÖn!")
		return
	end
	
	if nUsedDate ~= nDate then
		SetTask(TSK_GIVE_EVENT_ITEM, nDate * 100)
	end
	
	local nCount = mod(GetTask(TSK_GIVE_EVENT_ITEM), 100)
	if nCount >= 4 then
		Talk(1,"","Mçi ngµy chØ cã thÓ tÆng S«c«la tèi ®a 4 lÇn mµ th«i!")
		return
	end
	if GetItemCount(2, 1, 30286) < 10 then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ 10 S«c«la råi!")
		return
	end
	if DelItem(2, 1, 30286, 10) == 1 then
		ModifyExp(2500000)
		Msg2Player("NhËn ®­îc 2500000 ®iÓm kinh nghiÖm")
		gf_WriteLogEx(VET_201101_01_STR_LOG_TITLE, "nép S«c«la nhËn 2500000 exp")
		SetTask(TSK_GIVE_EVENT_ITEM, GetTask(TSK_GIVE_EVENT_ITEM) + 1)
	end
end