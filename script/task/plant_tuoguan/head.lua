--=============================================
--create by baiyun 2009.8.25
--describe:Ô½ÄÏ°æ8ÔÂ·Ýµ÷Õû ÀëÏßÍÐ¹ÜÖÖÊ÷Í·ÎÄ¼þ
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
--ËùÓÐ»î¶¯¸øÍÐ¹ÜÖÖÊ÷ÉÏ½»°ãÈôÖ¤Êé½±ÀøµÄÍ³Ò»Í·ÎÄ¼þ
Include("\\script\\lib\\writelog.lua");
Include("\\script\\online_activites\\award.lua")
						--°ï±ðÈËÖÖÊ÷µÄ»ý·Ö
TASK_TUOGUAN_PLANT_POINT = 2255;				
TASK_TUOGUAN_PLANT_WANT_ACTIVE_TIME = 2256;	--µã»÷NPCÇëÇó¼¤»îµÄÊ±¼ä
TASK_TUOGUAN_PLANT_ACTIVE_TIME = 2257;			--Íæ¼Ò¼¤»îÍÐ¹ÜµÄÊ±¼ä
TASK_TUOGUAN_PLANT_HAS_ACTIVE = 2258;				--Íæ¼ÒÊÇ·ñÒÑ¾­¼¤»îÍÐ¹ÜÖÖÊ÷
TASK_TUOGUAN_PLANT_DATE = 2259;							--Íæ¼Ò½øÐÐÍÐ¹ÜµÄÈÕÆÚ
TASK_TUOGUAN_PLANT_COUNT = 2260;						--Íæ¼Ò½ñÌìÒÑ¾­ÍÐ¹ÜµÄ´ÎÊý
TASK_TUOGUAN_PLANT_TYPE = 2261;							--Íæ¼ÒÍÐ¹ÜµÄÀàÐÍ£¬×Ô¼ºÍÐ¹Ü»¹ÊÇ°ï±ðÈËÖÖÊ÷
TASK_TUOGUAN_GIVE_BANRUO_DATE = 2272;				--ÍÐ¹ÜÖÖÊ÷ÉÏ½»°ãÈôÖ¤ÊéµÄÈÕÆÚ
TASK_TUOGUAN_GIVE_BANRUO_COUNT = 2273;			--ÍÐ¹ÜÖÖÊ÷ÉÏ½»°ãÈôÖ¤ÊéµÄÊýÁ¿
TASK_TUOGUAN_GET_AWARD_DATE = 2274;					--ÍÐ¹ÜÖÖÊ÷ÁìÈ¡½±ÀøµÄÈÕÆÚ
TASK_TUOGUAN_GET_AWARD_FLAG = 2275;					--ÍÐ¹ÜÖÖÊ÷ÁìÈ¡½±ÀøµÄ¼ÇÂ¼±ê¼Ç

str_TUOGUAN_LOG = "[ñy th¸c trång c©y:]";

--ÍÐ¹Ü³É¹¦µÄ¸ÅÂÊ
t_TUOGUAN_PLANT_RAND = {75, 75, 50, 75, 50};

--°ï±ðÈËÖÖÊ÷»ñµÃµÄ»ý·Ö
t_TUOGUAN_HELP_POINT = {
	{1, 46},
	{2, 46},
	{3, 7},
	{4, 1},
};
t_ZONE = {"HCM 1", "HCM 2", "HCM 3", "HN 1", "HN 2"};

--ÍÐ¹ÜµÄ¾­Ñé½±Àø
t_TUOGUAN_EXP = {
	--ÍÐ¹ÜÖÖÊ÷
	{
		{200000, 85},
		{300000, 5},
		{400000, 5},
		{500000, 5},
	},
	--°ï±ðÈËÖÖÊ÷
	{
		{600000, 30},
		{700000, 50},
		{800000, 20},
	}
};

