--=============================================
--create by baiyun 2009.4.13
--describe:Ô½ÄÏ°æ4ÔÂ·ÝÊÕ¼¯Ð£ÆìÏä»î¶¯ °×½ðÆì
--=============================================
Include("\\script\\online\\viet_2009_4\\collectjqbox\\jiaoqi_head.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua")

function OnUse()
	----¼ì²é»î¶¯Ê±¼ä
	if tonumber(date("%Y%m%d%H")) > 2009060724 then
		Talk(1, "", "Thêi h¹n sö dông vËt phÈm nµy ®· hÕt!");
		return 0;
	end
	
	-----ÅÐ¶Ï±³°üºÍ¸ºÖØ------------------------
	if gf_Judge_Room_Weight(5, 50, "Xin lçi, ") == 0 then
		return 0
	end
	
	if DelItem(2, 1, 30083, 1) ~= 1 then
		return 0;
	end
	
	local nItem = JQ_GetRandItem(JQ_WG_FLAG_ITEM_PARAM);
	local nResult, nIndex = AddItem(JQ_WG_FLAG_ITEM_PARAM[nItem][3], JQ_WG_FLAG_ITEM_PARAM[nItem][4], JQ_WG_FLAG_ITEM_PARAM[nItem][5], JQ_WG_FLAG_ITEM_PARAM[nItem][7]);
	if nResult == 1 then
		if JQ_WG_FLAG_ITEM_PARAM[nItem][6] ~= 0 then
			SetItemExpireTime(nIndex, JQ_WG_FLAG_ITEM_PARAM[nItem][6]);
		end
		Msg2Player("B¹n nhËn ®­îc " .. JQ_WG_FLAG_ITEM_PARAM[nItem][7] .. "c¸i" .. JQ_WG_FLAG_ITEM_PARAM[nItem][1]);
		WriteLogEx("Hoat dong thang 4","B¹ch Kim Kú",1,JQ_WG_FLAG_ITEM_PARAM[nItem][1]);		
	end
	
end