Include("\\script\\online_activites\\2011_04\\liberation\\strings.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\misc\\taskmanager.lua");
Include("\\script\\online\\viet_event\\firework_10\\head.lua");

VET_201104_LIBERATION_ACTIVITY_ID = 33;
VET_201104_LIBERATION_FIREWORK_USE_MAX = 4000

--ŒÔ∆∑∫ÕΩ±¿¯œ‡πÿµƒÕ∑πÿº¸◊÷
VET_201104_LIBERATION_INI_KEY="201104Liberation"
--TaskGroup
VET_201104_LIBERATION_TaskGroup = TaskManager:Create(3,1)
VET_201104_LIBERATION_TaskGroup.OpenFireworkDiff = 1
VET_201104_LIBERATION_TaskGroup.OpenFireWorkTimes = 2
VET_201104_LIBERATION_TaskGroup.GetFinalPrize = 3

-- ±º‰Ωıƒ“
function VET_201104_Liberation_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201104_LIBERATION_ACTIVITY_ID) == 1 then
		tinsert(tbSayDialog,gf_VnGetChangeSaySel("201104LiberationChg1").."/#VET201104CHG(1)")
		tinsert(tbSayDialog,gf_VnGetChangeSaySel("201104LiberationChg2").."/#VET201104CHG(2)")
		tinsert(tbSayDialog,VET_STR_201104_LIBERATION_OPERATING_DLG[1])
		tinsert(tbSayDialog,VET_STR_201104_LIBERATION_OPERATING_DLG[2])
		tinsert(tbSayDialog,gf_VnGetChangeSaySel("201104LiberationChg3").."/#VET201104CHG(3)")
		szSayHead = VET_STR_201104_LIBERATION_OPERATING_DLG[4]
	end
	return tbSayDialog,szSayHead
end
--µ¿æﬂ∂“ªª¥¶¿Ì
function VET201104CHG(nChgSeq)
	gf_VnItemChgDeal(VET_201104_LIBERATION_INI_KEY.."Chg"..nChgSeq)
end

function VET_201104_304_MassExchange()
	AskClientForNumber("VET_201104_304_ConfirmMassExchange", 1, 999, "SË B„ Hoa?")
end

function VET_201104_304_ConfirmMassExchange(nCount)
    if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        return 0;
    end
    
    if GetItemCount(2, 1, 30295) < 5 * nCount or GetItemCount(2, 1, 30230) < 2 * nCount then
        Talk(1, "", "Kh´ng ÆÒ nguy™n li÷u Æ” ÆÊi, xin vui lﬂng ki”m tra lπi hµnh trang!");
        return 0
    elseif DelItem(2, 1, 30295, 5 * nCount) == 1 and DelItem(2, 1, 30230, 2 * nCount) == 1 then 
        gf_AddItemEx2({2,1,30296, nCount}, VET_TB_201104_LIBERATION_ITEM_TITLE[2], VET_STR_201104_LIBERATION_LOG_TITLE, "ÆÊi B„ Hoa Chi’n Thæng bªng Xu", 0, 1)
    end
    SelectSay()
end

--¡ÏΩ±ƒ£ Ω¥¶¿Ì
function VET_201104_PRIZE_MODEL()
	Say(VET_STR_201104_LIBERATION_OPERATING_DLG[7],
		3,
		VET_STR_201104_LIBERATION_OPERATING_DLG[5],
		VET_STR_201104_LIBERATION_OPERATING_DLG[6],
		VET_STR_201104_LIBERATION_OPERATING_DLG[8]
	)
end
--…Ë÷√¥¶¿Ì
function VET_201104_PRIZE_DIFF(nPrizeDiff)
	VET_201104_LIBERATION_TaskGroup:SetTask(VET_201104_LIBERATION_TaskGroup.OpenFireworkDiff,nPrizeDiff)
	Talk(1, "", format(VET_STR_201104_LIBERATION_OPERATING_DLG[15][nPrizeDiff],VET_TB_201104_LIBERATION_ITEM_TITLE[2],50000));
