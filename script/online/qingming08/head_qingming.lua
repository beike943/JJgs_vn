--File name:head_qingming.lua
--Describe:ÇåÃ÷½Ú»î¶¯½Å±¾Í·ÎÄ¼ş
--Create Date:2008-3-18
--Author:ChenMoxian

--È«¾Ö³£Á¿
FALSE = 0;	--ÏàĞÅ¶¨ÒåÕâÑùµÄ³£Á¿»áÊ¹´úÂëÈİÒ×Àí½âÒ»µã°É
TRUE = 1;
QINGMING_SWITCH = TRUE;	--»î¶¯¿ª¹Ø¡££°Îª¹Ø£¬£±Îª¿ª
--=========ÒÔÏÂÉèÖÃ¿ÉÒÔÈÃÊÕ·ÑÃâ·ÑÇøÓÃÍ¬Ò»¸ö½Å±¾£¬Ö»Òª¸ü¸Ä¿ª¹Ø¾Í¿ÉÒÔÁË========
IS_SHOUFEI = FALSE;--trueÊÕ·ÑÇøfalseÃâ·ÑÇø
--===========================================================================
--È«¾Ö±äÁ¿
--³É¶¼300ãê¾©200ÈªÖİ100µØÍ¼id
--ÈÎÎñ±äÁ¿ºÅ
--TSK_QINGMING_2008_ISINITED			= 1851 --¼ÇÂ¼È¥ÄêÈÎÎñ±äÁ¿ÊÇ·ñÒÑ¾­È«²¿³õÊ¼»¯£¬ÊÇĞÂÄÃµÄ
--TSK_QINGMING_2008_BAI_TOTAL			= 1851--¼ÇÂ¼Íæ¼ÒÀÛ¼ÆßµÍ·¶àÉÙÌì
--TSK_QINGMING_2008_BAI_LASTTIME	= 1852--¼ÇÂ¼Íæ¼ÒÉÏ´ÎßµÍ·µÄÈÕÆÚ
--TSK_QINGMING_2008_ITEMISUSED		= 1853--¼ÇÂ¼¼À°İÆ·µ±ÈÕÊÇ·ñÓÃ¹ı
--TSK_QINGMING_2008_PROBABILITY		= 1854--¼ÇÂ¼¼À°İÆ·Ê¹ÓÃºóÌá¸ßµÄ¸ÅÂÊ

EnterPointTab = {	--¼ÇÂ¼Èı¸öµØÍ¼µÄ½øÈë×ø±ê¡£ÕâĞ©×ø±ê²ß»®¶¼»¹Ã»¶¨,³­È¥ÄêµÄ
			[1] = {820,1636,3181},	--ÈªÖİ
			[2] = {819,1636,3181},	--ãê¾©
			[3] = {818,1636,3181},	--³É¶¼
			};
LeavePointTab = {	--¼ÇÂ¼´ÓÁêÄ¹³öÀ´Ê±µÄ×ø±ê¡£ÕâĞ©×ø±ê²ß»®¶¼»¹Ã»¶¨,³­È¥ÄêµÄ
			[1] = {100,1453,2812},	--ÈªÖİ¡¡»ÆÏÀÚ£
			[2] = {200,1170,2834},	--ãê¾©¡¡º«ÏÀÚ£
			[3] = {300,1640,3531},	--³É¶¼¡¡ĞùÔ¯ÏÀÚ£
			};

--ÅĞ¶Ï½ÚÈÕÊÇ·ñ¿ª·Å
function is_qingming_opened()	
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20080403 then
		return -1;--Èç¹û»¹Î´µ½Ê±¼ä
	elseif nDate > 20080412 then
		return 0;--ÒÑ¹ıÆÚ
	elseif QINGMING_SWITCH == TRUE then
		return 1;--ÔÚ¿ª·ÅÊ±¼äÇÒ¿ª¹ØÎªÕæ
	else
		return 2;--¿ª¹Ø¹Ø±Õ
	end;
end;

--µÃµ½Íæ¼ÒµÄĞÔ±ğ×Ö·û´®¡£´Ó\script\task\world\task_head.luaÀïÃæcopy¹ıÀ´µÄ¡£
--Copyright¡ò2005¡@peres
function get_player_sex()	
	local mySex -- ÓÃÒÔÏÔÊ¾ÈËÎïĞÔ±ğµÄ×Ö·û
	if (GetSex() == 1) then
		mySex = "ThiÕu hiÖp";
	elseif (GetSex() == 2) then
		mySex = "C« n­¬ng";
	end;
	return mySex;
