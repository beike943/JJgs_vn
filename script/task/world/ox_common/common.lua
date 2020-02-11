-- ³£ÓÃ¹¦ÄÜº¯Êı

-- cf : Common Function

-- Danexx
-- 2005.5.30
------------------------------------------------------------

-- Í¨¹ıº¯Êı·µ»ØÒ»¶ÎÎÄ×ÖµÄÑÕÉ«
-- text : ĞèÒªÏÔÊ¾µÄÎÄ×Ö
-- color : ÑÕÉ«
function cf_ox_SetColor(text, color)
	return "<color="..color..">"..text.."<color>"
end

-- Í¨¹ıº¯Êı·µ»ØÍæ¼ÒĞÔ±ğ³Æºô
-- male : Èç¹ûÊÇÄĞĞÔÔò·µ»ØÕâ¸ö×Ö·û´®
-- female : Èç¹ûÊÇÅ®ĞÔÔò·µ»ØÕâ¸ö×Ö·û´®
function cf_ox_GetSex(male, female)
	if (GetSex() == 1) then
		return male
	else
		return female
	end
end

-- Í¨¹ıº¯Êı·µ»ØÒ»Ìõ·Ö¸îÏß
-- length : ·Ö¸îÏßµÄ³¤¶È
function cf_ox_partingline(length)
	local partingline = "\n"
	if (length == 0) then
		length = 8
	end
	for i=1,length do 
		partingline = partingline.."…"
	end
	return partingline.."\n"
end

--function cf_ox_questnote(mode)
--	if (mode == 0) then
--		return " [ÈÎÎñÒÑ¾­½ÓÈ¡] "
--	elseif (mode == 1) then
--		return " [ÈÎÎñ»¹Î´Íê³É] "	
--	elseif (mode == 2) then
--		return " [ÈÎÎñÒÑ¾­Íê³É] "	
--	end
--end