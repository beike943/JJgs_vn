--=============================================
--create by baiyun 2009.4.13
--describe:Ô½ÄÏ°æ4ÔÂ·ÝÊÕ¼¯Ð£ÆìÏä»î¶¯
--=============================================
Include("\\script\\online\\viet_2009_4\\planttrees\\planttrees_head.lua")
--ÈÎÎñ±äÁ¿
JQ_TASK_GET_BOX_NUM = 2142;									--±¾ÌìÍ¨¹ýÊ¦ÃÅÈÎÎñ»ñµÃÐ£ÆìÏäµÄ´ÎÊý
JQ_TASK_GET_BOX_DATE = 2143;								--Í¨¹ýÊ¦ÃÅÈÎÎñ»ñµÃÐ£ÆìÏäµÄÈÕÆÚ
JQ_TASK_GOLDEN_FLAG_EXP_MAX = 2144;					--Ã¿ÌìÊ¹ÓÃ»Æ½ðÆì»ñµÃµÄ¾­ÑéµÄ×î´óÖµ
JQ_TASK_GET_GOLDEN_FLAG_REWARD_DATE = 2145;	--»ñµÃ»Æ½ðÆì½±ÀøµÄÈÕÆÚ

JQ_MAX_GET_BOX_NUM = 10;										--½ÇÉ«Ã¿Ìì×î¶à»ñµÃµÄÐ£ÆìÏäÊýÁ¿

JQ_CJ_GET_BOX_PERCENT = 30; 								--Í¨¹ý²Ø½£ÄÚ´ò¹Ö¿ÉÒÔ»ñµÃÐ£ÆìÏäµÄ¸ÅÂÊÎª30%

JQ_LEVEL_B_TO_R_FLAG_MONEY = 10 * 100;			--Éý¼¶À¶Æìµ½ºìÆìËùÐèµÄÇ®£¨Í­Ç®£©
JQ_LEVEL_B_TO_R_FLAG_BFLAG_NUM = 3;					--Éý¼¶À¶Æìµ½ºìÆìËùÐèµÄÀ¶ÆìÊý
JQ_GOLDEN_FLAG_EXP_MAX = 200000000;					--Ã¿ÌìÊ¹ÓÃ»Æ½ðÆì»ñµÃµÄ¾­ÑéµÄ×î´óÖµ
JQ_GOLDEN_FLAG_EACH_EXP = 125000;						--»Æ½ðÆìÃ¿´Î»ñµÃµÄ¾­ÑéÊý

JQ_ITEM_LIMIT_TIME = 7 * 24 * 60 * 60;			--ÓÐµÄ½±ÀøÎïÆ·µÄÊ¹ÓÃÆÚÏÞ

--Ê¦ÃÅÈÎÎñÖÐ½ÇÉ«»ñµÃÐ£ÆìÏäµÄÊýÁ¿
--½ÇÉ«µÈ¼¶£¬Ã¿´Î»ñµÃÐ£ÆìÏäµÄÊýÁ¿
JQ_SHIMEN_PARAM = {
					{1, 0},
					{2, 0},
					{3, 0},
					{4, 0},
					{5, 30},
					{6, 40},
					{7, 50},
					{8, 60},
					{9, 80},
		};

