--=============================================
--create by baiyun 2009.9.14
--describe:Ô½ÄÏ2009Äê9ÔÂ¹¥³ÇÕ½ÐÞ¸Ä£¬¾ºÍ¶ÌôÕ½ÁîÏà¹ØÊµÏÖ
--=============================================
--ÌôÕ½Áî 		2,1,30117
--³É¶¼ËÑ²¶Áî 2,1,30118
--ÉÐ·½±¦½£ 	 2,1,30119
--³É¶¼Ö®Ó¡ 	 2,1,30120
--³É¶¼ÒÉ°¸Áî 

Include("\\script\\missions\\bw\\siege\\siege_arena_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")

File_name = "\\script\\missions\\bw\\siege\\jingtoutiaozhanling.lua";
--±¨Ãû¾ºÍ¶ÌôÕ½Áî
function baobing_jingtoutiaozhanling()
	local szTong = GetTongName();
	local nYear = tonumber(date("%Y"));
	local nDay = tonumber(date("%m%d"));
	
	if IsTongMaster() == 0 then
		Talk(1,"","<color=green> Chñ l«i ®µi<color>: ChØ cã bang chñ míi cã thÓ b¸o danh ®Êu gi¸ khiªu chiÕn lÖnh.")
		return 0
	end
	
	-- ÊÇ¹¥³Ç»òÕßÊØ³Ç·½ÈÎÒâÒ»·½
	for index, value in tFightCityName do
		local szAttack, szDefence = GetCityWarAD(index)
		if szTong == szAttack then
			Talk(1,"","B¹n ®· lµ ng­êi cña "..value.." bªn c«ng, kh«ng thÓ b¸o danh ®Êu gi¸ khiªu chiÕn lÖnh thªm lÇn n÷a")
			return 0
		end
		if szTong == szDefence then
			Talk(1,"","B¹n ®· lµ ng­êi cña "..value.." bªn thñ, kh«ng thÓ b¸o danh ®Êu gi¸ khiªu chiÕn lÖnh thªm lÇn n÷a.")
			return 0
		end
	end
	
	-- ÊÇ·ñÊÇ°ïÖ÷

	
	-- °ïÖ÷±ØÐëÔÚÎ»7ÌìÒÔÉÏ
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if nNow - nLastAssignTime < 604800 then
		Talk(1,"","<color=green> Chñ l«i ®µi<color>: Thêi gian t¹i vÞ cña c¸c h¹ Ýt h¬n 7 ngµy, kh«ng thÓ b¸o danh ®Êu gi¸ khiªu chiÕn lÖnh")
		return 0
	end
	
	-- 80¼¶ÒÔÉÏ
	local nLevel = GetLevel();
	if nLevel < 80 then
		Talk(1,"","<color=green> Chñ l«i ®µi<color>: CÊp bËc c¸c h¹ kh«ng ®ñ 80, kh«ng thÓ b¸o danh ®Êu gi¸ khiªu chiÕn lÖnh")
		return 0
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1,"","<color=green> Chñ l«i ®µi<color>: C¸c h¹ ch­a gia nhËp m«n ph¸i, kh«ng thÓ b¸o danh ®Êu gi¸ khiªu chiÕn lÖnh")
		return 0
	end
	
	ApplyRelayShareData("tiaozhanling",0,0,File_name,"baoming_callback")
end

