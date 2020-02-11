--=============================================
--create by baiyun 2009.4.13
--describe:Ô½ÄÏ°æ4ÔÂ·İÊÕ¼¯Ğ£ÆìÏä»î¶¯ »Æ½ğÆì
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
	
	-----ÅĞ¶Ï±³°üºÍ¸ºÖØ------------------------
	if gf_Judge_Room_Weight(5, 50, "Xin lçi, ") == 0 then
		return 0
	end
	
	if DelItem(2, 1, 30084, 1) ~= 1 then
		return 0;
	end
	
	--¼ì²é½ñÌìÊÇ·ñÓĞµÃµ½¾­Ñé
	--¼ì²éµÃµ½µÄ¾­ÑéÊÇ·ñµ½´ïÉÏÏŞ
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(JQ_TASK_GET_GOLDEN_FLAG_REWARD_DATE) < nDate then --Èç¹û½ñÌìµÚÒ»´Î»ñµÃ¾­Ñé
		SetTask(JQ_TASK_GET_GOLDEN_FLAG_REWARD_DATE, nDate);
	end;
	
	--¸ø¾­Ñé
	if GetTask(JQ_TASK_GOLDEN_FLAG_EXP_MAX) < JQ_GOLDEN_FLAG_EXP_MAX then
		ModifyExp(JQ_GOLDEN_FLAG_EACH_EXP);
		SetTask(JQ_TASK_GOLDEN_FLAG_EXP_MAX, GetTask(JQ_TASK_GOLDEN_FLAG_EXP_MAX) + JQ_GOLDEN_FLAG_EACH_EXP);
		Msg2Player("B¹n nhËn ®­îc " .. JQ_GOLDEN_FLAG_EACH_EXP .. "Kinh nghiÖm");
		WriteLog("[Ho¹t ®éng thu thËp hiÖu kú th¸ng 4]:" .. GetName() .. "NhËn ®­îc" .. JQ_GOLDEN_FLAG_EACH_EXP .. "Kinh nghiÖm");
	else
		Msg2Player("H«m nay ®· sö dông Hoµng Kim Kú ®¹t ®Õn kinh nghiÖm cao nhÊt råi!");
	end
	
	--µÃµ½Ëæ»úÎïÆ·
	local nItem = JQ_GetRandItem(JQ_YG_FLAG_ITEM_PARAM);
	
	--»ñµÃÉùÍû
	if nItem >= 8 and nItem <= 11 then 
		ModifyReputation(JQ_YG_FLAG_ITEM_PARAM[nItem][7], 0);
		Msg2Player("B¹n nhËn ®­îc " .. JQ_YG_FLAG_ITEM_PARAM[nItem][7] .. " ®iÓm" .. "Danh väng");		
		WriteLogEx("Hoat dong thang 4","Hoµng Kim Kú",JQ_YG_FLAG_ITEM_PARAM[nItem][7],JQ_YG_FLAG_ITEM_PARAM[nItem][1]);		
		return 1;
	end
	--»ñµÃĞŞÎª
	if nItem == 12 then
		ModifyPopur(20);
		Msg2Player("B¹n nhËn ®­îc " .. JQ_YG_FLAG_ITEM_PARAM[nItem][7] .. " ®iÓm" .. "LuyÖn");
		WriteLogEx("Hoat dong thang 4","Hoµng Kim Kú",JQ_YG_FLAG_ITEM_PARAM[nItem][7],JQ_YG_FLAG_ITEM_PARAM[nItem][1]);		
		return 1;
	end
	--»ñµÃ²Ø½£µã
	if nItem == 13 then
		SetTask(1801, GetTask(1801) + JQ_YG_FLAG_ITEM_PARAM[nItem][7]);
		Msg2Player("B¹n nhËn ®­îc " .. JQ_YG_FLAG_ITEM_PARAM[nItem][7] .. " ®iÓm" .. "®iÓm tµng kiÕm");
		WriteLogEx("Hoat dong thang 4","Hoµng Kim Kú",JQ_YG_FLAG_ITEM_PARAM[nItem][7],JQ_YG_FLAG_ITEM_PARAM[nItem][1]);
		return 1;
	end
	--ÆäËüÎïÆ·½±Àø
	local nResult, nIndex = AddItem(JQ_YG_FLAG_ITEM_PARAM[nItem][3], JQ_YG_FLAG_ITEM_PARAM[nItem][4], JQ_YG_FLAG_ITEM_PARAM[nItem][5], JQ_YG_FLAG_ITEM_PARAM[nItem][7]);
	if nResult == 1 then
		if JQ_YG_FLAG_ITEM_PARAM[nItem][6] ~= 0 then
			SetItemExpireTime(nIndex, JQ_YG_FLAG_ITEM_PARAM[nItem][6]);
		end
		Msg2Player("B¹n nhËn ®­îc " .. JQ_YG_FLAG_ITEM_PARAM[nItem][7] .. "c¸i" .. JQ_YG_FLAG_ITEM_PARAM[nItem][1]);
		WriteLogEx("Hoat dong thang 4","Hoµng Kim Kú",JQ_YG_FLAG_ITEM_PARAM[nItem][7],JQ_YG_FLAG_ITEM_PARAM[nItem][1]);
	end
	
end