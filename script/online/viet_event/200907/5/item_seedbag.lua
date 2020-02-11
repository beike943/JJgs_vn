--=============================================
--create by baiyun 2009.5.29
--describe:Ô½ÄÏ°æ7ÔÂ·İ»î¶¯Ö®ÎåÖÖÊ÷£¬ÖÖ×Ó°ü½Å±¾
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
--ËùÓĞ»î¶¯¸øÖÖ×Ó°ü½±ÀøµÄÍ³Ò»Í·ÎÄ¼ş
Include("\\script\\online_activites\\award.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\function\\vip_card\\vc_head.lua")

function OnUse(nItemIdx)
	--local nMainType = GetItemGenre(item)--Ö÷ÀàĞÍ
	--local nSecondType = GetItemDetail(item)--¸±ÀàĞÍ
	--local nDetailType = GetItemParticular(item)--ÏêÏ¸ÀàĞÍ
	local nExpire = GetItemExpireTime(tonumber(nItemIdx));
	if gf_Judge_Room_Weight(7, 10, " ") == 0 then           --by£ºxiongyizhi 2010ÄêÊ¥µ®»î¶¯Ìí¼ÓĞÂ»î¶¯²ÄÁÏÈë¿Ú£¬Ôö¼ÓÒ»¸ö¿Õ¼äÅĞ¶Ï
		return
	end
	local seedtab = {2, 1, 30086, 6};
	--if DelItem(nMainType, nSecondType, nDetailType, 1) == 1 then
	if DelItemByIndex(nItemIdx, 1) == 1 then
		Give_seedbag_Award()           --by£ºxiongyizhi 2010ÄêÊ¥µ®»î¶¯Ìí¼ÓĞÂ»î¶¯²ÄÁÏÈë¿Ú
		for i  = 1, 6 do
			local nIsSuccess, nItem=  AddItem(2, 1, 30086, 1);
			if nExpire > 0 then
				SetItemExpireTime(nItem, nExpire);
			end
		end
		-- Bang héi tinh anh 6 , nguån ra hoa hång
		local nDate = tonumber(date("%y%m%d"))
        	if nDate >= 110930 and nDate <= 111023 then
        		gf_AddItemEx2({2, 0, 1164, 20, 1}, "Hoa Hång PhÊn", "Bang Hoi Tinh Anh 6", "më Tói H¹t Gièng")
        	end
        	VietSeedBagAwards()
		--gf_AddItemEx(seedtab, "H¹t gièng");
		--ÎäÁÖvipÁî
		_vc_OpenSeedBag();
	end
end