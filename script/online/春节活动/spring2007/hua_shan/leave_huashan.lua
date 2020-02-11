Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êý
function Leave_huashan()
	SetDeathPunish(1)
	Msg2Player("B¹n ®· chuyÓn sang tr¹ng th¸i PK vµ tö vong")
	SetTask(991,GetTime())
	if spring_2007_date_chk() == 0 then
		RemoveTrigger(GetTrigger(900))
	end
end
