--=============================================
--create by baiyun 2009.10.13
--describe:Ô½ÄÏ°æ11ÔÂ·İ»î¶¯ Í·ÎÄ¼ş
--=============================================
Include("\\script\\lib\\globalfunctions.lua");

VIET_0911_TASK_SHANGXIAN_AWORD = 2100;	--Ã¿ÌìÁìÈ¡ÉÏÏß½±ÀøµÄÈÕÆÚ
VIET_0911_TASK_JUHUACHA_COUNT = 2075;		--Ê¹ÓÃ¾Õ»¨²èµÄ´ÎÊı
VIET_0911_TASK_ZHENZHU_COUNT = 2076;		--Ê¹ÓÃÕäÖéµÄ´ÎÊı
VIET_0911_TASK_ZHANGMEN_DATE = 2077;		--¸øÕÆÃÅËÍ¶«Î÷µÄÈÕÆÚ
VIET_0911_TASK_ZHANGMEN_COUNT = 2078;		--ÒÑ¾­¸øÕÆÃÅËÍ¶«Î÷µÄ´ÎÊı
VIET_0911_TASK_ZHANGMEN_TIME = 2079;		--¸øÕÆÃÅËÍ¶«Î÷µÄÊ±¼ä£¬Ê±¼ä´ÁGetTime()
VIET_0911_TASK_SHIMENG_DATE = 2080;			--Ê¦ÃÅÈÎÎñµÃµ½¾Õ»¨µÄÈÕÆÚ
VIET_0911_TASK_SHIMENG_NUM = 2089;			--Ê¦ÃÅÈÎÎñµÃµ½¾Õ»¨µÄÊıÁ¿
VIET_0911_TASK_YANHUO_DATE = 2098;			--Ê¹ÓÃÑÌ»ğµÄÈÕÆÚ
VIET_0911_TASK_YANHUO_NUM = 2099;				--½ñÌìÒÑ¾­Ê¹ÓÃÑÌ»ğµÄ´ÎÊı
VIET_0911_TASK_LAST_USE_TIME = 2116;		--ÉÏ´ÎÊ¹ÓÃÑÌ»ğµÄÊ±¼äGetTime()
VIET_0911_TASK_TONG_AWARD_DATE = 2189;	--ÁìÈ¡°ï»á³å½±µÄÈÕÆÚ(%Y%W)

VIET_0911_JUHUACHA_MAX_COUNT = 2400;		--×î´óÊ¹ÓÃ¾Õ»¨²èµÄ´ÎÊı
VIET_0911_ZHENZHU_MAX_COUNT = 100;			--×î´óÊ¹ÓÃÕäÖéµÄ´ÎÊı
VIET_0911_YANHUO_MAX_COUNT = 16;				--Ã¿Ìì×î¶àÊ¹ÓÃµÄÑÌ»ğµÄ¸öÊı

VIET_0911_LOG_TITLE = "Hoat dong thang 11"

