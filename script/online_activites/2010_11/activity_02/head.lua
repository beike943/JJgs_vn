Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\reborn\\tongban\\head.lua");

SF_title = "Ho¹t ®éng th¸ng 11 ®­îc tiÕn hµnh vµo ngµy 29/10/2010 ~ 05/12/2010. Vui lßng xem th«ng tin chi tiÕt t¹i http://volam2.zing.vn";
SF_useThreshold = 1500;
SF_activityID = 17;
SF_modeTaskID = VET_201011_02_TASK_MODE;
SF_usedCountTaskID = VET_201011_02_TASK_USED_COUNT;
SF_usedCountMode1TaskID = VET_201011_02_TASK_USED_COUNT_MODE1;
SF_usedCountMode2TaskID = VET_201011_02_TASK_USED_COUNT_MODE2;
SF_ifGotRewardTaskID = VET_201011_02_IF_GET_REWARD;

VET_201011_EVENT_LOG_TITLE = "Hoat dong thang 11 nam 2010"

SF_expReward = 
{
	200000, 
	250000
}

SF_weapon_bpy = {
				[1]  = {675, "Ph¸ Yªn ®ao", {0, 3, 6001, 1,1,-1,-1,-1,-1,-1,-1}},
				[2]  = {675, "Phï Yªn tr­îng",{0,8,6003, 1,1,-1,-1,-1,-1,-1,-1}},
				[3]  = {675, "Hµm Yªn thñ",{0,0,6004, 1,1,-1,-1,-1,-1,-1,-1}},
				[4]  = {675, "Tµng Yªn ch©m",{0,1,6005, 1,1,-1,-1,-1,-1,-1,-1}},
				[5]  = {675, "Phi Yªn kiÕm",{0,2,6006, 1,1,-1,-1,-1,-1,-1,-1}},
				[6]  = {675, "VËn Yªn cÇm",{0,10,6007, 1,1,-1,-1,-1,-1,-1,-1}},
				[7] = {675, "V©n Yªn thñ",{0,0,6008, 1,1,-1,-1,-1,-1,-1,-1}},
				[8] = {675, "L­u Yªn c«n",{0,5,6009, 1,1,-1,-1,-1,-1,-1,-1}},
				[9] = {675, "HuyÒn Yªn kiÕm",{0,2,6010, 1,1,-1,-1,-1,-1,-1,-1}},
				[10] = {675, "Vò Yªn bót",{0,9,6011, 1,1,-1,-1,-1,-1,-1,-1}},
				[11] = {675, "Hµ Tiªm Th­¬ng",{0,6,6012, 1,1,-1,-1,-1,-1,-1,-1}},
				[12] = {675, "Hµnh Yªn Cung",{0,4,6013, 1,1,-1,-1,-1,-1,-1,-1}},
				[13] = {625, "Träc Yªn nhÉn",{0,7,6014, 1,1,-1,-1,-1,-1,-1,-1}},
				[14] = {600, "Yªu Yªn tr¶o",{0,11,6015, 1,1,-1,-1,-1,-1,-1,-1}},
				[15] = {675, "Ph¸ Yªn C«n",{0, 5, 6002, 1,1,-1,-1,-1,-1,-1,-1}},
};

SF_items = 
{
	{2, 1, 30250, "Hoa H­íng D­¬ng"},
	{2, 1, 30251, "GiÊy gãi hoa"},
	{2, 1, 30252, "§ãa Hoa H­íng D­¬ng"},
	{2, 1, 30253, "Hoa hång ®á"},
	{2, 1, 30254, "Hoa hång phÊn"},
	{2, 1, 30255, "Hoa hång vµng"},
	{2, 1, 30256, "Hoa Hång Tr¾ng"},
	{2, 1, 30257, "L¨ng Ba Tµn QuyÓn"},
	{2, 1, 30258, "Th­ëng ThiÖn LÖnh"},
	{2, 1, 30259, "Ph¹t ¸c LÖnh"},
	{2, 1, 30230, " ®ång "},
	{2, 1, 199, "§¹i ng©n phiÕu"}
};

SF_compositeTable1 = 
{
	{
		{"Hoa H­íng D­¬ng", 2, 1, 30250, 5},
		{"GiÊy gãi hoa", 2, 1, 30251, 1}
	},
	{
		{"§ãa Hoa H­íng D­¬ng", 100, {"§ãa Hoa H­íng D­¬ng", {2, 1, 30252, 1}}}
	}
};