--ÍÐ¹ÜµÃµÄ½±Àø
t_TUOGUAN_AWARD = {
--ÍÐ¹ÜÖÖÊ÷
--°ï±ðÈËÖÖÊ÷,½±ÀøÏàÍ¬
	--{"Th¸i H­ §a MËt Qu¶ ", 	60, {2,1,387,1}},
	{"Vßng Th¸i H­ B¸t Qu¸i - Cµn", 354, {2,1,469,1}},
	{"Vßng Th¸i H­ B¸t Qu¸i - Kh«n", 290, {2,1,470,1}},
	{"Vßng Th¸i H­ B¸t Qu¸i - Kh¶m", 60, {2,1,471,1}},
	{"Vßng Th¸i H­ B¸t Qu¸i - §oµi", 40, {2,1,472,1}},
	{"Vßng Th¸i H­ B¸t Qu¸i - Ly", 40, {2,1,473,1}},
--	{"Vßng Th¸i H­ B¸t Qu¸i - ChÊn", 1, {2,1,474,1}},
--	{"Vßng Th¸i H­ B¸t Qu¸i - CÊn", 100, {2,1,475,1}},
--	{"Vßng Th¸i H­ B¸t Qu¸i - Tèn", 3, {2,1,476,1}},
	{"Ngò Hµnh MËt tÞch", 			4, {0,107,155,1}},
	{"NguyÖt Hoa Chi Tinh", 			3, {2,1,3219,1}},
	{"NguyÖt Hoa ", 					4, {2,1,2002,1}},
	{"XÝch ThiÕt Tinh", 				204, {2,1,2652,1}},
	{"N«ng Tang phæ", 			1, {2,1,1056,1}},
--	{"Long HuyÕt hoµn", 				1, {2,1,1002,1}},
--	{"Kú L©n hoµn", 				1, {2,1,1003,1}},
--	{"Phông HuyÕt hoµn", 				1, {2,1,1004,1}},
--	{"ChiÕn ThÇn hoµn", 				1, {2,1,1005,1}},
};

--½»¹»8¸ö°ãÈôÖ¤ÊéºóµÃµ½µÄ½±Àø
t_TUOGUAN_8_AWARD = {
	{"Bµn Long bÝch", 10, {2,1,1000,1}, 15*24*3600},
	{"MÆt n¹ S¸t Thñ §­êng", 10, {2,1,1087,1}, 15*24*3600},
	{"ThÇn N«ng §¬n", 10, {2,1,343,1}, 15*24*3600},
	{"ThÕ Th©n phï", 10, {2,0,556,1}, 15*24*3600},
	{"Tu Ch©n YÕu QuyÕt", 10, {2,0,554,1}, 15*24*3600},
	{"Tµng KiÕm anh hïng thiÕp", 10, {2,0,31,1}, 15*24*3600},
	{"S­ m«n mËt hµm", 10, {2,1,1020,1}, 15*24*3600},
	{"§¹i Nh©n s©m", 10, {2,0,553,1}, 15*24*3600},
	{"ThÇn hµnh bÝ phæ", 10, {0,200,39,1}, 15*24*3600},
	{"Tinh ®iªu hoa c­¬ng th¹ch", 10, {2,1,1023,1}, 15*24*3600},
};


--»ý·Ö»»È¡½±ÀøµÄ½±ÀøÁÐ±í
t_TUOGUAN_POINT_TO_AWARD = {
	{"MËt tÞch m«n ph¸i cao cÊp 70", nil},
	{"Nh©n S©m V¹n N¨m", {2,1,30071,6}},
	{"Tr¸i c©y", nil},
	{"Thiªn Th¹ch linh th¹ch", {2,1,1068,1}, 30 * 24 * 3600},
	{"Nh©n S©m V¹n N¨m", {2,1,30071,6}},
	{"Hßa ThÞ BÝch", {2,1,1001,2}, 7 * 24 * 3600},
	{"Tr¸i c©y", nil},
	{"Nh©n S©m V¹n N¨m", {2,1,30071,6}},
	{"§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", {2,1,1067,1}, 30 * 24 * 3600},
	{"Thiªn Cang LÖnh",{2, 95, 204,2}}, 
	{"Nh©n S©m V¹n N¨m", {2,1,30071,6}},
	{"§¹i §Þnh Hån", {2,1,1113,1}, 30 * 24 * 3600},
	{"Thiªn M«n Kim LÖnh", {2,1,30370,2}},
	{"Nh©n S©m V¹n N¨m", {2,1,30071,6}},
	{"L¨ng Ba Vi Bé", {0,112,78,1}},
	{"Tói Thiªn Th¹ch Tinh Th¹ch", {2,1,3356,1}, 30 * 24 * 3600},
	{"Tr¸i c©y", nil},
	{"ChuyÓn Sinh §¬n", {2,1,30345,1}, 30 * 24 * 3600},
	{"Thiªn Th¹ch linh th¹ch", {2,1,1068,1}, 30 * 24 * 3600},
	{"Hßa ThÞ BÝch", {2,1,1001,2}, 7 * 24 * 3600},
	{"Nh©n S©m V¹n N¨m", {2,1,30071,6}},
	{"§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", {2,1,1067,1}, 30 * 24 * 3600},
	{"Tói Thiªn Th¹ch Tinh Th¹ch", {2,1,3356,1}, 30 * 24 * 3600},
	{"L¨ng Ba Vi Bé toµn tËp", {0,112,158,1}},
	{"Tr¸i c©y", nil},
	{"Hßa ThÞ BÝch", {2,1,1001,2}, 7 * 24 * 3600},
	{"Nh©n S©m V¹n N¨m", {2,1,30071,6}},
	{"ChuyÓn Sinh §¬n", {2,1,30345,1}, 30 * 24 * 3600},
	{"Thiªn M«n Kim LÖnh", {2,1,30370,2}},
	{"Nh©n S©m V¹n N¨m", {2,1,30071,18}},
}

