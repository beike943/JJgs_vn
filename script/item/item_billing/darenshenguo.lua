-- ´óÈË²Î¹û
-- 4Ğ¡Ê±ÄÚÌáÉıÃØ¼®ĞŞÁ¶ËÙ¶È4±¶£¬Ê±¼ä¿ÉÀÛ»ı¡£µ¥»÷Í¶ÈëĞŞÎª°´Å¥µ¯³öÌáÊ¾¿òÌáÊ¾
-- lizhi 2006-11-2 11:52

TASK_ID = 2505

function OnUse()
	local nLeftTime = GetTask(TASK_ID)
	nLeftTime = floor(nLeftTime / 18 / 60)
	local nHour = floor(nLeftTime / 60)
	local nMin = floor(mod(nLeftTime, 60))
	Say("Dïng ®¹i Nh©n s©m tèc ®é tu luyÖn mËt tŞch gÊp 4 lÇn trong 4 giê, hiÖn b¹n cßn "..nHour.."h "..nMin.." phót, muèn sö dông?",
		2,
		"§óng råi./yes_use",
		"Hñy bá./no_use"
		)
end

function yes_use()
	local nHave = GetItemCount(2,0,553)
	AskClientForNumber("use_cb", 1, tonumber(nHave), "Dïng bao nhiªu ®¹i Nh©n s©m?")
end

function use_cb(nCount)
	local nTaskValue = GetTask(TASK_ID)
	if DelItem(2, 0, 553, nCount) == 1 then
		SetTask(TASK_ID, nTaskValue + 14400 * 18 * nCount)
		local nTime = floor(GetTask(TASK_ID) / 18 / 60)
		local nHour = floor(nTime / 60)
		local nMin = floor(mod(nTime, 60))
		Msg2Player("B¹n ®· dïng ®¹i Nh©n s©m, thêi gian cho tèc ®é tu luyÖn mÊt tŞch gÊp 4 lÇn lµ"..nHour.."h "..nMin.." phót ")
	end
end

function no_use()

end