SF_compositeTable2 = 
{
	{
		{"Hoa H­íng D­¬ng", 2, 1, 30250, 5},
		{" ®ång ", 2, 1, 30230, 2}
	},
	{
		{"§ãa Hoa H­íng D­¬ng", 100, {"§ãa Hoa H­íng D­¬ng", {2, 1, 30252, 1}}}
	}
};

SF_compositeTable3 = 
{
	{
		{"§¹i ng©n phiÕu", 2, 1, 199, 1},
	},
	{
		{" ®ång ", 100, {" ®ång ", {2, 1, 30230, 100}}}
	}
};

-- base 1000
SF_itemReward =
{
	{3, 305, 10000, 1},
	{1, 100, "Thiªn th¹ch", {2, 2, 8, 1}},
	{1, 60, "M¶nh Thiªn th¹ch", {2, 2, 7, 1}},
 	{1, 5, "ThÕ Th©n phï", {2, 0, 556, 1}, 7 * 24 * 3600},
 	{1, 20, "B¸t Nh· Chøng Th­", {2, 1, 30114, 1}, 7 * 24 * 3600},
 	{1, 20, "C©y B¸t Nh· nhá", {2, 0, 504, 1}, 7 * 24 * 3600},
 	{1, 10, "C©y B¸t Nh·", {2, 0, 398, 1}, 7 * 24 * 3600},
  	{4, 250, 10, 1},
  	{5, 140, 10, 1},
	{1, 5, "Thiªn Hµ MËt tÞch", {0, 107, 64, 1}},
	{1, 5, "Tö Hµ MËt tÞch", {0, 107, 65, 1}},
	{1, 5, "Chiªm Y Phæ", {0, 107, 66, 1}},
	{1, 50, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 1}, 7 * 24 * 3600},
	{1, 5, "§¹i Nh©n s©m", {2, 0, 553, 1}, 7 * 24 * 3600},
	{1, 10, "TiÓu Nh©n s©m qu¶", {2, 0, 552, 1}, 7 * 24 * 3600},
	{1, 10, "§é NguyÖt ThÇn Sa", {2, 1, 3332, 1}},
};

SF_specialTimes = 20;
SF_maxCountExpReward = 20000000;

-- base 10000
SF_extraItemReward = {
    {8, 1000, 60, 1},
    {15, 1000, 60, 1},
    {12, 1000, 60, 1},
    {1, 600, "TiÓu Nh©n s©m qu¶", {2, 0, 552, 1}, 7 * 24 * 3600},
    {1, 300, "C¬ quan nh©n", {2, 1, 1011, 1}, 7 * 24 * 3600},
    {1, 300, "Sæ tay sèng", {2, 19, 1, 1}, 7 * 24 * 3600},
    {1, 500, "V« NgÊn Thñy", {2, 1, 503, 1}, 7 * 24 * 3600},
    {1, 500, "TÈy Tñy ®¬n", {2, 0, 136, 1}, 7 * 24 * 3600},
    {1, 100, "TÈy Tñy linh ®¬n", {2, 0, 137, 1}, 7 * 24 * 3600},
    {1, 1240, "§Êu hån", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 1000, "Th¸i H­ §a MËt Qu¶ ", {2, 1, 387, 1}, 7 * 24 * 3600},
    {1, 1009, "Tµng KiÕm anh hïng thiÕp", {2, 0, 31, 1}, 7 * 24 * 3600},
    {1, 1000, "R­¬ng BÝ KÝp", {2, 1, 30093, 1}, 7 * 24 * 3600},
    {1, 1, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 50, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 400, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
};

-- base 1000
SF_maxCountItemReward = 
{
	{3, 150, 5000000, 1},
	{1, 200, "Ch«m Ch«m", {2, 1, 30165, 50}},
	{1, 100, "ChiÕn ThÇn hoµn", {2, 1, 1005, 1}, 7 * 24 * 3600},
	{31, 10, "SF_get_bpy_weapon_201011()"},
	{1, 10, "Phi Yªn Th¹ch", {2, 1, 30130, 1}},
	{1, 1, "Thiªn Qu¸i Th¹ch", {2, 0, 1084, 1}},
	{1, 10, "Tö Quang ThÇn Th¹ch", {2, 1, 30131, 1}},
	{1, 5, "B¸ch Kim Hång Bao (trèng)", {2, 1, 30228, 1}, 7 * 24 * 3600},
	{1, 5, "Hoµng Kim §¹i Hång Bao (trèng)", {2, 1, 538, 1}, 7 * 24 * 3600},
	{1, 10, "Tö Kim Hång Bao (trèng)", {2, 1, 536, 1}, 7 * 24 * 3600},
	{1, 200, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 2}},
	{1, 1, "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", {2, 1, 1067, 1}, 7 * 24 * 3600},
	{1, 10, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1}},
	{1, 5, "Thiªn Th¹ch Linh Th¹ch", {2, 1, 1068, 1}, 7 * 24 * 3600},
	{1, 1, "L¨ng Ba Vi Bé", {0, 112, 78, 1}},
	{32, 282, 7000, 1},
}

