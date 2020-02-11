--ÁºÉ½¾«Á¦Ïä
--ÏûºÄ20µã¾«Á¦´ò¿ª£¬´ò¿ªºó²»ÏûÊ§£¬Ã¿ÈËÃ¿¹Ø¿ÉÒÔ¿ªÆôÒ»´Î
--Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\vip_feedback_system\\yinjuan_api.lua")
Include("\\script\\missions\\liangshan\\head.lua");

JINGLI_BOX_INDEX=0
function main()
	--SendScript2VM("\\script\\missions\\liangshan\\mission\\mission.lua", format("jingli_box_main()"))
	Say("Ng­¬i quyÕt ®Þnh tiªu hao 20 ®iÓm tinh lùc ®Ó më tinh lùc b¶o r­¬ng kh«ng?", 2, "X¸c ®Þnh më/ensure_openBox", "T¹i h¹ chØ xem qua th«i/do_nothing");
end

--function jingli_box_main()	
--	Say("ÄãÈ·¶¨ÏûºÄ20µã¾«Á¦¿ªÆô¾«Á¦±¦ÏäÂð£¿", 2, "È·¶¨¿ªÆô/ensure_openBox", "ÎÒÖ»ÊÇ¿´¿´¶øÒÑ/do_nothing");
--end

--µôÂäÁºÉ½¾«Á¦Ïä
function drop_jingli_box(nBossNpcIdx)
	do return end
--	if JINGLI_BOX_INDEX ~= 0 then--Ò»´ÎµôÒ»¸öÏä×Ó
--		return
--	end
--	set_jingli_box_open_flag(0)--ÏÈÇå³ý±êÖ¾Î»
--	local nLifeTime = nil
--	local m, x, y = GetNpcWorldPos(nBossNpcIdx);
--	if m and x and y then
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--    	local npc = CreateNpc("Ïä×ÓÇ®", "¾«Á¦±¦Ïä", m, x2, y2);
--    	if npc and npc > 0 then
--    		JINGLI_BOX_INDEX=npc
--    		if nLifeTime then
--        		SetNpcLifeTime(npc, nLifeTime);
--        	end
--        	SetNpcScript(npc, "\\script\\missions\\liangshan\\npc\\box_jingli.lua");
--    	else
--    		print(format("create npc jinglibox fail"))
--    	end
--	end
end

function remove_jingli_box()
	if JINGLI_BOX_INDEX ~= 0 then--Ò»´ÎµôÒ»¸öÏä×Ó
		SetNpcLifeTime(JINGLI_BOX_INDEX, 0);
	end
	JINGLI_BOX_INDEX=0
end

function set_jingli_box_open_flag(nVal)
	if 0 == nVal then
		JINGLI_BOX_INDEX=0
	end
	SetMissionV(MV_LS_OPEN_JINGLI_BOX_FLAG, nVal);
end