-- MËt tÞch cao cÊp 70
t_TUOGUAN_HIG = {
	[2] = {"Kim Cang B¸t Nh· Ch©n QuyÓn", {0,107,204,2,1}},
	[3] = {"V« TrÇn Bå §Ò Ch©n QuyÓn",{0,107,206,2,1}},
	[4] = {"TiÒm Long Tóc DiÖt Ch©n QuyÓn",{0,107,205,2,1}},
	[6] = {"Thiªn La Liªn Ch©u Ch©n QuyÓn",{0,107,207,2,1}},
	[8] = {"Nh­ ý Kim §Ønh Ch©n QuyÓn",{0,107,208,2,1}},
	[9] = {"BÝch H¶i TuyÖt ¢m Ch©n QuyÓn",{0,107,209,2,1}},
	[11] = {"Hçn §én TrÊn Nh¹c Ch©n QuyÓn",{0,107,210,2,1}},
	[12] = {"Quú Thiªn Du Long Ch©n QuyÓn",{0,107,211,2,1}},
	[14] = {"HuyÒn ¶nh Mª T«ng Ch©n QuyÓn",{0,107,212,2,1}},
	[15] = {"Qu©n Tö §íi Phong Ch©n QuyÓn",{0,107,213,2,1}},
	[17] = {"TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn",{0,107,214,2,1}},
	[18] = {"Xuyªn V©n L¹c Hång Ch©n QuyÓn",{0,107,215,2,1}},
	[20] = {"HuyÒn Minh Phong Ma Ch©n QuyÓn",{0,107,216,2,1}},
	[21] = {"Linh Cæ HuyÒn Tµ Ch©n QuyÓn",{0,107,217,2,1}},
	[23] = {"Cöu Thiªn Phong L«i Ch©n QuyÓn", {0,107, 218,2,1}},		
	[29] = {"Hång TrÇn Tóy Méng Ch©n QuyÓn", {0,107, 222,2,1}},		
	[30] = {"Phong Hoa Thiªn DiÖp Ch©n QuyÓn", {0,107, 223,2,1}},			
};
--»ý·Ö»»È¡½±ÀøµÄÃØ¼®
-- MËt tÞch 70
t_TUOGUAN_MIJI = {
	[2] = {"Kim Cang B¸t Nh· Kinh", {0,107,166,2}},
	[3] = {"V« TrÇn Bå §Ò Kinh",{0,107,168,1}},
	[4] = {"TiÒm Long TÞch DiÖt Kinh",{0,107,167,1}},
	[6] = {"Thiªn La Liªn Ch©u Lôc",{0,107,169,1}},
	[8] = {"Nh­ ý Kim §Ønh MËt TÞch",{0,107,170,1}},
	[9] = {"BÝch H¶i TuyÖt ¢m Phæ",{0,107,171,1}},
	[11] = {"Hçn §én TrÊn Nh¹c MËt TÞch"	,{0,107,172,1}},
	[12] = {"Quü Thiªn Du Long MËt TÞch",{0,107,173,1}},
	[14] = {"HuyÔn ¶nh Mª Tung MËt TÞch",{0,107,174,1}},
	[15] = {"Qu©n Tö TiÖt Phong MËt TÞch",{0,107,175,1}},
	[17] = {"TrÊn Qu©n Phi Long Th­¬ng Phæ"	,{0,107,176,1}},
	[18] = {"Xuyªn V©n L¹c Hång MËt TÞch",{0,107,177,1}},
	[20] = {"U Minh Phong Ma Lôc",{0,107,178,1}},
	[21] = {"Linh Cæ HuyÔn Tµ Lôc",{0,107,179,1}},
	[23] = {"Cöu Thiªn Phong L«i QuyÕt",{0,107,198,1}},	
	[29] = {"Hång TrÇn Tóy Méng Phæ",{0,107,202,1}},
	[30] = {"Phong Hoa Thiªn DiÖp Phæ",{0,107,203,1}},
};

