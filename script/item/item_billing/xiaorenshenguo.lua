-- Ğ¡ÈË²Î¹û
-- 4Ğ¡Ê±ÄÚÌáÉıÃØ¼®ĞŞÁ¶ËÙ¶È2±¶£¬Ê±¼ä¿ÉÀÛ»ı¡£µ¥»÷Í¶ÈëĞŞÎª°´Å¥µ¯³öÌáÊ¾¿òÌáÊ¾
-- lizhi 2006-11-2 11:53

TASK_ID = 2506

function OnUse()
	local nLeftTime = GetTask(TASK_ID)
	nLeftTime = floor(nLeftTime / 18 / 60)
	local nHour = floor(nLeftTime / 60)
	local nMin = floor(mod(nLeftTime, 60))
	Say("Dïng tiÓu Nh©n s©m qu¶ cã thÓ nhËn ®­îc tèc ®éc tu luyÖn mËt tŞch gÊp 4 lÇn trong 4 giê, b¹n cßn "..nHour.."h "..nMin.." phót, muèn dïng kh«ng?",
		2,
		"§óng råi./yes_use",
		"Hñy bá./no_use"
		)
end

function yes_use()
	local nHave = GetItemCount(2,0,552)
	AskClientForNumber("use_cb", 1, tonumber(nHave), "Muèn dïng mÊy tiÓu Nh©n s©m qu¶?")
end

function use_cb(nCount)
	local nTaskValue = GetTask(TASK_ID)
	if DelItem(2, 0, 552, nCount) == 1 then
		SetTask(TASK_ID, nTaskValue + 14400 * 18 * nCount)
		local nTime = floor(GetTask(TASK_ID) / 18 / 60)
		local nHour = floor(nTime / 60)
		local nMin = floor(mod(nTime, 60))
		Msg2Player("B¹n ®· dïng TiÓu Nh©n s©m qu¶, thêi gian tu luyÖn mËt tŞch gÊp 4 lÇn cßn"..nHour.."h "..nMin.." phót ")
	end
end

function no_use()

end