tJingLiAward = {
	{1, 300, "M¶nh Thiªn Cang", {2, 1, 30390, 1, 4}, 0},
	{1, 200, "M¶nh Thiªn Cang", {2, 1, 30390, 2, 4}, 0},
	{1, 100, "M¶nh Thiªn Cang", {2, 1, 30390, 4, 4}, 0},
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
	{1, 200, "Ngò Hoa Tô Nguyªn T¸n (søc m¹nh)", {1, 0, 261, 1}, 0},
	{1, 200, "Ngò Hoa Tô Nguyªn T¸n (néi c«ng)", {1, 0, 262, 1}, 0},
	{1, 200, "Ngò Hoa Tô Nguyªn T¸n (g©n cèt)", {1, 0, 263, 1}, 0},
	{1, 200, "Ngò Hoa Tô Nguyªn T¸n (th©n ph¸p)", {1, 0, 264, 1}, 0},
	{1, 200, "Ngò Hoa Tô Nguyªn T¸n (nhanh nhÑn)", {1, 0, 265, 1}, 0},
	{1, 600, "H¾c Ngäc §o¹n Tôc Cao", {1, 0, 6, 1, 4}, 0},
	{1, 600, "Sinh Sinh Hãa T¸n", {1, 0, 16, 1, 4}, 0},
	{1, 600, "V¹n VËt Quy Nguyªn §¬n", {1, 0, 11, 1, 4}, 0},
	{1, 400, "Cöu chuyÓn håi hån ®¬n", {1, 0, 32, 1, 4}, 0},
}
function ensure_openBox()
	local nOpenFlag = GetMissionV(MV_LS_OPEN_JINGLI_BOX_FLAG)
	local nTeamMemberBitIdx = getIndexAtTeam() + 1
	local bOpened = SafeGetBit(nOpenFlag, nTeamMemberBitIdx)
	if bOpened ~= 0 then
		Say("Ng­¬i ®· më b¶o r­¬ng tinh lùc råi, kh«ng thÓ më tiÕp.", 0);
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0
	end
	local nRet1, nRet2 = ModifyEnergy(-20, 1);
	if -1 ~= nRet1 then
		set_jingli_box_open_flag(SafeSetBit(nOpenFlag, nTeamMemberBitIdx, 1))
		local nRandIndex = gf_EventGiveRandAward(tJingLiAward, gf_SumRandBase(tJingLiAward), 1, "L­¬ng S¬n", "Më b¶o r­¬ng tinh lùc L­¬ng S¬n");
		
		
--		--¾«Á¦±¦Ïä¿ªÆô´ÎÊýÍ³¼Æ
--		AddRuntimeStat(1,10,0,1);
--		--Í³¼ÆµÀ¾ß
--		if tJingLiAward[nRandIndex] then
--			if tJingLiAward[nRandIndex][3] == "3¼¶Á¶Â¯Ìú" then
--				AddRuntimeStat(1,16,0,tJingLiAward[nRandIndex][4][4]);
--			elseif tJingLiAward[nRandIndex][3] == "3¼¶Ï´ÐÄÊ¯" then
--				AddRuntimeStat(1,17,0,tJingLiAward[nRandIndex][4][4]);
--			elseif tJingLiAward[nRandIndex][3] == "ÃØÒø×ê" then
--				AddRuntimeStat(1,18,0,tJingLiAward[nRandIndex][4][4]);
--			elseif tJingLiAward[nRandIndex][3] == "ÃØÒø´¸" then
--				AddRuntimeStat(1,19,0,tJingLiAward[nRandIndex][4][4]);
--			end
--		end
	else
		Say("Tinh lùc kh«ng ®ñ, kh«ng thÓ më b¶o r­¬ng tinh lùc.",0);	
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
		{1, 7000, "Huy Ch­¬ng §ång ChÕ", {0, 153, 1, 1, 4}, 0},
		{1, 2500, "Huy Ch­¬ng ThiÕt ChÕ", {0, 153, 2, 1, 4}, 0},
		{1, 380, "Huy Ch­¬ng Ngäc ChÕ", {0, 153, 3, 1, 4}, 0},
		{1, 20, "Huy Ch­¬ng Kim ChÕ ngò hµnh", {0, 153, 4, 1, 4}, 0, 0, 0, 1},
		{1, 20, "Huy Ch­¬ng Méc ChÕ ngò hµnh", {0, 153, 5, 1, 4}, 0, 0, 0, 1},
		{1, 20, "Huy Ch­¬ng Thñy ChÕ ngò hµnh", {0, 153, 6, 1, 4}, 0, 0, 0, 1},
		{1, 20, "Huy Ch­¬ng Háa ChÕ ngò hµnh", {0, 153, 7, 1, 4}, 0, 0, 0, 1},
		{1, 20, "Huy Ch­¬ng Thæ ChÕ ngò hµnh", {0, 153, 8, 1, 4}, 0, 0, 0, 1},
		{1, 20, "Huy Ch­¬ng ¢m ChÕ ngò hµnh", {0, 153, 9, 1, 4}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "L­¬ng S¬n", "Më b¶o r­¬ng tinh lùc");
end