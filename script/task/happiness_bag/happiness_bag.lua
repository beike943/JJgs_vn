Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\plant\\tree_head.lua");
Include("\\script\\online\\viet_event\\200907\\5\\planttrees_head.lua");
Include("\\script\\online_activites\\task_values.lua");

HB_TASK_VALUE_KEY_USED_COUNT = VET_201011_HB_TASK_USED_COUNT;
HB_USED_MAX = 20;

HB_ITEM_TYPE_MAIN = 2;
HB_ITEM_TYPE_SUB1 = 1;
HB_ITEM_TYPE_SUB2 = 30241;
HB_ITEM_THRESHOLD_TIMES = 10;
HB_TEMP_TASK_VALUE_KEY_ITEM = VET_201011_HB_TASK_TEMP_ITEM_INDEX;
HB_ADDITIONAL_REWARD_EXP = 1500000;
HB_MINOR_REWARD_EXP = 100000;

HB_TREE_SEED_REWARD_TIME = 12;
HB_SMALL_WISDOM_TREE_REWARD_TIME = 8;
HB_BIG_WISDOM_TREE_REWARD_TIME1 = 4;
HB_BIG_WISDOM_TREE_REWARD_TIME2 = 8;

HBRewardSourceTable = {
	2,	--big battlefield
	1,	--small battlefield
	1,	--killer hall
	1,	--planting tree seeds
	2,	--small wisdom tree
	1	--big wisdom tree
};

function HBResetCounter()
	SetTask(HB_TASK_VALUE_KEY_USED_COUNT, 0);
end

function HBClearItem()
	local itemCount = BigGetItemCount(HB_ITEM_TYPE_MAIN, HB_ITEM_TYPE_SUB1, HB_ITEM_TYPE_SUB2);
	if 0 < itemCount then
		BigDelItem(HB_ITEM_TYPE_MAIN, HB_ITEM_TYPE_SUB1, HB_ITEM_TYPE_SUB2, itemCount);
	end
end

function HBDayBegin()
	HBResetCounter();
	HBClearItem();
end

function HBRewardSource(tableIndex)
	do return end
	local itemID = {HB_ITEM_TYPE_MAIN, HB_ITEM_TYPE_SUB1, HB_ITEM_TYPE_SUB2, HBRewardSourceTable[tableIndex]};
	local itemName = "Tói May M¾n";
	gf_AddItemEx2(itemID, itemName, "happiness bag", "reward");
end

function HBRewardInBigBattleField()
	HBRewardSource(1);
end

function HBRewardInSmallBattleField()
	HBRewardSource(2);
end

function HBRewardInKillerHall()
	HBRewardSource(3);
end

function HBRewardInPlantingTreeSeeds()
	if HB_TREE_SEED_REWARD_TIME == GetTask(TASK_PLANT_TREE_COUNT) then
		HBRewardSource(4);
	end
end

function HBRewardInBigWisdomTree()
	if HB_BIG_WISDOM_TREE_REWARD_TIME1 == GetTask(TASK_PLAN_BIGTREE_COUNT) then
		HBRewardSource(5);
	elseif HB_BIG_WISDOM_TREE_REWARD_TIME2 == GetTask(TASK_PLAN_BIGTREE_COUNT) then
		HBRewardSource(5);
	end	
end

function HBRewardInSmallWisdomTree()
	if HB_SMALL_WISDOM_TREE_REWARD_TIME == GetTask(TASK_PLAN_SMALLTREE_COUNT) then
		HBRewardSource(6);
	end
end

function HBBroadcast(rewardInfo)
	return AddGlobalCountNews("Chóc mõng "..GetName().."Më Tói May M¾n nhËn ®­îc"..rewardInfo..",ThËt may m¾n qu¸!", 1);
end

HBStrings = 
{
	"Chóc mõng ",
	"ThËt may m¾n qu¸!",
	"C¸c h¹ nhËn ®­îc 100 ®iÓm tu luyÖn",
	"C¸c h¹ nhËn ®­îc 200 ®iÓm tu luyÖn",
	"C¸c h¹ nhËn ®­îc 400 ®iÓm tu luyÖn",
	"C¸c h¹ nhËn ®­îc 800 ®iÓm tu luyÖn"
}

-- base 10000
HBMajoyRewardList = {
	{2, 1600, 100000},
	{2, 1200, 200000},
	{2, 800, 400000},
	{2, 350, 800000},
	{31, 50, "ModifyExp(10000000);HBBroadcast(\'".."10000000 ®iÓm kinh nghiÖm"..","..HBStrings[1].."\')"},
	{31, 500, "ModifyPopur(100);Msg2Player(\'"..HBStrings[3].."\')"},
	{31, 400, "ModifyPopur(200);Msg2Player(\'"..HBStrings[4].."\')"},
	{31, 300, "ModifyPopur(400);Msg2Player(\'"..HBStrings[5].."\')"},
	{31, 250, "ModifyPopur(800);Msg2Player(\'"..HBStrings[6].."\')"},
	{31, 50, "ModifyPopur(2000);HBBroadcast(\'".."2000 ®iÓm tu luyÖn,"..", "..HBStrings[1].."\')"},
	{4, 1000, 1},
	{4, 400, 2},
	{4, 300, 4},
	{4, 200, 8},
	{4, 100, 50},
	{5, 1000, 10},
	{5, 400, 20},
	{5, 300, 40},
	{5, 250, 80},
	{5, 50, 1000},
	{3, 200, 50000},
	{3, 100, 100000},
	{3, 100, 200000},
	{3, 95, 400000},
	{31, 5, "Earn(10000000);HBBroadcast(\'".."1000 vµng,"..", "..HBStrings[1].."\')"},
};

