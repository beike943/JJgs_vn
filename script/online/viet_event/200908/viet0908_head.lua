--=============================================
--create by baiyun 2009.7.16
--describe:Ô½ÄÏ°æ8ÔÂ·Ý»î¶¯Í·ÎÄ¼þ
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua");

VIET_0908_TASK_KILL_HALL_EXP_DATE = 2081;			--É±ÊÖÌÃ¾­Ñé»ñµÃÈÕÆÚ(Ö»¶¨Òå×ö¼ÇÂ¼ÓÃ)
VIET_0908_TASK_KILL_HALL_EXP = 2082;					--É±ÊÖÌÃ»ñµÃµÄ¾­ÑéÊý(Ö»¶¨Òå×ö¼ÇÂ¼ÓÃ)
VIET_0908_TASK_SHIMEN_GET_PUTAO_DATE = 2083;	--Í¨¹ýÊ¦ÃÅÈÎÎñ»ñµÃÆÏÌÑµÄÈÕÆÚ
VIET_0908_TASK_SHIMEN_GET_PUTAO_COUNT = 2084;	--Í¨¹ýÊ¦ÃÅÈÎÎñ»ñµÃÆÏÌÑµÄ´ÎÊý
VIET_0908_TASK_ALREADY_GET_EXP = 2085;				--ÒÑ¾­»ñµÃµÄ¾­ÑéÊýÁ¿
VIET_0908_TASK_SHANGXIAN_AWORD = 2086;				--»ñµÃÉÏÏß½±ÀøµÄÈÕÆÚ
VIET_0908_TASK_GET_SHAQI_DATE = 2087;					--»ñµÃÉ±ÆøÖµµÄÈÕÆÚ
VIET_0908_TASK_GET_SHAQI_COUNT = 2088;				--»ñµÃÉ±ÆøÖµµÄÊýÁ¿


VIET_0908_CONST_SHIMEN_GET_MAX = 10;					--Ã¿Ìì×î¶àÊ®´Î»ñµÃÊ¦ÃÅÈÎÎñÆÏÌÑ½±Àø
VIET_0908_CONST_MAX_EXP = 200000000;					--Ê¹ÓÃ¸÷ÖÖÌÇ×î¶à»ñµÃµÄ¾­Ñé

--Í¨¹ýÊ¦ÃÅÈÎÎñ»ñµÃµÄÆÏÌÑµÄÊýÁ¿
tVIET_SHIMEN_PUTAO = {
	[1] = 10,
	[2] = 10,
	[3] = 10,
	[4] = 10,
	[5] = 50,
	[6] = 60,
	[7] = 70,
	[8] = 70,
	[9] = 80,
};

tVIET_0908_HECHENG = {
	{{{"Nho", 4, 2, 1, 30098}, {"Tói H­¬ng LiÖu", 1, 2, 1, 30101}}, {"KÑo Nho", {2, 1, 30102, 1}, "Keo Nho"}},
	{{{"M·ng cÇu", 4, 2, 1, 30099}, {"Tói H­¬ng LiÖu", 1, 2, 1, 30101}}, {"KÑo M·ng CÇu", {2, 1, 30103, 1}, "Keo Mang Cau"}},
	{{{"SÇu riªng", 4, 2, 1, 30100}, {"Tói H­¬ng LiÖu", 1, 2, 1, 30101}}, {"KÑo SÇu Riªng", {2, 1, 30104, 1}, "Keo Sau Rieng"}},
};

str_VIET_0908_LOG_TITLE = "[Hoat dong thang 8]";