end
--¿Òª®µƒ π”√
function VET_201104_Liberation_Firework(nItemIndex)
	--¥Œ ˝ºÏ≤‚
	local nUseTimes = VET_201104_LIBERATION_TaskGroup:GetTask(VET_201104_LIBERATION_TaskGroup.OpenFireWorkTimes)
	if nUseTimes >= VET_201104_LIBERATION_FIREWORK_USE_MAX then
		Talk(1,"",format(VET_STR_201104_LIBERATION_OPERATING_DLG[9],VET_201104_LIBERATION_FIREWORK_USE_MAX))
		return
	end
	--∂“ªªπÊ‘Ú «∑Ò…Ë∂®ºÏ≤‚
	local nPrizeDiff = VET_201104_LIBERATION_TaskGroup:GetTask(VET_201104_LIBERATION_TaskGroup.OpenFireworkDiff)
	if nPrizeDiff ~= 1 and nPrizeDiff ~= 2 then
		VET_201104_PRIZE_MODEL()
		return
	end
	
	--ø’º‰∏∫÷ÿ≈–∂œ
	if gf_Judge_Room_Weight(1, 10 , "") ~= 1 then
		return 0
	end
	--ŒÔ∆∑…æ≥˝
	if DelItemByIndex(nItemIndex,1) ~= 1 then
		return
	else
		VET_201104_LIBERATION_TaskGroup:SetTask(VET_201104_LIBERATION_TaskGroup.OpenFireWorkTimes,(nUseTimes + 1))
		--√ø20¥ŒµƒΩ±¿¯
		if nPrizeDiff == 1 then
			ModifyExp(250000)
			Msg2Player("Bπn nhÀn Æ≠Óc 250000 Æi”m kinh nghi÷m.")
		else
			ModifyExp(200000)
			Msg2Player("Bπn nhÀn Æ≠Óc 200000 Æi”m kinh nghi÷m.")
			if mod((nUseTimes + 1),20) == 0 then
				gf_EventGiveRandAward(VET_TB_201104_LIBERATION_SUC_FIREWORK_PRIZE_20, 10000, 1, VET_STR_201104_LIBERATION_LOG_TITLE,format(VET_TB_201104_LIBERATION_LOG_ACTION_LIST[5],(nUseTimes + 1),VET_TB_201104_LIBERATION_ITEM_TITLE[2]));				
			else
				gf_EventGiveRandAward(VET_TB_201104_LIBERATION_SUC_FIREWORK_PRIZE, 1000, 1, VET_STR_201104_LIBERATION_LOG_TITLE,format(VET_TB_201104_LIBERATION_LOG_ACTION_LIST[4],VET_TB_201104_LIBERATION_ITEM_TITLE[2]))
			end
		end
		--Talk(1,"",format(VET_STR_201104_LIBERATION_OPERATING_DLG[12],(nUseTimes + 1),VET_201104_LIBERATION_FIREWORK_USE_MAX))
	end
end
--±ﬁ≈⁄µƒ π”√
function VET_201104_Liberation_Firecracker(nItemIndex)
	--ŒÔ∆∑…æ≥˝
	use_firework(nItemIndex)
end
--¡Ï»°÷’º´Ω±¿¯
function VET_201104_GET_FINAL_PRIZE()
	--¿Òª®¥Œ ˝≈–∂œ
	local nUseTimes = VET_201104_LIBERATION_TaskGroup:GetTask(VET_201104_LIBERATION_TaskGroup.OpenFireWorkTimes)
	if nUseTimes < 2000 then
		Talk(1,"",format(VET_STR_201104_LIBERATION_OPERATING_DLG[12],nUseTimes,VET_201104_LIBERATION_FIREWORK_USE_MAX))
		return
	end
	-- «∑Ò“—æ≠¡Ï»°≈–∂œ
	if VET_201104_LIBERATION_TaskGroup:GetTask(VET_201104_LIBERATION_TaskGroup.GetFinalPrize) == 1 then
		Talk(1,"",VET_STR_201104_LIBERATION_OPERATING_DLG[13])
		return
	end
	--ø’º‰∏∫÷ÿ≈–∂œ
	if gf_Judge_Room_Weight(1, 100 , "") ~= 1 then
		return 0
	end
	--ø™ º¥¶¿Ì
	Say(VET_STR_201104_LIBERATION_OPERATING_DLG[14][1],getn(VET_STR_201104_LIBERATION_OPERATING_DLG[14][2]),VET_STR_201104_LIBERATION_OPERATING_DLG[14][2])
