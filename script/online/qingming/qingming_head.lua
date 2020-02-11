--File name:qingming_head.lua
--Describe:ÇåÃ÷½Ú»î¶¯½Å±¾Í·ÎÄ¼ş
--Create Date:2006-3-15(315Ïû·ÑÕßµÄ½ÚÈÕ)
--Author:yanjun

--È«¾Ö³£Á¿
FALSE = 0;	--ÏàĞÅ¶¨ÒåÕâÑùµÄ³£Á¿»áÊ¹´úÂëÈİÒ×Àí½âÒ»µã°É
TRUE = 1;
QINGMING_SWITCH = TRUE;	--»î¶¯¿ª¹Ø¡££°Îª¹Ø£¬£±Îª¿ª
--È«¾Ö±äÁ¿ºÅ

--ÈÎÎñ±äÁ¿ºÅ
QINGMING_TASK = 1875;	--´ËÈÎÎñ±äÁ¿ÎªËÄ²¿·ÖÀ´Ê¹ÓÃ
						--1×Ö½Ú¼ÇÂ¼Íæ¼ÒÄ¿Ç°ßµ°İÁË¶àÉÙ´Î
						--2×Ö½Ú¼ÇÂ¼µ±ÌìÓĞÃ»ÓĞ°İ¹ı
						--3×Ö½Ú¼ÇÂ¼Íæ¼ÒÊÇ²»ÊÇÁ¬×Å£±£°Ìì¶¼È¥°İ¼ÀÁË
						--4×Ö½Ú
JIBAI_ITEM = 1876;	--´ËÈÎÎñ±äÁ¿ÎªËÄ²¿·ÖÀ´Ê¹ÓÃ
					--1×Ö½Ú¼ÇÂ¼Íæ¼Òµ±ÌìÓĞÃ»ÓĞÊ¹ÓÃ¹ı¼ÀÆ·ÂøÍ·
					--2×Ö½Ú¼ÇÂ¼Íæ¼Òµ±ÌìÓĞÃ»ÓĞÊ¹ÓÃ¹ı¼ÀÆ·¼¦Èâ
					--3×Ö½Ú¼ÇÂ¼Íæ¼Òµ±ÌìÓĞÃ»ÓĞÊ¹ÓÃ¹ı¼ÀÆ·ÀÏ¾Æ
					--4×Ö½Ú¼ÇÂ¼Íæ¼ÒÊ¹ÓÃ¼À°İÎïÆ·ºóÌá¸ßµÄ¸ÅÂÊ

EnterPointTab = {	--¼ÇÂ¼Èı¸öµØÍ¼µÄ½øÈë×ø±ê¡£
			[1] = {818,1636,3181},	--ÈªÖİ
			[2] = {820,1636,3181},	--ãê¾©
			[3] = {819,1636,3181},	--³É¶¼
			};
LeavePointTab = {	--¼ÇÂ¼´ÓÁêÄ¹³öÀ´Ê±µÄ×ø±ê
			[1] = {100,1453,2812},	--ÈªÖİ¡¡»ÆÏÀÚ£
			[2] = {200,1170,2834},	--ãê¾©¡¡º«ÏÀÚ£
			[3] = {300,1640,3531},	--³É¶¼¡¡ĞùÔ¯ÏÀÚ£
			};
		
--=============================================================================================
--==================================Ïà¹Øº¯Êı===================================================
--ÅĞ¶Ï½ÚÈÕÊÇ·ñ¿ª·Å
function Is_QingMing_Opened()	
	local nDate = tonumber(date("%Y%m%d"));
	if QINGMING_SWITCH == TRUE and nDate >= 20060331 and nDate <=20060409 then
		return TRUE;
	else
		return FALSE;
	end;
end;

--×Ô¶¨ÒåĞ´ÈÕÖ¾º¯Êı¡£µÚÒ»¸ö²ÎÊıÎªÊÂ¼şÃû£¬µÚ¶ş¸ö²ÎÊıÎªÊÂ¼şÄÚÈİ
function Write_Log(Event,Content)	
	WriteLog("["..Event.."]:"..GetName()..Content);
end;

--µÃµ½Íæ¼ÒµÄĞÔ±ğ×Ö·û´®¡£´Ó\script\task\world\task_head.luaÀïÃæcopy¹ıÀ´µÄ¡£
--Copyright¡ò2005¡@peres
function GetPlayerSex()	
	local mySex -- ÓÃÒÔÏÔÊ¾ÈËÎïĞÔ±ğµÄ×Ö·û
	if (GetSex() == 1) then
		mySex = "ThiÕu hiÖp";
	elseif (GetSex() == 2) then
		mySex = "C« n­¬ng";
	end;
	return mySex;
end;

--ÉèÖÃÄ³ÈÎÎñ±äÁ¿µÄÄ³Ò»×Ö½ÚµÄÖµ
function Set_Task_Byte(TaskID,Byte,Value)	
	SetTask(TaskID,SetByte(GetTask(TaskID),Byte,Value));
	return GetTask(TaskID);
end;

--µÃµ½Ä³ÈÎÎñ±äÁ¿Ä³Ò»×Ö½ÚµÄÖµ
function Get_Task_Byte(TaskID,Byte)	
	return GetByte(GetTask(TaskID),Byte);
end;