end;

function nothing()--¿Õº¯Êı,½áÊø¶Ô»°
	
end;

function get_type()--·µ»ØÏÀÚ£ÀàĞÍ1»ÆÏÀ2º«ÏÀ3ĞùÔ¯ÏÀ
	local nLocalMapID = 0;
	local nLocalPosX = 0;
	local nLocalPosY = 0;
	local nType = 0;

	nLocalMapID,nLocalPosX,nLocalPosY = GetWorldPos();
	--¸ù¾İÍæ¼ÒËùÔÚµØÍ¼idÀ´ÅĞ¶ÏÓëÍæ¼Ò¶Ô»°µÄÊÇÄÄ¸öÏÀÚ£µÄÒıÂ·ÈË
	if nLocalMapID == EnterPointTab[1][1] or nLocalMapID == LeavePointTab[1][1] then
		nType = 1;
	elseif nLocalMapID == EnterPointTab[2][1] or nLocalMapID == LeavePointTab[2][1] then
		nType = 2;
	elseif nLocalMapID == EnterPointTab[3][1] or nLocalMapID == LeavePointTab[3][1] then
		nType = 3;
	else
		WriteLog("Thanh Minh 2008: B¶n ®å ng­êi ch¬i së t¹i vµ b¶n ®å ng­êi dÉn ®­êng kh«ng phï hîp.");
		return FALSE;--³ö´í
	end;
	
	return nType;
end;
function get_transport_name()--·µ»ØÏÀÚ£ÒıÂ·ÈËÃû×Ö
	local nLocalMapID = 0;
	local nLocalPosX = 0;
	local nLocalPosY = 0;
	local szTransportName ="";

	nLocalMapID,nLocalPosX,nLocalPosY = GetWorldPos();
	--¸ù¾İÍæ¼ÒËùÔÚµØÍ¼idÀ´ÅĞ¶ÏÓëÍæ¼Ò¶Ô»°µÄÊÇÄÄ¸öÏÀÚ£µÄÒıÂ·ÈË
	if nLocalMapID == EnterPointTab[1][1] or nLocalMapID == LeavePointTab[1][1] then
		szTransportName = "Hoµng ®¹i hiÖp (dÉn ®­êng)";
	elseif nLocalMapID == EnterPointTab[2][1] or nLocalMapID == LeavePointTab[2][1] then
		szTransportName = "Hµn ®¹i hiÖp (dÉn ®­êng)";
	elseif nLocalMapID == EnterPointTab[3][1] or nLocalMapID == LeavePointTab[3][1] then
		szTransportName = "Hiªn Viªn ®¹i hiÖp (dÉn ®­êng)";
	else
		WriteLog("Thanh Minh 2008: B¶n ®å ng­êi ch¬i së t¹i vµ b¶n ®å ng­êi dÉn ®­êng kh«ng phï hîp.");
		return FALSE;--³ö´í
	end;
	
	return szTransportName;
end;

function get_tomb_name()--·µ»ØÏÀÚ£Ãû³Æ
	local nLocalMapID = 0;
	local nLocalPosX = 0;
	local nLocalPosY = 0;

	local szTombName = "";

	nLocalMapID,nLocalPosX,nLocalPosY = GetWorldPos();
	--¸ù¾İÍæ¼ÒËùÔÚµØÍ¼idÀ´ÅĞ¶ÏÓëÍæ¼Ò¶Ô»°µÄÊÇÄÄ¸öÏÀÚ£µÄÒıÂ·ÈË
	if nLocalMapID == EnterPointTab[1][1] or nLocalMapID == LeavePointTab[1][1] then
		szTombName = "Hoµng ®¹i hiÖp";
	elseif nLocalMapID == EnterPointTab[2][1] or nLocalMapID == LeavePointTab[2][1] then
		szTombName = "Hµn ®¹i hiÖp";
	elseif nLocalMapID == EnterPointTab[3][1] or nLocalMapID == LeavePointTab[3][1] then
		szTombName = "Hiªn Viªn ®¹i hiÖp";
	else
		WriteLog("Thanh Minh 2008: B¶n ®å ng­êi ch¬i së t¹i vµ b¶n ®å ng­êi dÉn ®­êng kh«ng phï hîp.");
		return FALSE;--³ö´í
	end;
	
	return szTombName;
end;