SF_options = 
{
	"\nGhÐp §ãa Hoa H­íng D­¬ng (cÇn 5 Hoa H­íng D­¬ng + 1 GiÊy Gãi)/SF_composite1",
	"GhÐp §ãa Hoa H­íng D­¬ng (cÇn 5 Hoa H­íng D­¬ng + 2 vËt phÈm xu)/SF_composite2",
}

SF_results = 
{
	"Nguyªn liÖu mang theo kh«ng ®ñ",
	"Rêi khái",
	"C¸c h¹ ®· nhËn th­ëng",
	"§· kÝch ho¹t nhËn th­ëng kÌm vËt phÈm",
	"§· kÝch ho¹t nhËn th­ëng kh«ng kÌm vËt phÈm, t¨ng thªm 25% kinh nghiÖm",
	"Sè l­îng §ãa Hoa H­íng D­¬ng sö dông ®· ®¹t giíi h¹n 3000"
}

function SF_setMode(mode)
	SetTask(SF_modeTaskID, mode);
	WriteLogEx(VET_201011_EVENT_LOG_TITLE, "chØnh nhËn th­ëng lo¹i "..mode)
end

function SF_getMode()
	local result = GetTask(SF_modeTaskID);
	if 0 == result then
		result = 1
	end
	return result;
end

function SF_getUsedCount()
	return GetTask(SF_usedCountTaskID);
end

function SF_getUsedCountMode1()
	return GetTask(SF_usedCountMode1TaskID);
end

function SF_getUsedCountMode2()
	return GetTask(SF_usedCountMode2TaskID)
end

function SF_addUsedCount()
	SetTask(SF_usedCountTaskID, GetTask(SF_usedCountTaskID)+1);
	if 1 == SF_getMode() then
		SetTask(VET_201011_02_TASK_USED_COUNT_MODE1, GetTask(SF_usedCountMode1TaskID)+1);
	else
		SetTask(VET_201011_02_TASK_USED_COUNT_MODE2, GetTask(SF_usedCountMode2TaskID)+1);
	end
end

function SF_notEnoughMaterial()
	local title = SF_results[1];
	local menu = {SF_results[2]};
	Say(title, getn(menu), menu);
end

function SF_maxCount()
	--WriteLog("SF_maxCount::called");
	local title = SF_results[6];
	local menu = {SF_results[2]};
	Say(title, getn(menu), menu);
end

function SF_composite1()
	if GetItemCount(2,1,30250) < 5 or GetItemCount(2,1,30251) < 1 then
        Talk(1,"","H×nh nh­ ®¹i hiÖp ch­a mang ®ñ nguyªn liÖu, vui lßng thö l¹i!")
        return
    end
    if gf_Judge_Room_Weight(2,200," ") ~= 1 then
        return
    end
    if DelItem(2,1,30250, 5) == 1 and DelItem(2,1,30251, 1) == 1 then
        gf_AddItemEx2({2,1,30252, 1}, "§ãa Hoa H­íng D­¬ng", VET_201011_EVENT_LOG_TITLE, "ghÐp vËt phÈm",0,1)
    end
    SelectSay()
end

function SF_composite2()
	AskClientForNumber("confirm_SF_composite2", 1, 999, "Sè Hoa H­íng D­¬ng?")
end

function confirm_SF_composite2(nCount)
	if nCount == nil then
		return
	end
	local nQuantity = tonumber(nCount)
	if nQuantity < 1 or nQuantity > 999 then
		Talk(1, "", "Sè l­îng nhËp vµo kh«ng hîp lÖ, xin vui lßng nhËp l¹i!")
		return
	end
	if gf_Judge_Room_Weight(3, 200," ") ~= 1 then
        	return
     end
	if GetItemCount(2, 1, 30250) < (5 * nQuantity) or GetItemCount(2,1,30230) < (2 * nQuantity) then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ Hoa H­íng D­¬ng hoÆc vËt phÈm Xu ®Ó ®æi!")
		return
	end
	if DelItem(2, 1, 30250, 5 * nQuantity) == 1 and DelItem(2,1,30230, 2 * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 30252, nQuantity}, "§ãa Hoa H­íng D­¬ng", VET_201011_EVENT_LOG_TITLE, "ghÐp b»ng vËt phÈm Xu")
	end
	SelectSay()
