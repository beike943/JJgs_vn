--²¹³¥ÐÞ¸´Íæ¼ÒÕòÅÉ¼¼ÄÜµÈ¼¶Òì³£ÎÊÌâ
--×ªÉúÉèÖÃ½ÇÉ«µÈ¼¶Ð¡ÓÚ85¼¶ µ¼ÖÂÕòÅÉÃØ¼®²»ÄÜÆð×÷ÓÃ µ¼ÖÂ½ÇÉ«ÕòÅÉ¼¼ÄÜµÈ¼¶Òì³£
--ÎÒ·½Ä¿Ç°ÔÝ¶¨µÄÐÞ¸Ä·½°¸Îª£º
--1.ÐÞ¸´ÃØ¼®²»Æð×÷ÓÃµÄÇé¿öÏÂ ÕòÅÉ¼¼ÄÜµÈ¼¶Òì³£µÄÎÊÌâ
--2.Ôö¼ÓÒ»¸öNpc¹¦ÄÜ Í¨¹ýnpc¶Ô»° ×Ô¶¯½«ÒÑ¾­Òì³£µÄ½ÇÉ«ÕòÅÉ¼¼ÄÜµÈ¼¶ÉèÖÃÎª10¼¶£¨ÒªÇóÍæ¼ÒÍÑÏÂÕòÅÉÃØ¼®£©
--×Ô¶¯ÉèÖÃµÄÅÐ¶ÏÌõ¼þÎª£ºa.Íæ¼ÒÒÑ¾­ÊÇ4×ª»ò4×ªÒÔÉÏ
--b.Íæ¼ÒÕòÅÉ¼¼ÄÜ²»Âú10¼¶
--¸ÃNPC¹¦ÄÜÊ±ÏÞÉèÖÃÎª7Ìì 7ÌìÖ®ºó¸Ã¹¦ÄÜÎÞÐ§



Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
t_zhenpai_skill = --ÕòÅÉ¼¼ÄÜ
{
	[2] = 32, --ÉÙÁÖË×¼Ò
	[3] = 57,--ÉÙÁÖìø×Ú
	[4] = 44,--ÉÙÁÖÎä×Ú
	[6] = 74,--ÌÆÃÅ
	[8] = 89,--¶ëáÒ·ð¼Ò
	[9] = 102,--¶ëáÒË×¼Ò
	[11] = 113,--Ø¤°ï¾»ÒÂ
	[12] = 124,--Ø¤°ïÎÛÒÂ
	[14] = 146,--Îäµ±µÀ¼Ò
	[15] = 159,--Îäµ±Ë×¼Ò
	[17] = 732,--ÑîÃÅÇ¹Æï
	[18] = 745,--ÑîÃÅ¹­Æï
	[20] = 775,--Îå¶¾Ð°ÏÀ
	[21] = 774,--Îå¶¾¹ÆÊ¦
}

function OnNpcTalkRepairGreatSkill()
	local nDate = tonumber(date("%Y%m%d"))
	if not (nDate >= 20130418 and nDate <= 20130511) then--²»ÔÚ²¹³¥ÆÚ
		Talk (1,"",format("%s","TÝnh n¨ng kh«ng n»m trong thêi h¹n cã hiÖu lùc"))
		return
	end
	
	local szTitle = format("§iÒu kiÖn söa ch÷a kü n¨ng trÊn ph¸i: chuyÓn sinh 4 trë lªn, kh«ng cã phã mËt tÞch trang bÞ, kü n¨ng trÊn ph¸i kh«ng ®ñ 10 cÊp")
	local tbSay = {}
	tinsert(tbSay, format("%s/_On_Repair","Tháa ®ñ ®iÒu kiÖn ®Ó phôc håi kü n¨ng trÊn ph¸i"))
	tinsert(tbSay, "Tõ bá/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _On_Repair()
	local nSkillId = t_zhenpai_skill[GetPlayerRoute()]
	if not nSkillId then--Á÷ÅÉÒì³£
		Talk (1,"",format("%s%s!","Söa ch÷a kü n¨ng trÊn ph¸i","§iÒu kiÖn kh«ng phï hîp !"))
		return
	end
	if GetTranslifeCount() < 4 and GetPlayerRebornParam(0) < 1 then
		Talk (1,"",format("%s%s!","Söa ch÷a kü n¨ng trÊn ph¸i","§iÒu kiÖn kh«ng phï hîp !!"))
		return
	end
	if GetPlayerEquipIndex(9) ~= 0 then--¸±ÃØ¼®Î»ÖÃÓÐ×°±¸
		Talk (1,"",format("%s%s!","Söa ch÷a kü n¨ng trÊn ph¸i","§iÒu kiÖn kh«ng phï hîp !!!"))
		return
	end
	
	if GetSkillLevel(nSkillId) >= 10 then--¼¼ÄÜÕý³£
		Talk (1,"",format("%s%s!","Söa ch÷a kü n¨ng trÊn ph¸i","§iÒu kiÖn kh«ng phï hîp !!!!"))
		return
	end
	
	local nOldSkillLv = GetSkillLevel(nSkillId) or 0
	
	--Ö´ÐÐÐÞ¸´²Ù×÷
	if nOldSkillLv <= 0 then
		LearnSkill(nSkillId)
	end
	local nSkillNewLv = GetSkillLevel(nSkillId) or 0
	while nSkillNewLv < 10 do
		local nSkillLvBfUp = GetSkillLevel(nSkillId) or 0
		if LevelUpSkill(nSkillId) ~= 1 then
			Talk (1,"",format("%s%s!","Söa ch÷a kü n¨ng trÊn ph¸i","ThÊt b¹i"))
			gf_WriteLogEx("REPAIR GREAT SKILL VNG", "update skill fail", 1, "Fix fail");
			break
		end
		nSkillNewLv = GetSkillLevel(nSkillId) or 0
		if nSkillNewLv <= nSkillLvBfUp then
			Talk (1,"",format("%s%s!","Söa ch÷a kü n¨ng trÊn ph¸i","ThÊt b¹i"))
			gf_WriteLogEx("REPAIR GREAT SKILL VNG", "update skill fail2", 1, "Fix fail2");
			break
		end
	end
	
	Talk (1,"",format("%s%s!","Söa ch÷a kü n¨ng trÊn ph¸i"," thµnh c«ng "))
	local szLog = format("Role[%s] Route[%d] update greate skill[%d] from[%d]-->[%d] ",GetName(), GetPlayerRoute(), nSkillId, nOldSkillLv, nSkillNewLv)
	gf_WriteLogEx("repair great skill", szLog, "", "", "")
	gf_WriteLogEx("REPAIR GREAT SKILL VNG", "update thµnh c«ng", 1, "Fix thµnh c«ng")

end

function no()
end

