--´º½Ú¸±»î¶¯3
Include("\\script\\lib\\globalfunctions.lua") --¹«¹²º¯ÊýÎÄ¼þ
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

VET_201401_VALENTINE_ACTIVITYID = 110;

VET_201401_VALENTINE_MAIN = "LÔ T×nh Nh©n 2014/Vet_201401_Valentine_Main";

VET_201401_VALENTINE_TASK = TaskManager:Create(1, 15)
VET_201401_VALENTINE_TASK.DaySeq = 1
VET_201401_VALENTINE_TASK.HuiTuZi = 2
VET_201401_VALENTINE_TASK.BaiTuZi = 3
VET_201401_VALENTINE_TASK.Task = 4
VET_201401_VALENTINE_TASK.Present = 5
VET_201401_VALENTINE_TASK.Award = 6
VET_201401_VALENTINE_TASK.MaleTimes = 7

function Vet_201401_Valentine_Main()
	if gf_GetPlayerRebornCount() < 1 then
		Talk(1,"","Nh©n vËt chuyÓn sinh 1 trë lªn míi tham gia ®­îc ho¹t ®éng");
		return 0;
	end
	if VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.DaySeq, zgc_pub_day_turn());
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Present, 0);
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Award, 0);
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.MaleTimes, 0);
	end
	local tSay = {
		"NhËn nhiÖm vô LÔ T×nh Nh©n/Vet_201401_Valentine_Task",
		"NhËn th­ëng LÔ T×nh Nh©n/Vet_201401_Valentine_Award",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say("NguyÖn cho thÕ gian h÷u t×nh nh©n duyªn!", getn(tSay), tSay);
end

function Vet_201401_Valentine_Task(bAccept)
	if GetSex() ~= 2 then
		Talk(1,"","ChØ cã n÷ nh©n vËt míi cã thÓ nhËn nhiÖm vô");
		return 0;
	end
	if bAccept and tonumber(bAccept) == 1 then
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Task, 1);
		Msg2Player("§¹i hiÖp nhanh chãng ®i t×m Thá X¸m vµ Thá Tr¾ng ®Ó tiªu diÖt nã!");
		return 1;
	end
	local nHuituzi = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.HuiTuZi);
	local nBaituzi = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.BaiTuZi);
	local msg = format("1: §¸nh b¹i %d Thá X¸m <color=yellow>(%d/%d)<color>\n2: §¸nh b¹i %d Thá Tr¾ng <color=yellow>(%d/%d)<color>",
		 1402, nHuituzi, 1402, 1402, nBaituzi, 1402);
	local tSay = {};
	if nBaituzi >= 1402 and nHuituzi >=1402 then
		tinsert(tSay, "§· hoµn thµnh nhiÖm vô nµy/nothing");
	else
		if VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.Task) == 0 then
			tinsert(tSay, "NhËn nhiÖm vô LÔ T×nh Nh©n/#Vet_201401_Valentine_Task(1)");
			tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing");
		else
			tinsert(tSay, "NhiÖm vô ch­a hoµn thµnh/nothing");
		end
	end
	Say(msg, getn(tSay), tSay);
end

function Vet_201401_Valentine_Trigger(sName)
	if gf_CheckEventDateEx(VET_201401_VALENTINE_ACTIVITYID) ~= 1 then
		return 0;
	end
	if VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.Task) ~= 1 then
		return 0;
	end
	local nHuituzi = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.HuiTuZi);
	local nBaituzi = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.BaiTuZi);
	if nHuituzi >= 1402 and nBaituzi >= 1402 then
		return 0;
	end
	if sName == "Thá x¸m" and nHuituzi < 1402 then
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.HuiTuZi, nHuituzi + 1);
		Msg2Player(format("NhiÖm vô LÔ T×nh Nh©n: ®¸nh b¹i %s%d/%d", sName, nHuituzi + 1, 1402));
	end
	if sName == "Thá rõng" and nBaituzi < 1402 then
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.BaiTuZi, nBaituzi + 1);
		Msg2Player(format("NhiÖm vô LÔ T×nh Nh©n: ®¸nh b¹i %s%d/%d", sName, nBaituzi + 1, 1402));
	end
end

function Vet_201401_Valentine_Award()
	if GetSex() ~= 2 then
		Talk(1,"","PhÇn th­ëng nµy chØ cã nh©n vËt n÷ sö dông");
		return 0;
	end
	local nHuituzi = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.HuiTuZi);
	local nBaituzi = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.BaiTuZi);
	if nHuituzi < 1402 or nBaituzi < 1402 then
		Talk(1,"","Ng­¬i ch­a hoµn thµnh nhiÖm vô LÔ T×nh Nh©n");
		return 0;
	end
	local nUseTime = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.Present);
	local tSay = {
		format("Tiªu hao 1402 Tiªu Dao Ngäc + 999 Tµng Hång Hoa ®Ó nh©n vËt nam trong tæ ®éi nhËn th­ëng (%d/%d)/#Vet_201401_Valentine_Present(%d)", nUseTime, 3, nUseTime),
		"Ta muèn nhËn phÇn th­ëng LÔ T×nh Nh©n 2014/Vet_201401_Valentine_Award_deal",
		"T¹i h¹ chØ xem qua th«i/nothing"
	}
	Say("NguyÖn cho thÕ gian h÷u t×nh nh©n duyªn!", getn(tSay), tSay);
