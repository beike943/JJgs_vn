-- =====================================================
-- File : Ò©Æ·npc¶Ô»°½Å±¾µÄÍ·ÎÄ¼ş
-- Desc : Ò»Ğ©Í¨ÓÃµÄº¯Êı
-- Creator : Tony(Jizheng)
-- =====================================================

-- ´«Èë3¸ö²ÎÊı£¬Éú»î¼¼ÄÜµÄ´óÀà£¬ID£¬»¹ÓĞÉú»î¼¼ÄÜµÄµÈ¼¶
-- ·µ»ØÒ»¸ö²ÎÊı£¬1±íÊ¾Íæ¼ÒÓĞÑ§Õâ¸öÉú»î¼¼ÄÜ£¬¶øÇÒµÈ¼¶´ïµ½ÒªÇó£¬0±íÊ¾²»´ïÒªÇó¡£
function check_dig_condition(nLifeSkillType, nLifeSkillID, nLifeSkillLevel)

	strTab = {"§èn c©y", "Lµm da", "Canh t¸c", "H¸i thuèc", "§µo kho¸ng", "KĞo t¬", "TËp linh"}
	
	local nRet = 0
	local nCurLifeSkillLevel = GetLifeSkillLevel(nLifeSkillType, nLifeSkillID)
	
	if (nCurLifeSkillLevel == 0) then
		Say("H·y ®i häc kü n¨ng "..strTab[nLifeSkillID].." råi quay l¹i nhĞ!", 0)
	elseif (nCurLifeSkillLevel < nLifeSkillLevel) then
		Say("ThiÕu hiÖp_"..strTab[nLifeSkillID].." (Kü n¨ng) ch­a ®ñ cÊp "..nLifeSkillLevel..", h·y ®i t¨ng cÊp kü n¨ng!", 0)
	else
		nRet = 1
	end
	
	return nRet
end;

-- ´«Èë3¸ö²ÎÊı£¬Éú»î¼¼ÄÜµÄ´óÀà£¬ID£¬»¹ÓĞ²É¼¯ÎïÆ·µÄ×î¸ßµÈ¼¶
-- ·µ»ØÒ»¸ö²ÎÊı£¬±íÊ¾Íæ¼Ò²É¼¯ÁËÕâ¸öÎïÆ·£¬ÄÜµÃµ½µÄ¾­Ñé±¶Êı
function get_dig_multi_count(nLifeSkillType, nLifeSkillID, nLifeSkillLevel)
	local nRet = 1
	
	local nCurLifeSkillLevel = GetLifeSkillLevel(nLifeSkillType, nLifeSkillID)
	if (nCurLifeSkillLevel <= nLifeSkillLevel) then
		nRet = 8
	elseif (nCurLifeSkillLevel - nLifeSkillLevel <= 10) then
		nRet = 4
	end
	
	return nRet
end;