--ÉÏÏß½±Àø
tVIET_0908_SHANGXIAN_AWORD = {
	{3000, 3999, 200000},
	{4000, 4999, 300000},
	{5000, 5999, 400000},
	{6000, 6999, 500000},
	{7000, 7999, 600000},
	{8000, 8999, 700000},
	{9000, 9999, 800000},
	{10000, 10999, 900000},
	{11000, 14999, 1000000},
	{15000, 19999, 1100000},
	{20000, 24999, 1200000},
	{25000, 0, 1300000},
};
--ÕòÅÉ¼¼ÄÜID
tbViet_0908_SkillID = 
	{
		[0] = 0,
		[1] = 0,	
		[2] = 32,	--ÉÙÁÖË×¼Ò,Ò×½î¾­
		[3] = 57,	--ÉÙÁÖìøÉ®,Ï´Ëè¾­
		[4] = 44,	--ÉÙÁÖÎäÉ®,ÈçÀ´ÉñÕÆ
		[5] = 0,			--ÌÆÃÅ
		[6] = 74,	--ÌÆÃÅ,ÎüÐÇÕó
		[7] = 0,			--¶ëáÒ
		[8] = 89,	--¶ëáÒ·ð¼Ò,ÍòÏàÉñ¹¦
		[9] = 102,	--¶ëáÒË×¼Ò,ÌìÒôÕò»êÇú
		[10] = 0,			--Ø¤°ï
		[11] = 113,--Ø¤°ï¾»ÒÂ,½µÁúÊ®°ËÕÆ
		[12] = 124,--Ø¤°ïÎÛÒÂ,´ò¹·¹÷Õó
		[13] = 0,			--Îäµ±
		[14] = 146,--Îäµ±µÀ¼Ò,ÎÞÉÏÌ«¼«½£
		[15] = 159,--Îäµ±Ë×¼Ò,Ì«¼«Éñ¹¦
		[16] = 0,			--ÑîÃÅ
		[17] = 732,--ÑîÃÅÇ¹Æï,Á¬»·×êÁúÇ¹
		[18] = 745,--ÑîÃÅ¹­Æï,°ÔÍõÏè·ï¼ý
		[19] = 0,			--Îå¶¾
		[20] = 775,--Îå¶¾Ð°ÏÀ,ÎÞÌìÄ§¹¦
		[21] = 774,--Îå¶¾¹ÆÊ¦,ÎÞÓ°Ä§¹Æ
};
	
tVIET_0908_MIJI = {
	{"Tø Linh Thiªn ý Phæ", 30, {0, 107, 160, 1}},
	{"Tø Linh Tö ý Phæ", 30, {0, 107, 161, 1}},
	{"Tø Linh ChiÕn ý Phæ", 30, {0, 107, 159, 1}},
	{"B¸ch Th¶o mËt tÞch", 10, {0, 107, 156, 1}},
};

tVIET_0908_MIJI_EXCHANGE = {
	{{0, 107, 64, 4}, {2, 1, 30105, 1}},
	{{0, 107, 65, 4}, {2, 1, 30105, 1}},
	{{0, 107, 66, 2}, {2, 1, 30105, 1}},
};