t_TUOGUAN_MIJI2 = {
	[2] = {"Kim Cang B¸t Nh· Kinh", {0,107,166,2}},
	[3] = {"V« TrÇn Bå §Ò Kinh",{0,107,168,2}},
	[4] = {"TiÒm Long TÞch DiÖt Kinh",{0,107,167,2}},
	[6] = {"Thiªn La Liªn Ch©u Lôc",{0,107,169,2}},
	[8] = {"Nh­ ý Kim §Ønh MËt TÞch",{0,107,170,2}},
	[9] = {"BÝch H¶i TuyÖt ¢m Phæ",{0,107,171,2}},
	[11] = {"Hçn §én TrÊn Nh¹c MËt TÞch"	,{0,107,172,2}},
	[12] = {"Quü Thiªn Du Long MËt TÞch",{0,107,173,2}},
	[14] = {"HuyÔn ¶nh Mª Tung MËt TÞch",{0,107,174,2}},
	[15] = {"Qu©n Tö TiÖt Phong MËt TÞch",{0,107,175,2}},
	[17] = {"TrÊn Qu©n Phi Long Th­¬ng Phæ"	,{0,107,176,2}},
	[18] = {"Xuyªn V©n L¹c Hång MËt TÞch",{0,107,177,2}},
	[20] = {"U Minh Phong Ma Lôc",{0,107,178,2}},
	[21] = {"Linh Cæ HuyÔn Tµ Lôc",{0,107,179,2}},
	[23] = {"Cöu Thiªn Phong L«i QuyÕt",{0,107,198,2}},	
	[29] = {"Hång TrÇn Tóy Méng Phæ",{0,107,202,2}},
	[30] = {"Phong Hoa Thiªn DiÖp Phæ",{0,107,203,2}},	
};
-- MËt tÞch 45
t_TUOGUAN_LOW = {
	[2] = {"Kim Cang Phôc Ma kinh",{0,107, 1,2}},
	[3] = {"V« TrÇn MËt tÞch",{0,107, 5,2}},
	[4] = {"TiÒm Long MËt tÞch",	{0,107, 3,2}},
	[6] = {"Thiªn La MËt TÞch",{0,107, 7,2}},
	[8] = {"Nh­ ý MËt TÞch",{0,107, 9,2}},
	[9] = {"BÝch H¶i Phæ",{0,107,11,2}},
	[11] = {"Hçn §én MËt tÞch",{0,107,13,2}},
	[12] = {"Quý Thiªn MËt tÞch",{0,107,15,2}},
	[14] = {"HuyÒn ¶nh MËt tÞch",{0,107,17,2}},
	[15] = {"Qu©n Tö MËt tÞch",{0,107,19,2}},
	[17] = {"TrÊn Qu©n MËt tÞch",{0,107,21,2}},
	[18] = {"Xuyªn V©n MËt tÞch",{0,107,23,2}},
	[20] = {"U Minh Quû Lôc",{0,107,25,2}},
	[21] = {"Linh Cæ MËt tÞch",{0,107,27,2}},
	[23] = {"Kinh Phong MËt TÞch",{0,107,180,2}},
	[29] = {"Tóy Méng MËt tÞch",{0,107,188,2}},
	[30] = {"Phån Hoa MËt tÞch",{0,107,190,2}},			
};