function baoming_callback(szKey, nKey1, nKey2, nCount)
	local szTong = GetTongName();
	local nDate = tonumber(date("%y%m%d"));
	local nNum, nLastDate = GetRelayShareDataByKey("tiaozhanling", nKey1, nKey2, szTong);
	DelRelayShareDataCopy("tiaozhanling",nKey1,nKey2);
	if (not nNum) or (not nLastDate) then
		if DelItem(2,1,1200,1) ~= 1 then
			Talk(1,"","<color=green> Chñ l«i ®µi<color>: Xin h·y mang th­ tiÕn cö ®Ó b¸o danh khiªu chiÕn lÖnh");
			return 0;
		end
		if AddRelayShareData("tiaozhanling", nKey1, nKey2, File_name, "nothing", 2, szTong, "dds", 0, nDate, szTong) == 1 then
			Talk(1,"","<color=green> Chñ l«i ®µi<color>: Bang chñ ®· b¸o danh ®Êu gi¸ khiªu chiÕn lÖnh thµnh c«ng, qu¸ tr×nh ®Êu gi¸ sÏ b¾t ®Çu vµo 19:40, xin bang chñ l­u ý!");
			SetGlbValue(1020,GetGlbValue(1020) + 1)
		end
	else
		if nLastDate < nDate then
			if DelItem(2,1,1200,1) ~= 1 then
				Talk(1,"","<color=green> Chñ l«i ®µi<color>: Xin h·y mang th­ tiÕn cö ®Ó b¸o danh khiªu chiÕn lÖnh");
				return 0;
			end
			if AddRelayShareData("tiaozhanling", nKey1, nKey2, File_name, "nothing", 2, szTong, "dds", 0, nDate, szTong) == 1 then
				Talk(1,"","<color=green> Chñ l«i ®µi<color>: Bang chñ ®· b¸o danh ®Êu gi¸ khiªu chiÕn lÖnh thµnh c«ng, qu¸ tr×nh ®Êu gi¸ sÏ b¾t ®Çu vµo 19:40, xin bang chñ l­u ý!");
				SetGlbValue(1020,GetGlbValue(1020) + 1)
			end
		else
			Talk(1, "", "<color=green> Chñ l«i ®µi<color>: Quý bang chñ ®· giao nép th­ tiÕn cö råi.");
		end
	end
end

function jingtou_tiaozhanling()
	if IsTongMaster() == 0 then
		Talk(1,"","<color=green> Chñ l«i ®µi<color>: ChØ cã bang chñ míi cã thÓ ®Êu gi¸ khiªu chiÕn lÖnh")
		return 0
	end
	ApplyRelayShareData("tiaozhanling",0,0,File_name,"jingtou_callback");
end

function jingtou_callback(szKey, nKey1, nKey2, nCount)
	local szTong = GetTongName();
	local nDate = tonumber(date("%y%m%d"));	
	
	local nNum, nLastDate = GetRelayShareDataByKey("tiaozhanling", nKey1, nKey2, szTong);
	DelRelayShareDataCopy("tiaozhanling",nKey1,nKey2);
	if (not nNum) or (not nLastDate) then
		Talk(1, "", "<color=green> Chñ l«i ®µi<color>: Bang héi cña c¸c h¹ ch­a b¸o danh ®Êu gi¸ khiªu chiÕn lÖnh");
	else
		if nLastDate < nDate then
			Talk(1, "", "<color=green> Chñ l«i ®µi<color>: Bang héi cña c¸c h¹ ch­a b¸o danh ®Êu gi¸ khiªu chiÕn lÖnh");
		else
			local nCount = 1;
			local nPreCount = GetItemCount(2,1,30117);
			if nPreCount > 999 then
				nPreCount = 999;
			end
			SetTaskTemp(103, nNum);
			
			AskClientForNumber("give_tiaozhanling", nCount, nPreCount, "§¹i hiÖp muèn giao nép bao nhiªu khiªu chiÕn lÖnh?");
		end
	end
end

function give_tiaozhanling(nCount)
	local szTong = GetTongName();
	local nDate = tonumber(date("%y%m%d"));
	if nCount == 0 then
		return 0;
	end
	if DelItem(2, 1, 30117, nCount) == 1 then
		AddRelayShareData("tiaozhanling", 0,0,File_name, "nothing", 2, szTong, "dds", nCount + GetTaskTemp(103), nDate, szTong);
		Talk(1, "", "<color=green> Chñ l«i ®µi<color>: Ng­¬i ®· thay bæn bang héi giao nép "..nCount.." khiªu chiÕn lÖnh");
		WriteLogEx("Cong Thanh Chien","nép",nCount,"Khiªu ChiÕn LÖnh","",GetTongName())
	else
		Talk(1, "", "<color=green> Chñ l«i ®µi<color>: C¸c h¹ mang khiªu chiÕn lÖnh kh«ng ®ñ, h·y kiÓm tra l¹i sè l­îng khiªu chiÕn lÖnh");
		return 0;
	end
end

--²é¿´±¾°ï¾ºÍ¶ÌôÕ½ÁîµÄÇé¿ö
function view_tiaozhanling()
	ApplyRelayShareData("tiaozhanling",0,0,File_name,"view_callback");
end

