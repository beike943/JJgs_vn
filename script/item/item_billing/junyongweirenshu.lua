-- ¾üÓÃÎ¯ÈÎÊé

Include("\\script\\task\\weekend\\task_head.lua")

function OnUse(idx)
	local nValue = GetTask(TASK_IB_BOOK2)
	
	if nValue == 1 then
		Say("B¹n ®· dïng 1 lÇn qu©n dông-ñy nhiÖm th­!", 0)
		return
	end
	
	Say("B¹n muèn dïng qu©n dông-ñy nhiÖm th­? Nã cã thÓ gióp b¹n gi÷ l¹i ®iÓm ®Şnh quèc an bang cña ho¹t ®éng cuèi tuÇn lÇn tr­íc.", 
		2,
		"Sö dông /yes_use",
		"Sai/no_say")
end

function yes_use()
	if DelItem(2,1,1030,1) == 1 then
		SetTask(TASK_IB_BOOK2, 1)
		Msg2Player("B¹n ®· dïng 1 qu©n dông-ñy nhiÖm th­.")
	end
end

function no_say()

end