--»ý·Ö»»¾÷Òª½±Àø
t_TUOGUAN_JUEYAO = {
	[2] = {"Tói bÝ kiÕp ThiÕu L©m", {2,0,607,1}},
	[3] = {"Tói bÝ kiÕp ThiÕu L©m",{2,0,607,1}},
	[4] = {"Tói bÝ kiÕp ThiÕu L©m",{2,0,607,1}},
	[6] = {"Tói bÝ kiÕp §­êng M«n",{2,0,608,1}},
	[8] = {"Tói bÝ kiÕp Nga My",{2,0,609,1}},
	[9] = {"Tói bÝ kiÕp Nga My",{2,0,609,1}},
	[11] = {"Tói bÝ kiÕp C¸i Bang"	,{2,0,610,1}},
	[12] = {"Tói bÝ kiÕp C¸i Bang",{2,0,610,1}},
	[14] = {"Tói bÝ kiÕp Vâ §ang",{2,0,611,1}},
	[15] = {"Tói bÝ kiÕp Vâ §ang",{2,0,611,1}},
	[17] = {"Tói bÝ kiÕp D­¬ng M«n"	,{2,0,612,1}},
	[18] = {"Tói bÝ kiÕp D­¬ng M«n",{2,0,612,1}},
	[20] = {"Tói bÝ kiÕp Ngò §éc",{2,0,613,1}},
	[21] = {"Tói bÝ kiÕp Ngò §éc",{2,0,613,1}},
};

function plant_tuoguan(nType, nPay, nZone)
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE) == 1 then
		if GetTask(TASK_TUOGUAN_PLANT_TYPE) == 1 then
			Talk(1, "", "ThiÕu hiÖp ®· nhê ng­êi trång c©y gióp, 900 gi©y sau h·y ®Õn Sø Gi¶ Vâ L©m ®Ó nhËn th­ëng.");
			return 0;
		else
			Talk(1, "", "ThiÕu hiÖp ®· ®¨ng ký thµnh c«ng trång c©y gióp ng­êi kh¸c, 360 gi©y sau h·y quay l¹i nhËn th­ëng.");
			return 0;
		end
	end
	if GetTask(TASK_TUOGUAN_PLANT_DATE) ~= nDate then
		SetTask(TASK_TUOGUAN_PLANT_COUNT, 0);
	end
	if GetTask(TASK_TUOGUAN_PLANT_COUNT) >= 16 then
		Talk(1, "", "H«m nay thiÕu hiÖp ®· ñy th¸c trång c©y vµ gióp ng­êi kh¸c trång c©y thµnh c«ng, kh«ng thÓ ñy th¸c thªm hoÆc gióp ng­êi kh¸c tr«ng c©y n÷a.");
		return 0;
	end
	local nDiff = GetTime() - GetTask(TASK_TUOGUAN_PLANT_WANT_ACTIVE_TIME);
	if nDiff < 60 then
		Talk(1, "", "ThiÕu hiÖp cÇn ph¶i ®îi thªm"..(60 - nDiff).." gi©y míi cã thÓ tiÕp tôc ñy th¸c trång c©y.");
		return 0;
	end
	if nType == 1 then
		if GetItemCount(2, 0, 398) == 0 or GetItemCount(2, 0, 351) < 7 or GetItemCount(2, 1, 509) == 0 then
			Talk(1, "", "Nguyªn liÖu trªn ng­êi kh«ng ®ñ, kh«ng thÓ ñy th¸c trång c©y");
			return 0;
		end
	elseif nType == 2 then
		if GetItemCount(2, 1, 30114) == 0 then
			Talk(1, "", "Trªn ng­êi kh«ng cã b¸t nh· chøng th­, kh«ng thÓ ñy th¸c trång c©y");
			return 0;
		end
	end
	if nType == 1 then
		if random(1, 100) > t_TUOGUAN_PLANT_RAND[nType] then
			Talk(1, "", "HiÖn t¹i ë server ®· chän ch­a cã ng­êi nhËn trång c©y/ ®· ®ñ sè l­îng c«ng viÖc. Xin h·y ®¨ng ký l¹i trong 60 gi©y n÷a");
			SetTask(TASK_TUOGUAN_PLANT_WANT_ACTIVE_TIME, GetTime());
			return 0;
		end
	elseif nType == 2 then
		if random(1, 100) > 75 then
			Talk(1, "", "HiÖn t¹i ë server ®· chän ch­a cã ng­êi nhËn trång c©y/ ®· ®ñ sè l­îng c«ng viÖc. Xin h·y ®¨ng ký l¹i trong 60 gi©y n÷a");
			SetTask(TASK_TUOGUAN_PLANT_WANT_ACTIVE_TIME, GetTime());
			return 0;
		end
	end
	if Pay(nPay * 10000) == 0 then
		Talk(1, "", "Ng©n l­îng cña b¹n kh«ng ®ñ!");
		return 0;
	end
	if nType == 1 then
		if DelItem(2, 0, 398, 1) == 1 and DelItem(2, 0, 351, 7) == 1 and DelItem(2, 1, 509, 1) == 1 then
			SetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE, 1);
			SetTask(TASK_TUOGUAN_PLANT_DATE, nDate);
			SetTask(TASK_TUOGUAN_PLANT_COUNT, GetTask(TASK_TUOGUAN_PLANT_COUNT) + 1);
			SetTask(TASK_TUOGUAN_PLANT_ACTIVE_TIME, GetTime());
			SetTask(TASK_TUOGUAN_PLANT_TYPE, nType);
			Talk(1, "", "§¹i hiÖp ®· ñy th¸c trång c©y thµnh c«ng, xin mêi ®îi 900 gi©y sau ®Õn <color=green>Vâ L©m Sø Gi¶<color> nhËn th­ëng.");
			Msg2Player("§¹i hiÖp ®· ñy th¸c trång c©y thµnh c«ng, xin mêi ®îi 900 gi©y sau ®Õn Vâ L©m Sø Gi¶ nhËn th­ëng.");
			if nZone ~= 0 then 
				WriteLogEx("Uy thac trong cay", "Uy Thac", 1, t_ZONE[nZone]);
			end
		end
	elseif nType == 2 then
		if DelItem(2, 1, 30114, 1) == 1 then
			SetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE, 1);
			SetTask(TASK_TUOGUAN_PLANT_DATE, nDate);
			SetTask(TASK_TUOGUAN_PLANT_COUNT, GetTask(TASK_TUOGUAN_PLANT_COUNT) + 1);
			SetTask(TASK_TUOGUAN_PLANT_ACTIVE_TIME, GetTime());
			SetTask(TASK_TUOGUAN_PLANT_TYPE, nType);
			if GetTask(TASK_TUOGUAN_GIVE_BANRUO_DATE) ~= nDate then
				SetTask(TASK_TUOGUAN_GIVE_BANRUO_COUNT, 0);
			end
			SetTask(TASK_TUOGUAN_GIVE_BANRUO_DATE, nDate);
			SetTask(TASK_TUOGUAN_GIVE_BANRUO_COUNT, GetTask(TASK_TUOGUAN_GIVE_BANRUO_COUNT) + 1);
                        give_tuoguan_activity_award()    --by xiongyizhi 2010ÄêÊ¥µ®ÐÂ¼Ó»î¶¯ÎïÆ·³ö¿Ú
			Talk(1, "", "C¸c h¹ ®· b¸o danh thµnh c«ng gióp ng­êi kh¸c trång c©y, ®îi 360 gi©y ®Õn nhËn th­ëng.");
			Msg2Player("C¸c h¹ ®· b¸o danh thµnh c«ng gióp ng­êi kh¸c trång c©y, ®îi 360 gi©y ®Õn nhËn th­ëng.");			
			WriteLogEx("Uy thac trong cay", "Nhan Trong Cay");
		end
	end