-- base 10000
HBAdditionalRewardList = {
	{6, 1300, 60, 1},
	{7, 100, 60, 1},
	{8, 100, 60, 1},
	{13, 1300, 60, 1},
	{10, 1300, 60, 1},
	{1, 1500, "Tö Hµ MËt tÞch", {0, 107, 65, 1}},
	{1, 1500, "Thiªn Hµ MËt tÞch", {0, 107, 64, 1}},
	{1, 1500, "Chiªm Y Phæ", {0, 107, 66, 1}},
	{1, 270, "§Êu hån", {2, 1, 1157, 1}, 7*24*3600},
	{1, 100, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1, 4}, 7*24*3600},
	{1, 5, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1, 4}, 1*24*3600},
	{1, 25, "Qu©n C«ng §¹i", {2, 1, 9978, 1, 4}, 1*24*3600},
	{1, 200, "Tö Quang Kim ThiÒn Ti", {2, 0, 737, 1}},
	{1, 200, "Tö Quang Kú L©n Vò", {2, 0, 736, 1}},
	{1, 200, "Tö Quang LiÖt DiÖm CÈm", {2, 0, 735 ,1}},
	{1, 200, "Th­îng Cæ Kú L©n HuyÕt", {2, 0, 739 ,1}},
	{1, 200, "M¶nh TiÖt Hoµnh Thó", {2, 0, 738 ,1}},
};

function OnUse(itemIndex)
	do return end
	SetTaskTemp(HB_TEMP_TASK_VALUE_KEY_ITEM, itemIndex);
	HBOpenUI();
	return 1;    
end

function HBOpenUI()
	local openedTimes = GetTask(HB_TASK_VALUE_KEY_USED_COUNT);
	local title = "Tói May M¾n: tói thÇn kú chøa ®Çy may m¾n.";
	title = title.."<enter>  ".."H«m nay c¸c h¹ ®· më "..openedTimes.." Tói May M¾n, chØ cã thÓ më thªm";
	if HB_ITEM_THRESHOLD_TIMES > openedTimes then
		title = title..(HB_ITEM_THRESHOLD_TIMES-openedTimes);
	else
		title = title.."0"
	end;
	title = title.." Tói lµ cã thÓ nhËn ®­îc phÇn th­ëng may m¾n råi.";
	title = title.."<enter><color=Red>".."Chó ý: sè l­îng Tói May M¾n më trong ngµy nhiÒu h¬n"..HB_ITEM_THRESHOLD_TIMES.." , tiÕp tôc më thªm chØ nhËn ®­îc"..HB_MINOR_REWARD_EXP.."Kinh nghiÖm.".."<color>";
	local menu = {};
	tinsert(menu, "Më Tói May M¾n".."/HBDoOpen");
	tinsert(menu, "KiÓm tra nguån xuÊt hiÖn cña Tói May M¾n".."/HBDoHelp");
	tinsert(menu, "Tho¸t".."/HBDoNothing");
	Say(title, getn(menu), menu);
end

function HBDoOpen()
	local openedTimes = GetTask(HB_TASK_VALUE_KEY_USED_COUNT);
	--WriteLog("opened times: "..openedTimes);
	if 0 <= openedTimes and openedTimes < HB_USED_MAX then
		if 1 == DelItemByIndex(itemIndex, -1) then
			if openedTimes+1 < HB_ITEM_THRESHOLD_TIMES then
				HBDoOpenPreThreshold();
			elseif openedTimes+1 == HB_ITEM_THRESHOLD_TIMES then
				HBDoOpenThreshold();
			else
				HBDoOpenPstThreshold();
			end
			SetTask(HB_TASK_VALUE_KEY_USED_COUNT, openedTimes+1);
			local itemIndex = GetTaskTemp(HB_TEMP_TASK_VALUE_KEY_ITEM);
			--WriteLog("delete item by index: "..itemIndex);
		end
	elseif openedTimes >= HB_USED_MAX then
	  -- TODO: refine it by SunZhuoshi
		Msg2Player("rÊt tiÕc, ®· ®¹t giíi h¹n sè l­îng ®­îc më trong ngµy"); 
	end
end

function HBMajorReward()
	do return end
	gf_EventGiveRandAward(HBMajoyRewardList, 10000, 1, "happiness bag", "major reward");
end

function HBAdditionalReward()
	if gf_Judge_Room_Weight(1,0,"") ~= 1 then
  	return
  end
  gf_EventGiveRandAward(HBAdditionalRewardList, 10000, 1, "happiness bag", "additional reward");
  gf_EventGiveCustomAward(1, ADDITIONAL_REWARD_EXP, 1, "happiness bag", "additional reward");
end

function HBMinorReward()
	gf_EventGiveCustomAward(1, HB_MINOR_REWARD_EXP, 1, "happiness bag", "minor reward");
end

function HBDoOpenPreThreshold()
	HBMajorReward();
end

function HBDoOpenThreshold()
	HBMajorReward();
	HBAdditionalReward();
end

function HBDoOpenPstThreshold()
	HBMinorReward();
end

function HBDoHelp()
	local title = "Th«ng qua tham dù ho¹t ®éng trong game, sÏ cã c¬ héi nhËn ®­îc Tói May M¾n, ho¹t ®éng cã kh¶ n¨ng xuÊt hiÖn: ";
	title = title.."<enter>".."ChiÕn tr­êng, S¸t Thñ §­êng, NhiÖm vô Vâ L©m Sø Gi¶ (c¸ nh©n vµ tæ ®éi), trång c©y, trång c©y B¸t Nh· lín nhá";
	local menu = {};
	tinsert(menu, "Tho¸t/HBDoNothing");
	tinsert(menu, "trë l¹i/HBOpenUI");
	Say(title, getn(menu), menu);
end

function HBDoNothing()
end