--°×½ðÆì½±ÀøÎïÆ·
--ÎïÆ·Ãû£¬³öÏÖ¸ÅÂÊ / 100000000 , ´óÀàÐÍ£¬¸±ÀàÐÍ£¬ÏêÏ¸ÀàÐÍ£¬Ê¹ÓÃÆÚÏÞ, ·¢·ÅÊýÁ¿
JQ_WG_FLAG_ITEM_PARAM = {
					{"Kim Cang Phôc Ma T©m Ph¸p", 59524, 0, 107, 2, 0, 1},
					{"TiÒm Long T©m Ph¸p", 59524, 0, 107, 4, 0, 1},
					{"V« TrÇn T©m Ph¸p", 59524, 0, 107, 6, 0, 1},
					{"Thiªn La T©m Ph¸p", 59524, 0, 107, 8, 0, 1},
					{"Nh­ ý T©m Ph¸p", 59524, 0, 107, 10, 0, 1},
					{"BÝch H¶i T©m Ph¸p", 59524, 0, 107, 12, 0, 1},
					{"Hçn §én T©m Ph¸p", 59524, 0, 107, 14, 0, 1},
					{"Quý Thiªn T©m Ph¸p", 59524, 0, 107, 16, 0, 1},
					{"HuyÒn ¶nh T©m Ph¸p", 59524, 0, 107, 18, 0, 1},
					{"Qu©n Tö T©m Ph¸p", 59524, 0, 107, 20, 0, 1},
					{"TrÊn Qu©n T©m Ph¸p", 59524, 0, 107, 22, 0, 1},
					{"Xuyªn V©n T©m Ph¸p", 59524, 0, 107, 24, 0, 1},
					{"U Minh T©m Ph¸p", 59524, 0, 107, 26, 0, 1},
					{"Linh Cæ T©m Ph¸p", 59524, 0, 107, 28, 0, 1},
					{"M¶nh Thiªn th¹ch", 32000000, 2, 2, 7, 0, 1},
					{"ThÕ Th©n phï", 14500000, 2, 0, 556, JQ_ITEM_LIMIT_TIME, 1},
					{"Tiªu KiÕp t¸n", 20070867, 2, 0, 141, JQ_ITEM_LIMIT_TIME, 1},
					{"Tµng KiÕm anh hïng thiÕp", 24000000, 2, 0, 31, JQ_ITEM_LIMIT_TIME, 1},
					{"B¸t B¶o TÈy Tñy Tiªn §¬n", 4167, 2, 0, 138, JQ_ITEM_LIMIT_TIME, 1},
					{"TÈy Tñy linh ®¬n", 8333, 2, 0, 137, JQ_ITEM_LIMIT_TIME, 1},
					{"Thiªn Hµ MËt tÞch", 833333, 0, 107, 64, 0, 1},
					{"Tö Hµ MËt tÞch", 833333, 0, 107, 65, 0, 1},
					{"Chiªm Y Phæ", 416667, 0, 107, 66, 0, 1},
					{"Lôc L©m Lang Yªn", 700000, 2, 1, 1014, JQ_ITEM_LIMIT_TIME, 1},
					{"Thñy Hoµng BÝ ChiÕu", 700000, 2, 1, 1047, JQ_ITEM_LIMIT_TIME, 1},
					{"Uyªn ¦¬ng Kim Ti B¹c", 150000, 2, 1, 1048, JQ_ITEM_LIMIT_TIME, 1},
					{"Ph¸o hoa ®­a tin", 3900000, 2, 1, 203, JQ_ITEM_LIMIT_TIME, 1},
					{"B¶o r­¬ng Tµng KiÕm ®Çu qu¸n", 100000, 2, 1, 1059, JQ_ITEM_LIMIT_TIME, 1},
					{"B¶o r­¬ng Tµng KiÕm y gi¸p", 150000, 2, 1, 1060, JQ_ITEM_LIMIT_TIME, 1},
					{"B¶o r­¬ng Tµng KiÕm hoa khè", 150000, 2, 1, 1061, JQ_ITEM_LIMIT_TIME, 1},
					{"B¶o r­¬ng Tµng KiÕm trang søc", 100000, 2, 1, 1062, JQ_ITEM_LIMIT_TIME, 1},
					{"B¶o r­¬ng Tµng KiÕm vò khÝ", 100000, 2, 1, 1063, JQ_ITEM_LIMIT_TIME, 1},
					{"NhÊt §¹i §¹i HiÖp", 200000, 2, 1, 1041, JQ_ITEM_LIMIT_TIME, 1},
					{"Phong th­ëng lÖnh_Liªu (Tiªn Phong)", 99966, 2, 1, 9985, JQ_ITEM_LIMIT_TIME, 1},
					{"Phong th­ëng lÖnh_Tèng (Tiªn Phong)", 100000, 2, 1, 9986, JQ_ITEM_LIMIT_TIME, 1},
					{"Phong lÖnh-cao cÊp", 50000, 2, 1, 1018, JQ_ITEM_LIMIT_TIME, 1}
}