end

function SF_getThresholdReward()
	local tSay = {}
	local szHeader = "§¹i hiÖp h·y chän lo¹i phÇn th­ëng:"
	
	tinsert(tSay, "20000000 ®iÓm kinh nghiÖm vµ vËt phÈm/#SF_confirm_getThresholdReward(1)")
	tinsert(tSay, "20 §iÓm N©ng CÊp B¹n §ång Hµnh vµ vËt phÈm/#SF_confirm_getThresholdReward(2)")
	tinsert(tSay, "1 §iÓm Linh Lùc B¹n §ång Hµnh vµ vËt phÈm/#SF_confirm_getThresholdReward(3)")
	tinsert(tSay, "Tho¸t/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function SF_confirm_getThresholdReward(nType)
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nType == 2 then
		if nCurPetLevel < 1 then
			Talk(1,"","§¹i hiÖp ch­a cã B¹n §ång Hµnh, kh«ng thÓ nhËn phÇn th­ëng nµy!")
			return
		end
	end
	if nType == 3 then
		if nCurPetLevel < 2 then
			Talk(1,"","B¹n §ång Hµnh ®¼ng cÊp 2 trë lªn míi cã thÓ nhËn phÇn th­ëng nµy!")
			return
		end
	end
	local title;
	local menu = {SF_results[2]};
	local usedCount = SF_getUsedCount(); 
	--WriteLog("used count: "..usedCount);
	--WriteLog("SF_useThreshold: "..SF_useThreshold);
	if usedCount >= SF_useThreshold then
		if 0 == GetTask(SF_ifGotRewardTaskID) then
			if 1 == gf_Judge_Room_Weight(2, 200, "") then
				SetTask(SF_ifGotRewardTaskID, 1);
				if nType == 1 then
					ModifyExp(SF_maxCountExpReward);
					Msg2Player("B¹n nhËn ®­îc 20000000 ®iÓm kinh nghiÖm")
				elseif nType == 2 then
					SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (20 * 100))
					Msg2Player("B¹n nhËn ®­îc 20 §iÓm N©ng CÊp B¹n §ång Hµnh")
				elseif nType == 3 then
					Pet_AddGP(1)
					Msg2Player("B¹n nhËn ®­îc 1 §iÓm Linh Lùc B¹n §ång Hµnh")
				end
				gf_EventGiveRandAward(SF_maxCountItemReward, 1000, 1, VET_201011_EVENT_LOG_TITLE, "nhËn th­ëng max event lo¹i "..nType);			
			end
		else
			title = "C¸c h¹ ®· nhËn th­ëng";
		end
	else
		title = "§· kÝch ho¹t ["..usedCount.."/3000] §ãa Hoa H­íng D­¬ng";
	end
	Say(title, getn(menu), menu);
end

function SF_onUse(itemIndex)
	if tonumber(date("%y%m%d")) < 101029 or tonumber(date("%y%m%d")) > 101205 then
		Talk(1,"","Sù kiÖn ®· kÕt thóc, kh«ng thÓ sö dông vËt phÈm nµy!")
		return
	end
	
	local usedCount = SF_getUsedCount();
	local mode = GetTask(SF_modeTaskID)
	if mode == 0 then
		Talk(1,"","B¹n vui lßng chän h×nh thøc nhËn th­ëng tr­íc!")
		return
	end
	if usedCount >= 3000 then
		SF_maxCount();
	else
		if 1 == gf_Judge_Room_Weight(2, 200, "") then
			if 1 == DelItemByIndex(itemIndex, 1) then
				ModifyExp(SF_expReward[mode])
				Msg2Player("B¹n nhËn ®­îc "..SF_expReward[mode].." ®iÓm kinh nghiÖm")
				if 1 == mode then
					if 0 == mod(usedCount+1, SF_specialTimes) then
						gf_EventGiveRandAward(SF_extraItemReward, 10000, 1, VET_201011_EVENT_LOG_TITLE, "nhËn th­ëng mèc 20");	
					else
						gf_EventGiveRandAward(SF_itemReward, 1000, 1, VET_201011_EVENT_LOG_TITLE, "nhËn th­ëng");
					end
					gf_WriteLogEx(VET_201011_EVENT_LOG_TITLE, "nhËn thuëng b×nh th­êng", 1, "§ãa Hoa H­íng D­¬ng", "2, 1, 30252");									
				else
					gf_WriteLogEx(VET_201011_EVENT_LOG_TITLE, "nhËn th­ëng ®iÓm kinh nghiÖm", 1, "§ãa Hoa H­íng D­¬ng", "2, 1, 30252");
				end
				SF_addUsedCount();
			end
		end
	end