function view_callback(szKey, nKey1, nKey2, nCount)
	local szTong = GetTongName();
	local nDate = tonumber(date("%y%m%d"));
	
	local nNum, nLastDate = GetRelayShareDataByKey("tiaozhanling", 0, 0, szTong);
	DelRelayShareDataCopy("tiaozhanling",0,0);
	if (not nNum) or (not nLastDate) then
		Talk(1, "", "<color=green> Chñ l«i ®µi<color>: Bang héi cña c¸c h¹ ch­a b¸o danh ®Êu gi¸ khiªu chiÕn lÖnh");
	else
		if nLastDate < nDate then
			Talk(1, "", "<color=green> Chñ l«i ®µi<color>: Bang héi cña c¸c h¹ ch­a b¸o danh ®Êu gi¸ khiªu chiÕn lÖnh");
		else
			Talk(1, "", "<color=green> Chñ l«i ®µi<color>: HiÖn giê bang héi cña c¸c h¹ ®· nép khiªu chiÕn lÖnh "..nNum.." c¸i råi.");
		end
	end
end

function nothing()

end

function main()
	if tonumber(date("%w")) == 5 then
		PlayerIndex = FirstPlayer()
		if SubWorldID2Idx(300) > 0 then
			ApplyRelayShareData("gongchengtype",0,0,File_name,"get_type_jingtou");				
		end		
	end
end

function get_type_jingtou(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		SetGlbValue(CITY_GLB_VALUE_TYPE, 1);		
	else
		local nType = GetRelayShareDataByKey(szKey, nKey1, nKey2, "type");
		DelRelayShareDataCopy(szKey,nKey1,nKey2);
		if nType == 0 then
			SetGlbValue(CITY_GLB_VALUE_TYPE, 1);			
		else
			SetGlbValue(CITY_GLB_VALUE_TYPE, nType);			
		end
	end
	if GetGlbValue(CITY_GLB_VALUE_TYPE) == 2 then
		ApplyRelayShareData("tiaozhanling",0,0,File_name,"main_callback");		
	end
end

function view_all_tiaozhanling()
	local nCount = GetGlbValue(1020) or 0	
	Talk(1,"","HiÖn t¹i cã "..nCount.." bang héi b¸o danh ®Êu gi¸ Khiªu ChiÕn LÖnh.")
end

function main_callback(szKey, nKey1, nKey2, nCount)
	local nDate = tonumber(date("%y%m%d"));	
	if nCount ~= 0 then
		local _, nNum, nLastDate, szTong = GetRelayShareDataByIndex(szKey, nKey1, nKey2, 0);
		
		if nDate == nLastDate then
			SetCityWarAttack(CITY_ID_CD, szTong);			
		end
		
		local szA, szD = GetCityWarAD(CITY_ID_CD)
		
		if szD ~= "" then						-- Èç¹ûÓÐÊØ³Ç·½
			SetCityWarAttack(CITY_ID_CD, szTong)
			szTong = replace(szTong, "|" ,"-")
			Msg2SubWorld("Chóc mõng bang héi:"..szTong.." Bang héi nhËn ®­îc "..tFightCityName[CITY_ID_CD].."_t­ c¸ch c«ng thµnh")
			AddGlobalNews("Chóc mõng bang héi:"..szTong.." Bang héi nhËn ®­îc "..tFightCityName[CITY_ID_CD].."_t­ c¸ch c«ng thµnh")
			WriteLogEx("Cong Thanh Chien",szTong.." nhËn ®­îc "..tFightCityName[CITY_ID_CD].."_t­ c¸ch c«ng thµnh")			
		elseif szD == "" then					-- Èç¹ûÃ»ÓÐÊØ³Ç·½£¬ÔòÖ±½ÓÕ¼ÓÐ³ÇÊÐ
			SetCityWarWinner(CITY_ID_CD, szTong)
			szTong = replace(szTong, "|" ,"-")
			Msg2SubWorld("Chóc mõng bang héi:"..szTong.." ®· chiÕm ®­îc "..tFightCityName[CITY_ID_CD])
			AddGlobalNews("Chóc mõng bang héi:"..szTong.." ®· chiÕm ®­îc "..tFightCityName[CITY_ID_CD])
			WriteLogEx("Cong Thanh Chien",szTong.." ®· chiÕm ®­îc "..tFightCityName[CITY_ID_CD])			
		end		
	end
end
