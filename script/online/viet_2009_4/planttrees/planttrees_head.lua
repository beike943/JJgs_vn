Include("\\script\\lib\\writelog.lua")

--=============================================
--create by baiyun 2009.4.9
--describe:Ô½ÄÏ°æ4ÔÂ·ÝÖÖÊ÷»î¶¯
--=============================================

PLANT_TREE_LIMIT = 24;					--Ã¿ÌìÖÖÊ÷µÄ×î´óÊýÁ¿
PLANT_TREE_INTERVAL = 2 * 60;		--Á½´ÎÁ¬ÐøÖÖÊ÷µÄ¼ä¸ô
PLANT_TREE_ROLE_LEVEL_LIMIT = 10;					--¿ÉÒÔÖÖÊ÷µÄ½ÇÉ«µÈ¼¶ÏÞÖÆ
PLANT_TREE_REWARD_ITEM_TIME_LIMIT = 7 * 24 * 60 * 60; --½±ÀøÎïÆ·µÄÊ¹ÓÃÆÚÏÞ

--Ê¹ÓÃµÄÈÎÎñ±äÁ¿
TASK_TREE_INDEX       = 2132;				--¼ÇÂ¼Íæ¼ÒÖÖµÄÊ÷µÄNPCË÷Òý
TASK_TREE_GROW        = 2133;				--¼ÇÂ¼Ê÷µÄÉú³É³Ì¶È
TASK_WATER_TREE_TIME  = 2134;				--¼ÇÂ¼¸øÊ÷½½Ë®µÄÊ±¼äµã£¬¸ÕÖÖÏÂ»¹Î´½½Ë®Ê±¼´ÎªÖÖÏÂµÄÊ±¼ä
TASK_PLANT_TREE_COUNT = 2135;		    --¼ÇÂ¼Íæ¼Òµ±ÌìÖÖÊ÷µÄ´ÎÊý
TASK_PLANT_TREE_DATE  = 2136;				--¼ÇÂ¼Íæ¼ÒÖÖÏÂÊ÷µÄÈÕÆÚ
TASK_PLANT_TREE_TIME  = 2137;				--¼ÇÂ¼Íæ¼ÒÉÏ´ÎÖÖÊ÷µÄÊ±¼ä,(Ã¿´ÎÖÖÏÂÊ÷ºó¶¼Òª¸üÐÂ´ËÖµ,ÓÃÀ´ÏÞÖÆÁ½´ÎÁ¬¼ÌÖÖÊ÷)
TASK_PLANT_TREE_TYPE  = 2138;				--ÖÖÏÂÊ÷µÄÀàÐÍ 1 - 5


TREE_TYPE = {									--Ä£°åÃû£¬NPCÃû×Ö£¬³öÏÖ¸ÅÂÊ
				{"MÇm hoa hång", "C©y HÐo óa",  9},
				{"MÇm Hoa hång", "C©y BÊt Tö", 16},
				{" nh¸nh hoa hång", "C©y B¹ch Ng©n", 70},
				{"c©y §a MËt Hoa Qu¶ nhá", "C©y Hoµng Kim", 4},
				{"c©y §a MËt Hoa Qu¶ lín", "C©y B¹ch Kim", 1},
			}
			
--Ê÷µÄÊôÐÔ£º³É³¤¶È£¬´æ»îÊ±¼ä£¬ Ïà¶ÔÓÚÖÖÏÂÊ÷µÄÊ±¼äÔÙ¹ý¶àÉÙÃëºó¿ÉÒÔ½½Ë®£¬ ËùÐèÂ¶Ë®
--ÔÚµÚÁù½×¶ÎÎªÁìÈ¡½±Àø
TREE_PARAM = {
				{1, 90, 45, 1},
				{2, 130, 90, 1},
				{3, 170, 130, 1},
				{4, 210, 170, 1},
				{5, 240, 210, 1},
				{6, 300, 240, 1},
}

--³ÇÊÐÃûÓëID
CITY_NAME_ID =
				{
					[100] = "TuyÒn Ch©u",
					[150] = "D­¬ng Ch©u",
					[200] = "BiÖn Kinh",
					[300] = "Thµnh §«",
					[350] = "T­¬ng D­¬ng",
					[400] = "§¹i Lý"
				}

--»Æ½ðÊ÷½±ÀøÎïÆ·£ºÎïÆ·Ãû£¬³öÏÖ¸ÅÂÊ£¬Ö÷ÀàÐÍ£¬¸±ÀàÐÍ£¬ÏêÏ¸ÀàÐÍ£¬Ê¹ÓÃÆÚÏÞ£¬·¢·ÅÊýÁ¿
GOLDEN_TREE_REWARD_ITEM_PARAM = {
									{"Tiªu KiÕp t¸n", 50, 2, 0, 141, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"ThÇn hµnh bÝ phæ", 10, 0, 200, 39, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"Tu Ch©n YÕu QuyÕt", 40, 2, 0, 554, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1}
	};