end

function SF_activateItemMode()
	local title = SF_results[4];
	local menu = {SF_results[2]};
	SF_setMode(1);
	Say(title, getn(menu), menu);	
end

function SF_activateNonItemMode()
	local title = SF_results[5];
	local menu = {SF_results[2]};
	SF_setMode(2);
	Say(title, getn(menu), menu);	
end

function SF_exchange()
	if 0 == gf_ExchangeItemEx(SF_compositeTable3, VET_201011_EVENT_LOG_TITLE, "composite3") then
		SF_notEnoughMaterial();
	end
end

function SF_dialog(menu, title)
	if gf_CheckEventDateEx(SF_activityID) == 1 then
		title = SF_title
		for i=1, getn(SF_options) do
			tinsert(menu, SF_options[i]);
		end
	end
	return menu, title;
end

function SF_smallWisdomTreeReward()
	if gf_CheckEventDateEx(SF_activityID) == 1 then
		gf_GivePlantSmallTreeAward({2, 1, 30250, 75}, "Hoa H­íng D­¬ng", VET_201011_EVENT_LOG_TITLE);
	end
end

function SF_bigWisdomTreeReward()
	if gf_CheckEventDateEx(SF_activityID) == 1 then
		gf_GivePlantBigTreeAward({2, 1, 30250, 100}, "Hoa H­íng D­¬ng", VET_201011_EVENT_LOG_TITLE);
	end
end

function SF_soloMessengerQuestReward()
	if gf_CheckEventDateEx(SF_activityID) == 1 then
		gf_GiveDailyTaskPersonalAward({2, 1, 30250, 60}, "Hoa H­íng D­¬ng", VET_201011_EVENT_LOG_TITLE);
	end
end

function SF_partyMessengerQuestReward()
	if gf_CheckEventDateEx(SF_activityID) == 1 then
		gf_GiveDailyTaskTeamAward({2, 1, 30250, 60}, "Hoa H­íng D­¬ng", VET_201011_EVENT_LOG_TITLE);
	end
end	

function SF_get_bpy_weapon_201011()
	local nRand = random(1, 10000)
	local nTotal = 0
	for i = 1, getn(SF_weapon_bpy) do
		if nRand <= nTotal + SF_weapon_bpy[i][1] then
			gf_AddItemEx2(SF_weapon_bpy[i][3], SF_weapon_bpy[i][2], VET_201011_EVENT_LOG_TITLE, "nhËn phÇn th­ëng max event")
			break
		end
		nTotal = nTotal + SF_weapon_bpy[i][1]
	end
end

function give_sunflower()
	local nUsedDate = floor(GetTask(EVENT201011_GIVE_FLOWER) / 10)
	local nDate = tonumber(date("%y%m%d"))
	
	if nUsedDate ~= nDate then
		SetTask(EVENT201011_GIVE_FLOWER, nDate * 10)
	end
	
	local nCount = mod(GetTask(EVENT201011_GIVE_FLOWER), 10)	
	if nCount >= 3 then
		Talk(1,"","Mçi ngµy chØ cã thÓ d©ng hoa tèi ®a 3 lÇn mµ th«i!")
		return
	end
	if GetItemCount(2, 1, 30252) < 10 then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ 10 §ãa Hoa H­íng D­¬ng råi!")
		return
	end
	if DelItem(2, 1, 30252, 10) == 1 then
		ModifyExp(2000000)
		Msg2Player("NhËn ®­îc 2000000 ®iÓm kinh nghiÖm")
		gf_WriteLogEx("Hoat dong thang 11 n¨m 2010", "TÆng §ãa Hoa H­íng D­¬ng nhËn 2000000 exp")
		SetTask(EVENT201011_GIVE_FLOWER, GetTask(EVENT201011_GIVE_FLOWER) + 1)
	end
end

function do_nothing()

end