--ÉÏÏß½±Àø
tbVIET_0911_SHANGXIAN_AWORD = {
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
--ÉÏÏß½±Àø¸øµÄ¾Õ»¨ÊıÁ¿
tbVIET_0911_SHANGXIAN_AWARD2 = {
	[1] = 30,
	[2] = 30,
	[3] = 30,
	[4] = 40,
	[5] = 40,
	[6] = 40,
	[7] = 40,
	[8] = 50,
	[9] = 50,
	[10] = 50,
	[11] = 50,
	[12] = 50,
};

--Í¨¹ıÊ¦ÃÅÈÎÎñ»ñµÃµÄ¾Õ»¨µÄÊıÁ¿
tVIET_0911_SHIMEN_JUHUA = {
	[1] = 15,
	[2] = 15,
	[3] = 15,
	[4] = 20,
	[5] = 20,
	[6] = 20,
	[7] = 30,
	[8] = 30,
	[9] = 30,
};

--ÓñÍÃÏä½±Àø
tbVIET_0911_YUTUXIANG = {
	{"M¶nh Thiªn th¹ch", 10, {2, 2, 7, 1}, 0},
	{"Thiªn th¹ch", 10, {2, 2, 8, 1}, 0},
	{"Tiªu KiÕp t¸n", 10, {2, 0, 141, 1}, 7 * 24 * 3600},
	{"§Êu hån", 4, {2, 1, 1157, 1}, 7 * 24 * 3600},
	{"Money", 37, 10000},
	{"Rep", 12, 1},
	{nil, 12},
	{"Exp", 5, 20000}
};

tbVIET_0911_JUHUACHA_AWARD = {
	{"M¶nh Thiªn th¹ch", 60000, {2, 2, 7, 1}, 0},
	{"Thiªn th¹ch", 60000, {2, 2, 8, 1}, 0},
	{"M¶nh B¨ng th¹ch", 20000, {2, 1, 148, 1},  0},
	{"B¨ng th¹ch", 30000, {2, 1, 149, 1}, 0},
	{"TÈy Tñy linh ®¬n", 100, {2, 0, 137, 1}, 15 * 24 * 3600},
	{"§ång TiÒn Vµng", 5000, {2, 1, 30094, 1}, 0},
	{"Tu Ch©n YÕu QuyÕt", 70000, {2, 0, 554, 1}, 15 * 24 * 3600},
	{"R­¬ng Bİ Kİp", 1000, {2, 1, 30093, 1}, 30 * 24 * 3600},
	{"§Êu hån", 10000, {2, 1, 1157, 1}, 15 * 24 * 3600},
	{"ThÇn N«ng §¬n", 14000, {2, 1, 343, 1}, 15 * 24 * 3600},
	{"V¨n CÈm H¹p", 500, {2, 1, 1100, 1}, 15 * 24 * 3600},
	{"Qu©n C«ng Ch­¬ng", 5000, {2, 1, 9999, 1}, 15 * 24 * 3600},
	{"Th¸i H­ §a MËt Qu¶ ", 5000, {2, 1, 387, 1}, 15 * 24 * 3600},
	{"S­ m«n t×nh nguyÖn th­", 5000, {2, 1, 1019, 1}, 15 * 24 * 3600},
	{"S­ m«n lÖnh th­", 5000, {2, 1, 1016, 1}, 15 * 24 * 3600},
--	{"èng B«ng GiÊy", 140999, {2, 1, 30092, 1}, 0},
	{"B¶o R­¬ng §Æc BiÖt", 1, {2, 1, 30091, 1}, 30 * 24 * 3600},
	{"R­¬ng TrÊn Ph¸i", 1000, {2, 1, 30113, 1}, 30 * 24 * 3600},
	{nil, 320000},
	{nil, 347399},
	{"Tiªu KiÕp t¸n", 10000, {2, 0, 141, 1}, 15 * 24 * 3600},
--	{"Ngäc Trai", 83300, {2, 1, 30122, 1}, 15 * 24 * 3600},
	{"Tø Linh Thiªn ı Phæ", 3000, {0, 107, 160, 1}, 0},
	{"Tø Linh Tö ı Phæ", 3000, {0, 107, 161, 1}, 0},
	{"Tø Linh ChiÕn ı Phæ", 3000, {0, 107, 159, 1}, 0},
	{"Bµn Long Bİch", 2000, {2, 1, 1000, 1}, 15 * 24 * 3600},
	{"TiÓu nh©n s©m qu¶", 20000, {2, 0, 552, 1}, 15 * 24 * 3600},
};

tbVIET_0911_JUHUACHA_AWARD_2 = {
	{"Tu Ch©n YÕu QuyÕt", 230000, {2, 0, 554, 1}, 15 * 24 * 3600},
	{"R­¬ng Bİ Kİp", 40000, {2, 1, 30093, 1}, 30 * 24 * 3600},
	{"Qu©n C«ng Ch­¬ng", 170000, {2, 1, 9999, 1}, 15 * 24 * 3600},
	{"R­¬ng TrÊn Ph¸i", 20000, {2, 1, 30113, 1}, 30 * 24 * 3600},
	{"Tiªu KiÕp t¸n", 210000, {2, 0, 141, 1}, 15 * 24 * 3600},
	{"Tø Linh Thiªn ı Phæ", 40000, {0, 107, 160, 1}, 0},
	{"Tø Linh Tö ı Phæ", 40000, {0, 107, 161, 1}, 0},
	{"Tø Linh ChiÕn ı Phæ", 40000, {0, 107, 159, 1}, 0},
	{"Bµn Long Bİch", 210000, {2, 1, 1000, 1}, 15 * 24 * 3600},
};

tbVIET_0911_JUHUACHA_AWARD_FULL = {
	{"Thiªn Th¹ch Linh Th¹ch", 7800, {2, 1, 1068, 1}, 15 * 24 * 3600},
	{"Thiªn Th¹ch Tinh Th¹ch", 453000, {2, 1, 1009, 1}, 0},
	{"§Şnh Hån Thiªn Th¹ch ThÇn Th¹ch", 3100, {2, 1, 1067, 1}, 7 * 24 * 3600},
	{"L¨ng Ba Vi Bé", 31300, {0, 112, 78, 1}, 0},
	{"Huy hiÖu chiÕn c«ng (Huy hoµng)", 4700, {2, 1, 9977, 1}, 7 * 24 * 3600},
	{"M· Bµi", 500100, {2, 1, 371, 1}, 30 * 24 * 3600},
}

--°ï»á³å½±»î¶¯£¬°ïÖ÷½±Àø
tbVIET_0911_TONG_AWARD1 = {
	[1] = 
	{
		{1, "Ngù dông b¹ch ngäc th¹ch", {2, 1, 1024, 15}, 7 * 24 * 3600},
		{1, "R­¬ng YÕu QuyÕt_Cao CÊp", {2, 1, 30112, 3}, 7 * 24 * 3600},
		{1, "Bao m¶nh Thiªn Th¹ch", {2, 1, 1049, 1}, 7 * 24 * 3600},
		{1, "Bao Thiªn Th¹ch", {2, 1, 1050, 1}, 7 * 24 * 3600},
		{1, "1 bao Xİch ThiÕt Tinh", {2, 1, 2651, 1}, 7 * 24 * 3600},
		{1, "Ngò Hµnh MËt tŞch", {0, 107, 155, 2}, 0},
		{1, "Thiªn Th¹ch linh th¹ch", {2, 1, 1068, 1}, 7* 24 * 3600},
		{1, "N÷ Oa Tinh Th¹ch", {2, 1, 504, 3}, 7* 24 * 3600},
		{2, "ModifyExp(10000000)", "C¸c h¹ thu ®­îc 10000000 kinh nghiÖm"},
		{2, "ModifyReputation(1000, 1)", "C¸c h¹ thu ®­îc 1000 ®iÓm danh väng"},
	},
	[2] = 
	{
		{1, "Ngù dông b¹ch ngäc th¹ch", {2, 1, 1024, 10}, 7 * 24 * 3600},
		{1, "R­¬ng YÕu QuyÕt_Cao CÊp", {2, 1, 30112, 2}, 7 * 24 * 3600},
		{1, "Bao m¶nh Thiªn Th¹ch", {2, 1, 1049, 1}, 7 * 24 * 3600},
		{1, "Bao Thiªn Th¹ch", {2, 1, 1050, 1}, 7 * 24 * 3600},
		{1, "1 bao Xİch ThiÕt Tinh", {2, 1, 2651, 1}, 7 * 24 * 3600},
		{1, "Ngò Hµnh MËt tŞch", {0, 107, 155, 1}, 0},
		{1, "N÷ Oa Tinh Th¹ch", {2, 1, 504, 2}, 7* 24 * 3600},
		{2, "ModifyExp(7000000)", "C¸c h¹ thu ®­îc 7000000 ®iÓm kinh nghiÖm"},
		{2, "ModifyReputation(700, 1)", "C¸c h¹ thu ®­îc 700 danh väng"},
	},
	[3] = 
	{
		{1, "Ngù dông b¹ch ngäc th¹ch", {2, 1, 1024, 5}, 7 * 24 * 3600},
		{1, "R­¬ng YÕu QuyÕt_Cao CÊp", {2, 1, 30112, 1}, 7 * 24 * 3600},
		{1, "Bao m¶nh Thiªn Th¹ch", {2, 1, 1049, 1}, 7 * 24 * 3600},
		{1, "Bao Thiªn Th¹ch", {2, 1, 1050, 1}, 7 * 24 * 3600},
		{1, "1 bao Xİch ThiÕt Tinh", {2, 1, 2651, 1}, 7 * 24 * 3600},
		{1, "N÷ Oa Tinh Th¹ch", {2, 1, 504, 1}, 7* 24 * 3600},
		{2, "ModifyExp(5000000)", "C¸c h¹ thu ®­îc 5000000 ®iÓm kinh nghiÖm"},
		{2, "ModifyReputation(500, 1)", "C¸c h¹ thu ®­îc 700 danh väng"},
	}
};

--°ï»á³å½±»î¶¯£¬¸±°ïÖ÷ºÍ³¤ÀÏ½±Àø
tbVIET_0911_TONG_AWARD2 = {
	[1] = 
	{
		{2, "ModifyExp(7000000)", "C¸c h¹ thu ®­îc 7000000 ®iÓm kinh nghiÖm"},
		{2, "ModifyReputation(700, 1)", "C¸c h¹ thu ®­îc 700 danh väng"},
	},
	[2] = 
	{
		{2, "ModifyExp(5000000)", "C¸c h¹ thu ®­îc 5000000 ®iÓm kinh nghiÖm"},
		{2, "ModifyReputation(500, 1)", "C¸c h¹ thu ®­îc 500 danh väng"},
	},
	[3] =
	{
		{2, "ModifyExp(2000000)", "C¸c h¹ thu ®­îc 2000000 ®iÓm kinh nghiÖm"},
		{2, "ModifyReputation(200, 1)", "C¸c h¹ thu ®­îc 200 danh väng"},
	},
};

--°ï»á³å½±»î¶¯£¬ÌÃÖ÷ºÍÏãÖ÷½±Àø
tbVIET_0911_TONG_AWARD3 = {
	[1] = 
	{
		{2, "ModifyExp(5000000)", "C¸c h¹ thu ®­îc 5000000 ®iÓm kinh nghiÖm"},
		{2, "ModifyReputation(500, 1)", "C¸c h¹ thu ®­îc 500 danh väng"},
	},
	[2] = 
	{
		{2, "ModifyExp(2000000)", "C¸c h¹ thu ®­îc 2000000 ®iÓm kinh nghiÖm"},
		{2, "ModifyReputation(200, 1)", "C¸c h¹ thu ®­îc 200 danh väng"},
	},
	[3] =
	{
		{2, "ModifyExp(1000000)", "C¸c h¹ thu ®­îc 1000000 ®iÓm kinh nghiÖm"},
		{2, "ModifyReputation(100, 1)", "C¸c h¹ thu ®­îc 100 danh väng"},
	},
};

--°ï»á³å½±»î¶¯£¬ÆÕÍ¨°ïÖÚ½±Àø
tbVIET_0911_TONG_AWARD4 = {
	[1] = 
	{
		{2, "ModifyExp(2000000)","C¸c h¹ thu ®­îc 2000000 ®iÓm kinh nghiÖm"},
		{2, "ModifyReputation(200, 1)", "C¸c h¹ thu ®­îc 200 danh väng"},
	},
	[2] = 
	{
		{2, "ModifyExp(1000000)","C¸c h¹ thu ®­îc 1000000 ®iÓm kinh nghiÖm"},
		{2, "ModifyReputation(100, 1)","C¸c h¹ thu ®­îc 100 danh väng"},
	},
	[3] =
	{
		{2, "ModifyExp(500000)","C¸c h¹ thu ®­îc 500000 ®iÓm kinh nghiÖm"},
		{2, "ModifyReputation(50, 1)","C¸c h¹ thu ®­îc 50 danh väng"},
	},
};

tbVIET_0911_TANGQUASUPHU ={
	{nil, 50250},
	{"§Êu Hån", 26000, {2, 1, 1157, 1}, 15 * 24 * 3600},
	{"M·nh TiÖt Hoµnh Thó", 1000, {2, 0, 738, 1}, 0},
	{"Th­îng Cæ Kú L©n HuyÕt", 1000, {2, 0, 739, 1}, 0},
	{"NguyÖt Hoa Chi Tinh", 100, {2, 1, 3219, 1}, 0},
	{"NguyÖt Hoa", 10000, {2, 1, 2002, 1}, 0},
	{"L¨ng Ba Vi Bé", 100, {0, 112, 78, 1}, 0},
	{"R­¬ng Vò Khİ B¹c", 5000, {2, 1, 1147, 1}, 15 * 24 * 3600},
	{"§ång TiÒn Vµng", 2000, {2, 1, 30094, 1}, 0},
	{"Thñy Hoµng Bİ ChiÕu", 1000, {2, 1, 1047, 1}, 15 * 24 * 3600},
	{"Lôc L©m Lang Yªn", 1000, {2, 1, 1014, 1}, 15 * 24 * 3600},
	{"Uyªn ¦¬ng Kim Ti B¹c", 1000, {2, 1, 1048, 1}, 15 * 24 * 3600},
	{"Huy hiÖu chiÕn c«ng (huy hoµng)", 250, {2, 1, 9977, 1}, 15 * 24 * 3600},
	{"Thiªn Th¹ch Tinh Th¹ch", 1300, {2, 1, 1009, 1},0}
}

tbVIET_0911_TANGQUASUPHU_2 = {
	{0, 4000, 125000},
	{4001, 8000, 150000},
	{8001, 9000, 175000},
	{9001, 99999, 200000},
};

tbVIET_0911_WEAPON = {
	[2]= 	{"Cæ §İnh",0,3,64,200},
	[3]= 	{"A La H¸n Tr­îng",0,8,97,100},
	[4]=	 {"V¹n NhÉn",0,0,14,220},
	[6]= 	{"M·n Thiªn Hoa Vò",0,1,53,130},	
	[8]= 	{"Háa Tinh",0,2,36,90},	
	[9]= 	{"Hi Nh©n CÇm",0,10,75,140},
	[11]= {"V¹n NhÉn",0,0,14,220},
	[12]= {"LiÖt DiÖm",0,5,40,200},
	[14]= {"Háa Tinh",0,2,36,90},	
	[15]= {"ThÇn Hµnh",0,9,86,130},	
	[17]= {"§¹i Hµo L«i Th­¬ng",0,6,108,130},	
	[18]= {"ThÇn Cung",0,4,119,130},
	[20]= {"L¨ng Phong",0,7,12,200},
	[21]= {"M·nh hæ",0,11,12,200},
}

function get_full_skill_level()
	local nPlayerRoute = GetPlayerRoute()
	local nSkillID = TB_55_SKILL_INFO[nPlayerRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= 7 then
			return 1
		else
			return 0;
		end;
	end;
end;


-- »ñµÃ55¼¶¼¼ÄÜÊÇ·ñÒÑ¾­Ñ§ÂúÁË
TB_55_SKILL_INFO = {
	[0] = 0,--"ÎŞÃÅÎŞÅÉ",
	[1] = 0,--ÉÙÁÖ
	[2] = 31,--"Ë×¼Ò",
	[3] = 56,--"ìøÉ®",
	[4] = 43,--"ÎäÉ®",
	[5] = 0,--"ÌÆÃÅ",
	[6] = 73,--"ÌÆÃÅ",
	[7] = 0,--"¶ëáÒ",
	[8] = 88,--"¶ëáÒ·ğ¼Ò",
	[9] = 101,--"¶ëáÒË×¼Ò",
	[10] = 0,--"Ø¤°ï",
	[11] = 112,--"Ø¤°ï¾»ÒÂ",
	[12] = 123,--"Ø¤°ïÎÛÒÂ",
	[13] = 0,--"Îäµ±",
	[14] = 145,--"Îäµ±µÀ¼Ò",
	[15] = 158,--"Îäµ±Ë×¼Ò",
	[16] = 0,--"ÑîÃÅ",
	[17] = 731,--"ÑîÃÅÇ¹Æï",
	[18] = 744,--"ÑîÃÅ¹­Æï",
	[19] = 0,--"Îå¶¾",
	[20] = 377,--"Îå¶¾Ğ°ÏÀ",
	[21] = 363,--"Îå¶¾¹ÆÊ¦",
}

--ÁìÈ¡ÉÏÏß½±Àø
function Viet0911_Give_ShangXian_Aword()
	if tonumber(date("%y%m%d")) < 091106 or tonumber(date("%y%m%d")) > 091206 then
		Talk(1, "", "Ho¹t ®éng ®· qu¸ h¹n");
		return 0;
	end
	local nDayWeek = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if nDayWeek == 2 or nDayWeek == 3 or nDayWeek == 4 then
		Talk(1, "", "ChØ cã thø 2, 6, 7 chñ nhËt míi cã thÓ nhËn phÇn th­ëng lªn m¹ng");
		return 0;
	end
	if nHour < 16 then
		Talk(1, "", "Thêi gian nhËn online nhËn th­ëng vµo mçi ngµy tõ 16 ®Õn 24 giê");
		return 0;
	end
	if GetLevel() < 73 or GetPlayerRoute() == 0 then
		Talk(1, "", "ThÊp h¬n cÊp 73 vµ ch­a vµo m«n ph¸i th× kh«ng thÓ nhËn lo¹i phÇn th­ëng nµy");
		return 0;
	end
	if GetTask(VIET_0911_TASK_SHANGXIAN_AWORD) >= tonumber(date("%y%m%d")) then
		Talk(1, "", "H«m nay ®¹i hiÖp ®· nhËn phÇn th­ëng, xin h·y ®îi ngµy mai");
		return 0;
	end
	local nExp = 0;
	local nRep = GetReputation();
	local nFac = GetTask(336);
	local nRepLevel = viet0911_get_aword_level(nRep, tbVIET_0911_SHANGXIAN_AWORD);
	local nFacLevel = viet0911_get_aword_level(nFac, tbVIET_0911_SHANGXIAN_AWORD);
	if nRepLevel == 0 and nFacLevel == 0 then
		Talk(1, "", "§iÓm danh väng vµ cèng hiÕn s­ m«n kh«ng ®ñ nhËn phÇn th­ëng nµy.");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then 
		return 0;
	end
	if nRepLevel ~= 0 then
		ModifyExp(tbVIET_0911_SHANGXIAN_AWORD[nRepLevel][3]);
		Msg2Player("B¹n nhËn ®­îc "..tbVIET_0911_SHANGXIAN_AWORD[nRepLevel][3].." ®iÓm kinh nghiÖm");
		WriteLog(GetName() .. "NhËn ®­îc "..tbVIET_0911_SHANGXIAN_AWORD[nRepLevel][3] .. "  ®iÓm kinh nghiÖm")
		gf_AddItemEx({2, 1, 30118, tbVIET_0911_SHANGXIAN_AWARD2[nRepLevel]}, "Hoa Cóc");
	end
	if nFacLevel ~= 0 then
		ModifyExp(tbVIET_0911_SHANGXIAN_AWORD[nFacLevel][3]);
		Msg2Player("B¹n nhËn ®­îc "..tbVIET_0911_SHANGXIAN_AWORD[nFacLevel][3].." ®iÓm kinh nghiÖm");
		WriteLog(GetName() .. "NhËn ®­îc "..tbVIET_0911_SHANGXIAN_AWORD[nFacLevel][3] .. "  ®iÓm kinh nghiÖm")
		gf_AddItemEx({2, 1, 30118, tbVIET_0911_SHANGXIAN_AWARD2[nFacLevel]}, "Hoa Cóc");
	end
	SetTask(VIET_0911_TASK_SHANGXIAN_AWORD, tonumber(date("%y%m%d")));
end

--ÅĞ¶ÏÏÖÔÚµÄÉùÍûºÍÊ¦ÃÅ¹±Ï×¶È¿ÉÒÔ»ñµÃµÚ¼¸¼¶½±Àø
function viet0911_get_aword_level(nValue, tAword)
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

--×ö¾Õ»¨²è
function Viet_0911_GetJuHuaCha()
	if GetItemCount(2, 1, 30118) < 2 or GetItemCount(2, 1, 30121) < 1 then
		Say("§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ xin h·y kiÓm tra l¹i", 1, "ThËt ng¹i qu¸! Ta sÏ quay l¹i sau./viet_0911_nothing");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then 
		return 0;
	end
	if DelItem(2, 1, 30118, 2) == 1 and DelItem(2, 1, 30121, 1) == 1 then
		gf_SetLogCaption(VIET_0911_LOG_TITLE);
		gf_AddItemEx({2, 1, 30119, 1}, "Trµ Hoa Cóc");
		WriteLogEx(VIET_0911_LOG_TITLE,"hîp thµnh",1,"Trµ Hoa Cóc")
		gf_SetLogCaption("");
	end
	SelectSay();
end

--»»°Ù»¨±ı
function Viet0911_Give_Exchange_Baihuabing()
	if GetItemCount(2, 1, 30118) < 2 then
		Say("§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ xin h·y kiÓm tra l¹i", 1, "ThËt ng¹i qu¸! Ta sÏ quay l¹i sau./viet_0911_nothing");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then 
		return 0;
	end
	
	if Pay(10000) == 0 then
		Talk(1, "", "Ng©n l­îng cña b¹n kh«ng ®ñ!");
		return
	end
	if DelItem(2, 1, 30118, 2) == 1 then
		gf_SetLogCaption(VIET_0911_LOG_TITLE);
		gf_AddItemEx({2, 1, 30120, 1}, "B¸nh B¸ch Hoa");
		WriteLogEx(VIET_0911_LOG_TITLE,"hîp thµnh",1,"B¸nh B¸ch Hoa")
		gf_SetLogCaption("");
	end
	SelectSay();
end

--ÁìÈ¡ÅÅÃûÇ°ÈıÃû°ï»áµÄ½±Àø
function get_123tong_award()
	local tb_dialog = {
		"NhËn phÇn phÇn th­ëng bang chñ/#get_tong_award(1)",
		"NhËn phÇn th­ëng cña phã bang chñ vµ tr­ëng l·o/#get_tong_award(2)",
		"NhËn phÇn th­ëng cña ®­êng chñ vµ h­¬ng chñ/#get_tong_award(3)",
		"NhËn phÇn th­ëng bang chóng/#get_tong_award(4)",
	};
	Say("<color=green>Kim S¬n ch­ëng m«n nh©n<color>: Thµnh viªn cña 3 bang héi ®øng ®Çu ®Òu cã thÓ ®Õn ®©y nhËn th­ëng!<enter><color=red>Chó ı: Sau 24:00 thø 7 nÕu nh­ ®ång ®¹o kh«ng ®Õn nhËn, phÇn th­ëng sÏ bŞ xãa ®i<color>", 
		getn(tb_dialog), 
		tb_dialog
	);
end

function get_tong_award(nType)
	local nCurDate = tonumber(date("%Y%W"));
	local nLastDate = GetTask(VIET_0911_TASK_TONG_AWARD_DATE);
	SetTaskTemp(105, nType);
	if nLastDate >= nCurDate then
		Talk(1, "", "<color=green>Kim S¬n ch­ëng m«n nh©n<color>: TuÇn nµy c¸c h¹ ®· nhËn phÇn th­ëng bang héi råi.");
		return 0;
	end
	local nLevel = IsTongMember();
	if nLevel == 0 then
		Talk(1, "", "<color=green>Kim S¬n ch­ëng m«n nh©n<color>: C¸c h¹ vÉn ch­a gia nhËp bang héi, kh«ng thÓ nhËn phÇn th­ëng nµy.");
		return 0;
	end
	if GetLevel() < 73 then
		Talk(1, "", "<color=green>Kim S¬n ch­ëng m«n nh©n<color>: CÊp bËc ch­a ®ñ 73, kh«ng thÓ nhËn phÇn th­ëng nµy ®­îc");
		return 0;
	end
	if get_full_skill_level() == 0 then
		Talk(1, "", "<color=green>Kim S¬n ch­ëng m«n nh©n<color>: Ch­a häc ®Çy ®ñ chiªu thøc 55, kh«ng thÓ nhËn phÇn th­ëng nµy ®­îc");
		return 0;
	end
	if viet_0911_get_join_tong_day() < 7 then
		Talk(1, "", "<color=green>Kim S¬n ch­ëng m«n nh©n<color>: C¸c h¹ gia nhËp bang héi ch­a ®ñ 7 ngµy, kh«ng thÓ nhËn th­ëng!")
		return 0;
	end
	if GetTongLevel() < 5 then
		Talk(1, "", "<color=green>Kim S¬n ch­ëng m«n nh©n<color>: Bang héi c¸c h¹ ch­a ®¹t ®Õn cÊp 5, kh«ng thÓ nhËn th­ëng.");
		return 0;
	end
	if GetTongPopulation() < 1000000 then
		Talk(1, "", "<color=green>Kim S¬n ch­ëng m«n nh©n<color>: C¸c h¹ ®ang ë bang héi cã nh©n khİ kh«ng ®ñ 1000000, kh«ng thÓ nhËn th­ëng.");
		return 0;
	end
	local nTongLadder = GetTongPopuLadder();
	if nTongLadder > 3 or nTongLadder <= 0 then
		Talk(1, "", "<color=green>Kim S¬n ch­ëng m«n nh©n<color>: Bang héi cña c¸c h¹ xÕp h¹ng nh©n khİ kh«ng ph¶i 3 bang héi ®øng ®Çu, kh«ng thÓ nhËn th­ëng")
		return 0;
	end
	if gf_Judge_Room_Weight(5, 50, " ") ~= 1 then 
		return 0;
	end
	local nLevelName = {
		{1, 1, "Bang chñ"},
		{2, 2, "Phã bang"},
		{3, 2, "Tr­ëng l·o"},
		{4, 3, "§­êng chñ"},
		{5, 3, "H­¬ng chñ"},
		{6, 4, "bang chóng phæ th«ng"},
	};
	
	local szName = "";
	if nLevelName[nLevel][2] ~= nType then
		if nType == 2 or nType == 3 then
			szName = "phã bang chñ hoÆc tr­ëng l·o";
		elseif nType == 4 or nType == 5 then
			szName = "®­êng chñ hoÆc h­¬ng chñ";
		else
			szName = nLevelName[nType][3];
		end
		Talk(1, "", "<color=green>Kim S¬n ch­ëng m«n nh©n<color>: §Şa vŞ trong bang héi cña ®¹i hiÖp kh«ng ph¶i lµ "..szName..", kh«ng thÓ nhËn phÇn th­ëng nµy ®­îc.");
		return 0;
	end
	ApplyRelayShareData("viet0911_tongmaster_award", 0, nType, VIET_0911_FILE_NAME, "get_tongmaster_award_callback");
end

function get_tongmaster_award_callback(szKey, nKey1, nKey2, nCount)
	local nType = GetTaskTemp(105);
	local nLevel = IsTongMember();
	local nLevelName = {
		{1, 1, "Bang chñ"},
		{2, 2, "Phã bang"},
		{3, 2, "Tr­ëng l·o"},
		{4, 3, "§­êng chñ"},
		{5, 3, "H­¬ng chñ"},
		{6, 4, "bang chóng phæ th«ng"},
	};
	
	--¶Ô×î´óÁìÈ¡ÊıÁ¿µÄÏŞÖÆ
	local nNumLimit = {1, 2, 42, 261};--Ã¿¸öµÈ¼¶µÄÈË¿ÉÒÔÁìÈ¡µÄÊıÁ¿
	local nMaxNum = nNumLimit[nType];--×î´ó¿ÉÒÔÁìÈ¡µÄÊıÁ¿
	local nTongLadder = GetTongPopuLadder();
	local szName = "";
	if nLevelName[nLevel][2] ~= nType then
		if nType == 2 or nType == 3 then
			szName = "phã bang chñ hoÆc tr­ëng l·o";
		elseif nType == 4 or nType == 5 then
			szName = "®­êng chñ hoÆc h­¬ng chñ";
		else
			szName = nLevelName[nType][3];
		end
		Talk(1, "", "<color=green>Kim S¬n ch­ëng m«n nh©n<color>: §Şa vŞ trong bang héi cña ®¹i hiÖp kh«ng ph¶i lµ "..szName..", kh«ng thÓ nhËn phÇn th­ëng nµy ®­îc.");
		return 0;
	end
	
	if nCount ~= 0 then
		local nDate, nNum = GetRelayShareDataByKey(szKey, nKey1, nKey2, GetTongName());
		DelRelayShareDataCopy(szKey, nKey1, nKey2);
		if not nDate then
			Say("<color=green>Kim S¬n ch­ëng m«n nh©n<color>: C¸c h¹ ®ang ë bang héi nh©n khİ h¹ng "..nTongLadder.." , ®Şa vŞ cña ®¹i hiÖp trong bang héi lµ "..nLevelName[nLevel][3].."§¹i hiÖp x¸c nhËn muèn nhËn phÇn th­ëng nµy?",
					2,
			 		"Ta muèn nhËn th­ëng/#confirm_get_tong_award("..nTongLadder..", "..nLevelName[nLevel][2]..","..(nMaxNum - 1)..")",
					"§Ó ta nghÜ l¹i/viet_0911_nothing"
			 );
		else
			if nDate >= tonumber(date("%Y%W")) then
				if nNum <= 0 then
					Talk(1, "", "<color=green>Kim S¬n ch­ëng m«n nh©n<color>: TuÇn nµy c¸c h¹ ®· nhËn phÇn th­ëng bang héi råi.");
					return 0;
				else
					Say("<color=green>Kim S¬n ch­ëng m«n nh©n<color>: C¸c h¹ ®ang ë bang héi nh©n khİ h¹ng "..nTongLadder.." , ®Şa vŞ cña ®¹i hiÖp trong bang héi lµ "..nLevelName[nLevel][3].."§¹i hiÖp x¸c nhËn muèn nhËn phÇn th­ëng nµy?",
							2,
					 		"Ta muèn nhËn th­ëng/#confirm_get_tong_award("..nTongLadder..", "..nLevelName[nLevel][2]..","..(nNum - 1)..")",
							"§Ó ta nghÜ l¹i/viet_0911_nothing"
					 );
				end
			else
				Say("<color=green>Kim S¬n ch­ëng m«n nh©n<color>: C¸c h¹ ®ang ë bang héi nh©n khİ h¹ng "..nTongLadder.." , ®Şa vŞ cña ®¹i hiÖp trong bang héi lµ "..nLevelName[nLevel][3].."§¹i hiÖp x¸c nhËn muèn nhËn phÇn th­ëng nµy?",
						2,
				 		"Ta muèn nhËn th­ëng/#confirm_get_tong_award("..nTongLadder..", "..nLevelName[nLevel][2]..","..(nMaxNum - 1)..")",
						"§Ó ta nghÜ l¹i/viet_0911_nothing"
				 );
			end
		end
	else
		Say("<color=green>Kim S¬n ch­ëng m«n nh©n<color>: C¸c h¹ ®ang ë bang héi nh©n khİ h¹ng "..nTongLadder.." , ®Şa vŞ cña ®¹i hiÖp trong bang héi lµ "..nLevelName[nLevel][3].."§¹i hiÖp x¸c nhËn muèn nhËn phÇn th­ëng nµy?",
				2,
		 		"Ta muèn nhËn th­ëng/#confirm_get_tong_award("..nTongLadder..", "..nLevelName[nLevel][2]..","..(nMaxNum - 1)..")",
				"§Ó ta nghÜ l¹i/viet_0911_nothing"
		 );
	end
end
	 
function confirm_get_tong_award(nTongLadder, nType, nSaveNum)
	--nTongLadderÊÇ°ï»áÅÅÃû£¬nTypeÊÇÁìÈ¡ÄÄÒ»¼¶µÄ½±Àø
	local tbAward;
	if nType == 1 then
		tbAward = tbVIET_0911_TONG_AWARD1[nTongLadder];
	elseif nType == 2 then
		tbAward = tbVIET_0911_TONG_AWARD2[nTongLadder];
	elseif nType == 3 then
		tbAward = tbVIET_0911_TONG_AWARD3[nTongLadder];
	else
		tbAward = tbVIET_0911_TONG_AWARD4[nTongLadder];
	end
	for i = 1, getn(tbAward) do
		if tbAward[i][1] == 1 then
			gf_SetLogCaption(VIET_0911_LOG_TITLE);
			
			for j = 1, tbAward[i][3][4] do
				local nRetCode, nIndex = gf_AddItemEx({tbAward[i][3][1], tbAward[i][3][2], tbAward[i][3][3], 1}, tbAward[i][2]);
				if nRetCode == 1 and tbAward[i][4] ~= 0 then
					SetItemExpireTime(nIndex, tbAward[i][4]);
				end
			end
			
			gf_SetLogCaption("");
		else
			dostring(tbAward[i][2]);
			Msg2Player(tbAward[i][3]);
		end
	end
	SetTask(VIET_0911_TASK_TONG_AWARD_DATE, tonumber(date("%Y%W")));
	
	--ÁìÍêºó°Ñµ±Ç°µÄÈÕÆÚ´æ»Ø¹²Ïí¿âÖĞ
	AddRelayShareData("viet0911_tongmaster_award", 0, nType, VIET_0911_FILE_NAME, "viet_0911_nothing", 0, GetTongName(), "dd", tonumber(date("%Y%W")), nSaveNum);
end

function viet_0911_get_join_tong_day()
	local nJoinTime = GetJoinTongTime();
	if nJoinTime == 0 then	--Èç¹ûÃ»ÓĞ¼ÓÈë°ï»á
		return 0;
	end;
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	return nDayCount;
end

function viet_0911_nothing()

end