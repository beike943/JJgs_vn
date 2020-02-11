--=============================================
--create by baiyun 2009.5.29
--describe:Ô½ÄÏ°æ7ÔÂ·Ý»î¶¯Ö®ÎåÖÖÊ÷
--=============================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

g_viet0908_event_title = "Hoat dong trong cay thang 8 (viet nam):";

TREE_TYPE = {									--Ä£°åÃû£¬NPCÃû×Ö£¬³öÏÖ¸ÅÂÊ
				{"MÇm hoa hång", "C©y HÐo óa",  5, "C©y HÐo óa"},
				{"MÇm Hoa hång", "C©y BÊt Tö", 10, "C©y BÊt Tö"},
				{" nh¸nh hoa hång", "C©y B¹ch Ng©n", 80, "C©y B¹ch Ng©n"},
				{"c©y §a MËt Hoa Qu¶ nhá", "C©y Hoµng Kim", 4, "C©y Hoµng Kim"},
				{"c©y §a MËt Hoa Qu¶ lín", "C©y B¹ch Kim", 1, "C©y B¹ch Kim"},
			}
			
--TREE_TYPE = {									
--				{"MÇm hoa hång", "C©y HÐo óa",  5, "C©y HÐo óa"},
--				{"Trïng D­¬ng hoa 1", "C©y BÊt Tö", 10, "C©y BÊt Tö"},
--				{"Trïng D­¬ng hoa 2", "C©y B¹ch Ng©n", 80, "C©y B¹ch Ng©n"},
--				{"Hoa hång vµng", "C©y Hoµng Kim", 4, "C©y Hoµng Kim"},
--				{"Hoa hång ®á", "C©y B¹ch Kim", 1, "C©y B¹ch Kim"},
--			}
			
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
					[400] = "§¹i Lý",
					[500] = "Ph­îng T­êng"
				}

SMALLEST_TREE_REWARD_ITEM_PARAM = {
									{"§éc Cæ", 300,2, 17, 2, 0*24*60*60,20,0},
									{"M·nh §éc Cæ", 50,2, 17, 3, 0*24*60*60,10,0},
									{"§éc Yªu Cæ", 20, 2, 17, 4, 0*24*60*60,5,0},
									{"HuyÕt Cæ", 300, 2, 17, 5, 0*24*60*60,20,0},
									{"Thi HuyÕt Cæ", 50, 2, 17, 6, 0*24*60*60,10,0},
									{"HuyÕt Tinh Cæ", 20, 2, 17, 7, 0*24*60*60,5,0},
									{"H­¬ng Cæ", 1500, 2, 17, 8, 0*24*60*60,20,0},
									{"Mª H­¬ng Cæ", 200, 2, 17, 9, 0*24*60*60,10,0},
									{"§Ò H« Cæ", 20, 2, 17, 10, 0*24*60*60,5,0},
									{"Thi Cæ", 300, 2, 17, 11, 0*24*60*60,20,0},
									{"Tam Thi Cæ", 50,2, 17, 12, 0*24*60*60,10,0},
									{"Quú V­¬ng Cæ", 20,2, 17, 13, 0*24*60*60,5,0},
									{"Yªu Cæ", 3800,2, 17, 14, 0*24*60*60,20,0},
									{"Thùc Yªu Cæ", 1000,2, 17, 15, 0*24*60*60,10,0},
									{"Yªu Hoµng Cæ", 20,2, 17, 16, 0*24*60*60,5,0},
									{"T©m Cæ", 300, 2, 17, 17, 0*24*60*60,20,0},
									{"Thùc T©m Cæ", 50,2, 17, 18, 0*24*60*60,10,0},
									{"T©m S¸t Cæ", 20,2, 17, 19, 0*24*60*60,5,0},
									{"HuyÔn Cæ", 1000,2, 17, 20, 0*24*60*60,20,0},
									{"B¨ng HuyÔn Cæ", 50,2, 17, 21, 0*24*60*60,10,0},
									{"Vong Tiªn Cæ", 20,2, 17, 22, 0*24*60*60,5,0},
									{"Tµm Cæ", 300,2, 17, 23, 0*24*60*60,20,0},
									{"HuyÕt Tµm Cæ", 50,2, 17, 24, 0*24*60*60,10,0},
									{"Kim Tµm Cæ", 20,2, 17, 25, 0*24*60*60,5,0},
									{"Linh Cæ", 300,2, 17, 26, 0*24*60*60,20,0},
									{"Linh Lung Cæ", 50,2, 17, 27, 0*24*60*60,10,0},
									{"ThÊt Th¸i TiÓu Thiªn Cæ", 20,2, 17, 28,0*24*60*60,5,0},
									{"Ma Cæ", 100,2, 17, 29, 0*24*60*60,20,0},
									{"U ¶nh Cæ", 50,2, 17, 30, 0*24*60*60,10,0},
									{"V« ¶nh Ma Cæ", 20,2, 17, 31, 0*24*60*60,5,0},
	};