--°×½ðÊ÷½±ÀøÎïÆ·£ºÎïÆ·Ãû£¬³öÏÖ¸ÅÂÊ£¬Ö÷ÀàÐÍ£¬¸±ÀàÐÍ£¬ÏêÏ¸ÀàÐÍ£¬Ê¹ÓÃÆÚÏÞ£¬·¢·ÅÊýÁ¿
WHITE_TREE_REWARD_ITEM_PARAM = {
									{"Bé C¶nh", 5, 0, 105, 13, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"Hèt L«i B¸c", 5, 0, 105, 12, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"XÝch Thè", 5, 0, 105, 9, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"Tr¶o Hoµng Phi §iÖn", 5, 0, 105, 11, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"Phiªu Vò", 5, 0, 105, 15, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"Bµn Long bÝch", 10, 2, 1, 1000, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"V« NgÊn Thñy", 5, 2, 1, 503, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"Sæ tay sèng", 5, 2, 19, 1, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"Bång Lai Tiªn §¬n", 50, 2, 1, 1013, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"TÈy Tñy linh ®¬n", 5, 2, 0, 137, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1}
	};
--°×ÒøÊ÷µÄ¾­Ñé½±Àø£º¾­ÑéÖµ£¬¸ÅÂÊ
WHITE_SILVER_TREE_EXP_REWARD_PARAM = {
									{200000, 50},
									{250000, 25},
									{300000, 25}
};

--»Æ½ðÊ÷µÄ¾­Ñé½±Àø£º¾­ÑéÖµ£¬¸ÅÂÊ
YELLOW_GOLDEN_TREE_EXP_REWARD_PARAM = {
									{1000000, 80},
									{1500000, 15},
									{2000000, 5}
};

--°×½ðÊ÷µÄ¾­Ñé½±Àø£º¾­ÑéÖµ£¬¸ÅÂÊ
WHITE_GOLDEN_TREE_EXP_REWARD_PARAM = {
									{5000000, 50},
									{7500000, 25},
									{10000000, 25}
};
	
-----------------------------------------------------------------------
--checkPlaceMainCity()
--¼ì²éÊÇ·ñÔÚÖ¸¶¨µØµãÖÖÊ÷£ºÁù´óÖ÷³Ç£¬ãê¾©¡¢³É¶¼¡¢ÈªÖÝ¡¢´óÀí¡¢ÏåÑô¡¢ÑïÖÝ
-----------------------------------------------------------------------
function checkPlaceMainCity()	
	local nMapID = GetWorldPos();
	if nMapID == 100 or nMapID == 150 or nMapID == 200 or nMapID == 300 or nMapID == 350 or nMapID == 400 then
		return 1;
	else
		return 0;
	end
end

function checkEventTime()		--¼ì²é»î¶¯Ê±¼ä00:00 ¨C 12:00 ºÍ¡¡17:00 ¨C 00:00Á½¸öÊ±¼ä¶Î
	local nHour = getLocalTime();
	if nHour >= 12 and nHour < 17 then
		return 0;
	else
		return 1;
	end
end

function checkEventDate()		--¼ì²é»î¶¯ÈÕÆÚ2009Äê04ÔÂ24ÈÕ¡¡-- 2009Äê05ÔÂ24ÈÕ24µã
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

function getLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end

function getCurDate()
	nDay = date("%d")
	return tonumber(nDay)
end

function getCurMonth()
	nMonth = date("%m");
	return tonumber(nMonth);
end

function getCurYear()
	nYear = date("%Y");
	return tonumber(nYear);
end

function getDateTimeString(nSecond)
	local nDay = 0;
	local nHour = 0;
	local nMin = 0;
	local nSec = 0;
	local sTime = "";
	nDay = floor(nSecond / (60 * 60 * 24));
	nHour = floor(mod(nSecond / (60 * 60),  24));
	nMin = floor(mod(nSecond / 60 , 60));
	nSec = mod(nSecond , 60);
	if nDay > 0 then
		sTime = sTime..nDay.."Thiªn";
	end
	if nHour > 0 then
		sTime = sTime .. nHour .. "h ";
	end
	if nMin > 0 then
		sTime = sTime .. nMin .. " phót ";
	end
	if nSec >= 0 then
		sTime = sTime .. nSec .. " Gi©y ";
	end
	return sTime;
end

function doNothing()
end

--------------------------------------
--JQ_GetRandItem()
--È¡µÃËæ»úÎïÆ·
--------------------------------------
function PlantTree_GetRandItem(ITEM_PARAM)
	local nPos = 0;
	local nRand = random(1, 100);
	for i = 1, getn(ITEM_PARAM) do
		if nRand > nPos and nRand <= nPos + ITEM_PARAM[i][2] then
			return i;
		end
		nPos = nPos + ITEM_PARAM[i][2];
	end
	return 1;
end