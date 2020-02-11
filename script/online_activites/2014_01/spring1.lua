--´º½Ú¸±»î¶¯2
Include("\\script\\lib\\globalfunctions.lua") --¹«¹²º¯ÊýÎÄ¼þ
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

VET_201401_SPRING1_ACTIVITYID = 109;

VET_201401_SPRING1_MAIN = "TÕt Cæ TruyÒn/Vet_201401_sprint1_main";

VET_201401_SPRING1_TASK = TaskManager:Create(10, 7)
VET_201401_SPRING1_TASK.DaySeq = 1;
VET_201401_SPRING1_TASK.ACCEPT = 2;
VET_201401_SPRING1_TASK.AWARD = 3;
VET_201401_SPRING1_TASK.TEAM = 4;
VET_201401_SPRING1_TASK.KILLWILDPIG = 5;
VET_201401_SPRING1_TASK.TRIGGER = 6;
VET_201401_SPRING1_TASK.TeamCode = 7;

function Vet_201401_sprint1_main()
--	if gf_CheckBaseCondition(88, 1) ~= 1 and gf_GetPlayerRebornCount() <= 0 then
--		Talk(1,"","CÊp 88 trë lªn häc hÕt kü n¨ng 55 hoÆc ®· chuyÓn sinh míi cã thÓ tham gia ho¹t ®éng");
--		return 0;
--	end
	if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.DaySeq,zgc_pub_day_turn());
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.ACCEPT,0);
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.AWARD,0);
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.TEAM,0);
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.TRIGGER,0);
	end
	local tSay = {
		"NhËn nhiÖm vô TÕt Cæ TruyÒn/Vet_201401_AcceptSprintTask",
		"NhËn phÇn th­ëng nhiÖm vô TÕt Cæ TruyÒn/Vet_201401_GetAward",
		"PhÇn th­ëng tæ ®éi/Vet_201401_OpenTeamAward",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say("B¹o tróc thanh trung nhÊt tuÕ trõ, xu©n phong tèng no·n nhËp ®å t«!", getn(tSay), tSay);
end

function Vet_201401_AcceptSprintTask(bTag)
	local nKillWildPig = VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.KILLWILDPIG);
	if not bTag then
		Say(format("1: Tiªu hao 100 L¸ Dong + 100 §Ëu Xanh ThÞt Heo + 10 Vµng\n2: §¸nh b¹i 100 con Heo Rõng (%d/%d)", nKillWildPig, 100),
			 2, "§ång ý/#Vet_201401_AcceptSprintTask(1)", "trë l¹i/Vet_201401_sprint1_main");
		return 0;
	end
	if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.ACCEPT) ~= 0 then
		Talk(1,"","NhiÖm vô TÕt Cæ TruyÒn mçi ngµy chØ cã thÓ nhËn vµ hoµn thµnh 1 lÇn");
		return 0;
	end
	if GetItemCount(2, 1, 30619) < 100 then
		Talk(1,"",format("Hµnh trang kh«ng gian %s kh«ng ®ñ %d", "L¸ Dong", 100));
		return 0;
	end
	if GetItemCount(2, 1, 30620) < 100 then
		Talk(1,"",format("Hµnh trang kh«ng gian %s kh«ng ®ñ %d", "§Ëu Xanh ThÞt Heo", 100));
		return 0;
	end
	if GetCash() < 10*10000 then
		Talk(1,"",format("Hµnh trang kh«ng gian %s kh«ng ®ñ %d", "Vµng", 10).." Kim ");
		return 0;
	end
	if DelItem(2, 1, 30619, 100) ~= 1 or DelItem(2, 1, 30620, 100) ~= 1 or Pay(10*10000) ~= 1 then
		return 0;
	end
	VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.ACCEPT, 1);
	Msg2Player(format("Tiªu hao %s*%d", "L¸ Dong", 100));
	Msg2Player(format("Tiªu hao %s*%d", "§Ëu Xanh ThÞt Heo", 100));
	if nKillWildPig < 100 then
		Msg2Player("§¹i hiÖp nhanh chãng ®i t×m Heo Rõng vµ tiªu diÖt nã!");
	else
		Msg2Player("Nhanh nhËn phÇn th­ëng ®i!");
	end
end

function Vet_201401_Kill_WildPig(sName)
	if gf_CheckEventDateEx(VET_201401_SPRING1_ACTIVITYID) ~= 1 then
		return 0;
	end
	if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.ACCEPT) ~= 1 then
		return 0;
	end
	local nCount = VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.KILLWILDPIG);
	if nCount >= 100 then
		return 0;
	end
	if sName == "Heo rõng" then
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.KILLWILDPIG, nCount + 1);
		Msg2Player(format("NhiÖm vô TÕt Cæ TruyÒn: ®¸nh b¹i %s%d/%d", sName, min(nCount + 1, 100), 100));
	end