ETERNAL_TREE_REWARD_ITEM_PARAM = {
									{"§ång TiÒn Vµng", 160, 2,1,30094, 0, 1,0},									
									{"V¹n NhÉn (ch­a gi¸m ®Þnh)", 820, 2,1,375, 0, 1,0},
									{"Háa Tinh (ch­a gi¸m ®Þnh)", 820, 2,1,376, 0, 1,0},
									{"LiÖt DiÖm (ch­a gi¸m ®Þnh)", 820, 2,1,377, 0, 1,0},
									{"M·n Thiªn Hoa Vò (ch­a gi¸m ®Þnh)", 820, 2,1,378, 0, 1,0},
									{"Cæ §Ýnh (ch­a gi¸m ®Þnh)", 820, 2,1,379, 0, 1,0},
									{"Hi Nh©n CÇm (ch­a gi¸m ®Þnh)", 820, 2,1,380, 0, 1,0},
									{"ThÇn Hµnh (ch­a gi¸m ®Þnh)", 820, 2,1,381, 0, 1,0},
									{"A La H¸n Tr­îng (ch­a gi¸m ®Þnh)", 820, 2,1,382, 0, 1,0},
									{"§¹i Hµo L«i Th­¬ng (ch­a gi¸m ®Þnh)", 820, 2,1,383, 0, 1,0},
									{"ThÇn Cung (ch­a gi¸m ®Þnh)", 820, 2,1,384, 0, 1,0},
									{"M·nh Hæ (ch­a gi¸m ®Þnh)", 820, 2,1,385, 0, 1,0},
									{"L¨ng Phong (ch­a gi¸m ®Þnh)", 820, 2,1,386, 0, 1,0}
	};
--»Æ½ðÊ÷½±ÀøÎïÆ·£ºÎïÆ·Ãû£¬³öÏÖ¸ÅÂÊ£¬Ö÷ÀàÐÍ£¬¸±ÀàÐÍ£¬ÏêÏ¸ÀàÐÍ£¬Ê¹ÓÃÆÚÏÞ£¬·¢·ÅÊýÁ¿
GOLDEN_TREE_REWARD_ITEM_PARAM = {
									{"Tiªu KiÕp t¸n", 5000, 2, 0, 141, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1,0},
									{"ThÇn hµnh bÝ phæ", 2295, 0, 200, 39, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1,0},
									{"Tu Ch©n YÕu QuyÕt", 2500, 2, 0, 554, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1,0},
									{"Tö Kim Hång Bao", 200, 2, 1, 537, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1,0},
									{"§¹i hång bao hoµng kim", 5, 2, 1, 539, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1,0}
	};

--°×½ðÊ÷½±ÀøÎïÆ·£ºÎïÆ·Ãû£¬³öÏÖ¸ÅÂÊ£¬Ö÷ÀàÐÍ£¬¸±ÀàÐÍ£¬ÏêÏ¸ÀàÐÍ£¬Ê¹ÓÃÆÚÏÞ£¬·¢·ÅÊýÁ¿
WHITE_TREE_REWARD_ITEM_PARAM = {
									{"Bé C¶nh", 500, 0, 105, 13, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,1},
									{"Hèt L«i B¸c", 500, 0, 105, 12, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,1},
									{"XÝch Thè", 500, 0, 105, 9, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,1},
									{"Tr¶o Hoµng Phi §iÖn", 500, 0, 105, 11, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,1},
									{"Phiªu Vò", 500, 0, 105, 15, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,1},
									{"Bµn Long bÝch", 5499, 2, 1, 1000, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,0},
									{"V« NgÊn Thñy", 500, 2, 1, 503, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,0},
									{"Sæ tay sèng", 700, 2, 19, 1, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,0},
									{"Nh©n S©m V¹n N¨m", 699, 2, 1, 30071, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,0},
									{"TÈy Tñy linh ®¬n", 100, 2, 0, 137, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,0},
									{"B¶o R­¬ng §Æc BiÖt", 1, 2, 1, 30091, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,0},
									{"Ngò Hµnh MËt tÞch", 1, 0, 107, 155, 0, 1,0},
	};
	
