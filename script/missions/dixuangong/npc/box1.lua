--ÌìÒõ¾«Á¦Ïä
--ÏûºÄ20µã¾«Á¦´ò¿ª£¬´ò¿ªºó²»ÏûÊ§£¬Ã¿ÈËÃ¿¹Ø¿ÉÒÔ¿ªÆôÒ»´Î
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\settings\\static_script\\vip_feedback_system\\yinjuan_api.lua")

function main()
	Say("Ng­¬i x¸c ®Þnh tiªu hao 20 ®iÓm Tinh Lùc ®Ó më B¶o R­¬ng Thiªn ¢m Tinh Lùc kh«ng?", 2, "X¸c ®Þnh më/ensure_openBox", "T¹i h¹ chØ xem qua th«i/do_nothing");
end

tJingLiAward = {
	{1, 600, "M¶nh Thiªn M«n", {2, 1, 30410, 1, 4}, 0},
	--{1, 200, "ÌìÃÅËéÆ¬", {2, 1, 30410, 2, 4}, 0},
	--{1, 100, "ÌìÃÅËéÆ¬", {2, 1, 30410, 4, 4}, 0},
	{31, 1000, "rand_start_equip()", 1},
	{1, 600, "ThiÕt Tinh cÊp 2", {2, 1, 30534, 1, 4}, 0},
	{1, 200, "ThiÕt Tinh cÊp 3", {2, 1, 30535, 1, 4}, 0},
	{1, 100, "BÝ Ng©n To¶n", {2, 1, 30538, 1, 4}, 0},
	{1, 100, "BÝ Ng©n Chïy", {2, 1, 30539, 1, 4}, 0},
	{1, 500, "B¨ng Tinh Th¹ch", {2, 1, 30554, 1, 4}, 0},
	{1, 250, "M¶nh Thiªn th¹ch", {2, 2, 7, 1, 4}, 0},
	{1, 525, "Thiªn th¹ch", {2, 2, 8, 1, 4}, 0},
	{1, 25, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1, 4}, 0, 0, 0, 1},
	{1, 300, "Linh Th¹ch Nguyªn Th¹ch cÊp 4", {2, 1, 30416, 1, 4}, 0},
	{1, 200, "Linh Th¹ch Nguyªn Th¹ch cÊp 5", {2, 1, 30417, 1, 4}, 0},
	{1, 100, "Linh Th¹ch Nguyªn Th¹ch cÊp 6", {2, 1, 30418, 1, 4}, 0, 0, 0, 1},
	{31, 800, "api_daily_limit_award_yinquan(10,0)", 1},
	{31, 200, "api_daily_limit_award_yinquan(20,0)", 1},
	{31, 100, "api_daily_limit_award_yinquan(100,0)", 1},
	{1, 500, "CÊp 2 TÈy T©m Th¹ch", {2, 1, 30522, 1, 4}, 0},
	{1, 500, "CÊp 2 LuyÖn L« ThiÕt", {2, 1, 30528, 1, 4}, 0},
	{1, 100, "CÊp 3 TÈy T©m Th¹ch", {2, 1, 30523, 1, 4}, 0, 0, 0, 1},
	{1, 100, "CÊp 3 LuyÖn L« ThiÕt", {2, 1, 30529, 1, 4}, 0, 0, 0, 1},
	{1, 200, "Ngò Hoa Tô Nguyªn T¸n (søc m¹nh)", {1, 0, 261, 1, 1}, 0},
	{1, 200, "Ngò Hoa Tô Nguyªn T¸n (néi c«ng)", {1, 0, 262, 1, 1}, 0},
	{1, 200, "Ngò Hoa Tô Nguyªn T¸n (g©n cèt)", {1, 0, 263, 1, 1}, 0},
	{1, 200, "Ngò Hoa Tô Nguyªn T¸n (th©n ph¸p)", {1, 0, 264, 1, 1}, 0},
	{1, 200, "Ngò Hoa Tô Nguyªn T¸n (nhanh nhÑn)", {1, 0, 265, 1, 1}, 0},
	{1, 600, "H¾c Ngäc §o¹n Tôc Cao", {1, 0, 6, 1, 4}, 0},
	{1, 600, "Sinh Sinh Hãa T¸n", {1, 0, 16, 1, 4}, 0},
	{1, 600, "V¹n VËt Quy Nguyªn §¬n", {1, 0, 11, 1, 4}, 0},
	{1, 400, "Cöu chuyÓn håi hån ®¬n", {1, 0, 32, 1, 4}, 0},
}
function ensure_openBox()
	local nTeamIndex = MV_IS_OPENED_BOX_BEGIN + getIndexAtTeam();
	if GetMissionV(nTeamIndex) ~= 0 then
		Say("Ng­¬i ®· më B¶o R­¬ng Thiªn ¢m Tinh Lùc råi, kh«ng thÓ më l¹i", 0);
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0
	end
	local nRet1, nRet2 = ModifyEnergy(-20, 1);
	if -1 ~= nRet1 then
		local nRandIndex = gf_EventGiveRandAward(tJingLiAward, gf_SumRandBase(tJingLiAward), 1, "§Þa HuyÒn Cung", "Më R­¬ng §Þa HuyÒn Cung Thiªn ¢m Tinh Lùc");
		SetMissionV(nTeamIndex, 1);
		--¾«Á¦±¦Ïä¿ªÆô´ÎÊýÍ³¼Æ
		AddRuntimeStat(1,10,0,1);
		--Í³¼ÆµÀ¾ß
		if tJingLiAward[nRandIndex] then
			if tJingLiAward[nRandIndex][3] == "CÊp 3 LuyÖn L« ThiÕt" then
				AddRuntimeStat(1,16,0,tJingLiAward[nRandIndex][4][4]);
			elseif tJingLiAward[nRandIndex][3] == "CÊp 3 TÈy T©m Th¹ch" then
				AddRuntimeStat(1,17,0,tJingLiAward[nRandIndex][4][4]);
			elseif tJingLiAward[nRandIndex][3] == "BÝ Ng©n To¶n" then
				AddRuntimeStat(1,18,0,tJingLiAward[nRandIndex][4][4]);
			elseif tJingLiAward[nRandIndex][3] == "BÝ Ng©n Chïy" then
				AddRuntimeStat(1,19,0,tJingLiAward[nRandIndex][4][4]);
			end
		end
	else
		Say("Tinh Lùc kh«ng ®ñ, kh«ng thÓ më R­¬ng Thiªn ¢m Tinh Lùc.",0);	
	end
