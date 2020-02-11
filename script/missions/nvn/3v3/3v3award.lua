Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\missions\\nvn\\3v3\\3v3define.lua")
Include("\\script\\missions\\nvn\\3v3.lua")

function get_3v3_last_week_award()
	--ÅĞ¶ÏÌõ¼ş
	if Is3v3SystemOpen() ~= 1 then
		Talk(1,"","Tİnh n¨ng nµy t¹m thêi kh«ng më");
		return 0;
	end
	local nTag = gf_GetTaskByte(TASKID_3V3_AWARD_TAG, 1)
	if 0 == nTag then
		Talk(1,"","T¹m thêi kh«ng thÓ nhËn phÇn th­ëng tuÇn tr­íc!");
		return 0;
	end
	if 2 == nTag then
		Talk(1,"","§¹i hiÖp ®· nhËn phÇn th­ëng tØ vâ 3v3 cña tuÇn tr­íc, kh«ng thÓ nhËn thªm!");
		return 0;
	end
	if gf_Judge_Room_Weight(5, 100) ~= 1 then
		Talk(1,"","Hµnh trang kh«ng gian ®· ®Çy, kh«ng thÓ nhËn th­ëng!");
		return 0;
	end
	--Áì½±
	if 1 == nTag then
		local nWin = gf_GetMyTaskByte(TASKID_3V3_LASTWEEK_FIGHT_TIMES, 3, 4);
		local nFail = gf_GetMyTaskByte(TASKID_3V3_LASTWEEK_FIGHT_TIMES, 1, 2);
		local nTotal = nWin + nFail;
		--³¡´Î
		local nIndex = -1; 
		if nTotal == 10 then
			nIndex = 1
		elseif nTotal > 10 and nTotal <= 25 then
			nIndex = 2
		elseif nTotal > 25 and nTotal <= 49 then
			nIndex = 3
		elseif nTotal > 49 then
			nIndex = 4
		end
		if nIndex == -1 or nTotal == 0 then
			Talk(1,"","Sè trËn tØ vâ 3v3 tuÇn tr­íc cña ®¹i hiÖp qu¸ İt, kh«ng thÓ nhËn th­ëng! ")
			return 0;
		end
		--Ê¤ÂÊ
		local nIndexSub = -1;
		local nRate = 100 * nWin / nTotal;
		if nRate >= 0 and nRate < 20 then
			nIndexSub = 1
		elseif nRate >= 20 and nRate < 40 then
			nIndexSub = 2
		elseif nRate >= 40 and nRate < 60 then
			nIndexSub = 3
		elseif nRate >= 60 and nRate < 80 then
			nIndexSub = 4
		elseif nRate >= 80 then
			nIndexSub = 5
		end
		if nIndexSub == -1 then
			Talk(1,"","Sè trËn th¾ng tØ vâ 3v3 tuÇn tr­íc cña ®¹i hiÖp qu¸ thÊp, kh«ng thÓ nhËn th­ëng")
			return 0;
		end
		--ÖÃ±ê¼Ç
		gf_SetTaskByte(TASKID_3V3_AWARD_TAG, 1, 2);
		--¸ø½±Àø
		gf_AddItemEx2({2,1,30575,_3V3_LAST_WEEK_AWARD[nIndex][nIndexSub][1], 4}, "LÔ Bao Vâ L©m", "3V3", "PhÇn th­ëng tuÇn tr­íc", 0, 1);
		gf_AddItemEx2({2,1,30576,_3V3_LAST_WEEK_AWARD[nIndex][nIndexSub][2], 4}, "LÔ Bao Vâ L©m Hµo KiÖt", "3V3", "PhÇn th­ëng tuÇn tr­íc", 0, 1);
		Talk(1,"","Chóc mõng ®¹i hiÖp thµnh c«ng nhËn th­ëng tØ vâ 3v3 cña tuÇn tr­íc");
		Msg2Player("Chóc mõng ®¹i hiÖp thµnh c«ng nhËn th­ëng tØ vâ 3v3 cña tuÇn tr­íc");
		return 1;
	end
end