--ÌÇ½±Àø
--¸ÅÂÊ»ùÊý10000000
--ÎïÆ·£ºÎïÆ·Ãû×Ö£¬¸ÅÂÊ£¬ID±í£¬ÀàÐÍ£¬ÏûÊ§Ê±¼ä
--ÃüÁî£ºÃüÁîÖÖÀà£¬¸ÅÂÊ£¬ÃüÁî±í´ïÊ½£¬ÃüÁî²ÎÊý£¬0
--ÀàÐÍ>0ÃüÁî£¬=0ÎïÆ·
tVIET_0908_TANG_AWARD = {
	{"Bµn Long bÝch", 625000, {2, 1, 1000, 1}, 0, 7 * 24 * 3600},
	{"M¶nh Thiªn th¹ch", 1250000, {2, 2, 7, 1}, 0, 0},
	{"Thiªn th¹ch", 1250000, {2, 2, 8, 1}, 0, 0},
	{"M¶nh B¨ng th¹ch", 2187500, {2, 1, 148, 1}, 0, 0},
	{"B¨ng th¹ch", 2187500, {2, 1, 149, 1}, 0, 0},
	{"TÈy Tñy ®¬n", 125000, {2, 0, 136, 1}, 0, 7 * 24 * 60 * 60},
	{"B¸t B¶o TÈy Tñy Tiªn §¬n", 630, {2, 0, 138, 1}, 0, 7 * 24 * 60 * 60},
	{"Tiªu KiÕp t¸n", 1250000, {2, 0, 141, 1}, 0, 7 * 24 * 60 * 60},
	{"Tµng KiÕm anh hïng thiÕp", 1250000, {2, 0, 31, 1}, 0, 7 * 24 * 60 * 60},
	{"B¶o r­¬ng Tµng KiÕm ®Çu qu¸n", 12500, {2, 1, 1059, 1}, 0, 30 * 24 * 60 * 60},
	{"B¶o r­¬ng Tµng KiÕm y gi¸p", 12500, {2, 1, 1060, 1}, 0, 30 * 24 * 60 * 60},
	{"B¶o r­¬ng Tµng KiÕm hoa khè", 12500, {2, 1, 1061, 1}, 0, 30 * 24 * 60 * 60},
	{"B¶o r­¬ng Tµng KiÕm trang søc", 12500, {2, 1, 1062, 1}, 0, 30 * 24 * 60 * 60},
	{"B¶o r­¬ng Tµng KiÕm vò khÝ", 12500, {2, 1, 1063, 1}, 0, 30 * 24 * 60 * 60},
	{"B«n Tiªu", 100, {0, 105, 16, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 30 * 24 * 60 * 60},
	{"Phiªu Vò", 100, {0, 105, 15, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 30 * 24 * 60 * 60},
	{"§»ng Vô", 100, {0, 105, 20, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 30 * 24 * 60 * 60},
	{"Siªu Quang", 100, {0, 105, 19, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 30 * 24 * 60 * 60},
	{"§ång TiÒn Vµng", 625000, {2, 1, 30094, 1}, 0, 0},
	{"Lé thñy", 17822712, {2, 0, 351, 1}, 0, 0},
	{"Danh väng", 625000, "ModifyReputation(%d, 1)", 10, 0},
	{"Danh väng", 1250000, "ModifyReputation(%d, 1)", 5, 0},
	{"Danh väng", 2500000, "ModifyReputation(%d, 1)", 3, 0},
	{"Danh väng", 3125000, "ModifyReputation(%d, 1)", 2, 0},
	{"Danh väng", 28765160, "ModifyReputation(%d, 1)", 1, 0},
	{"§iÓm s­ m«n", 21379660, "SetTask(336, GetTask(336) + %d)", 1, 0},
	{"§iÓm s­ m«n", 3125000, "SetTask(336, GetTask(336) + %d)", 3, 0},
	{"§iÓm s­ m«n", 1875000, "SetTask(336, GetTask(336) + %d)", 5, 0},
	{"Thiªn Hµ MËt tÞch", 1000000, {0, 107, 64, 1}, 0, 0},
	{"Tö Hµ MËt tÞch", 1000000, {0, 107, 65, 1}, 0, 0},
	{"Chiªm Y Phæ", 31250, {0, 107, 66, 1}, 0, 0},
	{"TiÓu Nh©n s©m qu¶", 1000000, {2, 0, 552, 1}, 0, 7 * 24 * 60 * 60},
	{"Linh Xµ HuyÕt", 125000, {2, 1, 30105, 1}, 0, 0},
	{"R­¬ng BÝ KÝp", 62500, {2, 1, 30093, 1}, 0, 30 * 24 * 60 * 60},
	{"B¶o R­¬ng §Æc BiÖt", 188, {2, 1, 30091, 1}, 0, 30 * 24 * 60 * 60},
	{"Tu Ch©n YÕu QuyÕt", 5000000, {2, 0, 554, 1}, 0, 7 * 24 * 60 * 60},
	{"ThÇn N«ng §¬n", 500000, {2, 1, 343, 1}, 0, 7 * 24 * 60 * 60}
};



function Viet0908_HeCheng(nType)
	local nCount = 0;
	local nId1 = 0;
	local nId2 = 0;
	local nId3 = 0;
	local nNeedKind = getn(tVIET_0908_HECHENG[nType][1]);
	for i = 1, nNeedKind do
		nCount = tVIET_0908_HECHENG[nType][1][i][2];
		nId1 = tVIET_0908_HECHENG[nType][1][i][3];
		nId2 = tVIET_0908_HECHENG[nType][1][i][4];
		nId3 = tVIET_0908_HECHENG[nType][1][i][5];
		if GetItemCount(nId1, nId2, nId3) < nCount then
			Talk(1, "regainDialog", "§¹i hiÖp mang theo nguyªn liÖu kh«ng ®ñ.");
			return
		end
	end
	for i = 1, nNeedKind do
		nCount = tVIET_0908_HECHENG[nType][1][i][2];
		nId1 = tVIET_0908_HECHENG[nType][1][i][3];
		nId2 = tVIET_0908_HECHENG[nType][1][i][4];
		nId3 = tVIET_0908_HECHENG[nType][1][i][5];
		if DelItem(nId1, nId2, nId3, nCount) == 0 then 
			regainDialog();
			return
		end
	end
	gf_SetLogCaption(str_VIET_0908_LOG_TITLE);
	if gf_AddItemEx(tVIET_0908_HECHENG[nType][2][2], tVIET_0908_HECHENG[nType][2][1]) == 1 then
		WriteLogEx("Hoat dong thang 8", "Hop thanh keo trai cay", 1, tVIET_0908_HECHENG[nType][2][3]);
	end
	gf_SetLogCaption("");
	regainDialog();
end

--ÁìÈ¡ÉÏÏß½±Àø
function Viet0908_Give_ShangXian_Aword()
	if (tonumber(date("%y%m%d")) < 090911 or tonumber(date("%y%m%d")) > 090914) then
		Talk(1, "", "Ho¹t ®éng ®· qu¸ h¹n");
		return 0;
	end
	local nDate = tonumber(date("%y%m%d"));
	local nDayWeek = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	
	local nIndependenceEvent = 0;
	if nDate == 090901 or nDate == 090902 then
		nIndependenceEvent = 1;
	end
	
	if (nDayWeek == 2 or nDayWeek == 3 or nDayWeek == 4) and nIndependenceEvent == 0 then
		Talk(1, "", "ChØ cã thø 2, 6, 7 chñ nhËt míi cã thÓ nhËn phÇn th­ëng lªn m¹ng");
		return 0;
	elseif  nHour < 16 and nIndependenceEvent == 0  then
			Talk(1, "", "ChØ nhËn phÇn th­ëng lªn m¹ng tõ 16:00 ®Õn 24:00");
			return 0;
	end
	if GetLevel() < 73 or GetPlayerRoute() == 0 then
		Talk(1, "", "ThÊp h¬n cÊp 73 vµ ch­a vµo m«n ph¸i th× kh«ng thÓ nhËn lo¹i phÇn th­ëng nµy");
		return 0;
	end
	if GetTask(VIET_0908_TASK_SHANGXIAN_AWORD) >= tonumber(date("%y%m%d")) then
		Talk(1, "", "H«m nay ®¹i hiÖp ®· nhËn phÇn th­ëng, xin h·y ®îi ngµy mai");
		return 0;
	end
	local nExp = 0;
	local nRep = GetReputation();
	local nFac = GetTask(336);
	local nRepLevel = viet0908_get_aword_level(nRep, tVIET_0908_SHANGXIAN_AWORD);
	local nFacLevel = viet0908_get_aword_level(nFac, tVIET_0908_SHANGXIAN_AWORD);
	if nRepLevel == 0 and nFacLevel == 0  and nIndependenceEvent == 0 then
		Talk(1, "", "§iÓm danh väng vµ cèng hiÕn s­ m«n kh«ng ®ñ nhËn phÇn th­ëng nµy.");
		return 0;
	end
	if nRepLevel ~= 0 then
		ModifyExp(tVIET_0908_SHANGXIAN_AWORD[nRepLevel][3]);
		Msg2Player("B¹n nhËn ®­îc "..tVIET_0908_SHANGXIAN_AWORD[nRepLevel][3].." ®iÓm kinh nghiÖm");
		WriteLog(GetName() .. "get "..tVIET_0908_SHANGXIAN_AWORD[nRepLevel][3] .. "  ®iÓm kinh nghiÖm")
		WriteLogEx("Hoat dong thang 8", "Online nhan thuong");
	end
	if nFacLevel ~= 0 then
		ModifyExp(tVIET_0908_SHANGXIAN_AWORD[nFacLevel][3]);
		Msg2Player("B¹n nhËn ®­îc "..tVIET_0908_SHANGXIAN_AWORD[nFacLevel][3].." ®iÓm kinh nghiÖm");
		WriteLog(GetName() .. "get "..tVIET_0908_SHANGXIAN_AWORD[nFacLevel][3] .. "  ®iÓm kinh nghiÖm")
		WriteLogEx("Hoat dong thang 8", "Online nhan thuong");
	end
	if nIndependenceEvent == 1 and (nDayWeek == 2 or nDayWeek == 3)  then
		ModifyExp(2919450);
		Msg2Player("B¹n nhËn ®­îc 2919450 ®iÓm kinh nghiÖm");
		WriteLog(GetName() .. "get 2919450 ®iÓm kinh nghiÖm")
		WriteLogEx("Hoat dong thang 8", "Online nhan thuong Quoc khanh");
	end
	SetTask(VIET_0908_TASK_SHANGXIAN_AWORD, tonumber(date("%y%m%d")));
end

--ÅÐ¶ÏÏÖÔÚµÄÉùÍûºÍÊ¦ÃÅ¹±Ï×¶È¿ÉÒÔ»ñµÃµÚ¼¸¼¶½±Àø
function viet0908_get_aword_level(nValue, tAword)
	for i = getn(tAword), 1, -1 do
		if tAword[i][2] == 0 then
			if nValue >= tAword[i][1] then
				return i;
			end
		else
			if nValue >= tAword[i][1] and nValue <= tAword[i][2] then
				return i;
			end
		end
	end
	return 0;
end

--Ôö¼ÓÒ»µãÉ±ÆøÖµ
function Viet0908_Add_ShaQi()
	if (tonumber(date("%y%m%d")) >= 091001) then
		Talk(1, "", "Ho¹t ®éng ®· qu¸ h¹n");
		return 0;
	end
	local nDayWeek = tonumber(date("%w"));
	if nDayWeek == 2 or nDayWeek == 3 or nDayWeek == 4 then
		Talk(1, "", "ChØ t¹i thø 2, 6, 7 chñ nhËt míi cã thÓ nhËn ®­îc trÞ s¸t khÝ");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	if tbViet_0908_SkillID[nRoute] == 0 or GetSkillLevel(tbViet_0908_SkillID[nRoute]) == 0 then
		Talk(1, "", "§¹i hiÖp vÉn ch­a häc kü n¨ng trÊn ph¸i, v× vËy kh«ng thÓ t¨ng trÞ s¸t khÝ ®­îc.");
		return 0;
	end
	if GetMomentum() >= 10 then
		Talk(1, "", "TrÞ s¸t khÝ hiÖn t¹i ®· ®Çy, kh«ng thÓ t¨ng thªm ®iÓm s¸t khÝ ®­îc.");
		return 0;
	end
	if GetTask(VIET_0908_TASK_GET_SHAQI_DATE) < tonumber(date("%y%m%d")) then
		SetTask(VIET_0908_TASK_GET_SHAQI_COUNT, 0);
	end
	if GetTask(VIET_0908_TASK_GET_SHAQI_COUNT) >= 10 then
		Talk(1, "", "H«m nay c¸c h¹ ®· nhËn trÞ s¸t khÝ 10 lÇn råi, kh«ng thÓ nhËn thªm ®­îc n÷a.");
		return 0;
	end
	SetMomentum(GetMomentum() + 5);
	SetTask(VIET_0908_TASK_GET_SHAQI_COUNT, GetTask(VIET_0908_TASK_GET_SHAQI_COUNT) + 1);
	SetTask(VIET_0908_TASK_GET_SHAQI_DATE, tonumber(date("%y%m%d")));
	Msg2Player("NhËn ®­îc 5 ®iÓm s¸t khÝ");
	WriteLogEx("Hoat dong thang 8", "Tran phai Than Khi");
end

--ÁéÉßÑª»»ÃØ¼®
function Viet0908_LingSheXie_Miji()
	if tonumber(date("%y%m%d")) < 090807 or tonumber(date("%y%m%d")) >= 090907 then
		Talk(1, "", "Ho¹t ®éng ®· qu¸ h¹n");
		return 0;
	end
	if GetLevel() < 30 then
		Talk(1,"", "C¸c h¹ ch­a ®ñ ®¼ng cÊp cÇn thiÕt");
	 	return 0;
	end
	
	nType = 1;
	nRand = random(1, 100);
	if  nRand <= 34 then
		nType = 1;
	elseif nRand > 34 and nRand <= 68 then
		nType = 2;
	elseif nRand > 68 then
		nType = 3;
	end
	
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then return end
	local nId11 = tVIET_0908_MIJI_EXCHANGE[nType][1][1];
	local nId12 = tVIET_0908_MIJI_EXCHANGE[nType][1][2];
	local nId13 = tVIET_0908_MIJI_EXCHANGE[nType][1][3];
	local nCount1 = tVIET_0908_MIJI_EXCHANGE[nType][1][4]
	local nId21 = tVIET_0908_MIJI_EXCHANGE[nType][2][1];
	local nId22 = tVIET_0908_MIJI_EXCHANGE[nType][2][2];
	local nId23 = tVIET_0908_MIJI_EXCHANGE[nType][2][3];
	local nCount2 = tVIET_0908_MIJI_EXCHANGE[nType][2][4]
	if GetItemCount(nId21, nId22, nId23) < nCount2 or GetCash() < 1000000 then
		Say("C¸c h¹ kh«ng mang theo ®ñ nh÷ng thø ta cÇn.", 0);
		return 0;
	end
	if DelItem(nId21, nId22, nId23, nCount2) == 1 and Pay(1000000) == 1 then
		--¸øÎïÆ·½±Àø
		local nRand = gf_GetRandItemByTable(tVIET_0908_MIJI, 100, 1);
		gf_SetLogCaption(str_VIET_0908_LOG_TITLE);
		if gf_AddItemEx(tVIET_0908_MIJI[nRand][3], tVIET_0908_MIJI[nRand][1]) == 1 then
			WriteLogEx("Hoat dong thang 8", "Doi Mat Tich", 1, tVIET_0908_MIJI[nRand][1]);
		end
		gf_SetLogCaption("");
	end
end

function regainDialog()
	local nDate = tonumber(date("%y%m%d%H"));
	----¼ì²é»î¶¯Ê±¼ä
	if nDate < 09080700 or nDate >= 09090700 then
		Talk(1, "", "Ho¹t ®éng ®· qu¸ h¹n thêi gian råi");
		return 0;
	end
	
	Say(
			"Sù kiÖn th¸ng 8 diÔn ra tõ ngµy 07-08-2009 ®Õn hÕt 24 giê ngµy 06-09-2009. Chi tiÕt sù kiÖn ®ång ®¹o cã thÓ tham kh¶o trªn trang chñ: http://volam2.zing.vn",
			7,
			"Hîp thµnh KÑo Nho (cÇn 4 Nho T­íi vµ 1 Tói H­¬ng LiÖu)/#Viet0908_HeCheng(1)",
			"Hîp thµnh KÑo M·ng CÇu (cÇn 4 M·ng CÇu vµ 1 Tói H­¬ng LiÖu)/#Viet0908_HeCheng(2)",
			"Hîp thµnh KÑo SÇu Riªng (cÇn 4 SÇu Riªng vµ 1 Tói H­¬ng LiÖu)/#Viet0908_HeCheng(3)",
			"Ta muèn nhËn phÇn th­ëng ®iÓm kinh nghiÖm./Viet0908_Give_ShangXian_Aword",
			"T¨ng 5 trÞ s¸t khÝ./Viet0908_Add_ShaQi",
			"Mua 1 Lé Thñy (1 Lé Thñy = 10 b¹c)/BuyWater",
			"KÕt thóc ®èi tho¹i/dialog_over"
		);
end

--¹ºÂòÂ¶Ë®
function BuyWater()
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		return
	end
	if Pay(1000) == 0 then
		Talk(1, "", "Ng©n l­îng cña b¹n kh«ng ®ñ!");
		return
	end
	gf_AddItemEx({2, 0, 351, 1}, "Lé thñy");
end

function dialog_over()
end