end
-- phÇn th­ëng nép b¸t nh· chøng th­ thø 16
function Give_BNCT_16_Award()
	local rand =  random(1,100)
	if rand <= 50 then
		local nAwardRand = mod(random(1,1000),20)
		gf_AddItemEx2({2,1,(30164+nAwardRand),4}, "Tr¸i C©y", "Nop bat nha chung thu 16", "B¸t Nh· Chøng Th­")
	elseif rand <= 55 then
		Earn(300000)
		WriteLogEx("Nop bat nha chung thu 16","Nhan 30 vang")	
	elseif rand <= 75 then	
		gf_AddItemEx2({2,1,30086,1}, "H¹t Gièng", "Nop bat nha chung thu 16", "B¸t Nh· Chøng Th­",7*24*60*60)
	elseif rand <= 85 then
		gf_AddItemEx2({2,0,504,1}, "C©y B¸t Nh· Nhá", "Nop bat nha chung thu 16", "B¸t Nh· Chøng Th­",7*24*60*60)
	elseif rand <= 90 then
		gf_AddItemEx2({2,0,398,1}, "C©y B¸t Nh· ", "Nop bat nha chung thu 16", "B¸t Nh· Chøng Th­",7*24*60*60)
	elseif rand <= 95 then
		gf_AddItemEx2({2,1,30269,1}, "C©y Tø Linh", "Nop bat nha chung thu 16", "B¸t Nh· Chøng Th­",7*24*60*60)
	else
		ModifyExp(1000000)
		WriteLogEx( "Nop bat nha chung thu 16","Nhan 1000000 diem kinh nghiem")
	end
end