g_LastSeasonLimitTime = {
	--[GetName()] = LimitTime;	
};
function get_3v3_last_season_award()
	--ÅĞ¶ÏÌõ¼ş
	if Is3v3SystemOpen() ~= 1 then
		Talk(1,"","Tİnh n¨ng nµy t¹m thêi kh«ng më");
		return 0;
	end
	local nMapId, nX, nY = GetWorldPos();
	if nMapId ~= 200 then
		Talk(1,"","Gi¶i th­ëng quı 3v3 chØ ®­îc nhËn t¹i <color=red>bµn ®å BiÖn Kinh<color>, nhËn thÊt b¹i !");
		return 0;
	end
	--------------------------------------
	local nTag = gf_GetTaskByte(TASKID_3V3_AWARD_TAG, 2);
	if 1 ~= nTag then	
		--²»ÄÜÁì½±²»¹ÜÔõÃ´Ñù¶¼È¥¸üĞÂÅÅÃû
		--µã»÷ÓĞÊ±¼äÏŞÖÆµÄ£¬Ëæ±ã¾ÍÄÜµãÎÒÉµ°¡
		local nTime = GetTime() - (g_LastSeasonLimitTime[GetName()] or 0);
		if nTime < 5*60 then
			Talk(1,"",format("HiÖn nay server ®ang bËn, h·y <color=red>%d phót %d gi©y<color> sau thö l¹i !", floor((300 -nTime) / 60), mod((300 - nTime), 60)));
			return 0;
		end
		_3v3_CrossMatchRetsetPlayerTask()
		g_LastSeasonLimitTime[GetName()] = GetTime();
		--ÔÙ²»È»ÎÒºÃ¹ıÎÒ¾Í²»¸úÄãÍæÁË
		-----------------------------
		if 0 == nTag then
			Talk(1,"","HiÖn t¹i kh«ng cã phÇn th­ëng tØ vâ 3v3 cña quı tr­íc, nhËn th­ëng thÊt b¹i!");
			return 0;
		elseif 2 == nTag then
			Talk(1,"","§¹i hiÖp ®· nhËn phÇn th­ëng tØ vâ 3v3 cña quı tr­íc, kh«ng thÓ nhËn thªm!");
			return 0;
		end
	else
		if gf_Judge_Room_Weight(8, 100) ~= 1 then
			Talk(1,"","Hµnh trang kh«ng gian ®· ®Çy, kh«ng thÓ nhËn th­ëng!");
			return 0;
		end
		local nRank = gf_GetMyTaskByte(TASKID_LAST_MATCH_RANK, 1, 2);
		return _get_3v3_last_season_award(nRank);
	end
end