--»Æ½ðÆì½±ÀøÎïÆ·
--ÎïÆ·Ãû£¬³öÏÖ¸ÅÂÊ / 100000000 , ´óÀàÐÍ£¬¸±ÀàÐÍ£¬ÏêÏ¸ÀàÐÍ£¬Ê¹ÓÃÆÚÏÞ
JQ_YG_FLAG_ITEM_PARAM = {
					{"Lé thñy", 10000000, 2, 0, 351, 0, 1},
					{"M¶nh Thiªn th¹ch", 2025000, 2, 2, 7, 0, 1},
					{"Thiªn th¹ch", 3000000, 2, 2, 8, 0, 1},
					{"M¶nh B¨ng th¹ch", 2000000, 2, 1, 148, 0, 1},
					{"B¨ng th¹ch", 3000000, 2, 1, 149, 0, 1},
					{"Bång Lai Tiªn Thñy", 1500000, 2, 1, 1012, 0, 1},
					{"Bång Lai Lé Thñy", 2000000, 2, 1, 1052, 0, 1},
					{"Danh väng", 5000000, 0, 0, 0, 0, 3},
					{"Danh väng", 1000000, 0, 0, 0, 0, 5},
					{"Danh väng", 1000000, 0, 0, 0, 0, 10},
					{"Danh väng", 500000, 0, 0, 0, 0, 50},
					{"LuyÖn", 31000000, 0, 0, 0, 0, 20},
					{"§iÓm tµng kiÕm", 34500000, 0, 0, 0, 0, 100},
					{"Tµng KiÕm anh hïng thiÕp", 500000, 2, 0, 31, JQ_ITEM_LIMIT_TIME, 1},
					{"ThÕ Th©n phï", 1553800, 2, 0, 556, JQ_ITEM_LIMIT_TIME, 1},
					{"Tiªu KiÕp t¸n", 1000000, 2, 0, 141, JQ_ITEM_LIMIT_TIME, 1},
					{"B¸t B¶o TÈy Tñy Tiªn §¬n", 375, 2, 0, 138, JQ_ITEM_LIMIT_TIME, 1},
					{"TÈy Tñy linh ®¬n", 750, 2, 0, 137, JQ_ITEM_LIMIT_TIME,1},
					{"Thiªn Hµ MËt tÞch", 75000, 0, 107, 64, 0, 1},
					{"Tö Hµ MËt tÞch", 75000, 0, 107, 65, 0, 1},
					{"Chiªm Y Phæ", 37500, 0, 107, 66, 0, 1},
					{"Lôc L©m Lang Yªn", 12500, 2, 1, 1014, JQ_ITEM_LIMIT_TIME, 1},
					{"Thñy Hoµng BÝ ChiÕu", 12500, 2, 1, 1047, JQ_ITEM_LIMIT_TIME, 1},
					{"Uyªn ¦¬ng Kim Ti B¹c", 20000, 2, 1, 1048, JQ_ITEM_LIMIT_TIME, 1},
					{"Ph¸o hoa ®­a tin", 50000, 2, 1, 203, JQ_ITEM_LIMIT_TIME, 1},
					{"B¶o r­¬ng Tµng KiÕm ®Çu qu¸n", 2000, 2, 1, 1059, JQ_ITEM_LIMIT_TIME, 1},
					{"B¶o r­¬ng Tµng KiÕm y gi¸p", 50000, 2, 1, 1060, JQ_ITEM_LIMIT_TIME, 1},
					{"B¶o r­¬ng Tµng KiÕm hoa khè", 4000, 2, 1, 1061, JQ_ITEM_LIMIT_TIME, 1},
					{"B¶o r­¬ng Tµng KiÕm trang søc", 1000, 2, 1, 1062, JQ_ITEM_LIMIT_TIME, 1},
					{"B¶o r­¬ng Tµng KiÕm vò khÝ", 2000, 2, 1, 1063, JQ_ITEM_LIMIT_TIME, 1},
					{"NhÊt §¹i §¹i HiÖp", 5000, 2, 1, 1041, JQ_ITEM_LIMIT_TIME, 1},
					{"Phong th­ëng lÖnh_Liªu (Tiªn Phong)", 8000, 2, 1, 9985, JQ_ITEM_LIMIT_TIME, 1},
					{"Phong th­ëng lÖnh_Tèng (Tiªn Phong)", 8000, 2, 1, 9986, JQ_ITEM_LIMIT_TIME, 1},
					{"Phong lÖnh-cao cÊp", 2000, 2, 1, 1018, JQ_ITEM_LIMIT_TIME, 1},
					{"Kim Cang Phôc Ma kinh", 3970, 0, 107, 1, 0, 1},
					{"TiÒm Long MËt tÞch", 3970, 0, 107, 3, 0, 1},
					{"V« TrÇn MËt tÞch", 3970, 0, 107, 5, 0, 1},
					{"Thiªn La MËt TÞch", 3970, 0, 107, 7, 0, 1},
					{"Nh­ ý MËt TÞch", 3970, 0, 107, 9, 0, 1},
					{"BÝch H¶i Phæ", 3970, 0, 107, 11, 0, 1},
					{"Hçn §én MËt tÞch", 3970, 0, 107, 13, 0, 1},
					{"Quý Thiªn MËt tÞch", 3970, 0, 107, 15, 0, 1},
					{"HuyÒn ¶nh MËt tÞch", 3970, 0, 107, 17, 0, 1},
					{"Qu©n Tö MËt tÞch", 3970, 0, 107, 19, 0, 1},
					{"TrÊn Qu©n MËt tÞch", 3970, 0, 107, 21, 0, 1},
					{"Xuyªn V©n MËt tÞch", 3970, 0, 107, 23, 0, 1},
					{"U Minh Quû Lôc", 3970, 0, 107, 25, 0, 1},
					{"Linh Cæ MËt tÞch", 3970, 0, 107, 27, 0, 1}
					
}

function JQ_CheckEventDate()		--¼ì²é»î¶¯ÈÕÆÚ2009Äê04ÔÂ24ÈÕ¡¡-- 2009Äê05ÔÂ24ÈÕ24µã
	if getCurYear() ~= 2009 then
		return 0;
	end
	if getCurMonth() == 4 then
		if getCurDate() >= 24 then
			return 1;
		end
	end
	if getCurMonth() == 5 then
		if getCurDate() <= 31 then
			return 1;
		end
	end
	return 0;
end

function JQ_DoNothing()
end


--------------------------------------
--JQ_GetRandItem()
--È¡µÃËæ»úÎïÆ·
--------------------------------------
function JQ_GetRandItem(JQ_WYG_FLAG_ITEM_PARAM)
	local nPos = 0;
	local nRand = random(1, 100000000);
	for i = 1, getn(JQ_WYG_FLAG_ITEM_PARAM) do
		if nRand > nPos and nRand <= nPos + JQ_WYG_FLAG_ITEM_PARAM[i][2] then
			return i;
		end
		nPos = nPos + JQ_WYG_FLAG_ITEM_PARAM[i][2];
	end
	return 15;
end