--°×ÒøÊ÷½±ÀøÎïÆ·£ºÎïÆ·Ãû£¬³öÏÖ¸ÅÂÊ£¬Ö÷ÀàÐÍ£¬¸±ÀàÐÍ£¬ÏêÏ¸ÀàÐÍ£¬Ê¹ÓÃÆÚÏÞ£¬·¢·ÅÊýÁ¿
SILVER_TREE_REWARD_ITEM_PARAM = {
									{"B¨ng Th¹ch", 6000, 2, 1, 149, 0*24*60*60, 1,0},
									{"ThÕ Th©n Phï", 200, 2, 0, 556, 15*24*60*60, 1,0},
									{"B¸t Nh· Lín", 190, 2, 0, 398, 15*24*60*60, 1,0},
									{"Th¸i DÞch Hçn Nguyªn C«ng §å", 10, 2, 0, 1082,  0*24*60*60, 1,0},
									{"Kh«ng tróng g×", 3600, 0, 0, 0, 0, 0, 0},
	};

--°×ÒøÊ÷µÄ¾­Ñé½±Àø£º¾­ÑéÖµ£¬¸ÅÂÊ
WHITE_SILVER_TREE_EXP_REWARD_PARAM = {
									{500000, 2500},
									{600000, 7000},
									{700000, 500}
};

--»Æ½ðÊ÷µÄ¾­Ñé½±Àø£º¾­ÑéÖµ£¬¸ÅÂÊ
YELLOW_GOLDEN_TREE_EXP_REWARD_PARAM = {
									{2000000, 8000},
									{3000000, 1500},
									{4000000, 500}
};

--°×½ðÊ÷µÄ¾­Ñé½±Àø£º¾­ÑéÖµ£¬¸ÅÂÊ
WHITE_GOLDEN_TREE_EXP_REWARD_PARAM = {
									{10000000, 5000},
									{15000000, 2500},
									{20000000, 2500}
};

SEED_AWARD_COUNT = {
									{"B¸t Nh· Chøng Th­", 2, 1, 30114, 15 * 24 * 3600, 1,0},
									{"§Êu Hån", 2, 1, 1157, 15 * 24 * 3600, 1,0},									
									{"Qu©n C«ng Ch­¬ng", 2, 1, 9999, 15 * 24 * 3600, 1,0},
									{"Qu©n C«ng §¹i", 2, 1, 9998, 15 * 24 * 3600, 1,0},
									{"Tµng KiÕm Anh Hïng ThiÕp", 2, 0, 31, 7 * 24 * 3600, 1,0},
									
	};

	
-----------------------------------------------------------------------
--checkPlaceMainCity()
--¼ì²éÊÇ·ñÔÚÖ¸¶¨µØµãÖÖÊ÷£ºÁù´óÖ÷³Ç£¬ãê¾©¡¢³É¶¼¡¢ÈªÖÝ¡¢´óÀí¡¢ÏåÑô¡¢ÑïÖÝ
-----------------------------------------------------------------------
function checkPlaceMainCity()	
	local nMapID = GetWorldPos();
	if nMapID == 100 or nMapID == 150 or nMapID == 200 or nMapID == 300 or nMapID == 350 or nMapID == 400  or nMapID == 500 then
		return 1;
	else
		return 0;
	end
end

--function checkEventTime()		--¼ì²é»î¶¯Ê±¼ä00:00 ¨C 12:00 ºÍ¡¡17:00 ¨C 00:00Á½¸öÊ±¼ä¶Î
--	local nHour = getLocalTime();
--	if nHour >= 12 and nHour < 17 then
--		return 0;
--	else
--		return 1;
--	end
--end

function checkEventDate()		--¼ì²é»î¶¯ÈÕÆÚ2009Äê04ÔÂ24ÈÕ¡¡-- 2009Äê05ÔÂ31ÈÕ24µã
                                        --¼ì²é»î¶¯ÈÕÆÚ2010Äê09ÔÂ17ÈÕ¡¡-- 2009Äê10ÔÂ24ÈÕ24µã --10ÄêÖÐÇï»î¶¯Ö®ËÄÁéµÆ»á
	local nDate = tonumber(date("%y%m%d%H"));
	if nDate >= 09091800 and nDate < 09102524 then
		return 1;
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
	local nRand = random(1, 10000);
	for i = 1, getn(ITEM_PARAM) do
		if nRand > nPos and nRand <= nPos + ITEM_PARAM[i][2] then
			return i;
		end
		nPos = nPos + ITEM_PARAM[i][2];
	end
	return 1;
end

function PlantTree_GetRandItem_new(ITEM_PARAM, nMax)
	local nPos = 0;
	local nRand = random(1, nMax);
	for i = 1, getn(ITEM_PARAM) do
		if nRand > nPos and nRand <= nPos + ITEM_PARAM[i][2] then
			return i;
		end
		nPos = nPos + ITEM_PARAM[i][2];
	end
	return 1;
end