end
--÷’º´Ω±¿¯ªÒ»°¥¶¿Ì
function VET_201104_GET_FINAL_PRIZE_DTM(nPrizeDiff)
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	--¿Òª®¥Œ ˝≈–∂œ
	local nUseTimes = VET_201104_LIBERATION_TaskGroup:GetTask(VET_201104_LIBERATION_TaskGroup.OpenFireWorkTimes)
	if nUseTimes < 2000 then
		Talk(1,"",format(VET_STR_201104_LIBERATION_OPERATING_DLG[12],nUseTimes,VET_201104_LIBERATION_FIREWORK_USE_MAX))
		return
	end
	-- «∑Ò“—æ≠¡Ï»°≈–∂œ
	if VET_201104_LIBERATION_TaskGroup:GetTask(VET_201104_LIBERATION_TaskGroup.GetFinalPrize) == 1 then
		Talk(1,"",VET_STR_201104_LIBERATION_OPERATING_DLG[13])
		return
	end
	
	if nPrizeDiff == 1 then
		ModifyExp(20000000)
	elseif nPrizeDiff == 2 then
		--TODO add pet grow award here 
		if nCurPetLevel < 1 then
			Talk(1,"","ßπi hi÷p ch≠a c„ Bπn ßÂng Hµnh, kh´ng th” nhÀn ph«n th≠Îng nµy!")			
			return 0
	     end
   	     SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (20 * 100))
	     Msg2Player("Bπn nhÀn Æ≠Óc 20 ßi”m N©ng C p Bπn ßÂng Hµnh")
	elseif nPrizeDiff == 3 then
		--TODO add pet mp award here 
		if nCurPetLevel < 2 then
			Talk(1,"","Bπn ßÂng Hµnh Æºng c p 2 trÎ l™n mÌi c„ th” nhÀn ph«n th≠Îng nµy!")
			return 0
	     end
	     Pet_AddGP(1)
	     Msg2Player("Bπn nhÀn Æ≠Óc 1 ßi”m Linh L˘c Bπn ßÂng Hµnh")
	end
	VET_201104_LIBERATION_TaskGroup:SetTask(VET_201104_LIBERATION_TaskGroup.GetFinalPrize,1)
	gf_EventGiveRandAward(VET_TB_201104_LIBERATION_SUC_FIREWORK_PRIZE_MAX, 10000, 1, VET_STR_201104_LIBERATION_LOG_TITLE,VET_TB_201104_LIBERATION_LOG_ACTION_LIST[3])
end
--∆‰À¸Ω±¿¯¥¶¿Ì
function VET_201104_Liberation_GetShimenWeaponAward()
	gf_EventGiveRandAward(VET_TB_201104_LIBERATION_FACTION_WEAPON, 1000, 1, VET_STR_201104_LIBERATION_LOG_TITLE,VET_TB_201104_LIBERATION_LOG_ACTION_LIST[3])
end
function VET_201104_Liberation_GetShimenEquipAward()
	gf_EventGiveRandAward(VET_TB_201104_LIBERATION_FACTION_CLOTH, 1000, 1, VET_STR_201104_LIBERATION_LOG_TITLE,VET_TB_201104_LIBERATION_LOG_ACTION_LIST[3])
end
function VET_201104_Liberation_GetBufeiyanEquipAward()
	gf_EventGiveRandAward(VET_TB_201104_LIBERATION_FY_WEAPON, 10000, 1, VET_STR_201104_LIBERATION_LOG_TITLE,VET_TB_201104_LIBERATION_LOG_ACTION_LIST[3])
end
--ªÓ∂Ø◊ ‘¥ªÒ»°
	--–° ˜
function  VET_201104_Liberation_PlantSmallTreeAward()
	if gf_CheckEventDateEx(VET_201104_LIBERATION_ACTIVITY_ID) == 0 then
		return 0;
	end
	gf_GivePlantSmallTreeAward({2,1,30295,30},VET_TB_201104_LIBERATION_ITEM_TITLE[1],VET_STR_201104_LIBERATION_LOG_TITLE)
	return 1
end
	--¥Û ˜