end

function Vet_201401_Valentine_Present(nUseTime)
	if tonumber(nUseTime) >= 3 then
		Talk(1,"",format("Mçi ngµy mçi nh©n vËt nhiÒu nhÊt chØ cã thÓ sö dông phÇn th­ëng %d lÇn", 3));
		return 0;
	end
	if GetCaptainName() ~= GetName() then
		Talk(1,"","Ng­¬i kh«ng ph¶i ®éi tr­ëng, kh«ng thÓ sö dông tÝnh n¨ng nµy!");
		return 0;
	end
	local oldPlayerIdx = PlayerIndex;
	local malePlayerIdx = nil
	local maleName = nil
	local maleCount = 0;
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i);
		if GetSex() == 1 then
			maleCount = maleCount + 1;
			malePlayerIdx = PlayerIndex;
			maleName = GetName();
		end
	end
	PlayerIndex = oldPlayerIdx;
	if maleCount == 0 then
		Talk(1,"","Tæ ®éi kh«ng cã nh©n vËt nam");
		return 0;
	end
	if maleCount > 1 then
		Talk(1,"",format("Trong tæ ®éi sè l­îng nh©n vËt nam v­ît qu¸ %d ng­êi", 1));
		return 0;
	end
	if GetItemCount(2, 1, 30603) < 1402 then
		Talk(1,"",format("Trong hµnh trang %s sè l­îng kh«ng ®ñ %d", "Tiªu Dao Ngäc", 1402));
		return 0;
	end
	if GetItemCount(1, 2, 1) < 999 then
		Talk(1,"",format("Trong hµnh trang %s sè l­îng kh«ng ®ñ %d", "Tµng Hång Hoa", 999));
		return 0;
	end
	--------------------------
	PlayerIndex = malePlayerIdx;
	if VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.DaySeq, zgc_pub_day_turn());
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Present, 0);
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Award, 0);
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.MaleTimes, 0);
	end
	local nMaleTimes = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.MaleTimes);
	PlayerIndex = oldPlayerIdx;
	if nMaleTimes ~= 0 then
		Talk(1,"","Nh©n vËt nam nµy ®· nhËn lÔ vËt LÔ T×nh Nh©n råi");
		return 0;
	end
	---------------------------
	if DelItem(2, 1, 30603, 1402) ~= 1 or DelItem(1, 2, 1, 999) ~= 1 then
		return 0;
	end
	VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Present, tonumber(nUseTime) + 1);
	----------------------------------------------
	PlayerIndex = malePlayerIdx;
	VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.MaleTimes, 1);
	gf_ModifyExp(520520520);
	gf_EventGiveCustomAward(4, 520, 1, "Event phô 3 th¸ng 1");
  gf_EventGiveCustomAward(3, 520, 1, "Event phô 3 th¸ng 1");
  gf_EventGiveCustomAward(31, 520, 1, "Event phô 3 th¸ng 1");
  AwardGenuineQi(520);
  PlayerIndex = oldPlayerIdx;
  ----------------------------------------------
  local msg = format("[%s] h­íng vÒ [%s] d©ng tÆng lÔ vËt t×nh nh©n, nguyÖn cho thÕ gian h÷u t×nh nh©n duyªn!", GetName(), maleName);
  Msg2Global(msg);
end

function Vet_201401_Valentine_Award_deal()
	if VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.Award) ~= 0 then
		Talk(1,"","§· nhËn th­ëng LÔ T×nh Nh©n");
		return 0;
	end 
	local nUseTime = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.Present);
	if nUseTime < 3 then
		Talk(1,"",format("Sè lÇn d©ng tÆng quµ LÔ T×nh Nh©n cho nam sÜ kh«ng ®ñ %d", 3));
		return 0;
	end
	if gf_Judge_Room_Weight(5, 100, "") ~= 1 then
		return 0;
	end
	VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Award, 1);
	gf_ModifyExp(25251325);
	AwardGenuineQi(1402);
	local tAward = {
		{"Nh·n", 2,	1,	30164},
		{"Ch«m Ch«m", 2,	1,	30165},
		{"Cam", 2,	1,	30166},
		{"Dõa", 2,	1,	30167},
		{"M¨ng côt", 2,	1,	30168},
		{"B­ëi", 2,	1,	30169},
		{"D©u", 2,	1,	30170},
		{"Chuèi", 2,	1,	30171},
		{"Xoµi", 2,	1,	30172},
		{"§µo", 2,	1,	30173},
		{"MËn", 2,	1,	30174},
		{"V¶i", 2,	1,	30175},
		{"T¸o", 2,	1,	30176},
		{"B¬", 2,	1,	30177},
		{"§u §ñ", 2,	1,	30178},
		{"M·ng CÇu", 2,	1,	30179},
		{"Khãm", 2,	1,	30180},
		{"Lª", 2,	1,	30181},
		{"Bßn Bon", 2,	1,	30182},
		{"KhÕ", 2,	1,	30183},		
	}
--	for i = 1, 87 do
--		local nRand = random(getn(tAward));
--		AddItem(tAward[nRand][2], tAward[nRand][3], tAward[nRand][4], 16);
--	end
		local nRandom = mod(random(1,10000),20)
		AddItem(2,1,(30164 + nRandom), 1402)
end