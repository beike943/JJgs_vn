
-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ½ÌÓýÈÎÎñÍ·ÎÄ¼þ
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================


TEACH_SEASONNPC_ID = 1  -- Ò°ÛÅÐÂÊÖÈÎÎñµÄÈÎÎñ±äÁ¿¼ÇÂ¼
TEACH_STATE_ID = 806 -- ÈÎÎñ±äÁ¿×´Ì¬£¬1 ÎªÕýÔÚ½øÐÐÈÎÎñ£¬2 ÎªÒÑ¾­Íê³ÉÁËÈÎÎñ

-- ×Óº¯Êý£¬ÓÃÒÔ»ñÈ¡½ÌÓýÈÎÎñµÄ½øÕ¹³Ì¶È
function TE_GetTeachState()

	return GetTask(TEACH_SEASONNPC_ID)

end

-- ×Óº¯Êý£¬ÓÃÒÔÉèÖÃ½ÌÓýÈÎÎñµÄ½øÕ¹³Ì¶È
function TE_SetTeachState(nValue)

	SetTask(TEACH_SEASONNPC_ID, nValue)

end

-- ×Óº¯Êý£¬µÃµ½½ÌÓýÈÎÎñµÄ×´Ì¬
function TE_GetTeachPro()
	return GetTask(TEACH_STATE_ID)
end

-- ×Óº¯Êý£¬ÉèÖÃ½ÌÓýÈÎÎñµÄ×´Ì¬
function TE_SetTeachPro(nValue)
	SetTask(TEACH_STATE_ID,nValue)
end

-- ×Óº¯Êý£¬»ñÈ¡½ÌÓýÈÎÎñÄ¿Ç°½øÐÐµ½ÁËÄÄÒ»¶Î
-- ·µ»ØÊýÖµÎªµÚ¼¸¶Î
function TE_GetTeachLevel()

local nValue = GetTask(1);

	if (nValue >= 3) and (nValue < 7) then
		return 1
	elseif (nValue >= 8) and (nValue < 9) then
		return 2
	elseif (nValue >= 10) and (nValue < 11) then
		return 3
	elseif (nValue >= 12) and (nValue < 13) then
		return 4
	elseif (nValue >= 14) and (nValue < 18) then
		return 5
	elseif (nValue >= 19) and (nValue < 21) then
		return 6
	end

end


-- ×Óº¯Êý£¬Ê¹½ÌÓýÈÎÎñ½øÕ¹µ½ÏÂÒ»²½
function TE_SetTeachAdd()
	SetTask(TEACH_SEASONNPC_ID, GetTask(TEACH_SEASONNPC_ID) + 1)
	Msg2Player("NhiÖm vô hiÖn t¹i:"..GetTask(TEACH_SEASONNPC_ID));
	return
end

-- ×Óº¯Êý£¬ÓÃÓÚÀ©Õ¹¶Ô»° TALK º¯ÊýµÄ¹¦ÄÜ
function TE_Talk(num,fun,szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",szMsg[i])..","
	end
	szmsg = szmsg .. format("%q",szMsg[num])
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"
	dostring(szmsg)
end	