function VET_201104_Liberation_PlantBigTreeAward()
	if gf_CheckEventDateEx(VET_201104_LIBERATION_ACTIVITY_ID) == 0 then
		return 0;
	end
	gf_GivePlantBigTreeAward({2,1,30295,40},VET_TB_201104_LIBERATION_ITEM_TITLE[1],VET_STR_201104_LIBERATION_LOG_TITLE)
	return 1
end
	--÷÷◊”¥¸
function VET_201104_Liberation_SeedbagAward()
	if gf_CheckEventDateEx(VET_201104_LIBERATION_ACTIVITY_ID) == 0 then
		return 0;
	end
	gf_GiveSeedBagAward({2,1,30295,100},VET_TB_201104_LIBERATION_ITEM_TITLE[1],VET_STR_201104_LIBERATION_LOG_TITLE)
	return 1
end
	--Œ‰¡÷ π’ﬂ»ŒŒÒ
function VET_201104_Liberation_WulishizheAward()
	if gf_CheckEventDateEx(VET_201104_LIBERATION_ACTIVITY_ID) == 0 then
		return 0;
	end
	gf_GivePlantBigTreeAward({2,1,30295,30},VET_TB_201104_LIBERATION_ITEM_TITLE[1],VET_STR_201104_LIBERATION_LOG_TITLE)
end

function VET_201104_Give_FireCracker()
	local nUsedDate = floor(GetTask(TSK_DAHONGBAO_201101) / 1000)
	local nDate = tonumber(date("%y%m%d"))
	
	if GetLevel() < 77 then
		Talk(1, "", "ßºng c p 77 trÎ l™n mÌi c„ th” sˆ dÙng ph∏o hoa!")
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "Ph∂i c„ k¸ n®ng c p 55 mÌi c„ th” tham gia hoπt ÆÈng nµy!")
		return
	end
	
	if nDate > 110529 then
		Talk(1,"","ß∑ h’t thÍi hπn s˘ ki÷n!")
		return
	end
	
	if nUsedDate ~= nDate then
		SetTask ( TSK_DAHONGBAO_201101, nDate * 1000 )
		SetTask ( TSK_DAHONGBAO_201101_TIME, 0 )
	end
	
	local nCount = floor(mod(GetTask(TSK_DAHONGBAO_201101), 1000) / 100)
	if nCount >= 1 then
		Talk(1,"","MÁi ngµy chÿ c„ th” nhÀn ph∏o hoa 1 l«n mµ th´i!")
		return
	end
	
	gf_AddItemEx2({2, 1, 30297, 40, 4}, "Ph∏o chi’n thæng", VET_STR_201104_LIBERATION_LOG_TITLE, "nhÀn Ph∏o chi’n thæng")

	Msg2Player("NhÀn Æ≠Óc 40 Ph∏o chi’n thæng!")
	SetTask(TSK_DAHONGBAO_201101, GetTask(TSK_DAHONGBAO_201101) + 100)
end

function VET_201104_give_Winflower()
	local nUsedDate = floor(GetTask(TSK_GIVE_EVENT_ITEM) / 100)
	local nDate = tonumber(date("%y%m%d"))
	
	if nDate < 110520 or nDate > 110616 then
		Talk(1,"","ß∑ h’t thÍi hπn s˘ ki÷n!")
		return
	end
	
	if nUsedDate ~= nDate then
		SetTask(TSK_GIVE_EVENT_ITEM, nDate * 100)
	end
	
	local nCount = mod(GetTask(TSK_GIVE_EVENT_ITEM), 100)
	if nCount >= 4 then
		Talk(1,"","MÁi ngµy chÿ c„ th” nÈp Hoa chi’n thæng tËi Æa 4 l«n mµ th´i!")
		return
	end
	if GetItemCount(2, 1, 30296) < 10 then
		Talk(1,"","ßπi hi÷p kh´ng mang ÆÒ 10 Hoa chi’n thæng rÂi!")
		return
	end
	if DelItem(2, 1, 30296, 10) == 1 then
		ModifyExp(2500000)
		Msg2Player("NhÀn Æ≠Óc 2500000 Æi”m kinh nghi÷m")
		gf_WriteLogEx(VET_STR_201104_LIBERATION_LOG_TITLE, "nÈp Hoa chi’n thæng nhÀn 2500000 exp")
		SetTask(TSK_GIVE_EVENT_ITEM, GetTask(TSK_GIVE_EVENT_ITEM) + 1)
	end
end