end

function Vet_201401_GetAward()
	if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.AWARD) ~= 0 then
		Talk(1,"","Ng­¬i ®· nhËn phÇn th­ëng nhiÖm vô TÕt Cæ TruyÒn råi")
		return 0;
	end
	if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.ACCEPT) ~= 1 then
		Talk(1,"","Ng­¬i vÉn ch­a nhËn nhiÖm vô TÕt Cæ TruyÒn");
		return 0;
	end
	if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.KILLWILDPIG) < 100 then
		Talk(1,"","Ng­¬i ch­a hoµn thµnh nhiÖm vô ®¸nh b¹i 100 con Heo Rõng");
		return 0;
	end
	if gf_Judge_Room_Weight(3, 10, " ") ~= 1 then
		return 0;
	end
	VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.AWARD, 1);
	gf_Modify("Exp", 20142014);
  gf_AddItemEx2({2,95,208,1,4}, "Tô NghÜa LÖnh", "Event phô 2 th¸ng 1", "", 0, 1);
  gf_AddItemEx2({2,1,30409,1,4}, "Th«ng Thiªn LÖnh", "Event phô 2 th¸ng 1", "", 0, 1);
  gf_AddItemEx2({2,1,30623,1,4}, "Bao L× X× n¨m 2014", "Event phô 2 th¸ng 1", "", 24*3600, 1);
end

function Vet_201401_OpenTeamAward()
	if GetTeamSize() ~= 8 then
		Talk(1,"",format("Nh©n sè tæ ®éi kh«ng ®ñ %d ng­êi", 8));
		return 0;
	end
	if GetCaptainName() ~= GetName() then
		Talk(1,"","Ng­¬i kh«ng ph¶i ®éi tr­ëng");
		return 0;
	end
	local oldPlayerIdx = PlayerIndex;
	local bIsShow = nil;
	local msg = "Thµnh viªn ®· sö dông phÇn th­ëng tæ ®éi: \n"
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.TEAM) ~= 0 or GetTrigger(1535*2) > 0 then
			msg = msg.."<color=red>"..GetName().."<color>\n";
			bIsShow = 1;
		end
	end
	PlayerIndex = oldPlayerIdx;
	if bIsShow then
		Talk(1,"",msg);
		return 0;
	end
	local msg1 = "Thµnh viªn kh«ng ®ñ nguyªn liÖu: \n"
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetItemCount(2,1,30623) < 1 or GetCash() < 2*10000 then
			msg1 = msg1.."<color=red>"..GetName().."<color>\n";
			bIsShow = 1;
		end
	end
	PlayerIndex = oldPlayerIdx;
	if bIsShow then
		Talk(1,"",msg1);
		return 0;
	end
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if DelItem(2,1,30623,1) ~= 1 or Pay(2*10000) ~= 1 then
			PlayerIndex = oldPlayerIdx;
			return 0;
		end
	end
	PlayerIndex = oldPlayerIdx;
	SetCreateTeam(1);
	local nTeamCode = 0;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.TEAM, 1);
		nTeamCode = nTeamCode + tonumber(PlayerIndex);
	end
	PlayerIndex = oldPlayerIdx;
	local nTrigger = CreateTrigger(1, 1535, 1535*2);
	if nTrigger > 0 then
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.TRIGGER, 0);
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.TeamCode, nTeamCode);
		ContinueTimer(nTrigger);
		gf_Msg2Team("Më thµnh c«ng phÇn th­ëng tæ ®éi, kh«ng cÇn tiÕn hµnh thao t¸c kh¸c vµ ®õng rêi m¹ng");
	end
end

function Vet_201401_OnTimer()
	local oldPlayerIdx = PlayerIndex;
	local nTeamCode = 0;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		nTeamCode = nTeamCode + tonumber(PlayerIndex);
	end
	PlayerIndex = oldPlayerIdx;
	if GetCaptainName() ~= GetName() or GetTeamSize() ~= 8 
		or VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.TeamCode) ~= nTeamCode then
		RemoveTrigger(GetTrigger(1535*2));
		gf_Msg2Team("PhÇn th­ëng tæ ®éi kÕt thóc!");
		SetCreateTeam(0);
		return 0;
	end
	local nTimes = VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.TRIGGER);
	if nTimes > 40 then
		RemoveTrigger(GetTrigger(1535*2));
		gf_Msg2Team("PhÇn th­ëng tæ ®éi kÕt thóc!");
		SetCreateTeam(0);
		return 0;
	end
	gf_TeamOperateEX(function ()
		if gf_CheckBaseCondition(88, 1) == 1 or gf_GetPlayerRebornCount() > 0 then
			gf_ModifyExp(250000);
		end
	end)
	VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.TRIGGER, nTimes + 1);
end