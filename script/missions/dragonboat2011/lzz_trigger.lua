--by liubo
--µÇÂ¼´¥·¢Æ÷
Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function OnLogin()
	--print("Onlogin called!$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
	LZZ_RestorePlayerState()
	RemoveTrigger(RemoveTrigger(LOG_TRIGGER_ID))
end