end

function do_nothing()
--do nothing
end

function getIndexAtTeam()
	for i = 1, GetTeamSize() do
		if PlayerIndex == GetTeamMember(i) then
			return i - 1;
		end
	end	
end

function rand_start_equip()
	local tAward = {
		{1, 7000, "¸o Choµng T¹o Bè", {0, 152, 1, 1, 4}, 0},
		{1, 2500, "¸o Choµng CÈm §o¹n", {0, 152, 2, 1, 4}, 0},
		{1, 380, "¸o Choµng Háa V©n", {0, 152, 3, 1, 4}, 0},
		{1, 20, "¸o Choµng Ngò Hµnh Kim ChÕ", {0, 152, 4, 1, 4}, 0, 0, 0, 1},
		{1, 20, "¸o Choµng Ngò Hµnh Méc ChÕ", {0, 152, 5, 1, 4}, 0, 0, 0, 1},
		{1, 20, "¸o Choµng Ngò Hµnh Thñy ChÕ", {0, 152, 6, 1, 4}, 0, 0, 0, 1},
		{1, 20, "¸o Choµng Ngò Hµnh Háa ChÕ", {0, 152, 7, 1, 4}, 0, 0, 0, 1},
		{1, 20, "¸o Choµng Ngò Hµnh Thæ ChÕ", {0, 152, 8, 1, 4}, 0, 0, 0, 1},
		{1, 20, "¸o Choµng Ngò Hµnh ¢m ChÕ", {0, 152, 9, 1, 4}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "§Þa HuyÒn Cung", "Më R­¬ng §Þa HuyÒn Cung Thiªn ¢m Tinh Lùc");
end