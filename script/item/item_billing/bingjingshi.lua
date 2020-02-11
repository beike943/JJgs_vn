--±ù¾§Ê¯£ºµþ¼Ó999£¬¿ÉÒÔ½»Ò×£¬¿ÉÒÔÊ¹ÓÃ1¸ö±ù¾§Ê¯½«µÍ¼¶Ï´ÐÄÊ¯£¬Á¶Â¯ÌúºÏ³É¸ß¼¶Ï´ÐÄÊ¯£¬Á¶Â¯Ìú¡£ IB ÊÛ¼Û90Xu
--2¼¶Ï´ÐÄÊ¯/Á¶Â¯Ìú=4¸ö1¼¶Ï´ÐÄÊ¯/Á¶Â¯Ìú+1±ù¾§Ê¯
--2¼¶Ï´ÐÄÊ¯/Á¶Â¯Ìú=4¸ö2¼¶Ï´ÐÄÊ¯/Á¶Â¯Ìú+2±ù¾§Ê¯
--ºÏ³ÉµÄµÀ¾ß¾ùÎª°ó¶¨µÀ¾ß
Include("\\script\\lib\\globalfunctions.lua")

--t_compose = {
--	[401] = {
--		award = {"4¼¶Ï´ÐÄÊ¯", 2, 1, 30524, 1,
--			},
--		need={
--			{{"3¼¶Ï´ÐÄÊ¯", 2, 1, 30523, 4,},
--			{{"±ù¾§Ê¯", 2, 1, 30554, 3,},
--			},
--		},
--	[402] = {
--		award = {"4¼¶Á¶Â¯Ìú", 2, 1, 30530, 1,
--			},
--		need={
--			{{"3¼¶Á¶Â¯Ìú", 2, 1, 30529, 4,},
--			{{"±ù¾§Ê¯", 2, 1, 30554, 3,},
--			},
--		},
--}

function OnUse(nItem)
	local tSay = {
		"Hîp thµnh TÈy T©m Th¹ch cÊp 2 = 4*1 cÊp TÈy T©m Th¹ch + B¨ng Tinh Th¹ch/compose2x",
		"Hîp thµnh LuyÖn L« ThiÕt cÊp 2 = 4*1 cÊp LuyÖn L« ThiÕt + 2 B¨ng Tinh Th¹ch/compose2l",
		"Hîp thµnh TÈy T©m Th¹ch cÊp 3 = 4*2 cÊp TÈy T©m Th¹ch + B¨ng Tinh Th¹ch/compose3x",
		"Hîp thµnh LuyÖn L« ThiÕt cÊp 3 = 4*2 cÊp LuyÖn L« ThiÕt + 2 B¨ng Tinh Th¹ch/compose3l",
		"Hîp thµnh cÊp 4 TÈy T©m Th¹ch = 4*3 cÊp TÈy T©m Th¹ch + 3 B¨ng Tinh Th¹ch/compose4x",
		"Hîp thµnh cÊp 4 LuyÖn L« Thiªt = 4*3 cÊp LuyÖn L« ThiÕt + 3 B¨ng Tinh Th¹ch/compose4l",
		"Ra khái/do_nothing",
	}
--	for i,v in t_compose do
--		local szNeed = format("%sx%d",v.need[1][1], ,v.need[1][5])
--		for k=2, getn(v.need) do
--			szNeed=format("%s+%sx%d",v.need[k][1], ,v.need[k][5])
--		end
--		local szOp = format("ºÏ³É%s=%s/", v.award[1], )
--		tinsert(tSay, "")
--	end
--	tinsert(tSay, "ÍË³ö/do_nothing")
	Say("B¨ng Tinh Th¹ch: Ng­¬i muèn lµm kh«ng?", getn(tSay), tSay);
end

function do_nothing()
	--do nothing()
end

function compose2x()
	local nCount = min(GetItemCount(2,1,30554), floor(GetItemCount(2,1,30521) / 4));
	local nFrreRoom = GetFreeItemRoom();
	AskClientForNumber("compose2x_deal",0,min(nCount, nFrreRoom),"H·y nhËp sè l­îng hîp thµnh vµo","")
end

function compose2x_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if 1 == DelItem(2,1,30554,nNum) and 1 == DelItem(2,1,30521,4*nNum) then
		gf_AddItemEx2({2,1,30522,nNum,4}, "CÊp 2 TÈy T©m Th¹ch", "Hîp thµnh B¨ng Tinh Th¹ch", "Hîp thµnh TÈy T©m Th¹ch cÊp 2", 0, 1);
		AddRuntimeStat(2,1,0,nNum);
	end
end

function compose2l()
	local nCount = min(floor(GetItemCount(2,1,30554) / 2), floor(GetItemCount(2,1,30527) / 4));
	local nFrreRoom = GetFreeItemRoom();
	AskClientForNumber("compose2l_deal",0,min(nCount, nFrreRoom),"H·y nhËp sè l­îng hîp thµnh vµo","")
end

function compose2l_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if 1 == DelItem(2,1,30554,nNum*2) and 1 == DelItem(2,1,30527,4*nNum) then
		gf_AddItemEx2({2,1,30528,nNum,4}, "CÊp 2 LuyÖn L« ThiÕt", "Hîp thµnh B¨ng Tinh Th¹ch", "Hîp thµnh LuyÖn L« ThiÕt cÊp 2", 0, 1);
		AddRuntimeStat(2,3,0,nNum);
	end
end

function compose3x()
	local nCount = min(GetItemCount(2,1,30554), floor(GetItemCount(2,1,30522) / 4));
	local nFrreRoom = GetFreeItemRoom();
	AskClientForNumber("compose3x_deal",0,min(nCount, nFrreRoom),"H·y nhËp sè l­îng hîp thµnh vµo","")
end

function compose3x_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if 1 == DelItem(2,1,30554,nNum) and 1 == DelItem(2,1,30522,4*nNum) then
		gf_AddItemEx2({2,1,30523,nNum,4}, "CÊp 3 TÈy T©m Th¹ch", "Hîp thµnh B¨ng Tinh Th¹ch", "Hîp thµnh TÈy T©m Th¹ch cÊp 3", 0, 1);
		AddRuntimeStat(2,2,0,nNum);
	end
end

function compose3l()
	local nCount = min(floor(GetItemCount(2,1,30554) / 2), floor(GetItemCount(2,1,30528) / 4));
	local nFrreRoom = GetFreeItemRoom();
	AskClientForNumber("compose3l_deal",0,min(nCount, nFrreRoom),"H·y nhËp sè l­îng hîp thµnh vµo","")
end

function compose3l_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if 1 == DelItem(2,1,30554,nNum*2) and 1 == DelItem(2,1,30528,4*nNum) then
		gf_AddItemEx2({2,1,30529,nNum,4}, "CÊp 3 LuyÖn L« ThiÕt", "Hîp thµnh B¨ng Tinh Th¹ch", "Hîp thµnh LuyÖn L« ThiÕt cÊp 3", 0, 1);
		AddRuntimeStat(2,4,0,nNum);
	end
end

function compose4x()
	local nCount = min(floor(GetItemCount(2,1,30554)/3), floor(GetItemCount(2,1,30523) / 4));
	local nFreeRoom = GetFreeItemRoom();
	local nRealCount = min(nCount, nFreeRoom)
	if nRealCount >= 0 then
		AskClientForNumber("compose4x_deal",0,nRealCount,"H·y nhËp sè l­îng hîp thµnh vµo","")
	end
end

function compose4x_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if 1 == DelItem(2,1,30554,nNum*3) and 1 == DelItem(2,1,30523,4*nNum) then
		gf_AddItemEx2({2,1,30524,nNum,4}, "TÈy T©m Th¹ch cÊp 4", "Hîp thµnh B¨ng Tinh Th¹ch", "Hîp thµnh cÊp 4 TÈy T©m Th¹ch", 0, 1);
		AddRuntimeStat(2,5,0,nNum);
	end
end

function compose4l()
	local nCount = min(floor(GetItemCount(2,1,30554) / 3), floor(GetItemCount(2,1,30529) / 4));
	local nFreeRoom = GetFreeItemRoom();
	local nRealCount = min(nCount, nFreeRoom)
	if nRealCount >= 0 then
		AskClientForNumber("compose4l_deal",0, nRealCount,"H·y nhËp sè l­îng hîp thµnh vµo","")
	end
end

function compose4l_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if 1 == DelItem(2,1,30554,nNum*3) and 1 == DelItem(2,1,30529,4*nNum) then
		gf_AddItemEx2({2,1,30530,nNum,4}, "LuyÖn L« ThiÕt cÊp 4", "Hîp thµnh B¨ng Tinh Th¹ch", "Hîp thµnh cÊp 4 LuyÖn L« ThiÕt", 0, 1)
		AddRuntimeStat(2,6,0,nNum)
	end
end
