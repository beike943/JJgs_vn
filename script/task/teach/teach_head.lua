
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ½ÌÓıÈÎÎñÍ·ÎÄ¼ş
-- Edited by peres
-- 2005/05/07 PM 19:55

-- Õ³³íĞÂÏÊµÄÑª£¬´ÓËıµÄÉíÌåÉî´¦Á÷ÌÊ³öÀ´¡£
-- »º»ºµÄ£¬ÎÂÅ¯µÄ£¬°ÑËı½şÈóÔÚ³±ÊªµÄ´²µ¥ÉÏ¡£
-- Ëı¾õµÃÌÛÍ´¡£
-- Ëı¸Ğ¾õµ½×Ô¼ºÔÚÊ¢·ÅºÍ¿İÎ®Ö®ÖĞ£¬Ò»Æ¬ÓÖÒ»Æ¬µÄ»¨°ê£¬¾ÍÕâÑùµôÂäÏÂÀ´¡­¡­ºÚ°µµÄ³±Ë®Ó¿¶¯ÉÏÀ´¡£
-- È¥ÍùÊÀ½ç¾¡Í·µÄÂ·Í¾¡£
-- Í¯ÄêµÄº£µºÔÚÒ£Ô¶µÄµØ·½£¬Ò¹É«ÖĞµÄº½´¬£¬Æ¯²´ÔÚÎŞ¼ÊµÄ´óº£ÖĞ¡£

-- ======================================================


TEACH_SEASONNPC_ID = 1  -- Ò°ÛÅĞÂÊÖÈÎÎñµÄÈÎÎñ±äÁ¿¼ÇÂ¼


-- ×Óº¯Êı£¬ÓÃÒÔ»ñÈ¡½ÌÓıÈÎÎñµÄ½øÕ¹³Ì¶È
function TE_GetTeachState()
	return GetTask(TEACH_SEASONNPC_ID)
end

-- ×Óº¯Êı£¬ÓÃÒÔÉèÖÃ½ÌÓıÈÎÎñµÄ½øÕ¹³Ì¶È
function TE_SetTeachState(nValue)
	SetTask(TEACH_SEASONNPC_ID, nValue)
end

-- ×Óº¯Êı£¬µÃµ½½ÌÓıÈÎÎñµÄ×´Ì¬
function TE_GetTeachPro()
	return GetTask(TEACH_STATE_ID)
end

-- ×Óº¯Êı£¬ÉèÖÃ½ÌÓıÈÎÎñµÄ×´Ì¬
function TE_SetTeachPro(nValue)
	SetTask(TEACH_STATE_ID,nValue)
end


-- ×Óº¯Êı£¬Ê¹½ÌÓıÈÎÎñ½øÕ¹µ½ÏÂÒ»²½
function TE_SetTeachAdd()
	SetTask(TEACH_SEASONNPC_ID, GetTask(TEACH_SEASONNPC_ID) + 1)
	return
end


-- ÓÃÓÚ´¦ÀíÒ»¶ÑÑ¡ÏîµÄ¶Ô»°º¯Êı Say(""...);
function SelectSay(strSay)

local strMsg,strSel = "","";
local strNum = getn(strSay);

	if strNum < 2 then
		return
	end;
	
	if strNum > 2 then
		for i=2,strNum - 1 do
			strSel = strSel..format("%q", strSay[i])..",";
		end;
		strSel = strSel..format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", strSay[1])..","..(strNum - 1)..","..strSel..");";
	elseif strNum == 2 then
		strSel = format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", strSay[1])..",1"..","..strSel..");";
	end;
	
	dostring(strMsg);
	
end;


-- ×Óº¯Êı£¬ÓÃÓÚÀ©Õ¹¶Ô»° TALK º¯ÊıµÄ¹¦ÄÜ
function TE_Talk(fun,szMsg)
	local num = getn(szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",szMsg[i])..","
	end
	szmsg = szmsg .. format("%q",szMsg[num])
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"
	dostring(szmsg)
end	

-- ×Óº¯Êı£¬ÓÃÒÔ»ñÈ¡Íæ¼ÒµÄĞÔ±ğ£¬Ö±½Ó·µ»Ø×Ö·û´®
function GetPlayerSex()

local mySex -- ÓÃÒÔÏÔÊ¾ÈËÎïĞÔ±ğµÄ×Ö·û

	if (GetSex() == 1) then
		mySex = "ThiÕu hiÖp"
	elseif (GetSex() == 2) then
		mySex = "C« n­¬ng"
	end
	
	return mySex
	
end