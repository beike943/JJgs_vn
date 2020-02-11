
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÎäÆ÷µêÀÏ°å½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

function main()
	local tSay = {
		"Mua vò khİ/_buy_sale_equip",
		"Trang bŞ t¸ch/_equip_recycle",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say("<color=green>Chñ TiÖm Vò Khİ:<color> Vò khİ ë chç cña ta vÉn lµ mÆt hµng phæ biÕn, kh«ng biÕt mãn vò khİ cã thuéc quÎ sÏ nh­ thÕ nµo!", getn(tSay), tSay);
end;

function _buy_sale_equip()
	Sale(33);
end

function _equip_recycle()
	SendScript2Client("Open[[EquipRecycle]]");
end

function nothing()
	--do nothing
end