function _get_3v3_last_season_award(nRank)
	local nIndex = -1;
	if nRank == 1 then
		gf_SetTaskByte(TASKID_3V3_AWARD_TAG, 2, 2);
		nIndex = 1;
		--
		--gf_AddItemEx2({2,1,30577,1,4}, "ÎåĞĞĞ¬Àñ°ü", "3V3", "ÉÏÈü¼¾½±Àø", 0, 1);
		--
		gf_AddItemEx2({0,105,141,1,4,-1,-1,-1,-1,-1,-1}, "Phi HiÓu", "3V3", "PhÇn th­ëng quı tr­íc", 30 * 24 * 3600, 1)
		--
		--gf_AddItemEx2({2,1,30408,3,4}, "3¼¶Ç§»Ã¿Ì°å", "3V3", "ÉÏÈü¼¾½±Àø", 30 * 24 * 3600, 1)
		gf_AddItemEx2({2,1,30668,6,4}, "Tinh Hoa UÈn Linh CÊp 6", "3V3", "PhÇn th­ëng quı tr­íc", 30 * 24 * 3600, 1)
		--
		local tWaiZhuang = {
			{{"Thanh Minh M¹o", {0,108,684,1,4}}, {"Thanh Minh M¹o", {0,108,685,1,4}}, {"Thanh Minh M¹o", {0,108,686,1,4}}, {"Thanh Minh M¹o", {0,108,687,1,4}}},
			{{"Thanh Minh Th­îng Trang", {0,109,684,1,4}}, {"Thanh Minh Th­îng Trang", {0,109,685,1,4}}, {"Thanh Minh Th­îng Trang", {0,109,686,1,4}}, {"Thanh Minh Th­îng Trang", {0,109,687,1,4}}},
			{{"Thanh Minh H¹ Trang", {0,110,684,1,4}}, {"Thanh Minh H¹ Trang", {0,110,685,1,4}}, {"Thanh Minh H¹ Trang", {0,110,686,1,4}}, {"Thanh Minh H¹ Trang", {0,110,687,1,4}}},
		};
		local nBody = GetBody();
		local nSize = getn(tWaiZhuang);
		for i = 1, nSize do
			gf_AddItemEx2(tWaiZhuang[i][nBody][2], tWaiZhuang[i][nBody][1], "3V3", "PhÇn th­ëng quı tr­íc", 30 * 24 * 3600, 1)
		end
		--
		RemoveTitle(66,1);
		AddTitle(66,1);
		SetTitleTime(66, 1, GetTime() + 30*24*3600);
		--SetCurTitle(66, 1);
	elseif nRank > 1 and nRank <= 5 then
		gf_SetTaskByte(TASKID_3V3_AWARD_TAG, 2, 2);
		nIndex = 2;
		--
		--gf_AddItemEx2({2,1,30577,1}, "ÎåĞĞĞ¬Àñ°ü", "3V3", "ÉÏÈü¼¾½±Àø", 0, 1);
		--
		--gf_AddItemEx2({2,1,30408,3,4}, "3¼¶Ç§»Ã¿Ì°å", "3V3", "ÉÏÈü¼¾½±Àø", 30 * 24 * 3600, 1)
		gf_AddItemEx2({2,1,30668,6,4}, "Tinh Hoa UÈn Linh CÊp 6", "3V3", "PhÇn th­ëng quı tr­íc", 30 * 24 * 3600, 1)
		--
		local tWaiZhuang = {
			{{"Thanh Minh M¹o", {0,108,684,1,4}}, {"Thanh Minh M¹o", {0,108,685,1,4}}, {"Thanh Minh M¹o", {0,108,686,1,4}}, {"Thanh Minh M¹o", {0,108,687,1,4}}},
			{{"Thanh Minh Th­îng Trang", {0,109,684,1,4}}, {"Thanh Minh Th­îng Trang", {0,109,685,1,4}}, {"Thanh Minh Th­îng Trang", {0,109,686,1,4}}, {"Thanh Minh Th­îng Trang", {0,109,687,1,4}}},
			{{"Thanh Minh H¹ Trang", {0,110,684,1,4}}, {"Thanh Minh H¹ Trang", {0,110,685,1,4}}, {"Thanh Minh H¹ Trang", {0,110,686,1,4}}, {"Thanh Minh H¹ Trang", {0,110,687,1,4}}},
		};
		local nBody = GetBody();
		local nSize = getn(tWaiZhuang);
		for i = 1, nSize do
			gf_AddItemEx2(tWaiZhuang[i][nBody][2], tWaiZhuang[i][nBody][1], "3V3", "PhÇn th­ëng quı tr­íc", 30 * 24 * 3600, 1)
		end
		--
		RemoveTitle(66,2);
		AddTitle(66,2);
		SetTitleTime(66, 2, GetTime() + 30*24*3600);
		--SetCurTitle(66, 2);
	elseif nRank > 5 and nRank <= 10 then
		gf_SetTaskByte(TASKID_3V3_AWARD_TAG, 2, 2);
		nIndex = 3;
		--
		--gf_AddItemEx2({2,1,30577,1}, "ÎåĞĞĞ¬Àñ°ü", "3V3", "ÉÏÈü¼¾½±Àø", 0, 1);
		--
		RemoveTitle(66,3);
		AddTitle(66,3);
		SetTitleTime(66, 3, GetTime() + 30*24*3600);
		--SetCurTitle(66, 3);
	elseif nRank > 10 and nRank <= 20 then
		gf_SetTaskByte(TASKID_3V3_AWARD_TAG, 2, 2);
		nIndex = 4;
		--
		--gf_AddItemEx2({2,1,30577,1}, "ÎåĞĞĞ¬Àñ°ü", "3V3", "ÉÏÈü¼¾½±Àø", 0, 1);
		--
		RemoveTitle(66,4);
		AddTitle(66,4);
		SetTitleTime(66, 4, GetTime() + 30*24*3600);
		--SetCurTitle(66, 4);
	else
		Talk(1,"","ChØ cã c¸c ®¹i hiÖp n»m trong b¶ng xÕp h¹ng top 20 cña server míi nhËn ®­îc phÇn th­ëng quı");
		return 0;
	end
	local tTitle = {
		"Chİ T«n V­¬ng Gi¶",
		"§éc Bé Thiªn H¹",
		"Vâ l©m hµo kiÖt",
		"Giang Hå Tinh Anh",
	}
	if nIndex ~= -1 and tTitle[nIndex] ~= nil then
		local msg = format("Chóc mõng ®¹i hiÖp [%s] ®· xÕp h¹ng thø %d liªn ®Êu §¹i Héi TØ Vâ 3v3 cña quı tr­íc, nhËn ®­îc danh hiÖu [%s] vµ phÇn th­ëng phong phó!", GetName(), nRank, tTitle[nIndex]);
		Msg2Global(msg);
		AddGlobalNews(msg, 1);
		return 1;
	end
	return 0;
end
